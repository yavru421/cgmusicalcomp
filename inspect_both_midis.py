import mido

def inspect_mid(name):
    mid = mido.MidiFile(name, clip=True)
    print(f"=== {name} ===")
    for i, t in enumerate(mid.tracks):
        glock = [msg for msg in t if msg.type == 'note_on']
        if 'glock' in t.name.lower() or 'glock' in str(t).lower() or i == 11:
            notes = [m.note for m in glock]
            print(f"Track {i}: {t.name} (prog: {[m.program for m in t if m.type == 'program_change']})")
            if notes:
                print(f"  Notes count: {len(notes)}, min: {min(notes)}, max: {max(notes)}, sample: {notes[:10]}")

inspect_mid("test_tuning.mid")
inspect_mid("city_of_evil_medley.mid")
