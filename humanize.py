#!/usr/bin/env python3
"""
MIDI Humanized Renderer (humanize.py) - Pure Mido Acoustic Expression Edition
Uses mido with clip=True to safely parse LilyPond MIDI files and injects:
1. Micro-timing jitter (±6ms)
2. Expressive velocity fluctuations and downbeat accents
3. Continuous CC 11 (Expression) breath/swell curves on sustained notes
4. CC 1 vibrato on melodic wind/brass voices
5. Concert band seating CC 10 spatial panning
"""

import os
import sys
import argparse
import random
import math
import mido

DEFAULT_SEATING_PAN = [38, 46, 30, 50, 90, 42, 84, 76, 64, 34, 60, 64, 78, 56, 70]

def humanize_midi(
    input_path: str,
    output_path: str,
    timing_jitter_ticks: int = 0,
    vel_jitter: int = 4,
    downbeat_accent: int = 4,
    enable_expression: bool = True
) -> bool:
    if not os.path.exists(input_path):
        print(f"[ERROR] Input MIDI not found: {input_path}", file=sys.stderr)
        return False

    try:
        mid = mido.MidiFile(input_path, clip=True)
    except Exception as e:
        print(f"[ERROR] Failed to parse MIDI '{input_path}': {e}", file=sys.stderr)
        return False

    ticks_per_beat = mid.ticks_per_beat or 480
    total_notes_adjusted = 0
    total_cc11_injected = 0
    pan_idx = 0

    out_mid = mido.MidiFile(ticks_per_beat=ticks_per_beat)

    for track_idx, track in enumerate(mid.tracks):
        new_track = mido.MidiTrack()
        has_notes = any(msg.type == 'note_on' and getattr(msg, 'velocity', 0) > 0 for msg in track)

        # Detect track channel
        track_ch = 0
        for msg in track:
            if hasattr(msg, 'channel'):
                track_ch = msg.channel
                break

        # Inject initial CC 10 pan if musical track
        if has_notes:
            pan_val = DEFAULT_SEATING_PAN[pan_idx] if pan_idx < len(DEFAULT_SEATING_PAN) else 64
            pan_idx += 1
            new_track.append(mido.Message('control_change', channel=track_ch, control=10, value=pan_val, time=0))
            if enable_expression and track_ch != 9:  # Non-drum initial expression
                new_track.append(mido.Message('control_change', channel=track_ch, control=11, value=96, time=0))

        # First pass: collect messages and simulate micro-timing
        current_tick = 0
        active_notes = {}  # note -> (start_tick, velocity, msg_index)

        # We will build absolute-time message sequence
        abs_events = []
        cur_t = 0
        for msg in track:
            cur_t += msg.time
            abs_events.append((cur_t, msg))

        # Humanize events
        final_events = []
        for abs_time, msg in abs_events:
            if not msg.is_meta:
                # 1. Micro-timing jitter
                t_jitter = random.randint(-timing_jitter_ticks, timing_jitter_ticks) if abs_time > 0 else 0
                event_time = max(0, abs_time + t_jitter)

                # 2. Velocity humanization
                if msg.type == 'note_on' and msg.velocity > 0:
                    beat_pos = (event_time / ticks_per_beat) % 4.0
                    is_downbeat = (beat_pos < 0.2 or (beat_pos > 1.8 and beat_pos < 2.2))
                    accent = downbeat_accent if is_downbeat else 0
                    v_delta = random.randint(-vel_jitter, vel_jitter)
                    new_vel = min(127, max(1, msg.velocity + v_delta + accent))
                    
                    new_msg = msg.copy(velocity=new_vel)
                    final_events.append((event_time, new_msg))
                    active_notes[msg.note] = (event_time, new_vel)
                    total_notes_adjusted += 1

                elif msg.type == 'note_off' or (msg.type == 'note_on' and msg.velocity == 0):
                    final_events.append((event_time, msg))
                    if msg.note in active_notes and enable_expression and track_ch != 9:
                        start_tick, base_vel = active_notes.pop(msg.note)
                        dur_ticks = event_time - start_tick
                        # If duration is half note or longer (e.g. >= 2 beats)
                        if dur_ticks >= int(ticks_per_beat * 1.5):
                            # Inject 6 CC 11 breath curve points between start_tick and event_time
                            num_steps = 7
                            step_ticks = dur_ticks // num_steps
                            target_peak = min(127, max(45, int(base_vel * 1.05)))
                            attack_floor = max(35, int(target_peak * 0.75))
                            release_floor = max(30, int(target_peak * 0.50))

                            for s in range(1, num_steps):
                                frac = s / num_steps
                                cc_tick = start_tick + (s * step_ticks)
                                if frac <= 0.20:
                                    p = frac / 0.20
                                    c_val = attack_floor + (target_peak - attack_floor) * (p ** 1.5)
                                elif frac <= 0.75:
                                    drift = 2.0 * math.sin(2.0 * math.pi * (frac - 0.20) * 2.5)
                                    c_val = target_peak + drift
                                else:
                                    p = (frac - 0.75) / 0.25
                                    c_val = target_peak - (target_peak - release_floor) * (p ** 1.2)
                                
                                c_clamped = min(127, max(1, int(c_val)))
                                cc_msg = mido.Message('control_change', channel=track_ch, control=11, value=c_clamped, time=0)
                                final_events.append((cc_tick, cc_msg))
                                total_cc11_injected += 1
                else:
                    final_events.append((event_time, msg))
            else:
                final_events.append((abs_time, msg))

        # Sort all events by absolute time (stable sort keeps note_on before note_off if coincident)
        final_events.sort(key=lambda x: x[0])

        # Convert back to delta times
        last_t = 0
        for ev_time, ev_msg in final_events:
            delta = max(0, ev_time - last_t)
            new_track.append(ev_msg.copy(time=delta))
            last_t = ev_time

        out_mid.tracks.append(new_track)

    os.makedirs(os.path.dirname(os.path.abspath(output_path)), exist_ok=True)
    out_mid.save(output_path)
    print(f"[SUCCESS] Humanized {total_notes_adjusted} notes across {len(out_mid.tracks)} tracks.")
    print(f"          Injected {total_cc11_injected} continuous CC 11 expression breath control events.")
    print(f"          Output: {output_path}")
    return True

def main():
    parser = argparse.ArgumentParser(description="Humanize LilyPond MIDI files with mido & acoustic expression.")
    parser.add_argument("input", help="Input MIDI file path")
    parser.add_argument("-o", "--output", help="Output MIDI file path")
    parser.add_argument("--jitter-ticks", type=int, default=8, help="Micro-timing jitter in ticks (default: 8)")
    parser.add_argument("--vel-jitter", type=int, default=5, help="Velocity variation (default: ±5)")
    parser.add_argument("--downbeat-accent", type=int, default=4, help="Downbeat velocity boost (default: +4)")
    parser.add_argument("--no-expression", action="store_true", help="Disable CC 11 breath envelopes")

    args = parser.parse_args()
    output = args.output or args.input.replace(".mid", "_humanized.mid")

    success = humanize_midi(
        args.input,
        output,
        timing_jitter_ticks=args.jitter_ticks,
        vel_jitter=args.vel_jitter,
        downbeat_accent=args.downbeat_accent,
        enable_expression=not args.no_expression
    )
    sys.exit(0 if success else 1)

if __name__ == "__main__":
    main()
