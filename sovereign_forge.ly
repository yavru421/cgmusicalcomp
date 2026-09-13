\version "2.24.0"
\include "articulate.ly"

\header {
  title = "The Sovereign Forge"
  subtitle = "An Autobiographical Tone Poem for Concert Band"
  composer = "John Daniel Dondlinger"
  tagline = "Dedicated to the Memory of Jace & The Pressure Years — Composed by John Daniel Dondlinger"
}

#(set-global-staff-size 13)

\paper {
  #(set-paper-size "letter")
  top-margin = 0.4\in
  bottom-margin = 0.4\in
  left-margin = 0.5\in
  right-margin = 0.4\in
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  system-system-spacing.basic-distance = #11
  score-system-spacing.basic-distance = #11
}

% =======================================================================
% 1. FLUTE (Concert Pitch)
% =======================================================================
fluteConcert = \relative c'' {
  \key d \minor
  \time 4/4
  \clef treble

  % Part I: The Burden & The Solitary Dawn (Lento Pensieroso, q = 66)
  \tempo "Lento Pensieroso" 4 = 66
  R1 * 4 |
  r2 r4 a'8\p( d'' |
  f''4. e''8 d''4. a'8 |
  bes'4. a'8 g'4. bes'8 |
  a'2\> ~ a'4)\! r\fermata |

  % Part II: The Forge & Pressure Years (Allegro Risoluto, q = 112)
  \tempo "Allegro Risoluto - The Forge" 4 = 112
  R1 * 2 |
  r4 d''8\f d'' f''4 g'' |
  a''4. g''8 f''4 e'' |
  d''4. a'8 d''4 e'' |
  f''4. g''8 a''2 |
  g''4. f''8 e''4. g''8 |
  f''2. r4 |
  d''8\ff e'' f'' g'' a'' bes'' c''' d''' |
  e'''4. d'''8 c'''4 bes'' |
  a''4. g''8 f''4 e'' |
  d''2.\ff r4 |
  r8 a''16\fff a'' r8 a'' d'''4 a'' |
  d'''1:32\fff\fermata |

  % Part III: Sovereign Dawn (Maestoso Nobile, q = 76, D Major)
  \tempo "Maestoso Nobile - Sovereign Dawn" 4 = 76
  \key d \major
  fis''4.\f g''8 a''4. d'''8 |
  b''4. a''8 fis''2 |
  g''4. fis''8 e''4. g''8 |
  fis''1 ~ |
  fis''4. g''8 a''4. d'''8 |
  b''4. cis'''8 d'''2 |
  e'''4. d'''8 cis'''4. b''8 |
  a''2. r4 |
  d'''4.\fff cis'''8 b''4. a''8 |
  b''4. a''8 fis''2 |
  g''4. fis''8 e''4. e''8 |
  d''1\fff \bar "|."
}

% =======================================================================
% 2. B♭ CLARINET (Concert Pitch Definition)
% =======================================================================
clarinetConcert = \relative c' {
  \key d \minor
  \time 4/4
  \clef treble

  % Part I: Lento Pensieroso
  R1 * 2 |
  r4 d8\p( f a4 d' |
  f'4. e'8 d'2) |
  d'4.\p e'8 f'4. d'8 |
  d'2 d' |
  d'2 e' |
  f'2\> ~ f'4\! r\fermata |

  % Part II: Allegro Risoluto - The Forge
  R1 * 2 |
  d'8\f d' r d' d'4 d' |
  d'8 d' r d' d'4 d' |
  f'4.\f e'8 d'4. e'8 |
  f'4. g'8 a'2 |
  bes'4. a'8 g'4. bes'8 |
  a'2. r4 |
  d'8\ff e' f' g' a' bes' c'' d'' |
  g''4. f''8 e''4 d'' |
  c''4. bes'8 a'4 g' |
  f'2.\ff r4 |
  r8 f''16\fff f'' r8 f'' a''4 f'' |
  f''1:32\fff\fermata |

  % Part III: Maestoso Nobile (D Major)
  \key d \major
  d'4.\f e'8 fis'4. a'8 |
  g'4. fis'8 d'2 |
  e'4. d'8 cis'4. e'8 |
  d'1 ~ |
  d'4. e'8 fis'4. a'8 |
  g'4. a'8 b'2 |
  cis''4. b'8 a'4. g'8 |
  fis'2. r4 |
  fis'4.\fff a'8 g'4. fis'8 |
  g'4. fis'8 d'2 |
  e'4. d'8 cis'4. cis'8 |
  d'1\fff \bar "|."
}

% =======================================================================
% 3. B♭ TRUMPET (Concert Pitch Definition)
% =======================================================================
trumpetConcert = \relative c' {
  \key d \minor
  \time 4/4
  \clef treble

  % Part I: Lento Pensieroso (Tacet mm. 1-6, enters m. 7)
  R1 * 6 |
  r2 e'4.\p g'8 |
  f'2\> ~ f'4\! r\fermata |

  % Part II: Allegro Risoluto - The Forge
  R1 * 2 |
  r4 a'8\f a' d''4 e'' |
  f''4. e''8 d''4 cis'' |
  d''4. a'8 d''4 e'' |
  f''4. g''8 a''2 |
  g''4. f''8 e''4. g''8 |
  f''2. r4 |
  a'8\ff b' c'' d'' e'' f'' g'' a'' |
  bes''4. a''8 g''4 f'' |
  e''4. d''8 cis''4 cis'' |
  d''2.\ff r4 |
  r8 d''16\fff d'' r8 d'' f''4 d'' |
  d''1:32\fff\fermata |

  % Part III: Maestoso Nobile (D Major)
  \key d \major
  a'4.\f b'8 cis''4. d''8 |
  d''4. cis''8 a'2 |
  b'4. a'8 g'4. b'8 |
  a'1 ~ |
  a'4. b'8 cis''4. d''8 |
  d''4. e''8 fis''2 |
  g''4. fis''8 e''4. d''8 |
  cis''2. r4 |
  d''4.\fff cis''8 b''4. a''8 |
  b''4. a''8 fis''2 |
  g''4. fis''8 e''4. e''8 |
  d''1\fff \bar "|."
}

% =======================================================================
% 4. FRENCH HORN IN F (Concert Pitch Definition)
% =======================================================================
hornConcert = \relative c' {
  \key d \minor
  \time 4/4
  \clef treble

  % Part I: Solitary Horn Theme Opens the Piece
  d4\p( a' f4. e8 |
  d2 ~ d8 cis d e) |
  f4.( g8 a2 |
  d'4. c'8 bes2) |
  a1\p ~ |
  a1 |
  bes2 g |
  a2\> ~ a4\! r\fermata |

  % Part II: Allegro Risoluto - The Forge
  R1 * 2 |
  d8\f d r d d4 d |
  d8 d r d d4 d |
  d4.\f e8 f4. g8 |
  a4. bes8 c'2 |
  bes4. a8 g4. bes8 |
  a2. r4 |
  d8\ff e f g a bes c' d' |
  g'4. f'8 e'4 d' |
  cis'4. b8 a4 g |
  f2.\ff r4 |
  r8 d'16\fff d' r8 d' f'4 d' |
  d'1:32\fff\fermata |

  % Part III: Maestoso Nobile (D Major)
  \key d \major
  fis4.\f g8 a4. d'8 |
  d'4. d'8 a2 |
  b4. a8 g4. b8 |
  a1 ~ |
  a4. b8 cis'4. d'8 |
  d'4. e'8 fis'2 |
  e'4. d'8 cis'4. b8 |
  a2. r4 |
  a4.\fff a8 b4. cis'8 |
  d'4. cis'8 a2 |
  b4. a8 g4. g8 |
  fis1\fff \bar "|."
}

% =======================================================================
% 5. TROMBONE (Concert Pitch, Tenor Trombone C2-F4)
% =======================================================================
tromboneConcert = \relative c {
  \key d \minor
  \time 4/4
  \clef bass

  % Part I: Lento Pensieroso (Warm, Solemn Foundation)
  R1 * 2 |
  d1\p ~ |
  d1 |
  f1 |
  g2 f |
  g2 bes |
  a2\> ~ a4\! r\fermata |

  % Part II: Allegro Risoluto - The Forge (Grit & Driving Low Brass)
  d4.\f d8 f4 g |
  a4. g8 f4 e |
  d8\f d r d d4 d |
  d8 d r d d4 d |
  d4.\f e8 f4. g8 |
  a4. bes8 c'2 |
  bes4. a8 g4. bes8 |
  a2. r4 |
  d8\ff e f g a bes c' d' |
  g4. a8 bes4 c' |
  cis'4. d'8 e'4 cis' |
  d'2.\ff r4 |
  r8 d16\fff d r8 d f4 d |
  d1:32\fff\fermata |

  % Part III: Maestoso Nobile (D Major)
  \key d \major
  d4.\f e8 fis4. a8 |
  g4. fis8 d2 |
  e4. d8 cis4. e8 |
  d1 ~ |
  d4. e8 fis4. a8 |
  g4. a8 b2 |
  cis'4. b8 a4. g8 |
  fis2. r4 |
  d'4.\fff a8 g4. fis8 |
  g4. fis8 d2 |
  e4. d8 a,4. a,8 |
  d1\fff \bar "|."
}

% =======================================================================
% 6. BASS / TUBA FOUNDATION
% =======================================================================
bassConcert = \relative c, {
  \key d \minor
  \time 4/4
  \clef bass

  % Part I: Lento Pensieroso
  d,1\pp ~ |
  d,1 |
  d,1 |
  bes,,1 |
  f,,1 |
  g,,2 d, |
  g,,2 g, |
  a,,2\> ~ a,,4\! r\fermata |

  % Part II: Allegro Risoluto - The Forge
  d,4.\f d,8 f,4 g, |
  a,4. g,8 f,4 e, |
  d,8\f d, r d, d,4 d, |
  d,8 d, r d, d,4 d, |
  d,4.\f e,8 f,4. g,8 |
  a,4. bes,8 c2 |
  g,4. f,8 e,4. g,8 |
  a,2. r4 |
  d,8\ff e, f, g, a, bes, c d |
  g,4. a,8 bes,4 c |
  cis4. d8 e4 cis |
  d2.\ff r4 |
  d8\fff r d r d4 d |
  d1:32\fff\fermata |

  % Part III: Maestoso Nobile (D Major)
  \key d \major
  d,4.\f e,8 fis,4. a,8 |
  g,4. fis,8 d,2 |
  e,4. d,8 a,,4. a,,8 |
  d,1 ~ |
  d,4. e,8 fis,4. a,8 |
  g,4. a,8 b,2 |
  cis4. b,8 a,4. g,8 |
  fis,2. r4 |
  d4.\fff cis8 b,4. a,8 |
  g,4. fis,8 d,2 |
  e,4. fis,8 a,,4. a,,8 |
  d,,1\fff \bar "|."
}

% =======================================================================
% 7. PERCUSSION 1: CONCERT SNARE & BASS DRUM
% =======================================================================
percussionOne = \drummode {
  % Part I: Lento Pensieroso (Tacet)
  R1 * 8 |

  % Part II: Allegro Risoluto (Forge Cadence)
  sn8\f sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn8\f sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn8 sn sn sn sn2:32 |
  sn2. r4 |
  sn8\ff sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn2.\ff r4 |
  sn8\fff sn16 sn sn8 sn sn4 sn |
  sn1:32\fff\fermata |

  % Part III: Maestoso Nobile (Noble March & Heartbeat)
  <<
    {
      sn4.\f sn8 sn4 sn |
      sn4. sn8 sn2:32 |
      sn4. sn8 sn4 sn |
      sn1:32 ~ |
      sn4. sn8 sn4 sn |
      sn4. sn8 sn2:32 |
      sn4. sn8 sn4 sn |
      sn2. r4 |
      sn4.\fff sn8 sn4 sn |
      sn4. sn8 sn2:32 |
      sn4. sn8 sn4 sn |
      sn1:32\fff \bar "|."
    }
    \\
    {
      bd4\f r bd r |
      bd4 r bd2 |
      bd4 r bd r |
      bd1 ~ |
      bd4 r bd r |
      bd4 r bd2 |
      bd4 r bd r |
      bd2. r4 |
      bd4\fff r bd r |
      bd4 r bd2 |
      bd4 r bd r |
      bd1\fff \bar "|."
    }
  >>
}

% =======================================================================
% 8. PERCUSSION 2: CYMBALS (Crash & Suspended)
% =======================================================================
percussionTwo = \drummode {
  % Part I: Lento Pensieroso (Suspended Cymbal Mallet Roll)
  R1 * 6 |
  cyms1:32\p\< ~ |
  cyms2\> ~ cyms4\! r\fermata |

  % Part II: Allegro Risoluto
  R1 * 2 |
  cymc4\f r r2 |
  r1 |
  cymc4\f r r2 |
  r1 |
  cyms1:32\< |
  cymc4\ff r r2 |
  cymc4\ff r cymc r |
  cymc4 r cymc r |
  cyms1:32\< |
  cymc2.\ff r4 |
  cymc4\fff r cymc r |
  cymc1:32\fff\fermata |

  % Part III: Maestoso Nobile
  cymc4\f r r2 |
  r1 |
  cyms1:32\p\< ~ |
  cyms1\f |
  cymc4\f r r2 |
  r1 |
  cyms1:32\< |
  cymc4\ff r r2 |
  cymc4\fff r cymc r |
  cymc4 r cymc r |
  cyms1:32\< |
  cymc1:32\fff \bar "|."
}

% =======================================================================
% 9. PERCUSSION 3: TIMPANI (Tuned to D, A, F)
% =======================================================================
timpaniConcert = \relative c {
  \key d \minor
  \time 4/4
  \clef bass

  % Part I: Lento Pensieroso
  d,1\pp ~ |
  d,1 |
  R1 * 4 |
  a,1:32\p\< ~ |
  a,2\> ~ a,4\! r\fermata |

  % Part II: Allegro Risoluto (The Forge)
  d,4.\f d,8 f,4 g, |
  a,4. g,8 f,4 e, |
  d,8\f d, r d, d,4 d, |
  d,8 d, r d, d,4 d, |
  d,4.\f d,8 d,4. d,8 |
  a,4. a,8 a,2 |
  g,4. f,8 e,4. g,8 |
  a,2. r4 |
  d,8\ff d, d, d, d, d, d, d, |
  g,4. a,8 bes,4 c |
  a,4. a,8 a,4 a, |
  d,2.\ff r4 |
  d,8\fff r d, r d,4 d, |
  d,1:32\fff\fermata |

  % Part III: Maestoso Nobile (D Major)
  \key d \major
  d,4.\f d,8 d,4. d,8 |
  g,4. fis,8 d,2 |
  a,4. a,8 a,4. a,8 |
  d,1 ~ |
  d,4. d,8 d,4. d,8 |
  g,4. a,8 b,2 |
  a,4. a,8 a,4. a,8 |
  d,2. r4 |
  d,4.\fff d,8 d,4. d,8 |
  g,4. fis,8 d,2 |
  a,4. a,8 a,4. a,8 |
  d,1:32\fff \bar "|."
}

% =======================================================================
% 10. VISUAL ENGRAVED SCORE
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

    \new StaffGroup = "StringsBass" <<
      \new Staff \with { instrumentName = #"Tuba / Bass" shortInstrumentName = #"Bs." } {
        \bassConcert
      }
    >>

    \new StaffGroup = "Percussion" <<
      \new DrumStaff \with { instrumentName = #"Percussion 1 (SD/BD)" shortInstrumentName = #"Perc. 1" } {
        \percussionOne
      }
      \new DrumStaff \with { instrumentName = #"Percussion 2 (Cymbals)" shortInstrumentName = #"Perc. 2" } {
        \percussionTwo
      }
      \new Staff \with { instrumentName = #"Timpani" shortInstrumentName = #"Timp." } {
        \timpaniConcert
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
% 11. AUDIO SYNTHESIS SCORE (Expressive Concert Band Rendering)
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
    \new Staff \with { midiInstrument = #"tuba" } {
      \bassConcert
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      \percussionOne
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      \percussionTwo
    }
    \new Staff \with { midiInstrument = #"timpani" } {
      \timpaniConcert
    }
  >>
  \midi { }
}
