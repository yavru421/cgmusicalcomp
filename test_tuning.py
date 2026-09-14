import os
import subprocess
from validate_playability import audit_midi_file, VOICE_RANGES, match_instrument_voice, midi_to_note_name

# Let's see what each part currently produces in city_of_evil_medley.mid
report = audit_midi_file('city_of_evil_medley.mid')
print("Current status:", "PASSED" if report.passed else "FAILED")
print("Range violations count:", len(report.range_violations))
print("Breathing violations count:", len(report.breathing_violations))
print("Timpani violations count:", len(report.timpani_violations))

# Group range violations by voice
by_voice = {}
for v in report.range_violations:
    voice = v['voice']
    by_voice.setdefault(voice, []).append(v)

for voice, viols in by_voice.items():
    notes = [v['note'] for v in viols]
    min_v = min(notes)
    max_v = max(notes)
    print(f"Voice {voice}: {len(viols)} breaches, min={midi_to_note_name(min_v)} ({min_v}), max={midi_to_note_name(max_v)} ({max_v})")
