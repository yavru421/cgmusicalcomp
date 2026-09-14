import mido

mid = mido.MidiFile("city_of_evil_medley.mid")
print("Ticks per beat:", mid.ticks_per_beat)
for i, track in enumerate(mid.tracks):
    notes = [msg.note for msg in track if msg.type == 'note_on']
    program = [msg.program for msg in track if msg.type == 'program_change']
    print(f"Track {i}: name='{track.name}', prog={program}, notes_count={len(notes)}, min_note={min(notes) if notes else None}, max_note={max(notes) if notes else None}")
