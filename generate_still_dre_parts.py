#!/usr/bin/env python3
import os

PARTS_DIR = os.path.join(r"C:\dev\CGMusicalComposition", "Parts")
os.makedirs(PARTS_DIR, exist_ok=True)

PARTS_CONFIG = [
    {
        "file": "still_dre_part_flute.ly",
        "name": "Flute",
        "short": "Fl.",
        "staff": "Staff",
        "notes_file": "still_dre_flute.ily",
        "notes_call": "\\fluteNotes",
    },
    {
        "file": "still_dre_part_oboe.ly",
        "name": "Oboe",
        "short": "Ob.",
        "staff": "Staff",
        "notes_file": "still_dre_oboe.ily",
        "notes_call": "\\oboeNotes",
    },
    {
        "file": "still_dre_part_clarinet.ly",
        "name": "B♭ Clarinet",
        "short": "Cl.",
        "staff": "Staff",
        "notes_file": "still_dre_clarinet.ily",
        "notes_call": "\\transpose bes c' \\clarinetNotes",
    },
    {
        "file": "still_dre_part_altosax.ly",
        "name": "Alto Saxophone",
        "short": "A.Sax",
        "staff": "Staff",
        "notes_file": "still_dre_altosax.ily",
        "notes_call": "\\transpose ees c' \\altoSaxNotes",
    },
    {
        "file": "still_dre_part_trumpet.ly",
        "name": "B♭ Trumpet",
        "short": "Tpt.",
        "staff": "Staff",
        "notes_file": "still_dre_trumpet.ily",
        "notes_call": "\\transpose bes c' \\trumpetNotes",
    },
    {
        "file": "still_dre_part_horn.ly",
        "name": "Horn in F",
        "short": "Hn.",
        "staff": "Staff",
        "notes_file": "still_dre_horn.ily",
        "notes_call": "\\transpose f c' \\hornNotes",
    },
    {
        "file": "still_dre_part_trombone.ly",
        "name": "Trombone",
        "short": "Tbn.",
        "staff": "Staff",
        "notes_file": "still_dre_trombone.ily",
        "notes_call": "\\tromboneNotes",
    },
    {
        "file": "still_dre_part_tuba.ly",
        "name": "Tuba",
        "short": "Tba.",
        "staff": "Staff",
        "notes_file": "still_dre_tuba.ily",
        "notes_call": "\\tubaNotes",
    },
    {
        "file": "still_dre_part_bass.ly",
        "name": "Electric Bass",
        "short": "E.Bs.",
        "staff": "Staff",
        "notes_file": "still_dre_bass.ily",
        "notes_call": "\\bassNotes",
    },
    {
        "file": "still_dre_part_glockenspiel.ly",
        "name": "Glockenspiel",
        "short": "Glock.",
        "staff": "Staff",
        "notes_file": "still_dre_glockenspiel.ily",
        "notes_call": "\\glockenspielNotes",
    },
    {
        "file": "still_dre_part_marimba.ly",
        "name": "Marimba",
        "short": "Mba.",
        "staff": "Staff",
        "notes_file": "still_dre_marimba.ily",
        "notes_call": "\\marimbaNotes",
    },
    {
        "file": "still_dre_part_timpani.ly",
        "name": "Timpani",
        "short": "Timp.",
        "staff": "Staff",
        "notes_file": "still_dre_timpani.ily",
        "notes_call": "\\timpaniNotes",
    },
    {
        "file": "still_dre_part_percussion1.ly",
        "name": "Percussion 1 (SD/BD)",
        "short": "Perc. 1",
        "staff": "DrumStaff",
        "notes_file": "still_dre_percussion1.ily",
        "notes_call": "\\percussionOneNotes",
    },
    {
        "file": "still_dre_part_percussion2.ly",
        "name": "Percussion 2 (HH/Cym)",
        "short": "Perc. 2",
        "staff": "DrumStaff",
        "notes_file": "still_dre_percussion2.ily",
        "notes_call": "\\percussionTwoNotes",
    },
]

TEMPLATE = """\\version "2.24.0"

\\include "../Global/global_settings.ily"
\\include "../Global/still_dre_global.ily"
\\include "../Notes/{notes_file}"

#(set-global-staff-size 18)

\\header {{
  title = "Still D.R.E."
  subtitle = "Concert Band Edition"
  composer = "Dr. Dre, Mel-Man & Scott Storch"
  arranger = "Arr. John Daniel Dondlinger"
  instrument = "{name}"
  tagline = "Still D.R.E. — {name} — Wisconsin Rapids City Band"
}}

\\score {{
  \\new {staff} \\with {{
    instrumentName = #"{name}"
    shortInstrumentName = #"{short}"
  }} {{
    \\compressMMRests <<
      \\stillDreGlobal
      {notes_call}
    >>
  }}
  \\layout {{ }}
}}
"""

for cfg in PARTS_CONFIG:
    path = os.path.join(PARTS_DIR, cfg["file"])
    content = TEMPLATE.format(**cfg)
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)
    print(f"Generated: {cfg['file']}")

print("All 14 parts successfully generated!")
