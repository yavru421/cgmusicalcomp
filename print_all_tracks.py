import mido

mid = mido.MidiFile("city_of_evil_medley.mid", clip=True)
for i, t in enumerate(mid.tracks):
    progs = [m.program for m in t if m.type == 'program_change']
    notes = [m.note for m in t if m.type == 'note_on']
    name = t.name if hasattr(t, 'name') else ''
    print(f"Track {i}: name='{name}', prog={progs}, notes={len(notes)}, range=({min(notes) if notes else None} - {max(notes) if notes else None})")
