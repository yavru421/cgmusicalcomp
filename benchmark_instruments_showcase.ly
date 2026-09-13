\version "2.24.0"
\include "articulate.ly"

\header {
  title = "Concert Band Instrument Showcase & Benchmark Suite"
  subtitle = "Solo Demonstration of Every Instrument Followed by Grand Tutti Cadence"
  composer = "John Daniel Dondlinger"
  arranger = "Arranged for Wisconsin Rapids City Band"
  tagline = "Wisconsin Rapids City Band — Complete Instrument Benchmark Suite (2026)"
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

global = {
  \key bes \major
  \time 4/4
  \tempo "Con Brio — Maestoso" 4 = 100
}

% =======================================================================
% 1. FLUTE (Soaring, Agile, Pastoral Register)
% =======================================================================
flutePart = \fixed c' {
  \global
  \clef treble
  % 1. Flute Solo (mm. 1-4)
  d''4(\p f''8 bes'' d'''4. c'''8 |
  bes''8 a'' g'' f'' g''4 f''8 d'') |
  ees''16(\mf f'' g'' a'' bes'' c''' d''' ees''' f'''8-. d'''-.) bes''4 |
  c'''8-.(\f d'''-. c'''-. bes''-.) f''2\fermata |

  % Resting during Solos 2-14 (mm. 5-56 = 52 measures)
  R1*52 |

  % 15. Grand Tutti Finale (mm. 57-60)
  d'''4.\fff c'''8 bes''4 f'' |
  g''4. f''8 d''4 bes' |
  ees'''8-.(\ffff d'''-. c'''-. bes''-.) f'''4-^ f'''4-^ |
  <bes'' d''' f'''>1\fermata \bar "|."
}

% =======================================================================
% 2. OBOE (Plaintive, Singing Pastoral Cantabile)
% =======================================================================
oboePart = \fixed c' {
  \global
  \clef treble
  % Resting during Solo 1 (mm. 1-4)
  R1*4 |

  % 2. Oboe Solo (mm. 5-8)
  bes'4(\mf c''8. d''16 ees''4 d''8 c'' |
  bes'4. g'8 f'2) |
  g'8(\p a' bes' c'' d''4. ees''8 |
  d''8 c'' bes' a' bes'2\fermata) |

  % Resting during Solos 3-14 (mm. 9-56 = 48 measures)
  R1*48 |

  % 15. Grand Tutti Finale (mm. 57-60)
  bes'4.\fff c''8 d''4 d'' |
  ees''4. d''8 bes'4 g' |
  c''8-.(\ffff d''-. ees''-. f''-.) d''4-^ d''4-^ |
  d''1\fermata \bar "|."
}

% =======================================================================
% 3. B♭ CLARINET (Chalumeau Depth to Clarion Brilliance)
% =======================================================================
clarinetPart = \fixed c' {
  \global
  \clef treble
  % Resting during Solos 1-2 (mm. 1-8)
  R1*8 |

  % 3. Clarinet Solo (mm. 9-12)
  d8(\p f g bes d'4 c'8 bes |
  g1) |
  bes'8(\mf c'' d'' ees'' f''4 g''8 f'' |
  ees''8 d'' c'' bes' d''2\fermata) |

  % Resting during Solos 4-14 (mm. 13-56 = 44 measures)
  R1*44 |

  % 15. Grand Tutti Finale (mm. 57-60)
  f''4.\fff ees''8 d''4 bes' |
  c''4. bes'8 g'4 f' |
  g'8-.(\ffff a'-. bes'-. c''-.) bes'4-^ bes'4-^ |
  bes'1\fermata \bar "|."
}

% =======================================================================
% 4. ALTO SAXOPHONE (Soulful, Rich Swing Ballad Tone)
% =======================================================================
altoSaxPart = \fixed c' {
  \global
  \clef treble
  % Resting during Solos 1-3 (mm. 1-12)
  R1*12 |

  % 4. Alto Sax Solo (mm. 13-16)
  f'4(\mf g'8. aes'16 bes'4 c''8 bes' |
  aes'8 f' ees' c' ees'4-^ r) |
  f'8-.(\f f'-.) r8 aes'16( bes' c''8-. ees''-. c''4) |
  bes'8( aes' f' ees' f'2\fermata) |

  % Resting during Solos 5-14 (mm. 17-56 = 40 measures)
  R1*40 |

  % 15. Grand Tutti Finale (mm. 57-60)
  d''4.\fff c''8 bes'4 f' |
  g'4. f'8 ees'4 d' |
  ees'8-.(\ffff f'-. g'-. a'-.) f'4-^ f'4-^ |
  f'1\fermata \bar "|."
}

% =======================================================================
% 5. B♭ TRUMPET (Heroic, Crisp Fanfare & Nobility)
% =======================================================================
trumpetPart = \fixed c' {
  \global
  \clef treble
  % Resting during Solos 1-4 (mm. 1-16)
  R1*16 |

  % 5. Trumpet Solo (mm. 17-20)
  bes4.\f d'8 f'4 bes' |
  d''4. c''8 bes'4 r |
  f''8-.(\ff f''-.) d''-. bes'-. c''4. d''8 |
  bes'1\fermata |

  % Resting during Solos 6-14 (mm. 21-56 = 36 measures)
  R1*36 |

  % 15. Grand Tutti Finale (mm. 57-60)
  bes'4.\fff d''8 f''4 bes'' |
  bes''4. a''8 g''4 f'' |
  ees''8-.(\ffff f''-. g''-. a''-.) bes''4-^ bes''4-^ |
  bes''1\fermata \bar "|."
}

% =======================================================================
% 6. FRENCH HORN (Warm, Noble Woodland Horn Call)
% =======================================================================
hornPart = \fixed c' {
  \global
  \clef treble
  % Resting during Solos 1-5 (mm. 1-20)
  R1*20 |

  % 6. French Horn Solo (mm. 21-24)
  bes8(\mf d' f' bes' d''4. c''8 |
  bes'4. f'8 d'2) |
  ees'4(\f f'8 g' bes'4. a'8 |
  f'1\fermata) |

  % Resting during Solos 7-14 (mm. 25-56 = 32 measures)
  R1*32 |

  % 15. Grand Tutti Finale (mm. 57-60)
  f'4.\fff g'8 f'4 d' |
  ees'4. d'8 c'4 bes |
  c'8-.(\ffff d'-. ees'-. f'-.) d'4-^ d'4-^ |
  d'1\fermata \bar "|."
}

% =======================================================================
% 7. TENOR TROMBONE (Majestic, Bold Cantabile & Slide Power)
% =======================================================================
trombonePart = \fixed c' {
  \global
  \clef bass
  % Resting during Solos 1-6 (mm. 1-24)
  R1*24 |

  % 7. Trombone Solo (mm. 25-28)
  bes,4.\f d8 f4 bes |
  d'4. c'8 bes4 r8 f |
  g8-.(\ff aes-. g-. f-.) ees4. d8 |
  bes,1\fermata |

  % Resting during Solos 8-14 (mm. 29-56 = 28 measures)
  R1*28 |

  % 15. Grand Tutti Finale (mm. 57-60)
  d'4.\fff c'8 bes4 f |
  g4. f8 ees4 d |
  ees8-.(\ffff f-. g-. a-.) bes4-^ bes4-^ |
  bes1\fermata \bar "|."
}

% =======================================================================
% 8. TUBA (Deep, Bouncy Foundational Punch & Pedal Warmth)
% =======================================================================
tubaPart = \fixed c' {
  \global
  \clef bass
  % Resting during Solos 1-7 (mm. 1-28)
  R1*28 |

  % 8. Tuba Solo (mm. 29-32)
  bes,,4-.\f r8 f, bes,4-. r8 f, |
  bes,,4-. d,8-. f,-. bes,4-^ r |
  ees,4-. r8 bes,, ees,4-. r8 f, |
  bes,,1\fermata |

  % Resting during Solos 9-14 (mm. 33-56 = 24 measures)
  R1*24 |

  % 15. Grand Tutti Finale (mm. 57-60)
  bes,,4.\fff d,8 f,4 bes, |
  ees,4. d,8 c,4 f,, |
  bes,,8-.(\ffff c,-. d,-. ees,-.) f,4-^ f,,4-^ |
  bes,,1\fermata \bar "|."
}

% =======================================================================
% 9. ELECTRIC BASS (Tight Syncopated Walking Funk Groove)
% =======================================================================
electricBassPart = \fixed c' {
  \global
  \clef bass
  % Resting during Solos 1-8 (mm. 1-32)
  R1*32 |

  % 9. Electric Bass Solo (mm. 33-36)
  bes,,8-.\f r bes,,16( c, d,8) f,8-. g,16( aes,) f,8-. r |
  bes,,8-. r bes,4-^ r8 f,8-. bes,,4 |
  ees,8-. ees,16( f, g,8) bes,8 c8-. d16( c) bes,8-. f, |
  bes,,1\fermata |

  % Resting during Solos 10-14 (mm. 37-56 = 20 measures)
  R1*20 |

  % 15. Grand Tutti Finale (mm. 57-60)
  bes,,4.\fff d,8 f,4 bes, |
  ees,4. d,8 c,4 f,, |
  bes,,8-.(\ffff c,-. d,-. ees,-.) f,4-^ f,,4-^ |
  bes,,1\fermata \bar "|."
}

% =======================================================================
% 10. CELLO (Singing, Rich Tenor/Bass Romantic Warmth)
% =======================================================================
celloPart = \fixed c' {
  \global
  \clef bass
  % Resting during Solos 1-9 (mm. 1-36)
  R1*36 |

  % 10. Cello Solo (mm. 37-40)
  d4(\mf ees8. f16 g4 f8 ees |
  d4. bes,8 f,2) |
  g,8(\p a, bes, c d4. ees8 |
  d8 c bes, a, bes,2\fermata) |

  % Resting during Solos 11-14 (mm. 41-56 = 16 measures)
  R1*16 |

  % 15. Grand Tutti Finale (mm. 57-60)
  bes4.\fff f8 d4 bes, |
  ees4. d8 c4 f, |
  g,8-.(\ffff a,-. bes,-. c-.) d4-^ d4-^ |
  bes,1\fermata \bar "|."
}

% =======================================================================
% 11. GLOCKENSPIEL (Crystalline High Shimmering Bells)
% =======================================================================
glockPart = \fixed c' {
  \global
  \clef treble
  % Resting during Solos 1-10 (mm. 1-40)
  R1*40 |

  % 11. Glockenspiel Solo (mm. 41-44)
  bes''8\f d''' f''' bes''' d''''4. c''''8 |
  bes'''8 a''' g''' f''' g'''4 f''' |
  ees'''8 f''' g''' a''' bes'''4-^ d''''-^ |
  bes'''1\fermata |

  % Resting during Solos 12-14 (mm. 45-56 = 12 measures)
  R1*12 |

  % 15. Grand Tutti Finale (mm. 57-60)
  d'''4.\fff c'''8 bes''4 f'' |
  g''4. f''8 d''4 bes' |
  ees'''8-.(\ffff d'''-. c'''-. bes''-.) f'''4-^ f'''4-^ |
  bes'''1\fermata \bar "|."
}

% =======================================================================
% 12. MARIMBA (Warm Rosewood Acoustic Rolled Chords & Flourish)
% =======================================================================
marimbaPart = \fixed c' {
  \global
  \clef treble
  % Resting during Solos 1-11 (mm. 1-44)
  R1*44 |

  % 12. Marimba Solo (mm. 45-48)
  <bes d' f' bes'>1\f:32 |
  <ees' g' bes' ees''>2:32 <f' a' c'' f''>2:32 |
  bes'16(\mf d'' f'' bes'' d''' bes'' f'' d'' bes'8-.) d''-. f''-. bes''-. |
  <bes d' f' bes'>1\fermata |

  % Resting during Solos 13-14 (mm. 49-56 = 8 measures)
  R1*8 |

  % 15. Grand Tutti Finale (mm. 57-60)
  <bes d' f' bes'>4.\fff <c' ees' g' c''>8 <d' f' bes' d''>4 <f' a' c'' f''> |
  <g' bes' d'' g''>4. <f' a' c'' f''>8 <ees' g' bes' ees''>4 <d' f' bes' d''> |
  <ees' g' bes' ees''>8-.(\ffff <f' a' c'' f''>-. <g' bes' d'' g''>-. <a' c'' f'' a''>-.) <bes' d'' f'' bes''>4-^ <bes' d'' f'' bes''>4-^ |
  <bes d' f' bes'>1\fermata \bar "|."
}

% =======================================================================
% 13. TIMPANI (Dramatic Orchestral Roll & Melodic Punch)
% =======================================================================
timpaniPart = \fixed c' {
  \global
  \clef bass
  % Resting during Solos 1-12 (mm. 1-48)
  R1*48 |

  % 13. Timpani Solo (mm. 49-52)
  bes,1\p:32\< ~ |
  bes,2\ff:32 bes,4-^ r |
  f,4-^\f r bes,4-^ r |
  f,8-.\ff f,-. bes,4-^ r2\fermata |

  % Resting during Solo 14 (mm. 53-56 = 4 measures)
  R1*4 |

  % 15. Grand Tutti Finale (mm. 57-60)
  bes,4.\fff r8 f,4 bes, |
  ees4. d8 c4 f, |
  bes,8-.(\ffff bes,-. f,-. f,-.) bes,4-^ bes,4-^ |
  bes,1\fermata \bar "|."
}

% =======================================================================
% 14. CONCERT PERCUSSION / DRUM KIT (Snare Roll, BD & Crash Cymbal)
% =======================================================================
percussionPart = \drummode {
  \global
  % Resting during Solos 1-13 (mm. 1-52)
  R1*52 |

  % 14. Concert Battery Solo (mm. 53-56)
  sn1\p:32\< ~ |
  sn2\ff:32 sn8^"R" sn16^"L" sn^"R" sn8-^ r |
  bd4\f r8 sn cymc4-^ r8 sn |
  sn8\ff sn16 sn sn8 sn bd4-^ r\fermata |

  % 15. Grand Tutti Finale (mm. 57-60)
  bd4.\fff sn8 bd4 sn |
  bd4 sn8 sn bd4 sn |
  sn8-.(\ffff sn-. sn-. sn-.) cymc4-^ cymc4-^ |
  cymc1\fermata \bar "|."
}

% =======================================================================
% SCORE ASSEMBLY (Conductor Engraved View & MIDI Synthesizer Export)
% =======================================================================
\score {
  <<
    \new StaffGroup = "Woodwinds" <<
      \new Staff \with {
        instrumentName = "Flute"
        shortInstrumentName = "Fl."
        midiInstrument = #"flute"
      } { \flutePart }

      \new Staff \with {
        instrumentName = "Oboe"
        shortInstrumentName = "Ob."
        midiInstrument = #"oboe"
      } { \oboePart }

      \new Staff \with {
        instrumentName = "B♭ Clarinet"
        shortInstrumentName = "Cl."
        midiInstrument = #"clarinet"
      } { \clarinetPart }

      \new Staff \with {
        instrumentName = "Alto Sax"
        shortInstrumentName = "A.Sax"
        midiInstrument = #"alto sax"
      } { \altoSaxPart }
    >>

    \new StaffGroup = "Brass" <<
      \new Staff \with {
        instrumentName = "B♭ Trumpet"
        shortInstrumentName = "Tpt."
        midiInstrument = #"trumpet"
      } { \trumpetPart }

      \new Staff \with {
        instrumentName = "Horn in F"
        shortInstrumentName = "Hn."
        midiInstrument = #"french horn"
      } { \hornPart }

      \new Staff \with {
        instrumentName = "Trombone"
        shortInstrumentName = "Tbn."
        midiInstrument = #"trombone"
      } { \trombonePart }

      \new Staff \with {
        instrumentName = "Tuba"
        shortInstrumentName = "Tub."
        midiInstrument = #"tuba"
      } { \tubaPart }
    >>

    \new StaffGroup = "StringsBass" <<
      \new Staff \with {
        instrumentName = "Electric Bass"
        shortInstrumentName = "E.Bass"
        midiInstrument = #"electric bass (finger)"
      } { \electricBassPart }

      \new Staff \with {
        instrumentName = "Cello"
        shortInstrumentName = "Vc."
        midiInstrument = #"cello"
      } { \celloPart }
    >>

    \new StaffGroup = "PitchedPercussion" <<
      \new Staff \with {
        instrumentName = "Glockenspiel"
        shortInstrumentName = "Glock."
        midiInstrument = #"glockenspiel"
      } { \glockPart }

      \new Staff \with {
        instrumentName = "Marimba"
        shortInstrumentName = "Mar."
        midiInstrument = #"marimba"
      } { \marimbaPart }

      \new Staff \with {
        instrumentName = "Timpani"
        shortInstrumentName = "Timp."
        midiInstrument = #"timpani"
      } { \timpaniPart }
    >>

    \new DrumStaff \with {
      instrumentName = "Percussion"
      shortInstrumentName = "Perc."
      midiInstrument = #"standard kit"
    } { \percussionPart }
  >>

  \layout {
    \context {
      \Staff
      \consists "Measure_counter_engraver"
    }
  }

  \midi { }
}
