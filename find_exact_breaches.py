from validate_playability import audit_midi_file

report = audit_midi_file('city_of_evil_medley.mid')
for v in report.range_violations:
    if v['voice'] in ['Oboe', 'French Horn in F']:
        print(f"{v['voice']}: Note {v['note_name']} ({v['note']}) at m.{v['measure']} (~{v['time_sec']}s)")
