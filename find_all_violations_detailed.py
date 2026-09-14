from validate_playability import audit_midi_file

report = audit_midi_file('city_of_evil_medley.mid')
print("Total range violations:", len(report.range_violations))
non_glock = [v for v in report.range_violations if v['voice'] != 'Glockenspiel']
print(f"Non-glock violations count: {len(non_glock)}")
for v in non_glock:
    print(f"  Voice: {v['voice']} | Note: {v['note_name']} ({v['note']}) at m.{v['measure']} | Allowed: [{v['limit_min']} - {v['limit_max']}]")

print("Timpani violations:", len(report.timpani_violations))
print("Breathing violations:", len(report.breathing_violations))
