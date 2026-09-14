from validate_playability import audit_midi_file, VOICE_RANGES, midi_to_note_name

report = audit_midi_file('city_of_evil_medley.mid')
by_voice = {}
for v in report.range_violations:
    by_voice.setdefault(v['voice'], []).append(v)

for voice, viols in by_voice.items():
    print(f"\n--- Voice: {voice} ({len(viols)} violations) ---")
    # print up to 15 violations with measure and note name
    for v in viols[:15]:
        print(f"  m.{v['measure']}: {v['note_name']} ({v['note']}) | Allowed: [{v['limit_min']} - {v['limit_max']}]")
    if len(viols) > 15:
        print(f"  ... and {len(viols)-15} more.")
