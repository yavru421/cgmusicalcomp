#!/usr/bin/env python3
"""
Dual-Bus Acoustic Stem Renderer (render_dual_bus.py)
Renders multi-track MIDI into two acoustically decoupled stems via FluidSynth:
  1. Low & Rhythm Foundation (Tuba, Bass, Timpani, Percussion): Dry, punchy, high-transient
  2. Lyrical & Harmonic Top (Woodwinds, Brass, Mallets): Warm concert hall acoustic reverb
Summed and normalized to -0.3 dBFS master.
"""

import os
import sys
import argparse
import subprocess
import numpy as np
import soundfile as sf
import mido

FLUIDSYNTH = r"C:\dev\tools\fluidsynth\bin\fluidsynth.exe"
SOUNDFONT = r"C:\dev\tools\soundfonts\MuseScore_General.sf3"

# Instrument names or MIDI channels associated with low foundation & battery
LOW_AND_RHYTHM_KEYWORDS = ["tuba", "bass", "timpani", "perc", "drum", "surdo", "battery"]

def split_midi_stems(input_midi: str, stem_low_mid: str, stem_top_mid: str):
    """Splits a multi-track MIDI into Low/Rhythm and Lyrical/Top stems."""
    mid = mido.MidiFile(input_midi, clip=True)
    mid_low = mido.MidiFile(ticks_per_beat=mid.ticks_per_beat)
    mid_top = mido.MidiFile(ticks_per_beat=mid.ticks_per_beat)

    for i, track in enumerate(mid.tracks):
        track_name = track.name.lower() if track.name else f"track_{i}"
        is_drum = False
        is_low = False

        for msg in track:
            if hasattr(msg, 'channel') and msg.channel == 9:
                is_drum = True
                break

        if any(kw in track_name for kw in LOW_AND_RHYTHM_KEYWORDS) or is_drum:
            is_low = True

        # In typical 14-track layout: tracks 7 (tuba), 8 (bass), 11-14 (perc/timp)
        if i in [7, 8, 11, 12, 13, 14]:
            is_low = True

        if is_low:
            mid_low.tracks.append(track)
        else:
            mid_top.tracks.append(track)

    mid_low.save(stem_low_mid)
    mid_top.save(stem_top_mid)
    print(f"[STEM] Decoupled MIDI into:\n       - Low/Rhythm: {len(mid_low.tracks)} tracks\n       - Lyrical/Top: {len(mid_top.tracks)} tracks")

def render_stem(mid_path: str, wav_path: str, is_low_rhythm: bool):
    """Renders a MIDI stem with calibrated acoustic DSP parameters."""
    if is_low_rhythm:
        # Tight, dry, zero-mud reverb profile for bass and drums
        reverb_args = [
            "-o", "synth.reverb.active=1",
            "-o", "synth.reverb.room-size=0.20",
            "-o", "synth.reverb.damp=0.85",
            "-o", "synth.reverb.width=0.50",
            "-o", "synth.reverb.level=0.06",
            "-o", "synth.gain=0.48"
        ]
    else:
        # Lush concert hall reverb profile for woodwinds, brass, and mallets
        reverb_args = [
            "-o", "synth.reverb.active=1",
            "-o", "synth.reverb.room-size=0.50",
            "-o", "synth.reverb.damp=0.55",
            "-o", "synth.reverb.width=0.80",
            "-o", "synth.reverb.level=0.28",
            "-o", "synth.gain=0.42"
        ]

    cmd = [FLUIDSYNTH, "-F", wav_path] + reverb_args + [SOUNDFONT, mid_path]
    subprocess.run(cmd, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

def render_dual_bus(input_midi: str, output_wav: str):
    """Orchestrates the 2-stem render, summing, and master peak normalization."""
    base_dir = os.path.dirname(os.path.abspath(output_wav))
    stem_low_mid = os.path.join(base_dir, "_temp_low.mid")
    stem_top_mid = os.path.join(base_dir, "_temp_top.mid")
    stem_low_wav = os.path.join(base_dir, "_temp_low.wav")
    stem_top_wav = os.path.join(base_dir, "_temp_top.wav")

    try:
        # 1. Split MIDI into stems
        split_midi_stems(input_midi, stem_low_mid, stem_top_mid)

        # 2. Render both stems concurrently / sequentially
        print("[DSP] Rendering Low/Rhythm foundation stem (dry/punchy)...")
        render_stem(stem_low_mid, stem_low_wav, is_low_rhythm=True)

        print("[DSP] Rendering Lyrical/Top melodic stem (lush hall reverb)...")
        render_stem(stem_top_mid, stem_top_wav, is_low_rhythm=False)

        # 3. Sum audio stems
        audio_low, sr1 = sf.read(stem_low_wav)
        audio_top, sr2 = sf.read(stem_top_wav)

        min_len = min(len(audio_low), len(audio_top))
        audio_low = audio_low[:min_len]
        audio_top = audio_top[:min_len]

        mixed = audio_low + audio_top

        # 4. Master Peak Normalization (-0.3 dBFS)
        peak = np.max(np.abs(mixed))
        if peak > 0:
            target_peak = 10.0 ** (-0.3 / 20.0)  # ~0.966
            mixed = (mixed / peak) * target_peak

        sf.write(output_wav, mixed, sr1)
        size_mb = os.path.getsize(output_wav) / (1024 * 1024)
        print(f"[SUCCESS] Dual-bus master rendered: {output_wav} ({size_mb:.1f} MB, peak normalized to -0.3 dBFS)")

    finally:
        # Cleanup temp stems
        for tmp in [stem_low_mid, stem_top_mid, stem_low_wav, stem_top_wav]:
            if os.path.exists(tmp):
                try:
                    os.remove(tmp)
                except Exception:
                    pass

def main():
    parser = argparse.ArgumentParser(description="Dual-Bus FluidSynth Stem Master Renderer")
    parser.add_argument("input_midi", help="Input humanized MIDI file")
    parser.add_argument("-o", "--output", required=True, help="Output master WAV file")
    args = parser.parse_args()

    render_dual_bus(args.input_midi, args.output)

if __name__ == "__main__":
    main()
