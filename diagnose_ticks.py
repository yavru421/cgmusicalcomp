import mido
from validate_playability import midi_to_note_name

mid = mido.MidiFile('city_of_evil_medley.mid')
ticks_per_beat = mid.ticks_per_beat or 480
ticks_per_bar = ticks_per_beat * 4

def inspect_run(track_idx, name, start_bar, end_bar):
    track = mid.tracks[track_idx]
    abs_ticks = 0
    start_tick = (start_bar - 1) * ticks_per_bar
    end_tick = end_bar * ticks_per_bar
    notes_in_run = []
    for msg in track:
        abs_ticks += msg.time
        if msg.type == 'note_on' and msg.velocity > 0:
            if start_tick <= abs_ticks <= end_tick:
                bar = int(abs_ticks / ticks_per_bar) + 1
                notes_in_run.append((bar, abs_ticks, midi_to_note_name(msg.note), msg.note))
    print(f"\n--- {name} (Track {track_idx}) run bars {start_bar}-{end_bar}: {len(notes_in_run)} notes ---")
    # print first 5 and last 5 notes
    print("  First notes:", notes_in_run[:5])
    print("  Last notes:", notes_in_run[-5:])
    # check if there are empty bars in this range
    bars_present = set(x[0] for x in notes_in_run)
    missing = [b for b in range(start_bar, end_bar + 1) if b not in bars_present]
    print(f"  Bars with notes in this range ({len(bars_present)}):", min(bars_present) if bars_present else None, "to", max(bars_present) if bars_present else None)
    print("  Missing (rest) bars in this range:", missing)

inspect_run(1, "Flute", 153, 176)
inspect_run(2, "Oboe", 45, 68)
inspect_run(3, "Clarinet", 145, 176)
inspect_run(6, "Horn", 45, 68)
inspect_run(6, "Horn", 73, 89)
