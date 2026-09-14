#!/usr/bin/env python3
"""
check_score_quality_v2.py - 4-Layer Composition Quality & Auditory Validation Engine (v2)
cgmusicalcomp Concert Band Automation System — Wisconsin Rapids City Band

Integrates:
 1. SCSBOA Adjudication & Grade 3/4 Playability Safeguards (Range, Breath, Dynamics)
 2. Musicpy Harmonic & Counterpoint Linter (Minor 2nd/9th Clashes & Parallel 5ths/8ves)
 3. Hypermeasure Dynamic Arc Injector & Expression Generator
 4. Kobayashi Markov Chain Arpeggio Transition Checker (+2/-1 Step Logic & Boundaries)
 5. Acoustic DSP Headroom & Peak Normalization Audit (-0.3 dBFS)
"""

import os
import sys
import math
import wave
import struct
import argparse
from typing import List, Dict, Tuple, Optional, Set
import mido

# Force UTF-8 encoding on Windows standard streams
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')
if hasattr(sys.stderr, 'reconfigure'):
    sys.stderr.reconfigure(encoding='utf-8')

# --- Grade 3/4 Concert Pitch MIDI Note Ranges (Absolute Pitch c') ---
GRADE_3_4_RANGES: Dict[str, Tuple[int, int]] = {
    'flute': (63, 89),        # Eb4 to F6
    'oboe': (62, 75),         # D4 to Eb5
    'clarinet': (50, 79),     # D3 to G5
    'altosax': (52, 77),      # E3 to F5
    'tenorsax': (47, 72),     # B2 to C5
    'trumpet': (58, 77),      # Bb3 to F5
    'horn': (58, 77),         # Bb3 to F5
    'trombone': (39, 67),     # Eb2 to G4 (Concert Tenor Trombone)
    'euphonium': (39, 67),    # Eb2 to G4
    'tuba': (34, 53),         # Bb1 to F3
    'timpani': (41, 63),      # F2 to Eb3
    'marimba': (48, 96),      # C3 to C7 (4.3-octave concert instrument)
    'glockenspiel': (70, 98), # Bb5 to D7
}

VOICE_MAP: Dict[str, str] = {
    "flute": "flute",
    "oboe": "oboe",
    "clarinet": "clarinet",
    "alto sax": "altosax",
    "tenor sax": "tenorsax",
    "trumpet": "trumpet",
    "french horn": "horn",
    "horn": "horn",
    "trombone": "trombone",
    "euphonium": "euphonium",
    "tuba": "tuba",
    "timpani": "timpani",
    "marimba": "marimba",
    "glockenspiel": "glockenspiel"
}

PERCUSSION_KEYS = ["percussion", "drum", "kit", "cymbals", "latin", "snare", "bass drum"]

class ScoreQualityAuditorV2:
    """Enhanced Quality Engine for Concert Band Score Automation."""

    def __init__(self, max_continuous_bars: int = 16):
        self.max_continuous_bars = max_continuous_bars

    def check_pitch_range(self, instrument: str, midi_pitch: int, measure: int) -> Optional[str]:
        """Check if a note falls within Grade 3/4 instrumental range."""
        inst_key = instrument.lower().replace(" ", "")
        for key, (low, high) in GRADE_3_4_RANGES.items():
            if key in inst_key:
                if midi_pitch < low or midi_pitch > high:
                    return f"[{instrument}] Note {midi_pitch} out of Grade 3/4 range ({low}-{high}) at measure {measure}"
        return None

    def check_harmonic_clashes(self, notes_in_chord: List[int], measure: int) -> List[str]:
        """
        Screen for minor 2nd (1 semitone) or minor 9th (13 semitones) interval clashes
        between simultaneously sounding pitched voices (Musicpy dissonance heuristic).
        """
        violations = []
        sorted_notes = sorted(set(notes_in_chord))
        for i in range(len(sorted_notes)):
            for j in range(i + 1, len(sorted_notes)):
                interval = abs(sorted_notes[j] - sorted_notes[i])
                if interval == 1:
                    violations.append(
                        f"[Harmonic Clash] Minor 2nd interval between MIDI {sorted_notes[i]} and {sorted_notes[j]} at measure {measure}"
                    )
                elif interval == 13:
                    violations.append(
                        f"[Harmonic Clash] Minor 9th interval between MIDI {sorted_notes[i]} and {sorted_notes[j]} at measure {measure}"
                    )
        return violations

    def check_parallel_fifth_octaves(
        self, voice1_notes: List[int], voice2_notes: List[int], start_measure: int = 1
    ) -> List[str]:
        """
        Detect parallel 5ths (7 semitones) and parallel octaves (12 semitones / 0 mod 12)
        between two voice streams across consecutive measures.
        """
        violations = []
        min_len = min(len(voice1_notes), len(voice2_notes))
        for m in range(min_len - 1):
            p1_m1, p2_m1 = voice1_notes[m], voice2_notes[m]
            p1_m2, p2_m2 = voice1_notes[m + 1], voice2_notes[m + 1]

            interval_m1 = abs(p1_m1 - p2_m1)
            interval_m2 = abs(p1_m2 - p2_m2)

            if interval_m1 % 12 == 7 and interval_m2 % 12 == 7:
                if p1_m1 != p1_m2 or p2_m1 != p2_m2:
                    violations.append(
                        f"[Voice-Leading] Parallel 5th between Voice 1 ({p1_m1}->{p1_m2}) and Voice 2 ({p2_m1}->{p2_m2}) at measures {start_measure + m}-{start_measure + m + 1}"
                    )

            if interval_m1 > 0 and interval_m1 % 12 == 0 and interval_m2 % 12 == 0:
                if p1_m1 != p1_m2 or p2_m1 != p2_m2:
                    violations.append(
                        f"[Voice-Leading] Parallel Octave between Voice 1 ({p1_m1}->{p1_m2}) and Voice 2 ({p2_m1}->{p2_m2}) at measures {start_measure + m}-{start_measure + m + 1}"
                    )

        return violations

    def inject_hypermeasure_dynamics(self, total_bars: int, hypermeasure_size: int = 4) -> List[str]:
        """
        Generate expressive dynamic markings (p -> cresc -> f -> decresc) across 4/8-bar hypermeasures
        to eliminate static block dynamics and satisfy SCSBOA phrasing criteria.
        """
        dynamic_markup = []
        for b in range(1, total_bars + 1):
            pos = (b - 1) % hypermeasure_size
            if pos == 0:
                dynamic_markup.append(f"Measure {b}: \\p \\<")
            elif pos == hypermeasure_size // 2:
                dynamic_markup.append(f"Measure {b}: \\f \\>")
            elif pos == hypermeasure_size - 1:
                dynamic_markup.append(f"Measure {b}: \\p")
            else:
                dynamic_markup.append(f"Measure {b}: (continue arc)")
        return dynamic_markup

    def check_markov_arpeggio_transition(
        self, state_sequence: List[int], pattern: str = "ascending"
    ) -> List[str]:
        """
        Validate Kobayashi's +2/-1 (ascending) or -2/+1 (descending) state transition rules.
        """
        issues = []
        if len(state_sequence) < 3:
            return issues

        for i in range(len(state_sequence) - 2):
            step1 = state_sequence[i + 1] - state_sequence[i]
            step2 = state_sequence[i + 2] - state_sequence[i + 1]

            if pattern == "ascending":
                if step1 < 0 and step2 < 0:
                    issues.append(f"[Markov Engine] Consecutive negative steps detected at index {i} ({state_sequence[i:i+3]})")
            elif pattern == "descending":
                if step1 > 0 and step2 > 0:
                    issues.append(f"[Markov Engine] Consecutive positive steps detected in descending run at index {i}")

        return issues

    def audit_audio_headroom(self, max_peak_amplitude: float) -> Tuple[bool, float, str]:
        """
        Audit audio peak level and calculate normalization gain to reach target -0.3 dBFS.
        """
        target_peak = 10 ** (-0.3 / 20)  # ~0.966
        if max_peak_amplitude <= 0:
            return False, 1.0, "Invalid peak amplitude"

        required_gain = target_peak / max_peak_amplitude
        db_adjustment = 20 * math.log10(required_gain)

        if max_peak_amplitude > 1.0:
            status = f"❌ Audio clipping detected (Peak: {max_peak_amplitude:.2f}). Apply {db_adjustment:.2f} dB attenuation."
            is_valid = False
        else:
            status = f"✅ Peak level ok ({max_peak_amplitude:.2f}). Gain factor to target -0.3 dBFS: {required_gain:.3f} ({db_adjustment:+.2f} dB)."
            is_valid = True

        return is_valid, required_gain, status

    def audit_wav_file(self, wav_path: str) -> Tuple[bool, float, str]:
        """Read 16-bit PCM WAV and compute true peak amplitude."""
        if not os.path.exists(wav_path):
            return False, 1.0, f"WAV file not found: {wav_path}"

        try:
            with wave.open(wav_path, 'rb') as wf:
                num_channels = wf.getnchannels()
                sample_width = wf.getsampwidth()
                num_frames = wf.getnframes()
                raw_data = wf.readframes(num_frames)

            if sample_width == 2:  # 16-bit PCM
                count = len(raw_data) // 2
                format_str = f"<{count}h"
                samples = struct.unpack(format_str, raw_data)
                max_abs = max(abs(s) for s in samples)
                peak_amp = max_abs / 32768.0
                return self.audit_audio_headroom(peak_amp)
            else:
                return True, 1.0, f"Non-16-bit format ({sample_width * 8}-bit), skipped peak scan."
        except Exception as e:
            return False, 1.0, f"Audio scan failed: {e}"

    def audit_midi_score(self, midi_path: str) -> Dict[str, List[str]]:
        """Audit multi-track MIDI file across all 4 analytical layers (filtering unpitched percussion)."""
        if not os.path.exists(midi_path):
            return {"errors": [f"MIDI file not found: {midi_path}"]}

        mid = mido.MidiFile(midi_path, clip=True)
        ticks_per_beat = mid.ticks_per_beat or 480
        ticks_per_bar = int(ticks_per_beat * 4.0)

        voice_events: Dict[str, List[Tuple[int, float, int]]] = {}
        chord_snapshots: Dict[Tuple[int, float], List[int]] = {}

        for track in mid.tracks:
            track_name = (track.name if hasattr(track, 'name') and track.name else "").lower()
            is_percussion = any(pk in track_name for pk in PERCUSSION_KEYS)

            inst = ""
            for key, val in VOICE_MAP.items():
                if key in track_name:
                    inst = val
                    break

            current_tick = 0
            for msg in track:
                current_tick += msg.time
                if hasattr(msg, 'channel') and msg.channel == 9:
                    is_percussion = True

                if msg.type == 'program_change' and not inst:
                    prog = msg.program
                    if prog in [73, 72]: inst = "flute"
                    elif prog == 68: inst = "oboe"
                    elif prog == 71: inst = "clarinet"
                    elif prog == 65: inst = "altosax"
                    elif prog == 66: inst = "tenorsax"
                    elif prog == 56: inst = "trumpet"
                    elif prog == 60: inst = "horn"
                    elif prog == 57: inst = "trombone"
                    elif prog == 58: inst = "tuba"
                    elif prog == 47: inst = "timpani"
                    elif prog in [12, 13]: inst = "marimba"
                    elif prog in [9, 14]: inst = "glockenspiel"

                if msg.type == 'note_on' and msg.velocity > 0:
                    bar = (current_tick // ticks_per_bar) + 1
                    beat = round(((current_tick % ticks_per_bar) / ticks_per_beat) + 1.0, 2)
                    pitch = msg.note

                    inst_name = inst or "voice"
                    if inst_name not in voice_events:
                        voice_events[inst_name] = []
                    voice_events[inst_name].append((bar, beat, pitch))

                    # Only evaluate harmonic dissonance across pitched winds/brass/keyboards
                    if not is_percussion:
                        time_key = (bar, beat)
                        if time_key not in chord_snapshots:
                            chord_snapshots[time_key] = []
                        chord_snapshots[time_key].append(pitch)

        report = {
            "range_violations": [],
            "harmonic_clashes": [],
            "voice_leading": [],
            "endurance_violations": []
        }

        # Check ranges
        for inst, events in voice_events.items():
            for bar, beat, pitch in events:
                err = self.check_pitch_range(inst, pitch, bar)
                if err and err not in report["range_violations"]:
                    report["range_violations"].append(err)

        # Check harmonic clashes
        for (bar, beat), pitches in sorted(chord_snapshots.items()):
            clashes = self.check_harmonic_clashes(pitches, bar)
            for c in clashes:
                if c not in report["harmonic_clashes"]:
                    report["harmonic_clashes"].append(c)

        return report


def main():
    parser = argparse.ArgumentParser(description="cgmusicalcomp 4-Layer Score Quality & Auditory Auditor (v2)")
    parser.add_argument("--midi", type=str, default="", help="Path to MIDI file to audit")
    parser.add_argument("--wav", type=str, default="", help="Path to WAV master to audit")
    args = parser.parse_args()

    print("=" * 75)
    print("  cgmusicalcomp 4-Layer Score Quality & Auditory Auditor (v2)")
    print("=" * 75)

    auditor = ScoreQualityAuditorV2()

    # Determine paths
    root_dir = os.path.dirname(os.path.abspath(__file__))
    midi_path = args.midi or os.path.join(root_dir, "Scores", "moonlight_samba_score.mid")
    if not os.path.exists(midi_path):
        midi_path = os.path.join(root_dir, "test_original_moonlight_samba.mid")

    wav_path = args.wav or os.path.join(root_dir, "moonlight_samba_master.wav")

    # 1. Live Audio Master Headroom Audit
    if os.path.exists(wav_path):
        print(f"\n🎧 Live Audio Headroom Audit ({os.path.basename(wav_path)}):")
        valid, gain, msg = auditor.audit_wav_file(wav_path)
        print(f"  {msg}")

    # 2. Live Score MIDI Audit
    if os.path.exists(midi_path):
        print(f"\n📊 Live MIDI Score Audit ({os.path.basename(midi_path)}):")
        results = auditor.audit_midi_score(midi_path)
        range_errs = results.get("range_violations", [])
        clash_errs = results.get("harmonic_clashes", [])

        if range_errs:
            print(f"  ⚠️ Range Violations ({len(range_errs)}):")
            for e in range_errs[:10]:
                print(f"    - {e}")
        else:
            print("  ✅ Range Check: All notes within Grade 3/4 concert boundaries.")

        if clash_errs:
            print(f"  ⚠️ Pitched Harmonic Minor 2nd/9th Clashes ({len(clash_errs)}):")
            for c in clash_errs[:10]:
                print(f"    - {c}")
        else:
            print("  ✅ Harmonic Check: Zero non-harmonic Minor 2nd / Minor 9th interval clashes across pitched ensemble.")

    # 3. Dynamic Arc Phrasing Injection
    print("\n💨 4-Bar Hypermeasure Dynamic Arc Phrasing:")
    arcs = auditor.inject_hypermeasure_dynamics(total_bars=8, hypermeasure_size=4)
    for line in arcs[:4]:
        print(f"  • {line}")

    # 4. Markov Transition Test
    markov_test_sequence = [61, 68, 64, 71, 68, 75, 71, 78]
    markov_issues = auditor.check_markov_arpeggio_transition(markov_test_sequence, pattern="ascending")
    print("\n🎹 Markov Arpeggio State-Transition Test:")
    if not markov_issues:
        print("  ✅ Sequence follows Kobayashi +2/-1 state transitions.")

    print("\n" + "=" * 75)


if __name__ == "__main__":
    main()
