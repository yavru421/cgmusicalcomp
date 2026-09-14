#!/usr/bin/env python3
"""
End-to-End CUDA Binaural Master Audio Renderer (render_binaural_master.py)
Renders Wisconsin Rapids City Band multi-track MIDI into 14 dry acoustic stems via FluidSynth,
then convolves all 14 stems concurrently using native AD107 CUDA SM_89 28-channel batched P-OLA
CUFFT convolution (band_dsp_cuda.dll) resident in 32MB L2 Cache.

Target: < 1.20 ms block latency, 100% L2 cache residency, studio-grade binaural acoustics.
"""

import os
import sys
import time
import ctypes
import argparse
import subprocess
import numpy as np
import soundfile as sf
import mido

# Force UTF-8 output streams on Windows
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')
if hasattr(sys.stderr, 'reconfigure'):
    sys.stderr.reconfigure(encoding='utf-8')

WORKDIR = os.path.dirname(os.path.abspath(__file__))
FLUIDSYNTH = r"C:\dev\tools\fluidsynth\bin\fluidsynth.exe"
SOUNDFONT = r"C:\dev\tools\soundfonts\MuseScore_General.sf3"
DLL_PATH = os.path.join(WORKDIR, "band_dsp_cuda.dll")
CUDA_BIN = r"C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6\bin"

if os.path.exists(CUDA_BIN):
    os.add_dll_directory(CUDA_BIN)

INSTRUMENT_NAMES = [
    "Flute",
    "Oboe",
    "Bb Clarinet",
    "Alto Saxophone",
    "Bb Trumpet",
    "French Horn in F",
    "Tenor Trombone",
    "Tuba",
    "Electric Bass",
    "Cello",
    "Glockenspiel",
    "Marimba",
    "Timpani",
    "Concert Percussion"
]

def load_cuda_dsp():
    """Loads and initializes band_dsp_cuda.dll C-ABI exports."""
    if not os.path.exists(DLL_PATH):
        raise FileNotFoundError(f"band_dsp_cuda.dll not found at: {DLL_PATH}")

    dsp = ctypes.CDLL(DLL_PATH)

    dsp.cu_get_device_telemetry.restype = ctypes.c_char_p
    dsp.cu_binaural_pola_init.argtypes = [ctypes.c_int, ctypes.c_int, ctypes.c_int, ctypes.c_int]
    dsp.cu_binaural_pola_init.restype = ctypes.c_int

    dsp.cu_binaural_pola_generate_hall_acoustics.argtypes = [ctypes.c_float, ctypes.c_float, ctypes.c_float]
    dsp.cu_binaural_pola_generate_hall_acoustics.restype = ctypes.c_int

    dsp.cu_benchmark_pola_latency.argtypes = [ctypes.c_int]
    dsp.cu_benchmark_pola_latency.restype = ctypes.c_float

    dsp.cu_binaural_pola_process_stream.argtypes = [
        ctypes.POINTER(ctypes.c_float),
        ctypes.POINTER(ctypes.c_float),
        ctypes.c_int,
        ctypes.POINTER(ctypes.c_float)
    ]
    dsp.cu_binaural_pola_process_stream.restype = ctypes.c_int

    dsp.cu_binaural_pola_destroy.restype = None
    return dsp

def extract_and_render_dry_stems(input_midi: str, scratch_dir: str, sample_rate: int = 44100):
    """
    Extracts individual note tracks from multi-track MIDI and renders
    completely dry 44.1kHz audio stems via FluidSynth (reverb disabled).
    """
    os.makedirs(scratch_dir, exist_ok=True)
    mid = mido.MidiFile(input_midi, clip=True)

    tempo_track = None
    note_tracks = []

    for tr in mid.tracks:
        has_notes = any(msg.type in ('note_on', 'note_off') for msg in tr)
        if has_notes:
            note_tracks.append(tr)
        elif tempo_track is None:
            tempo_track = tr

    print(f"[EXTRACT] Found {len(note_tracks)} note tracks in {os.path.basename(input_midi)}")

    dry_stem_files = []
    for idx, tr in enumerate(note_tracks[:14]):
        inst_label = INSTRUMENT_NAMES[idx] if idx < len(INSTRUMENT_NAMES) else f"Stem_{idx+1}"
        stem_mid = os.path.join(scratch_dir, f"stem_{idx:02d}.mid")
        stem_wav = os.path.join(scratch_dir, f"stem_{idx:02d}_dry.wav")

        stem_file = mido.MidiFile(ticks_per_beat=mid.ticks_per_beat)
        if tempo_track:
            stem_file.tracks.append(tempo_track)
        stem_file.tracks.append(tr)
        stem_file.save(stem_mid)

        # Render dry via FluidSynth (zero internal reverb, clean transients)
        cmd = [
            FLUIDSYNTH,
            "-F", stem_wav,
            "-r", str(sample_rate),
            "-o", "synth.reverb.active=0",
            "-o", "synth.chorus.active=0",
            "-o", "synth.gain=0.45",
            SOUNDFONT,
            stem_mid
        ]
        t_fs0 = time.perf_counter()
        res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        t_fs = (time.perf_counter() - t_fs0) * 1000.0

        if os.path.exists(stem_wav) and os.path.getsize(stem_wav) > 1024:
            size_mb = os.path.getsize(stem_wav) / (1024 * 1024)
            print(f"  [STEM {idx+1:02d}/14] {inst_label:19s} -> {size_mb:4.1f} MB ({t_fs:.0f} ms)")
            dry_stem_files.append(stem_wav)
        else:
            print(f"  [STEM {idx+1:02d}/14] {inst_label:19s} -> FAILED FluidSynth render", file=sys.stderr)

    return dry_stem_files

def render_binaural_master(input_midi: str, output_wav: str, rt60: float = 1.8, room_depth: float = 28.0, room_width: float = 20.0):
    """
    Full pipeline: Multi-track MIDI -> 14 Dry Stems -> AD107 CUDA SM_89 Batched P-OLA Convolution -> Master Stereo WAV.
    """
    scratch_dir = os.path.join(WORKDIR, "scratch_binaural")
    t_start = time.perf_counter()

    # 1. Load CUDA DSP Engine
    print("=======================================================================")
    print("WISCONSIN RAPIDS CITY BAND BINAURAL MASTER RENDERER (AD107 CUDA)")
    print("=======================================================================")
    dsp = load_cuda_dsp()
    telemetry = dsp.cu_get_device_telemetry().decode('utf-8')
    print(f"Hardware Engine: {telemetry}\n")

    # 2. Extract & Render 14 Dry Stems via FluidSynth
    sample_rate = 44100
    stem_files = extract_and_render_dry_stems(input_midi, scratch_dir, sample_rate)
    num_stems = len(stem_files)
    if num_stems == 0:
        raise RuntimeError("No audio stems could be rendered.")

    # 3. Read and Align Stem Audio Buffers
    print(f"\n[ALIGN] Loading and stacking {num_stems} audio stems...")
    stem_data_list = []
    max_len = 0
    for wav_path in stem_files:
        data, sr = sf.read(wav_path)
        if data.ndim > 1:
            data = data[:, 0]
        stem_data_list.append(data.astype(np.float32))
        if len(data) > max_len:
            max_len = len(data)

    h_stems = np.zeros((14, max_len), dtype=np.float32)
    for i in range(min(num_stems, 14)):
        h_stems[i, :len(stem_data_list[i])] = stem_data_list[i]

    duration_sec = max_len / sample_rate
    print(f"  Total Master Length: {max_len:,} samples ({duration_sec:.2f} s / {duration_sec/60:.2f} min)")

    # 4. Initialize CUDA Batched P-OLA Engine
    block_size = 1024
    num_partitions = 44
    num_sources = 14

    print(f"\n[CUDA] Initializing 28-Channel Batched P-OLA CUFFT Engine (B={block_size}, P={num_partitions})...")
    ret_init = dsp.cu_binaural_pola_init(sample_rate, block_size, num_partitions, num_sources)
    if ret_init != 0:
        raise RuntimeError(f"cu_binaural_pola_init failed with code {ret_init}")

    print(f"[CUDA] Synthesizing Wisconsin Rapids Concert Hall Acoustics (RT60={rt60}s, {room_depth}m x {room_width}m)...")
    ret_ac = dsp.cu_binaural_pola_generate_hall_acoustics(
        ctypes.c_float(rt60),
        ctypes.c_float(room_depth),
        ctypes.c_float(room_width)
    )
    if ret_ac != 0:
        dsp.cu_binaural_pola_destroy()
        raise RuntimeError(f"cu_binaural_pola_generate_hall_acoustics failed with code {ret_ac}")

    # 5. Process Entire Multi-Channel Stream on AD107 RTX 4060
    print(f"[CUDA] Convolving 14 Stems -> Binaural Stereo Master on RTX 4060...")
    h_stereo_out = np.zeros((max_len, 2), dtype=np.float32)
    elapsed_gpu_ms = ctypes.c_float(0.0)

    stems_flat = np.ascontiguousarray(h_stems.flatten(), dtype=np.float32)
    stereo_flat = np.ascontiguousarray(h_stereo_out.flatten(), dtype=np.float32)

    ret_stream = dsp.cu_binaural_pola_process_stream(
        stems_flat.ctypes.data_as(ctypes.POINTER(ctypes.c_float)),
        stereo_flat.ctypes.data_as(ctypes.POINTER(ctypes.c_float)),
        max_len,
        ctypes.byref(elapsed_gpu_ms)
    )

    dsp.cu_binaural_pola_destroy()

    if ret_stream != 0:
        raise RuntimeError(f"cu_binaural_pola_process_stream failed with code {ret_stream}")

    master_audio = stereo_flat.reshape((max_len, 2))
    gpu_time_ms = elapsed_gpu_ms.value
    rtf_speed = (duration_sec * 1000.0) / gpu_time_ms if gpu_time_ms > 0 else 0.0

    print(f"  GPU Kernel Execution Time: {gpu_time_ms:.2f} ms")
    print(f"  Convolution Speedup Ratio: {rtf_speed:.1f}x Real-Time")

    # 6. Master Peak Normalization (-0.3 dBFS)
    peak = float(np.max(np.abs(master_audio)))
    if peak > 0:
        target_peak = 10.0 ** (-0.3 / 20.0)  # ~0.966
        master_audio = (master_audio / peak) * target_peak
        print(f"  Master Peak Normalization: {peak:.4f} -> {target_peak:.4f} (-0.3 dBFS)")

    # 7. Write Master WAV
    os.makedirs(os.path.dirname(os.path.abspath(output_wav)), exist_ok=True)
    sf.write(output_wav, master_audio, sample_rate, subtype="PCM_24")
    out_size_mb = os.path.getsize(output_wav) / (1024 * 1024)

    total_time = time.perf_counter() - t_start
    print(f"\n=======================================================================")
    print(f"BINAURAL MASTER AUDIO RENDER COMPLETE")
    print(f"=======================================================================")
    print(f"  Output Master WAV: {output_wav}")
    print(f"  Format           : 44.1 kHz, 24-bit Stereo PCM")
    print(f"  Size             : {out_size_mb:.2f} MB")
    print(f"  Total Pipeline   : {total_time:.2f} seconds")
    print(f"=======================================================================\n")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Wisconsin Rapids City Band CUDA Binaural Master Renderer")
    parser.add_argument("input_midi", help="Input multi-track MIDI file")
    parser.add_argument("-o", "--output", default="dsl_city_of_evil_binaural_master.wav", help="Output binaural master WAV")
    parser.add_argument("--rt60", type=float, default=1.8, help="Hall reverberation time RT60 in seconds")
    parser.add_argument("--depth", type=float, default=28.0, help="Hall depth in meters")
    parser.add_argument("--width", type=float, default=20.0, help="Hall width in meters")
    args = parser.parse_args()

    render_binaural_master(args.input_midi, args.output, args.rt60, args.depth, args.width)
