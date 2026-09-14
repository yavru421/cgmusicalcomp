import re
import subprocess
import os

PITCH_OFFSETS = {
    'c': 0, 'cis': 1, 'des': 1, 'd': 2, 'dis': 3, 'ees': 3,
    'e': 4, 'f': 5, 'fis': 6, 'ges': 6, 'g': 7, 'gis': 8,
    'aes': 8, 'a': 9, 'ais': 10, 'bes': 10, 'b': 11, 'bis': 12
}

def note_str_to_midi(pitch_name, octave_marks):
    # In \fixed c':
    # 'c' without marks = C3 = 48
    # 'c\'' = C4 = 60
    # 'c\'\'' = C5 = 72
    # 'c,' = C2 = 36
    # 'c,,' = C1 = 24
    base = 48 + PITCH_OFFSETS.get(pitch_name, 0)
    if octave_marks:
        up = octave_marks.count("'")
        down = octave_marks.count(",")
        base += 12 * (up - down)
    return base

def midi_to_note_str(midi_val):
    # Convert midi_val to pitch_name + octave_marks in \fixed c'
    # Reference C3 = 48
    semi = midi_val % 12
    # Find pitch name (prefer flats for concert band keys)
    PITCH_MAP = {
        0: 'c', 1: 'cis', 2: 'd', 3: 'ees', 4: 'e', 5: 'f',
        6: 'fis', 7: 'g', 8: 'aes', 9: 'a', 10: 'bes', 11: 'b'
    }
    pitch_name = PITCH_MAP[semi]
    octave = (midi_val // 12) - 1 # MIDI 60 -> octave 4
    # in \fixed c', octave 3 has no marks, octave 4 has ', octave 5 has '', octave 2 has ,, etc.
    diff = octave - 3
    if diff > 0:
        marks = "'" * diff
    elif diff < 0:
        marks = "," * (-diff)
    else:
        marks = ""
    return pitch_name + marks

def adjust_voice_notes(body, min_midi, max_midi, is_timpani=False):
    if is_timpani:
        # Strictly [41, 46, 48, 51]
        def repl_timp(m):
            pitch = m.group(1)
            octave = m.group(2)
            dur = m.group(3)
            # Match closest allowed pitch
            midi_num = note_str_to_midi(pitch, octave)
            allowed = [41, 46, 48, 51]
            closest = min(allowed, key=lambda x: abs(x - midi_num))
            new_note = midi_to_note_str(closest)
            return new_note + dur
        return re.sub(r'\b([a-g](?:is|es|bis|des)?)([\',]*)([\d.:~^\\<>\-]*)', repl_timp, body)

    # Note pattern: pitch name, octave marks, duration/articulations
    def repl_note(m):
        pitch = m.group(1)
        octave = m.group(2)
        dur = m.group(3)
        if pitch in ['R', 'r', 's']:
            return m.group(0)
        midi_num = note_str_to_midi(pitch, octave)
        # Transpose by octaves until within [min_midi, max_midi]
        while midi_num > max_midi:
            midi_num -= 12
        while midi_num < min_midi:
            midi_num += 12
        new_note = midi_to_note_str(midi_num)
        return new_note + dur

    return re.sub(r'\b([a-g](?:is|es|bis|des)?)([\',]*)([\d.:~^\\<>\-]*)', repl_note, body)

def run():
    with open("city_of_evil_medley.ly", "r", encoding="utf-8") as f:
        text = f.read()

    ranges = {
        "flutePart": (63, 89),
        "oboePart": (62, 75),
        "clarinetPart": (50, 79),
        "altoSaxPart": (60, 77),
        "trumpetPart": (58, 77),
        "hornPart": (58, 77),
        "trombonePart": (39, 67),
        "tubaPart": (34, 53),
        "electricBassPart": (28, 55),
        "celloPart": (36, 64),
        "glockPart": (82, 98),
        "marimbaPart": (48, 79),
        "timpaniPart": (41, 51)
    }

    for part_name, (low, high) in ranges.items():
        is_timp = (part_name == "timpaniPart")
        pattern = rf'({part_name}\s*=\s*\\fixed c\'\s*\{{)([\s\S]*?)(\n\}}\n)'
        m = re.search(pattern, text)
        if m:
            prefix = m.group(1)
            body = m.group(2)
            suffix = m.group(3)
            new_body = adjust_voice_notes(body, low, high, is_timpani=is_timp)
            text = text[:m.start(2)] + new_body + text[m.end(2):]
            print(f"Calibrated {part_name} to [{low}, {high}]")

    with open("city_of_evil_medley.ly", "w", encoding="utf-8") as f:
        f.write(text)

    print("Score saved. Compiling LilyPond...")

if __name__ == "__main__":
    run()
