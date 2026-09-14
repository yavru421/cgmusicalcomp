\version "2.24.0"
\include "articulate.ly"

\header {
  title = "Concert Band Instrument Showcase & Benchmark Suite (v2)"
  subtitle = "14-Voice Solo Demonstrations Highlighting Idiomatic Sweet Spots & Grand Tutti Climax"
  composer = "John Daniel Dondlinger"
  arranger = "Arranged for Wisconsin Rapids City Band (Grade 3/4)"
  tagline = "Wisconsin Rapids City Band — Complete 14-Voice Instrument Benchmark Suite v2 (2026)"
}

#(set-global-staff-size 12)

\paper {
  #(set-paper-size "letter")
  top-margin = 0.4\in
  bottom-margin = 0.4\in
  left-margin = 0.5\in
  right-margin = 0.4\in
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  system-system-spacing.basic-distance = #10
  score-system-spacing.basic-distance = #10
}

global = {
  \key bes \major
  \time 4/4
  \tempo "Con Brio — Maestoso" 4 = 100
}

% =======================================================================
% 1. FLUTE (Soaring, Agile, Pastoral Register: Eb4 - F6)
% =======================================================================
flutePart = \fixed c' {
  \global
  \clef treble
  % 1. Flute Solo (mm. 1-4)
  d'4(\p^\markup { \bold "1. Flute Solo" } f'8 bes' d''4. c''8 |
  bes'8 a' g' f' g'4 f'8 d') |
  ees'16(\mf f' g' a' bes' c'' d'' ees'' f''8-. d''-.) bes'4 |
  c''8-.(\f d''-. c''-. bes'-.) f'2\fermata |

  % Resting during Solos 2-14 (mm. 5-56 = 52 measures)
  R1*52 |

  % 15. Grand Tutti Finale (mm. 57-64 = 8 measures)
  d''4.\fff^\markup { \bold "Grand Tutti Climax" } c''8 bes'4 f' |
  g'4. f'8 d'4 bes |
  c'4.\fff d'8 ees'4 f' |
  g'2 f' |
  bes'4.\fff c''8 d''4 c'' |
  bes'4. f'8 g'4 f' |
  ees''8-.(\ffff d''-. c''-. bes'-.) f''4-^ f''4-^ |
  f''1\fermata \bar "|."
}

% =======================================================================
% 2. OBOE (Plaintive, Singing Pastoral Cantabile: D4 - Eb5)
% =======================================================================
oboePart = \fixed c' {
  \global
  \clef treble
  % Resting during Solo 1 (mm. 1-4)
  R1*4 |

  % 2. Oboe Solo (mm. 5-8)
  bes4(\mf^\markup { \bold "2. Oboe Solo" } c'8. d'16 ees'4 d'8 c' |
  bes4. g8 f2) |
  g8(\p a bes c' d'4. ees'8 |
  d'8 c' bes a bes2\fermata) |

  % Resting during Solos 3-14 (mm. 9-56 = 48 measures)
  R1*48 |

  % 15. Grand Tutti Finale (mm. 57-64)
  bes4.\fff c'8 d'4 d' |
  ees'4. d'8 bes4 g |
  g4.\fff a8 bes4 c' |
  ees'2 d' |
  bes4.\fff c'8 d'4 c' |
  bes4. g8 f4 d |
  g8-.(\ffff a-. bes-. c'-.) d'4-^ d'4-^ |
  d'1\fermata \bar "|."
}

% =======================================================================
% 3. B♭ CLARINET (Chalumeau Depth to Clarion Brilliance: D3 - G5)
% =======================================================================
clarinetPart = \fixed c' {
  \global
  \clef treble
  % Resting during Solos 1-2 (mm. 1-8)
  R1*8 |

  % 3. Clarinet Solo (mm. 9-12)
  d,8(\p^\markup { \bold "3. B♭ Clarinet Solo" } f, g, bes, d4 c8 bes, |
  g,2.) r8 f(\mf |
  bes8 c' d' ees' f'4 g'8 f' |
  ees'8 d' c' bes d'2\fermata) |

  % Resting during Solos 4-14 (mm. 13-56 = 44 measures)
  R1*44 |

  % 15. Grand Tutti Finale (mm. 57-64)
  f'4.\fff ees'8 d'4 bes |
  c'4. bes8 g4 f |
  ees4.\fff f8 g4 a |
  bes2 bes |
  f'4.\fff g'8 f'4 d' |
  ees'4. d'8 c'4 bes |
  g8-.(\ffff a-. bes-. c'-.) bes4-^ bes4-^ |
  bes1\fermata \bar "|."
}

% =======================================================================
% 4. BASSOON (Jaunty Staccato Leaps & Noble Singing Tenor: Bb1 - F4)
% =======================================================================
bassoonPart = \fixed c' {
  \global
  \clef bass
  % Resting during Solos 1-3 (mm. 1-12)
  R1*12 |

  % 4. Bassoon Solo (mm. 13-16)
  bes,,8-.\mf^\markup { \bold "4. Bassoon Solo" } r bes,,16( c, d,8) f,8-. g,16( a,) bes,8-. r |
  bes,,4-^ f,4-^ bes,8-.( a,-. g,-. f,-.) |
  d4(\p ees8. d16 c4 d8 c |
  bes,8 c d ees f2\fermata) |

  % Resting during Solos 5-14 (mm. 17-56 = 40 measures)
  R1*40 |

  % 15. Grand Tutti Finale (mm. 57-64)
  bes,,4.\fff d,8 f,4 bes, |
  ees,4. d,8 c,4 f,, |
  c,4.\fff d,8 ees,4 f, |
  ees,2 d, |
  bes,,4.\fff d,8 f,4 bes, |
  ees,4. d,8 c,4 f,, |
  bes,,8-.(\ffff c,-. d,-. ees,-.) f,4-^ f,,4-^ |
  bes,,1\fermata \bar "|."
}

% =======================================================================
% 5. ALTO SAXOPHONE (Rich, Soulful Singing Ballad Tone: C4 - F5)
% =======================================================================
altoSaxPart = \fixed c' {
  \global
  \clef treble
  % Resting during Solos 1-4 (mm. 1-16)
  R1*16 |

  % 5. Alto Sax Solo (mm. 17-20)
  f4(\mf^\markup { \bold "5. Alto Saxophone Solo" } g8. aes16 bes4 c'8 bes |
  aes8 f ees c ees4-^ r) |
  f8-.(\f f-.) r8 aes16( bes c'8-. ees'-. c'4) |
  bes8( aes f ees f2\fermata) |

  % Resting during Solos 6-14 (mm. 21-56 = 36 measures)
  R1*36 |

  % 15. Grand Tutti Finale (mm. 57-64)
  d'4.\fff c'8 bes4 f |
  g4. f8 ees4 d |
  ees4.\fff f8 g4 a |
  bes2 a |
  d'4.\fff c'8 bes4 f |
  g4. f8 ees4 d |
  ees8-.(\ffff f-. g-. a-.) f4-^ f4-^ |
  f1\fermata \bar "|."
}

% =======================================================================
% 6. TENOR SAXOPHONE (Smoky, Velvety Tenor Counter-Melody: Ab2 - C5)
% =======================================================================
tenorSaxPart = \fixed c' {
  \global
  \clef treble
  % Resting during Solos 1-5 (mm. 1-20)
  R1*20 |

  % 6. Tenor Sax Solo (mm. 21-24)
  bes,4(\mf^\markup { \bold "6. Tenor Saxophone Solo" } d8. ees16 f4 g8 f |
  ees8 c bes, g, bes,4-^ r) |
  d8-.(\f d-.) r8 f16( g bes8-. c'-. bes4) |
  g8( f d c d2\fermata) |

  % Resting during Solos 7-14 (mm. 25-56 = 32 measures)
  R1*32 |

  % 15. Grand Tutti Finale (mm. 57-64)
  bes,4.\fff d8 f4 bes |
  bes4. a8 g4 f |
  g4.\fff f8 ees4 d |
  ees2 f |
  bes,4.\fff d8 f4 bes |
  bes4. a8 g4 f |
  g8-.(\ffff f-. ees-. d-.) d4-^ d4-^ |
  d1\fermata \bar "|."
}

% =======================================================================
% 7. B♭ TRUMPET (Heroic, Crisp Fanfare & Nobility: Bb3 - F5)
% =======================================================================
trumpetPart = \fixed c' {
  \global
  \clef treble
  % Resting during Solos 1-6 (mm. 1-24)
  R1*24 |

  % 7. Trumpet Solo (mm. 25-28)
  bes,4.\f^\markup { \bold "7. B♭ Trumpet Solo" } d8 f4 bes |
  d'4. c'8 bes4 r |
  f'8-.(\ff f'-.) d'-. bes-. c'4. d'8 |
  bes1\fermata |

  % Resting during Solos 8-14 (mm. 29-56 = 28 measures)
  R1*28 |

  % 15. Grand Tutti Finale (mm. 57-64)
  bes4.\fff d'8 f'4 bes |
  d'4. c'8 bes4 f |
  ees4.\fff f8 g4 a |
  bes2 c' |
  d'4.\fff ees'8 f'4 d' |
  ees'4. d'8 c'4 bes |
  ees'8-.(\ffff d'-. c'-. bes-.) f'4-^ f'4-^ |
  bes1\fermata \bar "|."
}

% =======================================================================
% 8. FRENCH HORN (Warm, Noble Woodland Horn Call: Bb3 - F5)
% =======================================================================
hornPart = \fixed c' {
  \global
  \clef treble
  % Resting during Solos 1-7 (mm. 1-28)
  R1*28 |

  % 8. French Horn Solo (mm. 29-32)
  bes,8(\mf^\markup { \bold "8. French Horn Solo" } d f bes d'4. c'8 |
  bes4. f8 d2) |
  ees4(\f f8 g bes4. a8 |
  f1\fermata) |

  % Resting during Solos 9-14 (mm. 33-56 = 24 measures)
  R1*24 |

  % 15. Grand Tutti Finale (mm. 57-64)
  f4.\fff g8 f4 d |
  ees4. d8 c4 bes, |
  c4.\fff d8 ees4 f |
  g2 f |
  f4.\fff g8 f4 d |
  ees4. d8 c4 bes, |
  c8-.(\ffff d-. ees-. f-.) d4-^ d4-^ |
  d1\fermata \bar "|."
}

% =======================================================================
% 9. TENOR TROMBONE (Majestic, Bold Cantabile & Slide Power: Eb2 - G4)
% =======================================================================
trombonePart = \fixed c' {
  \global
  \clef bass
  % Resting during Solos 1-8 (mm. 1-32)
  R1*32 |

  % 9. Trombone Solo (mm. 33-36)
  bes,,4.\f^\markup { \bold "9. Tenor Trombone Solo" } d,8 f,4 bes, |
  d4. c8 bes,4 r8 f, |
  g,8-.(\ff aes,-. g,-. f,-.) ees,4. d,8 |
  bes,,1\fermata |

  % Resting during Solos 10-14 (mm. 37-56 = 20 measures)
  R1*20 |

  % 15. Grand Tutti Finale (mm. 57-64)
  d4.\fff c8 bes,4 f, |
  g,4. f,8 ees,4 d, |
  ees,4.\fff f,8 g,4 a, |
  bes,2 a, |
  d4.\fff c8 bes,4 f, |
  g,4. f,8 ees,4 d, |
  ees,8-.(\ffff f,-. g,-. a,-.) bes,4-^ bes,4-^ |
  bes,1\fermata \bar "|."
}

% =======================================================================
% 10. EUPHONIUM / BARITONE (Velvety Singing Lyricism & Agility: Eb2 - G4)
% =======================================================================
euphoniumPart = \fixed c' {
  \global
  \clef bass
  % Resting during Solos 1-9 (mm. 1-36)
  R1*36 |

  % 10. Euphonium Solo (mm. 37-40)
  d,4(\mf^\markup { \bold "10. Euphonium Solo" } ees,8. f,16 g,4 f,8 ees, |
  d,4. bes,,8 f,,2) |
  bes,,16(\f c, d, ees, f, g, a, bes, c8-.) d-. ees-. f-. |
  d8( c bes, a, bes,2\fermata) |

  % Resting during Solos 11-14 (mm. 41-56 = 16 measures)
  R1*16 |

  % 15. Grand Tutti Finale (mm. 57-64)
  bes,4.\fff c8 d4 d |
  ees4. d8 bes,4 g, |
  c4.\fff d8 ees4 f |
  g2 f |
  bes,4.\fff c8 d4 d |
  ees4. d8 bes,4 g, |
  c8-.(\ffff d-. ees-. f-.) d4-^ d4-^ |
  bes,1\fermata \bar "|."
}

% =======================================================================
% 11. TUBA (Deep, Foundation Resonance & Bouncing Agility: Bb1 - F3)
% =======================================================================
tubaPart = \fixed c' {
  \global
  \clef bass
  % Resting during Solos 1-10 (mm. 1-40)
  R1*40 |

  % 11. Tuba Solo (mm. 41-44)
  bes,,,4-.\f^\markup { \bold "11. Tuba Solo" } r8 f,, bes,,4-. r8 f,, |
  bes,,,4-. d,,8-. f,,-. bes,,4-^ r |
  ees,,4-. r8 bes,,, ees,,4-. r8 f,, |
  bes,,,1\fermata |

  % Resting during Solos 12-14 (mm. 45-56 = 12 measures)
  R1*12 |

  % 15. Grand Tutti Finale (mm. 57-64)
  bes,,,4.\fff d,,8 f,,4 bes,, |
  ees,,4. d,,8 c,,4 f,, |
  c,,4.\fff d,,8 ees,,4 f,, |
  ees,,2 f,, |
  bes,,,4.\fff d,,8 f,,4 bes,, |
  ees,,4. d,,8 c,,4 f,, |
  bes,,,8-.(\ffff c,,-. d,,-. ees,,-.) f,,4-^ f,,4-^ |
  bes,,,1\fermata \bar "|."
}

% =======================================================================
% 12. TIMPANI (Thunderous Crescendo & 4 Fixed Kettles: F2, Bb2, C3, Eb3)
% =======================================================================
timpaniPart = \fixed c' {
  \global
  \clef bass
  % Resting during Solos 1-11 (mm. 1-44)
  R1*44 |

  % 12. Timpani Solo (mm. 45-48)
  bes,,1\p:32\<^\markup { \bold "12. Timpani Solo (F2, B♭2, C3, E♭3)" } ~ |
  bes,,2\ff:32 bes,,4-^ r |
  f,,4-^\f r bes,,4-^ r |
  f,,8-.\ff f,,-. bes,,4-^ r2\fermata |

  % Resting during Solos 13-14 (mm. 49-56 = 8 measures)
  R1*8 |

  % 15. Grand Tutti Finale (mm. 57-64)
  bes,,4.\fff r8 f,,4 bes,, |
  ees,4. r8 c,4 f,, |
  c,4.\fff r8 ees,4 f,, |
  ees,2 f,, |
  bes,,4.\fff r8 f,,4 bes,, |
  ees,4. r8 c,4 f,, |
  bes,,8-.(\ffff bes,,-. f,,-. f,,-.) bes,,4-^ bes,,4-^ |
  bes,,1\fermata \bar "|."
}

% =======================================================================
% 13. TUNED PERCUSSION / MARIMBA & BELLS (Rosewood Warmth: C3 - G5)
% =======================================================================
marimbaPart = \fixed c' {
  \global
  \clef treble
  % Resting during Solos 1-12 (mm. 1-48)
  R1*48 |

  % 13. Tuned Percussion Solo (mm. 49-52)
  <bes, d f bes>1\f:32^\markup { \bold "13. Tuned Percussion Solo (Marimba & Bells)" } |
  <ees g bes ees'>2:32 <f a c' f'>2:32 |
  bes,16(\mf d f bes d' bes f d bes,8-.) d-. f-. bes-. |
  <bes, d f bes>1\fermata |

  % Resting during Solo 14 (mm. 53-56 = 4 measures)
  R1*4 |

  % 15. Grand Tutti Finale (mm. 57-64)
  <bes, d f bes>4.\fff <c ees g c'>8 <d f bes d'>4 <f a c' f'> |
  <g bes d' g'>4. <f a c' f'>8 <ees g bes ees'>4 <d f bes d'> |
  <c ees g c'>4.\fff <d f bes d'>8 <ees g bes ees'>4 <f a c' f'> |
  <g bes d' g'>2 <f a c' f'> |
  <bes, d f bes>4.\fff <c ees g c'>8 <d f bes d'>4 <f a c' f'> |
  <g bes d' g'>4. <f a c' f'>8 <ees g bes ees'>4 <d f bes d'> |
  <ees g bes ees'>8-.(\ffff <f a c' f'>-. <g bes d' g'>-. <a c' f'>-.) <bes d' f'>4-^ <bes d' f'>4-^ |
  <bes, d f bes>1\fermata \bar "|."
}

% =======================================================================
% 14. CONCERT BATTERY PERCUSSION (Snare Roll, Bass Drum & Crash Cymbals)
% =======================================================================
percussionPart = \drummode {
  \global
  % Resting during Solos 1-13 (mm. 1-52)
  R1*52 |

  % 14. Concert Battery Solo (mm. 53-56)
  sn1\p:32\<^\markup { \bold "14. Battery Percussion Solo" } ~ |
  sn2\ff:32 sn8^"R" sn16^"L" sn^"R" sn8-^ r |
  bd4\f r8 sn cymc4-^ r8 sn |
  sn8\ff sn16 sn sn8 sn bd4-^ r\fermata |

  % 15. Grand Tutti Finale (mm. 57-64)
  bd4.\fff sn8 bd4 sn |
  bd4 sn8 sn bd4 sn |
  bd4.\fff sn8 bd4 sn |
  bd4 sn8 sn cymc4 sn |
  bd4.\fff sn8 bd4 sn |
  bd4 sn8 sn bd4 sn |
  sn8-.(\ffff sn-. sn-. sn-.) cymc4-^ cymc4-^ |
  cymc1\fermata \bar "|."
}

% =======================================================================
% SCORE ASSEMBLY (14-Voice Conductor Score & MIDI Synthesizer Export)
% =======================================================================
\score {
  <<
    \new StaffGroup = "Woodwinds" <<
      \new Staff = "Staff_Flute" \with {
        instrumentName = "Flute"
        shortInstrumentName = "Fl."
        midiInstrument = #"flute"
      } { \flutePart }

      \new Staff = "Staff_Oboe" \with {
        instrumentName = "Oboe"
        shortInstrumentName = "Ob."
        midiInstrument = #"oboe"
      } { \oboePart }

      \new Staff = "Staff_Clarinet" \with {
        instrumentName = "B♭ Clarinet"
        shortInstrumentName = "Cl."
        midiInstrument = #"clarinet"
      } { \clarinetPart }

      \new Staff = "Staff_Bassoon" \with {
        instrumentName = "Bassoon"
        shortInstrumentName = "Bsn."
        midiInstrument = #"bassoon"
      } { \bassoonPart }

      \new Staff = "Staff_AltoSax" \with {
        instrumentName = "Alto Sax"
        shortInstrumentName = "A.Sax"
        midiInstrument = #"alto sax"
      } { \altoSaxPart }

      \new Staff = "Staff_TenorSax" \with {
        instrumentName = "Tenor Sax"
        shortInstrumentName = "T.Sax"
        midiInstrument = #"tenor sax"
      } { \tenorSaxPart }
    >>

    \new StaffGroup = "Brass" <<
      \new Staff = "Staff_Trumpet" \with {
        instrumentName = "B♭ Trumpet"
        shortInstrumentName = "Tpt."
        midiInstrument = #"trumpet"
      } { \trumpetPart }

      \new Staff = "Staff_Horn" \with {
        instrumentName = "Horn in F"
        shortInstrumentName = "Hn."
        midiInstrument = #"french horn"
      } { \hornPart }

      \new Staff = "Staff_Trombone" \with {
        instrumentName = "Trombone"
        shortInstrumentName = "Tbn."
        midiInstrument = #"trombone"
      } { \trombonePart }

      \new Staff = "Staff_Euphonium" \with {
        instrumentName = "Euphonium"
        shortInstrumentName = "Euph."
        midiInstrument = #"trombone"
      } { \euphoniumPart }

      \new Staff = "Staff_Tuba" \with {
        instrumentName = "Tuba"
        shortInstrumentName = "Tub."
        midiInstrument = #"tuba"
      } { \tubaPart }
    >>

    \new StaffGroup = "PercussionGroup" <<
      \new Staff = "Staff_Timpani" \with {
        instrumentName = "Timpani"
        shortInstrumentName = "Timp."
        midiInstrument = #"timpani"
      } { \timpaniPart }

      \new Staff = "Staff_Marimba" \with {
        instrumentName = "Tuned Percussion"
        shortInstrumentName = "Tuned"
        midiInstrument = #"marimba"
      } { \marimbaPart }

      \new DrumStaff = "Staff_Battery" \with {
        instrumentName = "Battery Percussion"
        shortInstrumentName = "Perc."
        midiInstrument = #"standard kit"
      } { \percussionPart }
    >>
  >>

  \layout {
    \context {
      \Staff
      \consists "Measure_counter_engraver"
    }
  }

  \midi { }
}
