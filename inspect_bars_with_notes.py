import mido

mid = mido.MidiFile('city_of_evil_medley.mid')
ticks_per_beat = mid.ticks_per_beat or 480
ticks_per_bar = ticks_per_beat * 4

for i, track in enumerate(mid.tracks):
    name = track.name if hasattr(track, 'name') else ""
    if not any(k in name.lower() for k in ['flute', 'oboe', 'clarinet', 'horn']):
        continue
    abs_ticks = 0
    bars = set()
    for msg in track:
        abs_ticks += msg.time
        if msg.type == 'note_on' and msg.velocity > 0:
            bar = int(abs_ticks / ticks_per_bar) + 1
            bars.add(bar)
    # find consecutive runs > 16
    sorted_bars = sorted(list(bars))
    runs = []
    curr_run = []
    for b in range(1, max(sorted_bars)+1 if sorted_bars else 1):
        if b in bars:
            curr_run.append(b)
        else:
            if len(curr_run) > 14:
                runs.append((curr_run[0], curr_run[-1], len(curr_run)))
            curr_run = []
    if len(curr_run) > 14:
        runs.append((curr_run[0], curr_run[-1], len(curr_run)))
    print(f"Track {i} ({name}): runs > 14 bars:", runs)
