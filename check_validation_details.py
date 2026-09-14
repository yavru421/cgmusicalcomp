from validate_playability import audit_midi_file

report = audit_midi_file('city_of_evil_medley.mid')
print("Timpani violations:", len(report.timpani_violations))
print("Breathing violations:", len(report.breathing_violations))
for b in report.breathing_violations:
    print(" ", b)
