import mido
from validate_playability import VOICE_RANGES, match_instrument_voice, NOTE_NAMES, midi_to_note_name

mid = mido.MidiFile("city_of_evil_medley.mid")
for track in mid.tracks:
    prog = None
    for msg in track:
        if msg.type == 'program_change':
            prog = msg.program
            break
    notes = [msg.note for msg in track if msg.type == 'note_on']
    if not notes:
        continue
    # find instrument
    match = None
    if prog in [73, 72]: match = ("flute", VOICE_RANGES["flute"])
    elif prog == 68: match = ("oboe", VOICE_RANGES["oboe"])
    elif prog == 71: match = ("clarinet", VOICE_RANGES["clarinet"])
    elif prog == 65: match = ("alto sax", VOICE_RANGES["alto sax"])
    elif prog == 56: match = ("trumpet", VOICE_RANGES["trumpet"])
    elif prog == 60: match = ("french horn", VOICE_RANGES["french horn"])
    elif prog == 57: match = ("trombone", VOICE_RANGES["trombone"])
    elif prog == 58: match = ("tuba", VOICE_RANGES["tuba"])
    elif prog in [32, 33]: match = ("bass", VOICE_RANGES["bass"])
    elif prog == 42: match = ("cello", VOICE_RANGES["cello"])
    elif prog == 47: match = ("timpani", VOICE_RANGES["timpani"])
    elif prog in [12, 13]: match = ("marimba", VOICE_RANGES["marimba"])
    elif prog in [9, 14]: match = ("glockenspiel", VOICE_RANGES["glockenspiel"])

    if match:
        vname, spec = match
        low, high = spec["min"], spec["max"]
        breaches_low = [n for n in notes if n < low]
        breaches_high = [n for n in notes if n > high]
        print(f"[{vname:<12}] (prog {prog}) allowed [{low}-{high}]: min_actual={min(notes)}, max_actual={max(notes)} | low_breaches={len(breaches_low)}, high_breaches={len(breaches_high)}")
