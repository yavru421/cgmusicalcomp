\version "2.24.0"
\include "articulate.ly"

\header {
  title = "The Next Episode (Intro)"
  subtitle = "Arranged for Concert Band & West Coast Rhythm Section"
  composer = "Dr. Dre (feat. Snoop Dogg) / David McCallum & David Axelrod"
  arranger = "Arranged by John Daniel Dondlinger"
  tagline = "The Next Episode — Dr. Dre (2001) / Arranged by John Daniel Dondlinger"
}

#(set-global-staff-size 14)

\paper {
  #(set-paper-size "letter")
  top-margin = 0.5\in
  bottom-margin = 0.5\in
  left-margin = 0.5\in
  right-margin = 0.5\in
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  system-system-spacing.basic-distance = #12
  score-system-spacing.basic-distance = #12
}

global = {
  \key g \minor
  \time 4/4
  \tempo "West Coast Groove" 4 = 95
}

% =======================================================================
% 1. FLUTE (Top String Hook & Stabs)
% =======================================================================
fluteConcert = \fixed c' {
  \global
  \clef treble

  % mm. 1-2: Opening Guitar / String Stabs
  r8 <g' bes' d''>-.\f <g' bes' d''>-. <g' bes' d''>-.  r <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-. |
  r8 <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-.  r <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-. |

  % mm. 3-6: Beat Drops — Flute doubles the stabs
  r8 <g' bes' d''>-.\ff <g' bes' d''>-. <g' bes' d''>-.  r <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-. |
  r8 <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-.  r <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-. |
  r8 <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-.  r <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-. |
  r8 <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-.  r <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-. |

  % mm. 7-10: Iconic Soaring Lead Hook
  d''4.\fff c''8 bes'4 a' |
  g'1 ~ |
  g'4 a'8 bes' c''4 d'' |
  d''4. c''8 bes'4 a' |
  g'1\fff \bar "|."
}

% =======================================================================
% 2. B♭ CLARINET (Concert Pitch Definition, Written A minor)
% =======================================================================
clarinetConcert = \fixed c' {
  \global
  \clef treble

  % mm. 1-2: Stabs
  r8 <bes d' g'>-.\f <bes d' g'>-. <bes d' g'>-.  r <bes d' g'>-. <bes d' g'>-. <bes d' g'>-. |
  r8 <bes d' g'>-. <bes d' g'>-. <bes d' g'>-.  r <bes d' g'>-. <bes d' g'>-. <bes d' g'>-. |

  % mm. 3-6: Stabs with Beat
  r8 <bes d' g'>-.\ff <bes d' g'>-. <bes d' g'>-.  r <bes d' g'>-. <bes d' g'>-. <bes d' g'>-. |
  r8 <bes d' g'>-. <bes d' g'>-. <bes d' g'>-.  r <bes d' g'>-. <bes d' g'>-. <bes d' g'>-. |
  r8 <bes d' g'>-. <bes d' g'>-. <bes d' g'>-.  r <bes d' g'>-. <bes d' g'>-. <bes d' g'>-. |
  r8 <bes d' g'>-. <bes d' g'>-. <bes d' g'>-.  r <bes d' g'>-. <bes d' g'>-. <bes d' g'>-. |

  % mm. 7-10: Lead Harmony
  bes'4.\fff a'8 g'4 f' |
  ees'1 ~ |
  ees'4 f'8 g' a'4 bes' |
  bes'4. a'8 g'4 f' |
  d'1\fff \bar "|."
}

% =======================================================================
% 3. B♭ TRUMPET (Concert Pitch Definition, Written A minor)
% =======================================================================
trumpetConcert = \fixed c' {
  \global
  \clef treble

  % mm. 1-2: Tacet during opening riff
  R1 * 2 |

  % mm. 3-6: Brass Stabs on Beats 2 & 4
  r8 g'-.\f r4 r8 g'-. r4 |
  r8 g'-. r4 r8 g'-. r4 |
  r8 g'-. r4 r8 g'-. r4 |
  r8 g'-. r4 r8 g'-. r4 |

  % mm. 7-10: Soaring Brass Lead Unison
  d''4.\fff c''8 bes'4 a' |
  g'1 ~ |
  g'4 a'8 bes' c''4 d'' |
  d''4. c''8 bes'4 a' |
  g'1\fff \bar "|."
}

% =======================================================================
% 4. FRENCH HORN IN F (Concert Pitch, Written D minor)
% =======================================================================
hornConcert = \fixed c' {
  \global
  \clef treble

  % mm. 1-2: Tacet
  R1 * 2 |

  % mm. 3-6: Warm Brass Punch
  r8 d'-.\f r4 r8 d'-. r4 |
  r8 d'-. r4 r8 d'-. r4 |
  r8 d'-. r4 r8 d'-. r4 |
  r8 d'-. r4 r8 d'-. r4 |

  % mm. 7-10: Horn Counterline
  g'4.\fff g'8 d'4 f' |
  c'1 ~ |
  c'4 c'8 d' ees'4 f' |
  g'4. g'8 d'4 f' |
  g'1\fff \bar "|."
}

% =======================================================================
% 5. TROMBONE (Concert Pitch, Bass Clef)
% =======================================================================
tromboneConcert = \fixed c {
  \global
  \clef bass

  % mm. 1-2: Tacet
  R1 * 2 |

  % mm. 3-6: Doubling the Iconic Bassline with Low Brass Punch
  g,4.\ff g,8 bes,4 c |
  d4. c8 bes,4 a, |
  g,4. g,8 bes,4 c |
  d4. c8 bes,4 a, |

  % mm. 7-10: Driving Low Brass
  g,4.\fff g,8 bes,4 c |
  d4. c8 bes,4 a, |
  g,4. g,8 bes,4 c |
  d4. c8 bes,4 a, |
  g,1\fff \bar "|."
}

% =======================================================================
% 6. ELECTRIC BASS (The Definitive Axelrod / Dre Bassline)
% =======================================================================
bassConcert = \fixed c, {
  \global
  \clef bass

  % mm. 1-2: Tacet
  R1 * 2 |

  % mm. 3-6: The Drop!
  g,4.\ff g,8 bes,4 c |
  d4. c8 bes,4 a, |
  g,4. g,8 bes,4 c |
  d4. c8 bes,4 a, |

  % mm. 7-10: Heavy Groove
  g,4.\fff g,8 bes,4 c |
  d4. c8 bes,4 a, |
  g,4. g,8 bes,4 c |
  d4. c8 bes,4 a, |
  g,1\fff \bar "|."
}

% =======================================================================
% 7. DRUM SET (Authentic Dr. Dre 95 BPM Hip-Hop Beat)
% =======================================================================
drumKit = \drummode {
  % mm. 1-2: Crisp Hi-Hat Ticking
  hh8\f hh hh hh hh hh hh hh |
  hh8 hh hh hh hh hh hh16 hh hho8 |

  % mm. 3-6: The Beat Drops! Heavy Kick & Crisp Backbeat Snare
  cymc4\ff r r2 |
  \repeat unfold 3 {
    bd4 sn8. bd16 r8 bd sn4 |
  }

  % mm. 7-10: Tutti Groove
  cymc4\fff sn8. bd16 r8 bd sn4 |
  bd4 sn8. bd16 r8 bd sn4 |
  bd4 sn8. bd16 r8 bd sn4 |
  bd4 sn8. bd16 r8 bd sn4 |
  cymc1\fff \bar "|."
}

% =======================================================================
% 8. VISUAL ENGRAVED SCORE
% =======================================================================
\score {
  <<
    \new StaffGroup = "Woodwinds" <<
      \new Staff \with { instrumentName = #"Flute" shortInstrumentName = #"Fl." } {
        \fluteConcert
      }
      \new Staff \with { instrumentName = #"B♭ Clarinet" shortInstrumentName = #"Cl." } {
        \transpose bes c' \clarinetConcert
      }
    >>

    \new StaffGroup = "Brass" <<
      \new Staff \with { instrumentName = #"B♭ Trumpet" shortInstrumentName = #"Tpt." } {
        \transpose bes c' \trumpetConcert
      }
      \new Staff \with { instrumentName = #"Horn in F" shortInstrumentName = #"Hn." } {
        \transpose f c' \hornConcert
      }
      \new Staff \with { instrumentName = #"Trombone" shortInstrumentName = #"Tbn." } {
        \tromboneConcert
      }
    >>

    \new StaffGroup = "Rhythm" <<
      \new Staff \with { instrumentName = #"Electric Bass" shortInstrumentName = #"Bs." } {
        \bassConcert
      }
      \new DrumStaff \with { instrumentName = #"Drum Set" shortInstrumentName = #"Drums" } {
        \drumKit
      }
    >>
  >>
  \layout {
    \context {
      \Score
      \override BarNumber.break-visibility = ##(#f #t #t)
    }
  }
}

% =======================================================================
% 9. AUDIO SYNTHESIS SCORE (Expressive Concert Band & Beat Playback)
% =======================================================================
\score {
  \unfoldRepeats \articulate <<
    \new Staff \with { midiInstrument = #"flute" } {
      \fluteConcert
    }
    \new Staff \with { midiInstrument = #"clarinet" } {
      \clarinetConcert
    }
    \new Staff \with { midiInstrument = #"trumpet" } {
      \trumpetConcert
    }
    \new Staff \with { midiInstrument = #"french horn" } {
      \hornConcert
    }
    \new Staff \with { midiInstrument = #"trombone" } {
      \tromboneConcert
    }
    \new Staff \with { midiInstrument = #"electric bass (finger)" } {
      \bassConcert
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      \drumKit
    }
  >>
  \midi { }
}
