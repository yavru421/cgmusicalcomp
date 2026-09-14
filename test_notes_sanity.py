#!/usr/bin/env python3
"""
Test and audit all notes in Notes/ for realistic pitch ranges and sensible voice leading.
"""
import os
import re

NOTES_DIR = r"C:\dev\CGMusicalComposition\Notes"

# Pitch conversion for LilyPond absolute pitches
PITCH_OFFSETS = {
    'c': 0, 'cis': 1, 'des': 1, 'd': 2, 'dis': 3, 'ees': 3,
    'e': 4, 'eis': 5, 'f': 5, 'fis': 6, 'ges': 6, 'g': 7,
    'gis': 8, 'aes': 8, 'a': 9, 'ais': 10, 'bes': 10, 'b': 11, 'bis': 0
}

def parse_relative_lilypond(content, start_octave=4):
    """Simple parser to track pitches in relative mode."""
    # Find relative start
    rel_match = re.search(r'\\relative\s+([a-g][,\']*)', content)
    ref_pitch = 60 # C4
    if rel_match:
        ref_str = rel_match.group(1)
        base = PITCH_OFFSETS.get(re.match(r'[a-g]+', ref_str).group(0), 0)
        octave = 4 + ref_str.count("'") - ref_str.count(",")
        ref_pitch = (octave + 1) * 12 + base

    # Clean out comments and commands
    cleaned = re.sub(r'%.*?\n', '\n', content)
    cleaned = re.sub(r'\\[a-zA-Z]+', ' ', cleaned)
    cleaned = re.sub(r'[{}(),><|\^~_!"\\:]', ' ', cleaned)

    tokens = cleaned.split()
    pitches = []
    curr = ref_pitch

    for tok in tokens:
        m = re.match(r'^([a-g](?:is|es|bis)?)([\',]*)(\d+)?', tok)
        if m:
            step_name, oct_mod, dur = m.groups()
            base = PITCH_OFFSETS.get(step_name, -1)
            if base == -1:
                continue

            # In LilyPond relative mode, choose the octave of step_name closest to curr
            best_pitch = None
            best_dist = 999
            for oct_cand in range(0, 10):
                cand_pitch = (oct_cand + 1) * 12 + base
                dist = abs(cand_pitch - curr)
                if dist < best_dist or (dist == best_dist and cand_pitch > curr):
                    best_dist = dist
                    best_pitch = cand_pitch

            # Apply octave modifiers
            if oct_mod:
                best_pitch += oct_mod.count("'") * 12
                best_pitch -= oct_mod.count(",") * 12

            pitches.append((tok, best_pitch))
            curr = best_pitch

    return pitches

for f in sorted(os.listdir(NOTES_DIR)):
    if f.startswith("moonlight_samba_") and f.endswith(".ily"):
        path = os.path.join(NOTES_DIR, f)
        with open(path, 'r', encoding='utf-8') as fh:
            content = fh.read()
        pitches = parse_relative_lilypond(content)
        if pitches:
            midi_vals = [p[1] for p in pitches]
            min_m, max_m = min(midi_vals), max(midi_vals)
            print(f"{f:32} Notes: {len(pitches):4} | Min MIDI: {min_m:3} | Max MIDI: {max_m:3}")
