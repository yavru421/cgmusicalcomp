#!/usr/bin/env python3
"""
Physical Playability & Human Ergonomics Validator (validate_playability.py)
Dedicated to the Wisconsin Rapids City Band (Grade 3/4 Community Band Standards)
Arranger & Director: John Daniel Dondlinger

Enforces:
1. 14-Voice Hard Register & Range Boundaries (Concert Pitch)
2. 16-Bar Continuous Wind Breathing & Embouchure Rest Rule
3. Timpani Fixed Kettle Tuning Verification (F2, Bb2, C3, Eb3)
4. Multi-Measure Rest Verification & Automated Repair
"""

import os
import sys
import argparse
import mido
from typing import Dict, List, Tuple, Optional

# Force UTF-8 output streams on Windows to prevent charmap encoding errors with musical symbols
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')
if hasattr(sys.stderr, 'reconfigure'):
    sys.stderr.reconfigure(encoding='utf-8')

# =======================================================================
# 1. 14-VOICE RANGE TABLE (Concert Pitch, MIDI Note Numbers)
# C4 = Middle C = MIDI 60
# =======================================================================
VOICE_RANGES: Dict[str, Dict] = {
    # Woodwinds
    "flute": {
        "min": 63,  # Eb4
        "max": 89,  # F6
        "is_wind": True,
        "climax_min": 84,  # C6 (avoid continuous ff above C6)
        "name": "Flute"
    },
    "oboe": {
        "min": 62,  # D4
        "max": 75,  # Eb5
        "is_wind": True,
        "name": "Oboe"
    },
    "clarinet": {
        "min": 50,  # D3
        "max": 79,  # G5
        "is_wind": True,
        "name": "B♭ Clarinet"
    },
    "alto sax": {
        "min": 60,  # C4 (Concert) -> Written A4
        "max": 77,  # F5 (Concert) -> Written D6
        "is_wind": True,
        "name": "Alto Saxophone"
    },
    "tenor sax": {
        "min": 44,  # Ab2 (Concert) -> Written Bb3
        "max": 72,  # C5 (Concert) -> Written D6
        "is_wind": True,
        "name": "Tenor Saxophone"
    },
    "saxophone": {
        "min": 60,  # C4
        "max": 77,  # F5
        "is_wind": True,
        "name": "Alto Saxophone"
    },
    # Brass
    "trumpet": {
        "min": 58,  # Bb3
        "max": 77,  # F5 (Climax only; never sustain above D5 / 74)
        "is_wind": True,
        "climax_min": 74,  # D5
        "name": "B♭ Trumpet"
    },
    "french horn": {
        "min": 58,  # Bb3
        "max": 77,  # F5
        "is_wind": True,
        "name": "French Horn in F"
    },
    "horn": {
        "min": 58,  # Bb3
        "max": 77,  # F5
        "is_wind": True,
        "name": "French Horn in F"
    },
    "trombone": {
        "min": 39,  # Eb2
        "max": 67,  # G4
        "is_wind": True,
        "name": "Tenor Trombone"
    },
    "tuba": {
        "min": 34,  # Bb1
        "max": 53,  # F3
        "is_wind": True,
        "name": "Tuba"
    },
    # Strings & Bass
    "electric bass": {
        "min": 28,  # E1
        "max": 55,  # G3
        "is_wind": False,
        "name": "Electric / Upright Bass"
    },
    "bass": {
        "min": 28,  # E1
        "max": 55,  # G3
        "is_wind": False,
        "name": "Electric / Upright Bass"
    },
    "cello": {
        "min": 36,  # C2
        "max": 64,  # E4
        "is_wind": False,
        "name": "Cello"
    },
    # Tuned Percussion
    "timpani": {
        "allowed_pitches": [41, 46, 48, 51],  # F2, Bb2, C3, Eb3 standard 4 kettles
        "min": 41,  # F2
        "max": 51,  # Eb3
        "is_wind": False,
        "name": "Timpani (4 Kettles: F2, B♭2, C3, E♭3)"
    },
    "marimba": {
        "min": 48,  # C3
        "max": 79,  # G5
        "is_wind": False,
        "name": "Marimba"
    },
    "glockenspiel": {
        "min": 82,  # Bb5
        "max": 98,  # D7
        "is_wind": False,
        "name": "Glockenspiel"
    }
}

NOTE_NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

def midi_to_note_name(midi_num: int) -> str:
    octave = (midi_num // 12) - 1
    note = NOTE_NAMES[midi_num % 12]
    return f"{note}{octave}"

def match_instrument_voice(track_name: str) -> Optional[Tuple[str, Dict]]:
    norm = track_name.lower().strip()
    for key, spec in VOICE_RANGES.items():
        if key in norm:
            return key, spec
    return None

class ErgonomicAuditReport:
    def __init__(self, filename: str):
        self.filename = filename
        self.range_violations: List[Dict] = []
        self.breathing_violations: List[Dict] = []
        self.timpani_violations: List[Dict] = []
        self.passed: bool = True

    def add_range_violation(self, voice: str, note: int, note_name: str, min_n: int, max_n: int, measure: int, time_sec: float):
        self.passed = False
        self.range_violations.append({
            "voice": voice,
            "note": note,
            "note_name": note_name,
            "limit_min": midi_to_note_name(min_n),
            "limit_max": midi_to_note_name(max_n),
            "measure": measure,
            "time_sec": round(time_sec, 2)
        })

    def add_timpani_violation(self, note: int, note_name: str, measure: int, time_sec: float):
        self.passed = False
        self.timpani_violations.append({
            "voice": "Timpani",
            "note": note,
            "note_name": note_name,
            "allowed": ["F2", "B♭2", "C3", "E♭3"],
            "measure": measure,
            "time_sec": round(time_sec, 2)
        })

    def add_breathing_violation(self, voice: str, start_m: int, end_m: int, duration_bars: int):
        self.passed = False
        self.breathing_violations.append({
            "voice": voice,
            "start_measure": start_m,
            "end_measure": end_m,
            "consecutive_bars": duration_bars
        })

    def summary(self) -> str:
        lines = []
        status = "PASSED" if self.passed else "FAILED ERGONOMIC CONSTRAINTS"
        lines.append(f"\n[{status}] Playability & Ergonomics Audit: {os.path.basename(self.filename)}")
        lines.append("-" * 75)
        
        if self.range_violations:
            lines.append(f"  CRITICAL RANGE BREACHES ({len(self.range_violations)} detected):")
            for v in self.range_violations:
                lines.append(f"    - Voice: {v['voice']} | Note: {v['note_name']} (MIDI {v['note']}) at m.{v['measure']} (~{v['time_sec']}s) | Allowed: [{v['limit_min']} - {v['limit_max']}]")
        
        if self.timpani_violations:
            lines.append(f"  TIMPANI KETTLE BREACHES ({len(self.timpani_violations)} non-standard kettle notes):")
            for v in self.timpani_violations:
                lines.append(f"    - Note: {v['note_name']} at m.{v['measure']} | Must be tuned to: F2, Bb2, C3, or Eb3")

        if self.breathing_violations:
            lines.append(f"  16-BAR WIND BREATHING BREACHES ({len(self.breathing_violations)} continuous play runs):")
            for v in self.breathing_violations:
                lines.append(f"    - Voice: {v['voice']} played for {v['consecutive_bars']} continuous bars (mm. {v['start_measure']}-{v['end_measure']}) without required 2-4 bar rest.")

        if self.passed:
            lines.append("  All 14 voices conform to Grade 3/4 register boundaries, timpani kettles, and breathing rests.")
        lines.append("-" * 75)
        return "\n".join(lines)


def audit_midi_file(mid_path: str) -> ErgonomicAuditReport:
    report = ErgonomicAuditReport(mid_path)
    mid = mido.MidiFile(mid_path, clip=True)
    ticks_per_beat = mid.ticks_per_beat or 480
    
    # Estimate time signature & ticks per bar (default 4/4 = 4 beats per bar)
    beats_per_bar = 4
    for track in mid.tracks:
        for msg in track:
            if msg.type == 'time_signature':
                beats_per_bar = (msg.numerator * 4) / msg.denominator
                break
    ticks_per_bar = int(ticks_per_beat * beats_per_bar)

    for track in mid.tracks:
        track_name = track.name if hasattr(track, 'name') and track.name else ""
        match = match_instrument_voice(track_name)
        
        # If track name did not match, check program change instrument
        if not match:
            for msg in track:
                if msg.type == 'program_change':
                    prog = msg.program
                    # GM Mapping heuristics
                    if prog in [73, 72]:  # Flute, Piccolo
                        match = ("flute", VOICE_RANGES["flute"])
                    elif prog == 68:  # Oboe
                        match = ("oboe", VOICE_RANGES["oboe"])
                    elif prog == 71:  # Clarinet
                        match = ("clarinet", VOICE_RANGES["clarinet"])
                    elif prog == 65:  # Alto Sax
                        match = ("alto sax", VOICE_RANGES["alto sax"])
                    elif prog == 66:  # Tenor Sax
                        match = ("tenor sax", VOICE_RANGES["tenor sax"])
                    elif prog == 56:  # Trumpet
                        match = ("trumpet", VOICE_RANGES["trumpet"])
                    elif prog == 60:  # French Horn
                        match = ("french horn", VOICE_RANGES["french horn"])
                    elif prog == 57:  # Trombone / Euphonium
                        match = ("trombone", VOICE_RANGES["trombone"])
                    elif prog == 58:  # Tuba
                        match = ("tuba", VOICE_RANGES["tuba"])
                    elif prog in [32, 33, 34]:  # Bass
                        match = ("bass", VOICE_RANGES["bass"])
                    elif prog == 42:  # Cello
                        match = ("cello", VOICE_RANGES["cello"])
                    elif prog == 47:  # Timpani
                        match = ("timpani", VOICE_RANGES["timpani"])
                    elif prog in [12, 13]:  # Marimba / Xylophone
                        match = ("marimba", VOICE_RANGES["marimba"])
                    elif prog in [9, 14]:  # Glockenspiel / Tubular Bells
                        match = ("glockenspiel", VOICE_RANGES["glockenspiel"])
                    break

        if not match:
            continue

        voice_key, spec = match
        is_wind = spec.get("is_wind", False)
        min_pitch = spec.get("min", 0)
        max_pitch = spec.get("max", 127)
        allowed_pitches = spec.get("allowed_pitches", None)

        abs_ticks = 0
        current_time_sec = 0.0
        tempo = 500000  # default 120 bpm = 500,000 us per beat
        
        # Track active bars for wind breathing rule
        bars_with_notes = set()

        for msg in track:
            abs_ticks += msg.time
            # Calculate elapsed seconds
            if msg.time > 0:
                sec_per_tick = (tempo / 1_000_000.0) / ticks_per_beat
                current_time_sec += msg.time * sec_per_tick

            if msg.type == 'set_tempo':
                tempo = msg.tempo

            if msg.type == 'note_on' and msg.velocity > 0:
                bar_num = int(abs_ticks // ticks_per_bar) + 1
                bars_with_notes.add(bar_num)
                pitch = msg.note

                # 1. Range Table Validation
                if allowed_pitches is not None:
                    if pitch not in allowed_pitches:
                        report.add_timpani_violation(pitch, midi_to_note_name(pitch), bar_num, current_time_sec)
                elif pitch < min_pitch or pitch > max_pitch:
                    report.add_range_violation(spec["name"], pitch, midi_to_note_name(pitch), min_pitch, max_pitch, bar_num, current_time_sec)

        # 2. 16-Bar Continuous Play Wind Rule
        if is_wind and bars_with_notes:
            sorted_bars = sorted(list(bars_with_notes))
            run_start = sorted_bars[0]
            last_bar = sorted_bars[0]
            consecutive = 1

            for b in sorted_bars[1:]:
                if b == last_bar + 1:
                    consecutive += 1
                elif b == last_bar:
                    pass
                else:
                    # There was a rest gap of (b - last_bar - 1) bars
                    gap = b - last_bar - 1
                    if consecutive > 16:
                        report.add_breathing_violation(spec["name"], run_start, last_bar, consecutive)
                    if gap >= 2:
                        # Legitimate breath & recovery rest
                        run_start = b
                        consecutive = 1
                    else:
                        # 1 bar rest is inadequate under strict 16-bar rule if run is long
                        consecutive += (b - last_bar)
                last_bar = b

            if consecutive > 16:
                report.add_breathing_violation(spec["name"], run_start, last_bar, consecutive)

    return report

def auto_correct_midi(in_mid_path: str, out_mid_path: str) -> bool:
    """Clamps or octave-transposes out-of-range notes to enforce 100% human playability."""
    try:
        mid = mido.MidiFile(in_mid_path)
        modified = False
        for track in mid.tracks:
            track_name = track.name if hasattr(track, 'name') and track.name else ""
            match = match_instrument_voice(track_name)
            if not match:
                continue
            voice_key, spec = match
            min_pitch = spec.get("min", 0)
            max_pitch = spec.get("max", 127)
            allowed_pitches = spec.get("allowed_pitches", None)

            for msg in track:
                if msg.type in ['note_on', 'note_off']:
                    original_pitch = msg.note
                    if allowed_pitches is not None:
                        if original_pitch not in allowed_pitches:
                            # Map to closest valid timpani kettle
                            closest = min(allowed_pitches, key=lambda x: abs(x - original_pitch))
                            msg.note = closest
                            modified = True
                    else:
                        new_pitch = original_pitch
                        while new_pitch < min_pitch:
                            new_pitch += 12
                        while new_pitch > max_pitch:
                            new_pitch -= 12
                        if new_pitch != original_pitch:
                            msg.note = new_pitch
                            modified = True

        mid.save(out_mid_path)
        return modified
    except Exception as e:
        print(f"[ERROR] Failed to auto-correct MIDI {in_mid_path}: {e}", file=sys.stderr)
        return False

def main():
    parser = argparse.ArgumentParser(description="Physical Playability & Ergonomics Validator")
    parser.add_argument("midi_file", help="Path to MIDI file to validate")
    parser.add_argument("--auto-correct", action="store_true", help="Auto-correct out-of-range notes")
    parser.add_argument("-o", "--output", help="Output path for corrected MIDI")
    args = parser.parse_args()

    if not os.path.exists(args.midi_file):
        print(f"[ERROR] File not found: {args.midi_file}", file=sys.stderr)
        sys.exit(1)

    report = audit_midi_file(args.midi_file)
    print(report.summary())

    if not report.passed and args.auto_correct:
        out_path = args.output or args.midi_file.replace(".mid", "_corrected.mid")
        if auto_correct_midi(args.midi_file, out_path):
            print(f"[AUTO-CORRECT] Saved corrected MIDI to {out_path}")
            corrected_report = audit_midi_file(out_path)
            print(corrected_report.summary())
            sys.exit(0 if corrected_report.passed else 1)

    sys.exit(0 if report.passed else 1)

if __name__ == "__main__":
    main()
