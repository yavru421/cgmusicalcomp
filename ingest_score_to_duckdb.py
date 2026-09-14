#!/usr/bin/env python3
"""
Ingest MIDI note events into DuckDB main.score_notes
Enables relational physical playability cross-diff auditing for Wisconsin Rapids City Band.
"""

import os
import sys
import mido
import duckdb

NOTE_NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

VOICE_MAP = {
    "flute": "flute",
    "oboe": "oboe",
    "clarinet": "clarinet",
    "alto sax": "alto sax",
    "tenor sax": "tenor sax",
    "trumpet": "trumpet",
    "french horn": "french horn",
    "horn": "french horn",
    "trombone": "trombone",
    "euphonium": "euphonium",
    "baritone": "euphonium",
    "tuba": "tuba",
    "timpani": "timpani",
    "marimba": "marimba",
    "glockenspiel": "glockenspiel",
    "bass": "tuba"
}

def midi_to_note_name(midi_num: int) -> str:
    octave = (midi_num // 12) - 1
    note = NOTE_NAMES[midi_num % 12]
    return f"{note}{octave}"

def match_instrument(track_name: str) -> str:
    norm = track_name.lower().strip()
    for key, val in VOICE_MAP.items():
        if key in norm:
            return val
    return ""

def ingest_midi(midi_path: str, piece_name: str, db_path: str):
    if not os.path.exists(midi_path):
        print(f"[ERROR] MIDI file not found: {midi_path}", file=sys.stderr)
        sys.exit(1)

    mid = mido.MidiFile(midi_path, clip=True)
    ticks_per_beat = mid.ticks_per_beat or 480

    # Default 4/4 time signature
    beats_per_bar = 4.0
    for track in mid.tracks:
        for msg in track:
            if msg.type == 'time_signature':
                beats_per_bar = (msg.numerator * 4.0) / msg.denominator
                break

    ticks_per_bar = int(ticks_per_beat * beats_per_bar)

    rows = []

    for track in mid.tracks:
        track_name = track.name if hasattr(track, 'name') and track.name else ""
        inst = match_instrument(track_name)
        if not inst:
            for msg in track:
                if msg.type == 'program_change':
                    prog = msg.program
                    if prog in [73, 72]:
                        inst = "flute"
                    elif prog == 68:
                        inst = "oboe"
                    elif prog == 71:
                        inst = "clarinet"
                    elif prog == 65:
                        inst = "alto sax"
                    elif prog == 66:
                        inst = "tenor sax"
                    elif prog == 56:
                        inst = "trumpet"
                    elif prog == 60:
                        inst = "french horn"
                    elif prog == 57:
                        inst = "trombone"
                    elif prog == 58:
                        inst = "tuba"
                    elif prog in [32, 33, 34]:
                        inst = "tuba"  # Bass doubles / supports Tuba
                    elif prog == 47:
                        inst = "timpani"
                    elif prog in [12, 13]:
                        inst = "marimba"
                    elif prog in [9, 14]:
                        inst = "glockenspiel"
                    break

        if not inst:
            continue

        abs_ticks = 0
        active_notes = {}

        for msg in track:
            abs_ticks += msg.time
            if msg.type == 'note_on' and msg.velocity > 0:
                active_notes[msg.note] = (abs_ticks, msg.velocity)
            elif msg.type == 'note_off' or (msg.type == 'note_on' and msg.velocity == 0):
                if msg.note in active_notes:
                    start_ticks, vel = active_notes.pop(msg.note)
                    duration_ticks = abs_ticks - start_ticks
                    duration_quarters = duration_ticks / ticks_per_beat

                    measure = int(start_ticks // ticks_per_bar) + 1
                    beat = round(((start_ticks % ticks_per_bar) / ticks_per_beat) + 1.0, 2)

                    pitch_name = midi_to_note_name(msg.note)

                    rows.append((
                        piece_name,
                        inst,
                        measure,
                        beat,
                        msg.note,
                        pitch_name,
                        duration_quarters,
                        vel
                    ))

    print(f"[INGEST] Parsed {len(rows)} note events across active voices from {midi_path}")

    # Connect to DuckDB
    con = duckdb.connect(db_path)
    con.execute("CREATE TABLE IF NOT EXISTS main.score_notes (piece_name VARCHAR, instrument VARCHAR, measure INT, beat DOUBLE, pitch_midi INT, pitch_name VARCHAR, duration_quarters DOUBLE, velocity INT);")
    con.execute("DELETE FROM main.score_notes WHERE piece_name = ?", [piece_name])
    con.executemany(
        """
        INSERT INTO main.score_notes (
            piece_name, instrument, measure, beat, pitch_midi, pitch_name, duration_quarters, velocity
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """,
        rows
    )
    con.close()
    print(f"[INGEST] Successfully committed {len(rows)} note events into main.score_notes")

if __name__ == "__main__":
    midi_file = r"C:\dev\CGMusicalComposition\Scores\moonlight_samba_score.mid"
    if len(sys.argv) > 1:
        midi_file = sys.argv[1]
    
    db_file = r"C:\Users\John\.gemini\config\mind.duckdb"
    ingest_midi(midi_file, "moonlight_samba", db_file)
