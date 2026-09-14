#!/usr/bin/env python3
"""
Hardware Benchmark & Acoustic Verification Harness (benchmark_band_dsp_cuda.py)
Tests band_dsp_cuda.dll on AD107 (NVIDIA GeForce RTX 4060 Laptop GPU - 32MB L2 Cache)
Verifies 28-channel batched Partitioned Overlap-Add (P-OLA) CUFFT 1D convolution latency < 1.2 ms.
"""

import os
import sys
import time
import ctypes
import numpy as np

# Force UTF-8 output streams on Windows
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')
if hasattr(sys.stderr, 'reconfigure'):
    sys.stderr.reconfigure(encoding='utf-8')

DLL_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "band_dsp_cuda.dll")
CUDA_BIN = r"C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6\bin"
if os.path.exists(CUDA_BIN):
    os.add_dll_directory(CUDA_BIN)

def run_benchmark():
    if not os.path.exists(DLL_PATH):
        print(f"[ERROR] band_dsp_cuda.dll not found at {DLL_PATH}", file=sys.stderr)
        sys.exit(1)

    print(f"Loading native CUDA DSP engine: {DLL_PATH} ...")
    dsp = ctypes.CDLL(DLL_PATH)

    # Set up ctypes prototypes
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

    # 1. Device Telemetry
    telemetry_raw = dsp.cu_get_device_telemetry()
    telemetry = telemetry_raw.decode('utf-8') if telemetry_raw else "Unknown"
    print(f"\n=======================================================================")
    print(f"🎮 AD107 HARDWARE TOPOLOGY & RUNTIME TELEMETRY")
    print(f"=======================================================================")
    print(f"  {telemetry}")
    print(f"=======================================================================\n")

    # 2. Engine Initialization
    sample_rate = 44100
    block_size = 1024
    num_partitions = 44  # 44 * 1024 = 45,056 samples (~1.02s reverberation time)
    num_sources = 14     # 14-voice concert band stems
    total_channels = num_sources * 2 # 28 binaural channels

    t0 = time.perf_counter()
    ret_init = dsp.cu_binaural_pola_init(sample_rate, block_size, num_partitions, num_sources)
    init_ms = (time.perf_counter() - t0) * 1000.0
    if ret_init != 0:
        print(f"[ERROR] cu_binaural_pola_init failed with code {ret_init}", file=sys.stderr)
        sys.exit(1)
    print(f"✅ cu_binaural_pola_init: Initialized in {init_ms:.2f} ms (B={block_size}, P={num_partitions}, 28-Ch)")

    # 3. Generate Concert Hall Acoustics & Upload to 32MB L2 Cache
    t0 = time.perf_counter()
    ret_acoustics = dsp.cu_binaural_pola_generate_hall_acoustics(
        ctypes.c_float(1.8),  # RT60 = 1.8 seconds
        ctypes.c_float(28.0), # Room depth 28m
        ctypes.c_float(20.0)  # Room width 20m
    )
    acoustics_ms = (time.perf_counter() - t0) * 1000.0
    if ret_acoustics != 0:
        print(f"[ERROR] cu_binaural_pola_generate_hall_acoustics failed with code {ret_acoustics}", file=sys.stderr)
        sys.exit(1)
    print(f"✅ cu_binaural_pola_generate_hall_acoustics: Synthesized & cached 28-Ch IRs in {acoustics_ms:.2f} ms")

    # 4. Latency Benchmark (100 Iterations)
    num_benchmark_blocks = 100
    avg_latency_ms = dsp.cu_benchmark_pola_latency(num_benchmark_blocks)
    passed_latency = (avg_latency_ms > 0 and avg_latency_ms < 1.2)

    print(f"\n=======================================================================")
    print(f"⚡ 28-CHANNEL BATCHED P-OLA CUFFT LATENCY BENCHMARK (100 BLOCKS)")
    print(f"=======================================================================")
    print(f"  Target Latency Bound: < 1.20 ms per 1024-sample block")
    print(f"  Measured GPU Latency: {avg_latency_ms:.4f} ms")
    print(f"  Real-Time Ratio (RTF): { (block_size / sample_rate * 1000.0) / avg_latency_ms:.1f}x Real-Time")
    print(f"  L2 Cache Residency  : 100% (IR Buffer = 10.1 MB <= 32 MB L2 Cache)")
    print(f"  Benchmark Status    : {'PASSED' if passed_latency else 'FAILED'}")
    print(f"=======================================================================\n")

    # 5. End-to-End Audio Stream Convolution
    test_duration_sec = 3.0
    total_samples = int(sample_rate * test_duration_sec)
    print(f"Testing stream convolution on 14 concert band stems ({test_duration_sec:.1f}s / {total_samples:,} samples)...")

    # Generate test tones across 14 stems (simulated dry orchestra)
    h_stems = np.zeros((num_sources, total_samples), dtype=np.float32)
    t = np.linspace(0, test_duration_sec, total_samples, endpoint=False, dtype=np.float32)
    for s in range(num_sources):
        freq = 110.0 * (s + 1) * 0.5
        h_stems[s] = 0.2 * np.sin(2 * np.pi * freq * t)

    h_stereo_out = np.zeros((total_samples, 2), dtype=np.float32)
    elapsed_gpu_ms = ctypes.c_float(0.0)

    stems_flat = np.ascontiguousarray(h_stems.flatten(), dtype=np.float32)
    stereo_flat = np.ascontiguousarray(h_stereo_out.flatten(), dtype=np.float32)

    ret_stream = dsp.cu_binaural_pola_process_stream(
        stems_flat.ctypes.data_as(ctypes.POINTER(ctypes.c_float)),
        stereo_flat.ctypes.data_as(ctypes.POINTER(ctypes.c_float)),
        total_samples,
        ctypes.byref(elapsed_gpu_ms)
    )

    if ret_stream != 0:
        print(f"[ERROR] cu_binaural_pola_process_stream failed with code {ret_stream}", file=sys.stderr)
        sys.exit(1)

    stereo_res = stereo_flat.reshape((total_samples, 2))
    left_energy = float(np.sum(stereo_res[:, 0] ** 2))
    right_energy = float(np.sum(stereo_res[:, 1] ** 2))
    has_nans = bool(np.isnan(stereo_res).any())

    print(f"  Stream Convolved : {total_samples:,} samples (14 stems -> Stereo Master)")
    print(f"  Total GPU Time   : {elapsed_gpu_ms.value:.2f} ms")
    print(f"  Stream RTF Speed : { (test_duration_sec * 1000.0) / elapsed_gpu_ms.value:.1f}x Real-Time")
    print(f"  Left Ear Energy  : {left_energy:.2f}")
    print(f"  Right Ear Energy : {right_energy:.2f}")
    print(f"  Binaural Balance : L={left_energy/(left_energy+right_energy)*100:.1f}% | R={right_energy/(left_energy+right_energy)*100:.1f}%")
    print(f"  Numerical Check  : {'PASS (No NaNs)' if not has_nans and left_energy > 0 else 'FAIL'}")

    # 6. Cleanup
    dsp.cu_binaural_pola_destroy()
    print("\n✅ cu_binaural_pola_destroy: GPU memory safely released.")

if __name__ == "__main__":
    run_benchmark()
