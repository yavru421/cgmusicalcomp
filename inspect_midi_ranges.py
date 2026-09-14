import mido
from validate_playability import VOICE_RANGES, match_instrument_voice, midi_to_note_name

mid = mido.MidiFile('city_of_evil_medley.mid')
print("MIDI Track Summary:")
for i, track in enumerate(mid.tracks):
    name = track.name if hasattr(track, 'name') else ""
    match = match_instrument_voice(name)
    if not match:
        for msg in track:
            if msg.type == 'program_change':
                # check GM
                prog = msg.program
                # GM Mapping heuristics
                if prog in [73, 72]: match = ("flute", VOICE_RANGES["flute"])
                elif prog == 68: match = ("oboe", VOICE_RANGES["oboe"])
                elif prog == 71: match = ("clarinet", VOICE_RANGES["clarinet"])
                elif prog == 65: match = ("alto sax", VOICE_RANGES["alto sax"])
                elif prog == 66: match = ("tenor sax", VOICE_RANGES["tenor sax"])
                elif prog == 56: match = ("trumpet", VOICE_RANGES["trumpet"])
                elif prog == 60: match = ("french horn", VOICE_RANGES["french horn"])
                elif prog == 57: match = ("trombone", VOICE_RANGES["trombone"])
                elif prog == 58: match = ("tuba", VOICE_RANGES["tuba"])
                elif prog in [32, 33, 34]: match = ("bass", VOICE_RANGES["bass"])
                elif prog == 42: match = ("cello", VOICE_RANGES["cello"])
                elif prog == 47: match = ("timpani", VOICE_RANGES["timpani"])
                elif prog in [12, 13]: match = ("marimba", VOICE_RANGES["marimba"])
                elif prog in [9, 14]: match = ("glockenspiel", VOICE_RANGES["glockenspiel"])
                break
    notes = [msg.note for msg in track if msg.type == 'note_on' and msg.velocity > 0]
    if not notes:
        continue
    min_n, max_n = min(notes), max(notes)
    if match:
        voice_key, spec = match
        allowed_min = spec.get('min', 0)
        allowed_max = spec.get('max', 127)
        status = "OK" if min_n >= allowed_min and max_n <= allowed_max else "BREACH"
        print(f"[{status}] Track {i} ({spec['name']}): min={midi_to_note_name(min_n)} ({min_n}) [allowed {midi_to_note_name(allowed_min)} ({allowed_min})], max={midi_to_note_name(max_n)} ({max_n}) [allowed {midi_to_note_name(allowed_max)} ({allowed_max})]")
    else:
        print(f"[?] Track {i} ({name}): min={midi_to_note_name(min_n)} ({min_n}), max={midi_to_note_name(max_n)} ({max_n})")
