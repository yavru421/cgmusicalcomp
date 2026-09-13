#!/usr/bin/env python3
"""
MIDI Humanized Renderer (humanize.py)
Adds micro-timing jitter (±6ms) and organic velocity curves to LilyPond MIDI outputs
prior to FluidSynth acoustic rendering.

Uses pretty_midi / mido for precise timestamp and velocity manipulation.
"""

import os
import sys
import argparse
import random
import numpy as np
import pretty_midi

def humanize_midi(
    input_path: str,
    output_path: str,
    jitter_ms: float = 6.0,
    vel_jitter: int = 5,
    downbeat_accent: int = 4,
    preserve_drum_timing: bool = True
) -> bool:
    """
    Humanizes a MIDI file by applying micro-timing variations and expressive velocity curves.
    
    Args:
        input_path: Path to source MIDI file
        output_path: Path to write humanized MIDI file
        jitter_ms: Micro-timing offset range in milliseconds (default: ±6ms)
        vel_jitter: Random velocity jitter range (default: ±5 units)
        downbeat_accent: Velocity boost added to strong beats (default: +4 units)
        preserve_drum_timing: Keep drums tighter (±2ms) to maintain rhythmic groove
        
    Returns:
        True if successful, False otherwise.
    """
    if not os.path.exists(input_path):
        print(f"[ERROR] Input MIDI not found: {input_path}", file=sys.stderr)
        return False
        
    try:
        midi_data = pretty_midi.PrettyMIDI(input_path)
    except Exception as e:
        print(f"[ERROR] Failed to parse MIDI '{input_path}': {e}", file=sys.stderr)
        return False

    jitter_sec = jitter_ms / 1000.0
    drum_jitter_sec = 0.002 if preserve_drum_timing else jitter_sec

    total_notes_adjusted = 0

    for inst in midi_data.instruments:
        is_drum = inst.is_drum
        cur_jitter = drum_jitter_sec if is_drum else jitter_sec

        # Sort notes temporally
        inst.notes.sort(key=lambda n: n.start)

        for i, note in enumerate(inst.notes):
            # 1. Micro-timing humanization (Gaussian jitter centered on 0, clamped to ±jitter_sec)
            dt_start = np.clip(random.gauss(0, cur_jitter * 0.5), -cur_jitter, cur_jitter)
            dt_end = np.clip(random.gauss(0, cur_jitter * 0.5), -cur_jitter, cur_jitter)

            new_start = max(0.0, note.start + dt_start)
            new_end = max(new_start + 0.015, note.end + dt_end)

            note.start = new_start
            note.end = new_end

            # 2. Velocity dynamics & metric weighting
            # If on beat 1 or 3 in 4/4 (approximate beat phase), add subtle weight
            beat_phase = (note.start * 2.0) % 2.0  # Normalized half-note phase
            metric_bonus = downbeat_accent if (beat_phase < 0.1 or beat_phase > 1.9) else 0

            # Random organic velocity variation
            v_delta = random.randint(-vel_jitter, vel_jitter)
            new_vel = int(np.clip(note.velocity + v_delta + metric_bonus, 1, 127))
            note.velocity = new_vel

            total_notes_adjusted += 1

    os.makedirs(os.path.dirname(os.path.abspath(output_path)), exist_ok=True)
    midi_data.write(output_path)
    print(f"[SUCCESS] Humanized {total_notes_adjusted} notes across {len(midi_data.instruments)} tracks.")
    print(f"          Output: {output_path}")
    return True

def main():
    parser = argparse.ArgumentParser(description="Humanize LilyPond MIDI files for acoustic rendering.")
    parser.add_argument("input", nargs="?", help="Input MIDI file path")
    parser.add_argument("-o", "--output", help="Output MIDI file path (default: <name>_humanized.mid)")
    parser.add_argument("--jitter-ms", type=float, default=6.0, help="Micro-timing jitter in milliseconds (default: 6.0ms)")
    parser.add_argument("--vel-jitter", type=int, default=5, help="Random velocity variation (default: ±5)")
    parser.add_argument("--downbeat-accent", type=int, default=4, help="Downbeat velocity boost (default: +4)")
    parser.add_argument("--batch-dir", help="Directory of MIDI files to process in batch")
    
    args = parser.parse_args()

    if args.batch_dir:
        if not os.path.exists(args.batch_dir):
            print(f"[ERROR] Directory not found: {args.batch_dir}", file=sys.stderr)
            sys.exit(1)
        midi_files = [f for f in os.listdir(args.batch_dir) if f.endswith(".mid") and not f.endswith("_humanized.mid")]
        print(f"[BATCH] Processing {len(midi_files)} MIDI files in {args.batch_dir}...")
        for mf in midi_files:
            in_file = os.path.join(args.batch_dir, mf)
            out_file = os.path.join(args.batch_dir, mf[:-4] + "_humanized.mid")
            humanize_midi(in_file, out_file, args.jitter_ms, args.vel_jitter, args.downbeat_accent)
        sys.exit(0)

    if not args.input:
        parser.print_help()
        sys.exit(1)

    output = args.output
    if not output:
        base, ext = os.path.splitext(args.input)
        output = f"{base}_humanized{ext}"

    success = humanize_midi(args.input, output, args.jitter_ms, args.vel_jitter, args.downbeat_accent)
    sys.exit(0 if success else 1)

if __name__ == "__main__":
    main()
