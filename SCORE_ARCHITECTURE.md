# Modular LilyPond Score Architecture & Directory Specification

**Repository**: `cgmusicalcomp`  
**Target Engine**: GNU LilyPond v2.24.4+  
**Reference Sources**: LilyPond Learning Manual §4.4.5, Reddit `r/lilypond` Best Practices, GitLab `lilypond-templates`

---

## 📌 Executive Summary

To maintain clean code separation, prevent duplication, and enable automated compilation of both **Conductor Scores** and **Transposed Musician Parts**, all compositions in this repository MUST strictly follow a modular directory structure. 

Notes are written **once** in absolute concert pitch (`\fixed c'`) inside the `Notes/` directory. Scores and individual parts import these note variables and apply key signatures, clefs, transpositions, and formatting directives dynamically.

---

## 📁 Standard Directory Structure

```text
cgmusicalcomp/
├── Global/
│   ├── global.ily            # Shared time signatures, key signatures, tempos, rehearsal marks
│   ├── conductor_geometry.ily # Tabloid 11x17 landscape conductor score layout
│   └── paper_defs.ily        # Margins, fonts, header/footer layouts, title blocks
├── Notes/
│   ├── flute.ily             # Note variable: fluteNotes = \fixed c'' { ... }
│   ├── oboe.ily              # Note variable: oboeNotes = \fixed c' { ... }
│   ├── clarinet1.ily         # Concert pitch notes: clarinetOneNotes = \fixed c' { ... }
│   ├── alto_sax.ily          # Concert pitch notes: altoSaxNotes = \fixed c' { ... }
│   ├── tenor_sax.ily         # Concert pitch notes: tenorSaxNotes = \fixed c' { ... }
│   ├── trumpet1.ily          # Concert pitch notes: trumpetOneNotes = \fixed c' { ... }
│   ├── horn1.ily             # Concert pitch notes: hornOneNotes = \fixed c' { ... }
│   ├── trombone1.ily         # Concert pitch notes: tromboneOneNotes = \fixed c { ... }
│   ├── euphonium.ily         # Concert pitch notes: euphoniumNotes = \fixed c { ... }
│   ├── tuba.ily              # Concert pitch notes: tubaNotes = \fixed c, { ... }
│   ├── timpani.ily           # Pitched percussion: timpaniNotes = \fixed c { ... }
│   └── percussion.ily        # Unpitched battery: snareNotes = \drummode { ... }
├── Parts/
│   ├── part_flute.ly         # Individual Flute Part (C)
│   ├── part_clarinet1.ly     # Individual Clarinet Part (\transpose bes c')
│   ├── part_trumpet1.ly      # Individual Trumpet Part (\transpose bes c')
│   ├── part_horn1.ly         # Individual French Horn Part (\transpose f c')
│   └── part_trombone1.ly     # Individual Trombone Part (C Bass Clef)
├── Scores/
│   └── score_full_band.ly    # Master Conductor Score (All 14-16 Staves)
├── MIDI/                     # Output multi-track MIDI files (.mid)
├── PDF/                      # Output compiled PDFs (.pdf)
└── Makefile                  # Automated build targets
```

---

## 🎼 Code Rules & Implementation Examples

### 1. The Global Settings File (`Global/global.ily`)
Defines overarching time signatures, key signatures, rehearsal markings, and tempo changes across all parts:

```lilypond
\version "2.24.0"

global = {
  \key bes \major
  \time 4/4
  \tempo "Maestoso e Con Brio" 4 = 108
  s1 * 4 | \mark \default
  s1 * 4 | \mark \default
  s1 * 4 |
}
```

### 2. Concert Pitch Note Definitions (`Notes/trumpet1.ily`)
Always use `\fixed c'` (or `\fixed c''`) to eliminate relative mode octave-drift. Write notes in **concert pitch**:

```lilypond
\version "2.24.0"

trumpetOneNotes = \fixed c' {
  bes4.\f f8 bes4 d' | f'2 d'4 r |
  ees'4. d'8 c'4 bes | c'2. r4 |
  d'4.\f c'8 bes4 c' | d'4. ees'8 f'2 |
  g'4 f' ees' d' | bes2. r4 |
}
```

### 3. Individual Transposed Musician Part (`Parts/part_trumpet1.ly`)
Imports global defs and note variables. Applies `\compressMMRests` so the performer sees consolidated multi-measure rest blocks:

```lilypond
\version "2.24.0"

\include "../Global/paper_defs.ily"
\include "../Global/global.ily"
\include "../Notes/trumpet1.ily"

\book {
  \header {
    title = "Wisconsin Rapids Celebration Fanfare"
    instrument = "B♭ Trumpet I"
    composer = "J. D. Dondlinger"
  }
  \score {
    \compressMMRests
    \new Staff {
      \transpose bes c' << \global \trumpetOneNotes >>
    }
    \layout { }
  }
}
```

### 4. Master Conductor Score (`Scores/score_full_band.ly`)
Combines all instrument staves into staff groups. Conductor scores can be displayed in concert pitch or transposed pitch:

```lilypond
\version "2.24.0"

\include "../Global/conductor_geometry.ily"
\include "../Global/global.ily"
\include "../Notes/flute.ily"
\include "../Notes/clarinet1.ily"
\include "../Notes/trumpet1.ily"
\include "../Notes/horn1.ily"
\include "../Notes/trombone1.ily"
\include "../Notes/tuba.ily"
\include "../Notes/percussion.ily"

\book {
  \header {
    title = "Wisconsin Rapids Celebration Fanfare"
    subtitle = "Full Conductor Score"
    composer = "J. D. Dondlinger"
  }
  \score {
    <<
      \new StaffGroup = "Woodwinds" <<
        \new Staff \with { instrumentName = #"Flute" } { << \global \fluteNotes >> }
        \new Staff \with { instrumentName = #"B♭ Clarinet I" } { \transpose bes c' << \global \clarinetOneNotes >> }
      >>
      \new StaffGroup = "Brass" <<
        \new Staff \with { instrumentName = #"B♭ Trumpet I" } { \transpose bes c' << \global \trumpetOneNotes >> }
        \new Staff \with { instrumentName = #"Horn I in F" } { \transpose f c' << \global \hornOneNotes >> }
        \new Staff \with { instrumentName = #"Trombone I" } { << \global \tromboneOneNotes >> }
        \new Staff \with { instrumentName = #"Tuba" } { << \global \tubaNotes >> }
      >>
      \new StaffGroup = "Percussion" <<
        \new DrumStaff \with { instrumentName = #"Snare Drum" } { << \global \snareNotes >> }
      >>
    >>
    \layout { }
    \midi { }
  }
}
```

---

## 🛠 Automation Makefile (`Makefile`)

```makefile
# Master Makefile for CGMusicalComposition
LILY_CMD := lilypond -ddelete-intermediate-files -dno-point-and-click

.PHONY: score parts all clean

score:
	$(LILY_CMD) -o PDF/score_full_band Scores/score_full_band.ly
	mv PDF/score_full_band.midi MIDI/score_full_band.mid

parts:
	$(LILY_CMD) -o PDF/part_flute Parts/part_flute.ly
	$(LILY_CMD) -o PDF/part_trumpet1 Parts/part_trumpet1.ly
	$(LILY_CMD) -o PDF/part_horn1 Parts/part_horn1.ly

all: score parts

clean:
	rm -f PDF/*.pdf MIDI/*.mid
```
