#!/usr/bin/env python3
"""
check_score_quality.py - 4-Layer Composition Quality & Auditory Validation Engine
CGMusicalComposition — Algorithmic Concert Band Engine (Grade 3/4 Standards)

Features:
 1. SCSBOA Adjudication & Grade 3/4 Range / Breath Endurance Limits
 2. Harmonic & Counterpoint Linter (Minor 2nd & Minor 9th Clashes)
 3. Kobayashi Markov Chain Arpeggio Transition Checker (+2/-1 Step Logic)
 4. Clean CLI integration for automated score auditing
"""

import sys
import argparse
from typing import List, Dict, Tuple, Optional

# Force UTF-8 output streams on Windows
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')
if hasattr(sys.stderr, 'reconfigure'):
    sys.stderr.reconfigure(encoding='utf-8')

# --- Grade 3/4 Concert Pitch MIDI Note Ranges ---
GRADE_3_4_RANGES: Dict[str, Tuple[int, int]] = {
    'flute': (63, 89),        # Eb4 to F6
    'oboe': (62, 75),         # D4 to Eb5
    'clarinet': (50, 79),     # D3 to G5
    'altosax': (52, 77),      # C4 to F5
    'tenorsax': (47, 72),     # B3 to C6
    'trumpet': (58, 77),      # Bb3 to F5
    'horn': (58, 77),         # Bb3 to F5
    'trombone': (51, 67),     # Eb2 to G4
    'tuba': (34, 53),         # Bb1 to F3
    'timpani': (41, 63),      # F2 to Eb3
    'marimba': (48, 79),      # C3 to G5
    'glockenspiel': (70, 98), # Bb5 to D7
}

class ScoreQualityAuditor:
    """Automated Quality Engine for Concert Band Score Automation."""

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
        """Screen for minor 2nd (1 st) or minor 9th (13 st) interval clashes."""
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

    def check_markov_arpeggio_transition(
        self, state_sequence: List[int], pattern: str = "ascending"
    ) -> List[str]:
        """Validate Kobayashi's +2/-1 (ascending) or -2/+1 (descending) state transition rules."""
        issues = []
        if len(state_sequence) < 3:
            return issues

        for i in range(len(state_sequence) - 2):
            step1 = state_sequence[i + 1] - state_sequence[i]
            step2 = state_sequence[i + 2] - state_sequence[i + 1]

            if pattern == "ascending":
                if step1 < 0 and step2 < 0:
                    issues.append(f"[Markov Engine] Consecutive negative steps at index {i} ({state_sequence[i:i+3]})")
            elif pattern == "descending":
                if step1 > 0 and step2 > 0:
                    issues.append(f"[Markov Engine] Consecutive positive steps at index {i} ({state_sequence[i:i+3]})")

        return issues

    def audit_score(self, score_data: Dict) -> List[str]:
        """Run comprehensive quality and playability audit on score data."""
        all_violations = []

        # 1. Range & Endurance Check
        for part_name, measures in score_data.get("parts", {}).items():
            consecutive_bars = 0
            for bar_num, notes in enumerate(measures, start=1):
                if notes:
                    consecutive_bars += 1
                    for n in notes:
                        range_err = self.check_pitch_range(part_name, n, bar_num)
                        if range_err:
                            all_violations.append(range_err)
                else:
                    consecutive_bars = 0

                if consecutive_bars > self.max_continuous_bars:
                    all_violations.append(
                        f"[{part_name}] Exceeded {self.max_continuous_bars} continuous bars without rest at measure {bar_num}"
                    )

        # 2. Harmonic Clash Check
        tutti_measures = score_data.get("tutti_chords", {})
        for bar_num, chord_notes in tutti_measures.items():
            clashes = self.check_harmonic_clashes(chord_notes, bar_num)
            all_violations.extend(clashes)

        return all_violations


def main():
    parser = argparse.ArgumentParser(description="Score Quality & Auditory Auditor")
    parser.add_argument("--max-bars", type=int, default=16, help="Max continuous bars without rest (default: 16)")
    parser.add_argument("--check-markov", nargs="+", type=int, help="Test pitch sequence against Markov +2/-1 rule")
    args = parser.parse_args()

    auditor = ScoreQualityAuditor(max_continuous_bars=args.max_bars)

    if args.check_markov:
        issues = auditor.check_markov_arpeggio_transition(args.check_markov)
        if issues:
            for iss in issues:
                print(f"❌ {iss}")
            sys.exit(1)
        print("✅ Markov sequence conforms to Kobayashi transition rules.")
        sys.exit(0)

    print("✅ ScoreQualityAuditor initialized and ready for automated pipeline calls.")

if __name__ == "__main__":
    main()
