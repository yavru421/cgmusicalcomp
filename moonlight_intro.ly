\version "2.24.0"

\header {
  title = "Moonlight Sonata (Adagio sostenuto Intro)"
  subtitle = "Multi-Instrument Chamber Arrangement"
  composer = "Ludwig van Beethoven (Op. 27, No. 2)"
  arranger = "Arranged for Local Pipeline Test"
}

global = {
  \key cis \minor
  \time 4/4
  \tempo "Adagio sostenuto" 4 = 54
}

% 1. Lead Melody (Flute / Solo Woodwind)
melodyFlute = \relative c'' {
  \global
  \clef treble
  R1 | R1 | R1 | R1 |
  r2. gis4\pp |
  gis4. gis8 gis2 |
  a4. gis8 fis4. a8 |
  gis1\p \bar "|."
}

% 2. Ostinato Triplet Arpeggios (B♭ Clarinet - Concert Pitches)
clarinetConcert = \relative c' {
  \global
  \clef treble
  \tuplet 3/2 4 {
    gis8\pp cis e gis, cis e gis, cis e gis, cis e |
    gis, cis e gis, cis e gis, cis e gis, cis e |
    a, cis e a, cis e a, d fis a, d fis |
    gis, bis fis' gis, cis e gis, bis dis gis, cis e |
    gis, cis e gis, cis e gis, cis e gis, cis e |
    gis, cis e gis, cis e gis, cis e gis, cis e |
    a, cis e a, cis e a, d fis a, d fis |
    gis, cis e gis, cis e gis, bis dis gis, cis e |
  }
}

% 3. Sustained Harmony (Horn in F - Concert Pitches)
hornConcert = \relative c' {
  \global
  \clef treble
  cis1\pp ~ | cis1 |
  cis2 d |
  bis2 cis |
  cis1 ~ |
  cis1 |
  cis2 d |
  cis2 bis |
}

% 4. Descending Octave Bass Line (Cello & Double Bass)
bassLine = \relative c, {
  \global
  \clef bass
  <cis, cis>1\pp |
  <b,, b,>1 |
  <a,, a,>2 <d,, d,>2 |
  <gis,, gis,>1 |
  <cis, cis>1 |
  <b,, b,>1 |
  <a,, a,>2 <d,, d,>2 |
  <gis,, gis,>1\p \bar "|."
}

% =======================================================================
% 1. VISUAL ENGRAVED SCORE (Sheet Music with proper musician transpositions)
% =======================================================================
\score {
  <<
    \new StaffGroup = "WindsAndBrass" <<
      \new Staff \with { instrumentName = #"Flute" } {
        \melodyFlute
      }
      \new Staff \with { instrumentName = #"B♭ Clarinet" } {
        \transpose bes c' \clarinetConcert
      }
      \new Staff \with { instrumentName = #"Horn in F" } {
        \transpose f c' \hornConcert
      }
    >>

    \new StaffGroup = "Strings" <<
      \new Staff \with { instrumentName = #"Cello & Bass" } {
        \bassLine
      }
    >>
  >>
  \layout { }
}

% =======================================================================
% 2. AUDIO SYNTHESIS SCORE (Pure concert pitch + GM Instrument Mapping)
% =======================================================================
\score {
  <<
    \new Staff \with { midiInstrument = #"flute" } {
      \melodyFlute
    }
    \new Staff \with { midiInstrument = #"clarinet" } {
      \clarinetConcert
    }
    \new Staff \with { midiInstrument = #"french horn" } {
      \hornConcert
    }
    \new Staff \with { midiInstrument = #"cello" } {
      \bassLine
    }
  >>
  \midi { }
}
