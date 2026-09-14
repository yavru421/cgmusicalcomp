import mido

mid = mido.MidiFile("test_tuning.mid", clip=True)
for i, track in enumerate(mid.tracks):
    notes = [msg.note for msg in track if msg.type == 'note_on']
    if notes:
        print(f"Notes: {notes}")
