import mido
mid = mido.MidiFile('city_of_evil_medley.mid')
for i, t in enumerate(mid.tracks):
    print(f"Track {i}: name='{t.name if hasattr(t, 'name') else ''}', messages={len(t)}")
