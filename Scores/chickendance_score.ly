\version "2.24.0"

\header {
  title = "The Chicken Dance"
  subtitle = "Der Ententanz — Polka for Concert Band"
  composer = "Werner Thomas"
  arranger = "John Daniel Dondlinger"
  tagline = "Dedicated to the Wisconsin Rapids City Band by John Daniel Dondlinger"
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
  \time 2/4
}

% =======================================================================
% 1. LEAD FLUTE (Concert Pitch) — Range: Eb4 - F6 (MIDI 63 - 89)
% In \fixed c': c=60, c'=72, c''=84. Range 63-89 = [ees, f'']
% =======================================================================
fluteConcert = \fixed c' {
  \global
  \clef treble
  \tempo "Allegro Polka" 4 = 126
  % Intro (mm. 1-4)
  R2 |
  r8 f'8\f bes'8. d''16 |
  f''4 ees''8. c''16 |
  bes'4 r |

  % --- VERSE 1 (mm. 5-36) ---
  % Section A1 (mm. 5-12) - The 4 Iconic Actions
  bes'16\f bes' bes' bes' bes'8 bes' |
  bes'4 r |
  a'16 a' a' a' a'8 a' |
  a'4 r |
  bes'16 bes' bes' bes' bes'8 bes' |
  bes'4 r |
  bes'8\ff r bes' r |
  bes' r bes' r |

  % Section A2 (mm. 13-20) - Flute rests mm. 13-16 for breathing, re-enters mm. 17-20
  R2 * 4 |
  bes'16\f bes' bes' bes' bes'8 bes' |
  bes'4 r |
  bes'8\ff r bes' r |
  bes' r bes' r |

  % Section B1 (mm. 21-28) - Swung Promenade
  d'8.\f ees'16 f'8 bes' |
  a'8 g' g'4 |
  c'8. d'16 ees'8 a' |
  g'8 f' f'4 |
  bes8. c'16 d'8 g' |
  f'8 ees' ees'4 |
  d'8. ees'16 f'8 ees' |
  d'8 c' bes4 |

  % Section B2 (mm. 29-36) - Flute rests mm. 29-32, re-enters mm. 33-36
  R2 * 4 |
  bes8. c'16 d'8 g' |
  f'8 ees' ees'4 |
  d'8. ees'16 f'8 ees' |
  d'8 c' bes4 |

  % --- VERSE 2 (mm. 37-68) - Più Mosso ---
  \tempo "Più Mosso" 4 = 138
  % Section A1 (mm. 37-44) - Virtuoso Woodwind Chirps
  bes'16\ff bes' bes' bes' bes'8 bes' |
  bes'4 r |
  a'16 a' a' a' a'8 a' |
  a'4 r |
  bes'16 bes' bes' bes' bes'8 bes' |
  bes'4 r |
  bes'8\fff r bes' r |
  bes' r bes' r |

  % Section A2 (mm. 45-52) - Flute rests mm. 45-48, re-enters mm. 49-52
  R2 * 4 |
  bes'16\ff bes' bes' bes' bes'8 bes' |
  bes'4 r |
  bes'8\fff r bes' r |
  bes' r bes' r |

  % Section B1 (mm. 53-60) - Shimmering Promenade
  d'8.\ff ees'16 f'8 bes' |
  a'8 g' g'4 |
  c'8. d'16 ees'8 a' |
  g'8 f' f'4 |
  bes8. c'16 d'8 g' |
  f'8 ees' ees'4 |
  d'8. ees'16 f'8 ees' |
  d'8 c' bes4 |

  % Section B2 (mm. 61-68) - Flute rests mm. 61-64, re-enters mm. 65-68
  R2 * 4 |
  bes8. c'16 d'8 g' |
  f'8 ees' ees'4 |
  d'8. ees'16 f'8 ees' |
  d'8 c' bes4 |

  % --- VERSE 3 & CODA (mm. 69-102) - Prestissimo Accelerando ---
  \tempo "Prestissimo" 4 = 158
  % Section A1 (mm. 69-76)
  bes'16\fff bes' bes' bes' bes'8 bes' |
  bes'4 r |
  a'16 a' a' a' a'8 a' |
  a'4 r |
  bes'16 bes' bes' bes' bes'8 bes' |
  bes'4 r |
  bes'8\fff r bes' r |
  bes' r bes' r |

  % Section A2 (mm. 77-84) - Flute rests mm. 77-80, re-enters mm. 81-84
  R2 * 4 |
  bes'16\fff bes' bes' bes' bes'8 bes' |
  bes'4 r |
  bes'8\fff r bes' r |
  bes' r bes' r |

  % Flute rests mm. 85-88
  R2 * 4 |

  % Promenade reprise (mm. 89-92)
  bes8.\fff c'16 d'8 g' |
  f'8 ees' ees'4 |
  d'8. ees'16 f'8 ees' |
  d'8 c' bes4 |

  % Grand Coda & Stinger (mm. 93-102)
  R2 * 2 |
  % Chromatic climb to high F6 (f'' = 89)
  c'16\fff cis' d' dis' e' f' fis' g' |
  gis'16 a' bes' b' c'' d'' ees'' f'' |
  f''8.\fff f''16 f''8 f'' |
  f''4 r |
  bes'8. bes'16 bes'8 bes' |
  f''8. f''16 f''8 f'' |
  bes'4\fff r |
  bes'8\fff r r4 \bar "|."
}

% =======================================================================
% 2. OBOE (Concert Pitch) — Range: D4 - Eb5 (MIDI 62 - 75)
% In \fixed c': c=60, Range 62-75 = [d, ees']
% =======================================================================
oboeConcert = \fixed c' {
  \global
  \clef treble
  \tempo "Allegro Polka" 4 = 126
  % Intro (mm. 1-4)
  R2 * 4 |

  % --- VERSE 1 (mm. 5-36) ---
  % Section A1: Oboe rests mm. 5-10, joins mm. 11-12 on claps
  R2 * 6 |
  bes8\ff r bes r |
  bes r bes r |

  % Section A2 (mm. 13-20): Oboe takes lyrical lead (within D4-Eb5)
  bes16\f bes bes bes bes8 bes |
  bes4 r |
  a16 a a a a8 a |
  a4 r |
  bes16 bes bes bes bes8 bes |
  bes4 r |
  bes8\ff r bes r |
  bes r bes r |

  % Oboe rests mm. 21-24
  R2 * 4 |

  % Section B1/B2 (mm. 25-30) - Lyrical Harmony Pad
  f4\f d' |
  ees'8 d' d'4 |
  ees'4 c' |
  d'8 c' c'4 |
  d'4 bes |
  c'8 bes bes4 |

  % Oboe rests mm. 31-34
  R2 * 4 |
  f8. g16 a8 f |
  bes4 r |

  % --- VERSE 2 (mm. 37-68) - Più Mosso ---
  \tempo "Più Mosso" 4 = 138
  % Oboe rests mm. 37-40
  R2 * 4 |

  % Enters mm. 41-44
  bes16\ff bes bes bes bes8 bes |
  bes4 r |
  bes8\fff r bes r |
  bes r bes r |

  % Oboe takes A2 lead mm. 45-52
  bes16\ff bes bes bes bes8 bes |
  bes4 r |
  a16 a a a a8 a |
  a4 r |
  bes16 bes bes bes bes8 bes |
  bes4 r |
  bes8\fff r bes r |
  bes r bes r |

  % Oboe rests mm. 53-56
  R2 * 4 |

  % Plays mm. 57-62
  f4\ff d' |
  ees'8 d' d'4 |
  ees'4 c' |
  d'8 c' c'4 |
  d'4 bes |
  c'8 bes bes4 |

  % Oboe rests mm. 63-66
  R2 * 4 |
  f8. g16 a8 f |
  bes4 r |

  % --- VERSE 3 & CODA (mm. 69-102) - Prestissimo ---
  \tempo "Prestissimo" 4 = 158
  % Oboe rests mm. 69-72
  R2 * 4 |

  % Enters mm. 73-76
  bes16\fff bes bes bes bes8 bes |
  bes4 r |
  bes8\fff r bes r |
  bes r bes r |

  % Plays A2 mm. 77-84
  bes16\fff bes bes bes bes8 bes |
  bes4 r |
  a16 a a a a8 a |
  a4 r |
  bes16 bes bes bes bes8 bes |
  bes4 r |
  bes8\fff r bes r |
  bes r bes r |

  % Oboe rests mm. 85-88
  R2 * 4 |

  % Promenade reprise mm. 89-92
  f4\fff d' |
  ees'8 d' d'4 |
  f8. g16 a8 f |
  bes4 r |

  % Coda mm. 93-102
  R2 * 4 |
  d'8.\fff d'16 d'8 d' |
  d'4 r |
  bes8. bes16 bes8 bes |
  d'8. d'16 d'8 d' |
  bes4\fff r |
  bes8\fff r r4 \bar "|."
}

% =======================================================================
% 3. BB CLARINET (Concert Pitch) — Range: D3 - G5 (MIDI 50 - 79)
% In \fixed c': c=60, Range 50-79 = [d,, g']
% =======================================================================
clarinetConcert = \fixed c' {
  \global
  \clef treble
  \tempo "Allegro Polka" 4 = 126
  % Intro (mm. 1-4)
  R2 |
  r8 f8\f bes8. d'16 |
  f'4 ees'8. c'16 |
  bes4 r |

  % --- VERSE 1 (mm. 5-36) ---
  % Section A1 (mm. 5-12) - Rich reed doubling on authentic theme
  bes16\f bes bes bes bes8 bes |
  bes4 r |
  a16 a a a a8 a |
  a4 r |
  bes16 bes bes bes bes8 bes |
  bes4 r |
  bes8\ff r bes r |
  bes r bes r |

  % Section A2 (mm. 13-20) - Clarinet rests mm. 13-16 for breathing
  R2 * 4 |
  bes16\f bes bes bes bes8 bes |
  bes4 r |
  bes8\ff r bes r |
  bes r bes r |

  % Section B1 (mm. 21-28) - Swung Promenade
  d8.\f ees16 f8 bes |
  a8 g g4 |
  c8. d16 ees8 a |
  g8 f f4 |
  bes,8. c16 d8 g |
  f8 ees ees4 |
  d8. ees16 f8 ees |
  d8 c bes,4 |

  % Clarinet rests mm. 29-32
  R2 * 4 |

  % Reprise mm. 33-36
  bes,8. c16 d8 g |
  f8 ees ees4 |
  d8. ees16 f8 ees |
  d8 c bes,4 |

  % --- VERSE 2 (mm. 37-68) - Più Mosso ---
  \tempo "Più Mosso" 4 = 138
  % Section A1 (mm. 37-44)
  bes16\ff bes bes bes bes8 bes |
  bes4 r |
  a16 a a a a8 a |
  a4 r |
  bes16 bes bes bes bes8 bes |
  bes4 r |
  bes8\fff r bes r |
  bes r bes r |

  % Section A2 (mm. 45-52)
  bes16\ff bes bes bes bes8 bes |
  bes4 r |
  a16 a a a a8 a |
  a4 r |
  bes16 bes bes bes bes8 bes |
  bes4 r |
  bes8\fff r bes r |
  bes r bes r |

  % Section B1 (mm. 53-60)
  d8.\ff ees16 f8 bes |
  a8 g g4 |
  c8. d16 ees8 a |
  g8 f f4 |
  bes,8. c16 d8 g |
  f8 ees ees4 |
  d8. ees16 f8 ees |
  d8 c bes,4 |

  % Clarinet rests mm. 61-64
  R2 * 4 |

  % Reprise mm. 65-68
  bes,8. c16 d8 g |
  f8 ees ees4 |
  d8. ees16 f8 ees |
  d8 c bes,4 |

  % --- VERSE 3 & CODA (mm. 69-102) - Prestissimo ---
  \tempo "Prestissimo" 4 = 158
  % Section A1 (mm. 69-76)
  bes16\fff bes bes bes bes8 bes |
  bes4 r |
  a16 a a a a8 a |
  a4 r |
  bes16 bes bes bes bes8 bes |
  bes4 r |
  bes8\fff r bes r |
  bes r bes r |

  % Clarinet rests mm. 77-80
  R2 * 4 |

  % Enters mm. 81-84
  bes16\fff bes bes bes bes8 bes |
  bes4 r |
  bes8\fff r bes r |
  bes r bes r |

  % Clarinet rests mm. 85-88
  R2 * 4 |

  % Promenade reprise mm. 89-92
  bes,8.\fff c16 d8 g |
  f8 ees ees4 |
  d8. ees16 f8 ees |
  d8 c bes,4 |

  % Coda mm. 93-102
  R2 * 2 |
  c16\fff cis d dis e f fis g |
  gis16 a bes b c' d' ees' f' |
  d'8.\fff d'16 d'8 d' |
  d'4 r |
  bes8. bes16 bes8 bes |
  d'8. d'16 d'8 d' |
  bes4\fff r |
  bes8\fff r r4 \bar "|."
}

% =======================================================================
% 4. ALTO SAXOPHONE (Concert Pitch) — Range: C4 - F5 (MIDI 60 - 77)
% In \fixed c': c=60, Range 60-77 = [c, f']
% =======================================================================
altoSaxConcert = \fixed c' {
  \global
  \clef treble
  \tempo "Allegro Polka" 4 = 126
  % Intro (mm. 1-4)
  R2 * 4 |

  % --- VERSE 1 (mm. 5-36) ---
  % Offbeat Pahs mm. 5-12
  r8 <d f>8\f r <d f> |
  r8 <d f> r <d f> |
  r8 <ees a> r <ees a> |
  r8 <ees a> r <ees a> |
  r8 <d f> r <d f> |
  r8 <d f> r <d f> |
  bes8\ff r bes r |
  bes r bes r |

  % Alto Sax rests mm. 13-16 for breathing
  R2 * 4 |

  % Enters mm. 17-24
  r8 <d f>8\f r <d f> |
  r8 <d f> r <d f> |
  bes8\ff r bes r |
  bes r bes r |
  r8 <d f> r <d f> |
  r8 <ees g> r <ees g> |
  r8 <ees a> r <ees a> |
  r8 <d f> r <d f> |

  % Rests mm. 25-28
  R2 * 4 |

  % Enters mm. 29-36
  r8 <d f>8\f r <d f> |
  r8 <ees g> r <ees g> |
  r8 <ees a> r <ees a> |
  r8 <d f> r <d f> |
  r8 <ees g> r <ees g> |
  r8 <ees g> r <ees g> |
  r8 <ees a> r <ees a> |
  bes4 r |

  % --- VERSE 2 (mm. 37-68) - Più Mosso ---
  \tempo "Più Mosso" 4 = 138
  % Offbeats mm. 37-44
  r8 <d f>8\ff r <d f> |
  r8 <d f> r <d f> |
  r8 <ees a> r <ees a> |
  r8 <ees a> r <ees a> |
  r8 <d f> r <d f> |
  r8 <d f> r <d f> |
  bes8\fff r bes r |
  bes r bes r |

  % Alto Sax rests mm. 45-48
  R2 * 4 |

  % Enters mm. 49-56
  r8 <d f>8\ff r <d f> |
  r8 <d f> r <d f> |
  bes8\fff r bes r |
  bes r bes r |
  r8 <d f> r <d f> |
  r8 <ees g> r <ees g> |
  r8 <ees a> r <ees a> |
  r8 <d f> r <d f> |

  % Rests mm. 57-60
  R2 * 4 |

  % Enters mm. 61-68
  r8 <d f>8\ff r <d f> |
  r8 <ees g> r <ees g> |
  r8 <ees a> r <ees a> |
  r8 <d f> r <d f> |
  r8 <ees g> r <ees g> |
  r8 <ees g> r <ees g> |
  r8 <ees a> r <ees a> |
  bes4 r |

  % --- VERSE 3 & CODA (mm. 69-102) - Prestissimo ---
  \tempo "Prestissimo" 4 = 158
  % Offbeats mm. 69-76
  r8 <d f>8\fff r <d f> |
  r8 <d f> r <d f> |
  r8 <ees a> r <ees a> |
  r8 <ees a> r <ees a> |
  r8 <d f> r <d f> |
  r8 <d f> r <d f> |
  bes8\fff r bes r |
  bes r bes r |

  % Alto Sax rests mm. 77-80
  R2 * 4 |

  % Enters mm. 81-88
  r8 <d f>8\fff r <d f> |
  r8 <d f> r <d f> |
  bes8\fff r bes r |
  bes r bes r |
  r8 <d f> r <d f> |
  r8 <ees g> r <ees g> |
  r8 <ees a> r <ees a> |
  r8 <d f> r <d f> |

  % Promenade reprise mm. 89-92
  r8 <ees g>8\fff r <ees g> |
  r8 <ees g> r <ees g> |
  r8 <ees a> r <ees a> |
  bes4 r |

  % Coda mm. 93-102
  R2 * 4 |
  d'8.\fff d'16 d'8 d' |
  d'4 r |
  bes8. bes16 bes8 bes |
  d'8. d'16 d'8 d' |
  bes4\fff r |
  bes8\fff r r4 \bar "|."
}

% =======================================================================
% 5. TENOR SAXOPHONE (Concert Pitch) — Range: Ab2 - C5 (MIDI 44 - 72)
% In \fixed c': c=60, Range 44-72 = [aes,, c']
% =======================================================================
tenorSaxConcert = \fixed c' {
  \global
  \clef treble
  \tempo "Allegro Polka" 4 = 126
  % Intro (mm. 1-4)
  R2 * 4 |

  % --- VERSE 1 (mm. 5-36) ---
  % Tenor oom-pah and countermelody mm. 5-12
  f,4\f d |
  f,4 d |
  f,4 ees |
  f,4 ees |
  f,4 d |
  f,4 d |
  bes,8\ff r bes, r |
  bes, r bes, r |

  % Tenor Sax rests mm. 13-16
  R2 * 4 |

  % Enters mm. 17-24
  f,4\f d |
  f,4 d |
  bes,8\ff r bes, r |
  bes, r bes, r |
  bes,8.\f c16 d8 g |
  f8 ees ees4 |
  c8. d16 ees8 a |
  g8 f f4 |

  % Rests mm. 25-28
  R2 * 4 |

  % Enters mm. 29-36
  bes,8.\f c16 d8 g |
  f8 ees ees4 |
  c8. d16 ees8 a |
  g8 f f4 |
  g8. a16 bes8 ees |
  d8 c c4 |
  bes8. c'16 d'8 c' |
  bes,,,4 r |

  % --- VERSE 2 (mm. 37-68) - Più Mosso ---
  \tempo "Più Mosso" 4 = 138
  % Countermelody mm. 37-44
  f,4\ff d |
  f,4 d |
  f,4 ees |
  f,4 ees |
  f,4 d |
  f,4 d |
  bes,8\fff r bes, r |
  bes, r bes, r |

  % Tenor Sax rests mm. 45-48
  R2 * 4 |

  % Enters mm. 49-56
  f,4\ff d |
  f,4 d |
  bes,8\fff r bes, r |
  bes, r bes, r |
  bes,8.\ff c16 d8 g |
  f8 ees ees4 |
  c8. d16 ees8 a |
  g8 f f4 |

  % Rests mm. 57-60
  R2 * 4 |

  % Enters mm. 61-68
  bes,8.\ff c16 d8 g |
  f8 ees ees4 |
  c8. d16 ees8 a |
  g8 f f4 |
  g8. a16 bes8 ees |
  d8 c c4 |
  bes8. c'16 d'8 c' |
  bes,,,4 r |

  % --- VERSE 3 & CODA (mm. 69-102) - Prestissimo ---
  \tempo "Prestissimo" 4 = 158
  % Countermelody mm. 69-76
  f,4\fff d |
  f,4 d |
  f,4 ees |
  f,4 ees |
  f,4 d |
  f,4 d |
  bes,8\fff r bes, r |
  bes, r bes, r |

  % Tenor Sax rests mm. 77-80
  R2 * 4 |

  % Enters mm. 81-88
  f,4\fff d |
  f,4 d |
  bes,8\fff r bes, r |
  bes, r bes, r |
  bes,8.\fff c16 d8 g |
  f8 ees ees4 |
  c8. d16 ees8 a |
  g8 f f4 |

  % Promenade reprise mm. 89-92
  g8.\fff a16 bes8 ees |
  d8 c c4 |
  bes8. c'16 d'8 c' |
  bes,,,4 r |

  % Coda mm. 93-102
  R2 * 4 |
  f8.\fff f16 f8 f |
  f4 r |
  bes,8. bes,16 bes,8 bes, |
  f8. f16 f8 f |
  bes,4\fff r |
  bes,8\fff r r4 \bar "|."
}

% =======================================================================
% 6. BB TRUMPET (Concert Pitch) — Range: Bb3 - F5 (MIDI 58 - 77)
% In \fixed c': c=60, Range 58-77 = [bes,, f']
% =======================================================================
trumpetConcert = \fixed c' {
  \global
  \clef treble
  \tempo "Allegro Polka" 4 = 126
  % Intro (mm. 1-4)
  R2 |
  r8 f8\f bes8. d'16 |
  f'4 ees'8. c'16 |
  bes4 r |

  % --- VERSE 1 (mm. 5-36) ---
  % Section A1 (mm. 5-12) - Lead Trumpet joins immediately!
  bes16\f bes bes bes bes8 bes |
  bes4 r |
  a16 a a a a8 a |
  a4 r |
  bes16 bes bes bes bes8 bes |
  bes4 r |
  bes8\ff r bes r |
  bes r bes r |

  % Trumpet rests mm. 13-20 for lip recovery
  R2 * 8 |

  % Section B1 (mm. 21-28) - Trumpet takes lyrical Promenade
  d8.\f ees16 f8 bes |
  a8 g g4 |
  c8. d16 ees8 a |
  g8 f f4 |
  bes,8. c16 d8 g |
  f8 ees ees4 |
  d8. ees16 f8 ees |
  d8 c bes,4 |

  % Trumpet rests mm. 29-36
  R2 * 8 |

  % --- VERSE 2 (mm. 37-68) - Più Mosso ---
  \tempo "Più Mosso" 4 = 138
  % Section A1 (mm. 37-44)
  bes16\ff bes bes bes bes8 bes |
  bes4 r |
  a16 a a a a8 a |
  a4 r |
  bes16 bes bes bes bes8 bes |
  bes4 r |
  bes8\fff r bes r |
  bes r bes r |

  % Trumpet rests mm. 45-52
  R2 * 8 |

  % Section B1 (mm. 53-60)
  d8.\ff ees16 f8 bes |
  a8 g g4 |
  c8. d16 ees8 a |
  g8 f f4 |
  bes,8. c16 d8 g |
  f8 ees ees4 |
  d8. ees16 f8 ees |
  d8 c bes,4 |

  % Trumpet rests mm. 61-68
  R2 * 8 |

  % --- VERSE 3 & CODA (mm. 69-102) - Prestissimo ---
  \tempo "Prestissimo" 4 = 158
  % Trumpet rests mm. 69-72
  R2 * 4 |

  % Enters mm. 73-76
  bes16\fff bes bes bes bes8 bes |
  bes4 r |
  bes8\fff r bes r |
  bes r bes r |

  % Plays A2 mm. 77-84
  bes16\fff bes bes bes bes8 bes |
  bes4 r |
  a16 a a a a8 a |
  a4 r |
  bes16 bes bes bes bes8 bes |
  bes4 r |
  bes8\fff r bes r |
  bes r bes r |

  % Trumpet rests mm. 85-88
  R2 * 4 |

  % Plays B reprise mm. 89-92
  d8.\fff ees16 f8 bes |
  a8 g g4 |
  d8. ees16 f8 ees |
  d8 c bes,4 |

  % Trumpet rests mm. 93-96
  R2 * 4 |

  % Coda Fanfares & Final Stinger (mm. 97-102)
  d'8.\fff d'16 d'8 d' |
  d'4 r |
  bes8. bes16 bes8 bes |
  d'8. d'16 d'8 d' |
  bes4\fff r |
  bes8\fff r r4 \bar "|."
}

% =======================================================================
% 7. FRENCH HORN IN F (Concert Pitch) — Range: Bb3 - F5 (MIDI 58 - 77)
% In \fixed c': c=60, Range 58-77 = [bes,, f']
% =======================================================================
hornConcert = \fixed c' {
  \global
  \clef treble
  \tempo "Allegro Polka" 4 = 126
  % Intro (mm. 1-4)
  R2 * 4 |

  % --- VERSE 1 (mm. 5-36) ---
  % Offbeat French Horn Pahs mm. 5-12
  r8 <d f>8\f r <d f> |
  r8 <d f> r <d f> |
  r8 <ees a> r <ees a> |
  r8 <ees a> r <ees a> |
  r8 <d f> r <d f> |
  r8 <d f> r <d f> |
  bes8\ff r bes r |
  bes r bes r |

  % Horn rests mm. 13-16
  R2 * 4 |

  % Enters mm. 17-24
  r8 <d f>8\f r <d f> |
  r8 <d f> r <d f> |
  bes8\ff r bes r |
  bes r bes r |
  bes8.\f c'16 d'8 f' |
  f'8 ees' ees'4 |
  a8. bes16 c'8 f' |
  ees'8 d' d'4 |

  % Horn rests mm. 25-28
  R2 * 4 |

  % Enters mm. 29-36
  bes8.\f c'16 d'8 f' |
  f'8 ees' ees'4 |
  a8. bes16 c'8 f' |
  ees'8 d' d'4 |
  g8. a16 bes8 ees' |
  d'8 c' c'4 |
  bes8. c'16 d'8 c' |
  bes8 a f4 |

  % --- VERSE 2 (mm. 37-68) - Più Mosso ---
  \tempo "Più Mosso" 4 = 138
  % Offbeats mm. 37-44
  r8 <d f>8\ff r <d f> |
  r8 <d f> r <d f> |
  r8 <ees a> r <ees a> |
  r8 <ees a> r <ees a> |
  r8 <d f> r <d f> |
  r8 <d f> r <d f> |
  bes8\fff r bes r |
  bes r bes r |

  % Horn rests mm. 45-48
  R2 * 4 |

  % Enters mm. 49-56
  r8 <d f>8\ff r <d f> |
  r8 <d f> r <d f> |
  bes8\fff r bes r |
  bes r bes r |
  bes8.\ff c'16 d'8 f' |
  f'8 ees' ees'4 |
  a8. bes16 c'8 f' |
  ees'8 d' d'4 |

  % Horn rests mm. 57-60
  R2 * 4 |

  % Enters mm. 61-68
  bes8.\ff c'16 d'8 f' |
  f'8 ees' ees'4 |
  a8. bes16 c'8 f' |
  ees'8 d' d'4 |
  g8. a16 bes8 ees' |
  d'8 c' c'4 |
  bes8. c'16 d'8 c' |
  bes8 a f4 |

  % --- VERSE 3 & CODA (mm. 69-102) - Prestissimo ---
  \tempo "Prestissimo" 4 = 158
  % Offbeats mm. 69-76
  r8 <d f>8\fff r <d f> |
  r8 <d f> r <d f> |
  r8 <ees a> r <ees a> |
  r8 <ees a> r <ees a> |
  r8 <d f> r <d f> |
  r8 <d f> r <d f> |
  bes8\fff r bes r |
  bes r bes r |

  % Horn rests mm. 77-80
  R2 * 4 |

  % Enters mm. 81-88
  r8 <d f>8\fff r <d f> |
  r8 <d f> r <d f> |
  bes8\fff r bes r |
  bes r bes r |
  bes8.\fff c'16 d'8 f' |
  f'8 ees' ees'4 |
  a8. bes16 c'8 f' |
  ees'8 d' d'4 |

  % Promenade reprise mm. 89-92
  g8.\fff a16 bes8 ees' |
  d'8 c' c'4 |
  bes8. c'16 d'8 c' |
  bes8 a f4 |

  % Coda mm. 93-102
  R2 * 4 |
  d'8.\fff d'16 d'8 d' |
  d'4 r |
  bes8. bes16 bes8 bes |
  d'8. d'16 d'8 d' |
  bes4\fff r |
  bes8\fff r r4 \bar "|."
}

% =======================================================================
% 8. TENOR TROMBONE (Concert Pitch) — Range: Eb2 - G4 (MIDI 39 - 67)
% In \fixed c': c=60, Range 39-67 = [ees,, g]
% =======================================================================
tromboneConcert = \fixed c' {
  \global
  \clef bass
  \tempo "Allegro Polka" 4 = 126
  % Intro (mm. 1-4)
  R2 * 4 |

  % --- VERSE 1 (mm. 5-36) ---
  % Trombone punchy bass support mm. 5-12
  bes,8\f r f, r |
  bes,8 r f, r |
  f,,8 r c, r |
  f,,8 r c, r |
  bes,8 r f, r |
  bes,8 r f, r |
  bes,8\ff r bes, r |
  bes, r bes, r |

  % Plays mm. 13-20
  bes,8\f r f, r |
  bes,8 r f, r |
  f,,8 r c, r |
  f,,8 r c, r |
  bes,8 r f, r |
  bes,8 r f, r |
  bes,8\ff r bes, r |
  bes, r bes, r |

  % Trombone rests mm. 21-24
  R2 * 4 |

  % Enters mm. 25-36
  bes,8\f r f, r |
  ees,,8 r bes,,, r |
  f,,8 r c, r |
  bes,8 r f, r |
  bes,8 r f, r |
  ees,,8 r bes,,, r |
  f,,8 r c, r |
  bes,4 r |

  % --- VERSE 2 (mm. 37-68) - Più Mosso ---
  \tempo "Più Mosso" 4 = 138
  % Bass support mm. 37-44
  bes,,8\ff r f, r |
  bes,8 r f, r |
  f,,8 r c, r |
  f,,8 r c, r |
  bes,8 r f, r |
  bes,8 r f, r |
  bes,8\fff r bes, r |
  bes, r bes, r |

  % Trombone rests mm. 45-48
  R2 * 4 |

  % Enters mm. 49-56
  bes,,8\ff r f, r |
  bes,8 r f, r |
  bes,8\fff r bes, r |
  bes, r bes, r |
  bes,,8\ff r f, r |
  ees,,8 r bes,,, r |
  f,,8 r c, r |
  bes,8 r f, r |

  % Trombone rests mm. 57-60
  R2 * 4 |

  % Enters mm. 61-68
  bes,,8\ff r f, r |
  ees,,8 r bes,,, r |
  f,,8 r c, r |
  bes,8 r f, r |
  bes,8 r f, r |
  ees,,8 r bes,,, r |
  f,,8 r c, r |
  bes,4 r |

  % --- VERSE 3 & CODA (mm. 69-102) - Prestissimo ---
  \tempo "Prestissimo" 4 = 158
  % Bass support mm. 69-76
  bes,,8\fff r f, r |
  bes,8 r f, r |
  f,,8 r c, r |
  f,,8 r c, r |
  bes,8 r f, r |
  bes,8 r f, r |
  bes,8\fff r bes, r |
  bes, r bes, r |

  % Trombone rests mm. 77-80
  R2 * 4 |

  % Enters mm. 81-88
  bes,,8\fff r f, r |
  bes,8 r f, r |
  bes,8\fff r bes, r |
  bes, r bes, r |
  bes,,8\fff r f, r |
  ees,,8 r bes,,, r |
  f,,8 r c, r |
  bes,8 r f, r |

  % Promenade reprise mm. 89-92
  bes,,8\fff r f, r |
  ees,,8 r bes,,, r |
  f,,8 r c, r |
  bes,4 r |

  % Coda mm. 93-102
  R2 * 4 |
  f,8.\fff f,16 f,8 f, |
  f,4 r |
  bes,8. bes,16 bes,8 bes, |
  f,8. f,16 f,8 f, |
  bes,,4\fff r |
  bes,,8\fff r r4 \bar "|."
}

% =======================================================================
% 9. EUPHONIUM (Concert Pitch) — Range: Eb2 - G4 (MIDI 39 - 67)
% In \fixed c': c=60, Range 39-67 = [ees,, g]
% =======================================================================
euphoniumConcert = \fixed c' {
  \global
  \clef bass
  \tempo "Allegro Polka" 4 = 126
  % Intro (mm. 1-4)
  R2 * 4 |

  % --- VERSE 1 (mm. 5-36) ---
  % Euphonium counter-melody & tenor support mm. 5-12
  d,4\f f, |
  d,4 f, |
  ees,4 f, |
  ees,4 f, |
  d,4 f, |
  d,4 f, |
  bes,8\ff r bes, r |
  bes, r bes, r |

  % Euphonium rests mm. 13-16
  R2 * 4 |

  % Enters mm. 17-24
  d,4\f f, |
  d,4 f, |
  bes,8\ff r bes, r |
  bes, r bes, r |
  bes,,8.\f c,16 d,8 g, |
  f,8 ees, ees,4 |
  c,8. d,16 ees,8 a, |
  g,8 f, f,4 |

  % Rests mm. 25-28
  R2 * 4 |

  % Enters mm. 29-36
  bes,,8.\f c,16 d,8 g, |
  f,8 ees, ees,4 |
  c,8. d,16 ees,8 a, |
  g,8 f, f,4 |
  bes,,8. c,16 d,8 g, |
  f,8 ees, ees,4 |
  d,8. ees,16 f,8 ees, |
  d,8 c, bes,,4 |

  % --- VERSE 2 (mm. 37-68) - Più Mosso ---
  \tempo "Più Mosso" 4 = 138
  % Countermelody mm. 37-44
  d,4\ff f, |
  d,4 f, |
  ees,4 f, |
  ees,4 f, |
  d,4 f, |
  d,4 f, |
  bes,8\fff r bes, r |
  bes, r bes, r |

  % Euphonium rests mm. 45-48
  R2 * 4 |

  % Enters mm. 49-56
  d,4\ff f, |
  d,4 f, |
  bes,8\fff r bes, r |
  bes, r bes, r |
  bes,,8.\ff c,16 d,8 g, |
  f,8 ees, ees,4 |
  c,8. d,16 ees,8 a, |
  g,8 f, f,4 |

  % Rests mm. 57-60
  R2 * 4 |

  % Enters mm. 61-68
  bes,,8.\ff c,16 d,8 g, |
  f,8 ees, ees,4 |
  c,8. d,16 ees,8 a, |
  g,8 f, f,4 |
  bes,,8. c,16 d,8 g, |
  f,8 ees, ees,4 |
  d,8. ees,16 f,8 ees, |
  d,8 c, bes,,4 |

  % --- VERSE 3 & CODA (mm. 69-102) - Prestissimo ---
  \tempo "Prestissimo" 4 = 158
  % Euphonium rests mm. 69-72
  R2 * 4 |

  % Enters mm. 73-84
  d,4\fff f, |
  d,4 f, |
  bes,8\fff r bes, r |
  bes, r bes, r |
  d,4 f, |
  d,4 f, |
  ees,4 f, |
  ees,4 f, |
  d,4 f, |
  d,4 f, |
  bes,8\fff r bes, r |
  bes, r bes, r |

  % Euphonium rests mm. 85-88
  R2 * 4 |

  % Enters mm. 89-102
  bes,,8.\fff c,16 d,8 g, |
  f,8 ees, ees,4 |
  d,8. ees,16 f,8 ees, |
  d,8 c, bes,,4 |
  bes,,8 b,, c, cis, |
  d, dis, e, f, |
  f,8.\fff f,16 f,8 f, |
  f,4 r |
  bes,8. bes,16 bes,8 bes, |
  f,8. f,16 f,8 f, |
  bes,,4\fff r |
  bes,,8\fff r r4 \bar "|."
}

% =======================================================================
% 10. TUBA (Concert Pitch) — Range: Bb1 - F3 (MIDI 34 - 53)
% In \fixed c': c=60, Range 34-53 = [bes,,,, f,]
% =======================================================================
tubaConcert = \fixed c' {
  \global
  \clef bass
  \tempo "Allegro Polka" 4 = 126
  % Intro (mm. 1-4)
  R2 |
  bes,,,4\f f,, |
  bes,,,4 f,, |
  bes,,,4 r |

  % --- VERSE 1 (mm. 5-36) ---
  % Section A1 (mm. 5-12) - Classic Bavarian Oom-Pah
  bes,,,8\f r f,, r |
  bes,,,8 r f,, r |
  f,,8 r c, r |
  f,,8 r c, r |
  bes,,,8 r f,, r |
  bes,,,8 r f,, r |
  bes,,,8\ff r bes,,, r |
  bes,,, r bes,,, r |

  % Tuba rests mm. 13-16 (Trombone carries bass)
  R2 * 4 |

  % Enters mm. 17-24
  bes,,,8\f r f,, r |
  bes,,,8 r f,, r |
  bes,,,8\ff r bes,,, r |
  bes,,, r bes,,, r |
  bes,,,8\f r f,, r |
  ees,,8 r bes,,, r |
  f,,8 r c, r |
  bes,,,8 r f,, r |

  % Tuba rests mm. 25-28
  R2 * 4 |

  % Enters mm. 29-36
  bes,,,8\f r f,, r |
  ees,,8 r bes,,, r |
  f,,8 r f,, r |
  bes,,,8 r f,, r |
  bes,,,8 r f,, r |
  ees,,8 r bes,,, r |
  f,,8 r f,, r |
  bes,,,4 r |

  % --- VERSE 2 (mm. 37-68) - Più Mosso ---
  \tempo "Più Mosso" 4 = 138
  % Bass mm. 37-44
  bes,,,8\ff r f,, r |
  bes,,,8 r f,, r |
  f,,8 r c, r |
  f,,8 r c, r |
  bes,,,8 r f,, r |
  bes,,,8 r f,, r |
  bes,,,8\fff r bes,,, r |
  bes,,, r bes,,, r |

  % Tuba rests mm. 45-48
  R2 * 4 |

  % Enters mm. 49-56
  bes,,,8\ff r f,, r |
  bes,,,8 r f,, r |
  bes,,,8\fff r bes,,, r |
  bes,,, r bes,,, r |
  bes,,,8\ff r f,, r |
  ees,,8 r bes,,, r |
  f,,8 r c, r |
  bes,,,8 r f,, r |

  % Tuba rests mm. 57-60
  R2 * 4 |

  % Enters mm. 61-68
  bes,,,8\ff r f,, r |
  ees,,8 r bes,,, r |
  f,,8 r c, r |
  bes,,,8 r f,, r |
  bes,,,8 r f,, r |
  ees,,8 r bes,,, r |
  f,,8 r c, r |
  bes,,,4 r |

  % --- VERSE 3 & CODA (mm. 69-102) - Prestissimo ---
  \tempo "Prestissimo" 4 = 158
  % Bass mm. 69-76
  bes,,,8\fff r f,, r |
  bes,,,8 r f,, r |
  f,,8 r c, r |
  f,,8 r c, r |
  bes,,,8 r f,, r |
  bes,,,8 r f,, r |
  bes,,,8\fff r bes,,, r |
  bes,,, r bes,,, r |

  % Tuba rests mm. 77-80
  R2 * 4 |

  % Enters mm. 81-88
  bes,,,8\fff r f,, r |
  bes,,,8 r f,, r |
  bes,,,8\fff r bes,,, r |
  bes,,, r bes,,, r |
  bes,,,8\fff r f,, r |
  ees,,8 r bes,,, r |
  f,,8 r c, r |
  bes,,,8 r f,, r |

  % Promenade reprise mm. 89-92
  bes,,,8\fff r f,, r |
  ees,,8 r bes,,, r |
  f,,8 r c, r |
  bes,,,4 r |

  % Coda mm. 93-102
  R2 * 4 |
  f,,8.\fff f,,16 f,,8 f,, |
  f,,4 r |
  bes,,,8. bes,,,16 bes,,,8 bes,,, |
  f,,8. f,,16 f,,8 f,, |
  bes,,,4\fff r |
  bes,,,8\fff r r4 \bar "|."
}

% =======================================================================
% 11. GLOCKENSPIEL (Concert Pitch) — Range: G5 - C8 (MIDI 79 - 108)
% In \fixed c': c=60, Range 79-108 = [g', c'''']
% =======================================================================
glockConcert = \fixed c' {
  \global
  \clef treble
  \tempo "Allegro Polka" 4 = 126
  % Intro (mm. 1-4)
  R2 |
  r8 f''8\f bes''8. d'''16 |
  d'''4 c'''8. a''16 |
  bes''4 r |

  % --- VERSE 1 (mm. 5-36) ---
  % Section A1 (mm. 5-12) - Bright bells doubling
  bes''16\f bes'' bes'' bes'' bes''8 bes'' |
  bes''4 r |
  a''16 a'' a'' a'' a''8 a'' |
  a''4 r |
  bes''16 bes'' bes'' bes'' bes''8 bes'' |
  bes''4 r |
  bes''8\ff r bes'' r |
  bes'' r bes'' r |

  % Rests mm. 13-36
  R2 * 24 |

  % --- VERSE 2 (mm. 37-68) - Più Mosso ---
  \tempo "Più Mosso" 4 = 138
  % Enters mm. 37-44
  bes''16\ff bes'' bes'' bes'' bes''8 bes'' |
  bes''4 r |
  a''16 a'' a'' a'' a''8 a'' |
  a''4 r |
  bes''16 bes'' bes'' bes'' bes''8 bes'' |
  bes''4 r |
  bes''8\fff r bes'' r |
  bes'' r bes'' r |

  % Rests mm. 45-68
  R2 * 24 |

  % --- VERSE 3 & CODA (mm. 69-102) - Prestissimo ---
  \tempo "Prestissimo" 4 = 158
  % Enters mm. 69-76
  bes''16\fff bes'' bes'' bes'' bes''8 bes'' |
  bes''4 r |
  a''16 a'' a'' a'' a''8 a'' |
  a''4 r |
  bes''16 bes'' bes'' bes'' bes''8 bes'' |
  bes''4 r |
  bes''8\fff r bes'' r |
  bes'' r bes'' r |

  % Rests mm. 77-88
  R2 * 12 |

  % Coda & Stinger (mm. 89-102)
  d''8.\fff ees''16 f''8 bes'' |
  a''8 g'' g''4 |
  d''8. ees''16 f''8 ees'' |
  d''8 c'' bes'4 |
  R2 * 2 |
  bes'16\fff b' c'' cis'' d'' dis'' e'' f'' |
  fis''16 g'' gis'' a'' bes''8 r |
  f''8.\fff f''16 f''8 f'' |
  f''4 r |
  bes''8. bes''16 bes''8 bes'' |
  f''8. f''16 f''8 f'' |
  bes''4\fff r |
  bes''8\fff r r4 \bar "|."
}

% =======================================================================
% 12. PERCUSSION 1: SNARE DRUM & BASS DRUM
% =======================================================================
percussionOne = \drummode {
  <<
    {
      % Intro (mm. 1-4)
      sn2:32\p\< ~ |
      sn4\f sn8. sn16 |
      sn4 sn8. sn16 |
      sn4 r |

      % Verse 1 (mm. 5-36)
      \repeat unfold 3 {
        sn8 sn16 sn sn8 sn |
        sn4 r |
      }
      % 4 Claps!
      sn8\ff r sn r |
      sn r sn r |

      \repeat unfold 3 {
        sn8 sn16 sn sn8 sn |
        sn4 r |
      }
      sn8\ff r sn r |
      sn r sn r |

      % Promenade (mm. 21-36)
      \repeat unfold 16 {
        sn8 sn16 sn sn8 sn |
      }

      % Verse 2 (mm. 37-68)
      \repeat unfold 3 {
        sn8 sn16 sn sn8 sn |
        sn4 r |
      }
      sn8\fff r sn r |
      sn r sn r |

      \repeat unfold 3 {
        sn8 sn16 sn sn8 sn |
        sn4 r |
      }
      sn8\fff r sn r |
      sn r sn r |

      \repeat unfold 16 {
        sn8 sn16 sn sn8 sn |
      }

      % Verse 3 & Coda (mm. 69-102)
      \repeat unfold 3 {
        sn8 sn16 sn sn8 sn |
        sn4 r |
      }
      sn8\fff r sn r |
      sn r sn r |

      \repeat unfold 3 {
        sn8 sn16 sn sn8 sn |
        sn4 r |
      }
      sn8\fff r sn r |
      sn r sn r |

      \repeat unfold 8 {
        sn8 sn16 sn sn8 sn |
      }

      % Coda
      sn2:32\fff ~ |
      sn4 sn8. sn16 |
      sn2:32 ~ |
      sn8 r r4 |
      sn8. sn16 sn8 sn |
      sn4 r |
      sn8. sn16 sn8 sn |
      sn8. sn16 sn8 sn |
      sn4\fff r |
      sn8\fff r r4 \bar "|."
    }
    \\
    {
      % Bass Drum
      R2 |
      bd4\f bd |
      bd4 bd |
      bd4 r |

      % Verse 1
      \repeat unfold 6 {
        bd4 bd |
      }
      bd8\ff r bd r |
      bd r bd r |

      \repeat unfold 6 {
        bd4 bd |
      }
      bd8\ff r bd r |
      bd r bd r |

      \repeat unfold 16 {
        bd4 bd |
      }

      % Verse 2
      \repeat unfold 6 {
        bd4 bd |
      }
      bd8\fff r bd r |
      bd r bd r |

      \repeat unfold 6 {
        bd4 bd |
      }
      bd8\fff r bd r |
      bd r bd r |

      \repeat unfold 16 {
        bd4 bd |
      }

      % Verse 3
      \repeat unfold 6 {
        bd4 bd |
      }
      bd8\fff r bd r |
      bd r bd r |

      \repeat unfold 6 {
        bd4 bd |
      }
      bd8\fff r bd r |
      bd r bd r |

      \repeat unfold 8 {
        bd4 bd |
      }

      % Coda
      bd4 bd |
      bd4 bd |
      bd4 bd |
      bd8 r r4 |
      bd8. bd16 bd8 bd |
      bd4 r |
      bd8. bd16 bd8 bd |
      bd8. bd16 bd8 bd |
      bd4\fff r |
      bd8\fff r r4 \bar "|."
    }
  >>
}

% =======================================================================
% 13. PERCUSSION 2: CRASH CYMBALS
% =======================================================================
percussionTwo = \drummode {
  % Intro
  R2 * 3 |
  cymc4\f r |

  % Verse 1
  cymc4\f r |
  R2 |
  cymc4 r |
  R2 |
  cymc4 r |
  R2 |
  cymc8\ff r cymc r |
  cymc r cymc r |

  R2 * 6 |
  cymc8\ff r cymc r |
  cymc r cymc r |

  % Promenade
  R2 * 15 |
  cymc4\f r |

  % Verse 2
  cymc4\ff r |
  R2 |
  cymc4 r |
  R2 |
  cymc4 r |
  R2 |
  cymc8\fff r cymc r |
  cymc r cymc r |

  R2 * 6 |
  cymc8\fff r cymc r |
  cymc r cymc r |

  R2 * 15 |
  cymc4\ff r |

  % Verse 3
  cymc4\fff r |
  R2 |
  cymc4 r |
  R2 |
  cymc4 r |
  R2 |
  cymc8\fff r cymc r |
  cymc r cymc r |

  R2 * 6 |
  cymc8\fff r cymc r |
  cymc r cymc r |

  R2 * 8 |

  % Coda
  cymc4\fff r |
  cymc4 r |
  cymc4 r |
  R2 |
  cymc8. cymc16 cymc8 cymc |
  cymc4 r |
  cymc8. cymc16 cymc8 cymc |
  cymc8. cymc16 cymc8 cymc |
  cymc4\fff r |
  cymc8\fff r r4 \bar "|."
}

% =======================================================================
% 14. PERCUSSION 3: AUXILIARY (HANDCLAPS & TRIANGLE)
% =======================================================================
percussionThree = \drummode {
  R2 * 4 |

  % Verse 1 Claps
  R2 * 6 |
  cl8\ff r cl r |
  cl r cl r |

  R2 * 6 |
  cl8\ff r cl r |
  cl r cl r |

  % Promenade Triangle
  \repeat unfold 16 {
    tri4\f tri8 tri |
  }

  % Verse 2 Claps
  R2 * 6 |
  cl8\fff r cl r |
  cl r cl r |

  R2 * 6 |
  cl8\fff r cl r |
  cl r cl r |

  \repeat unfold 16 {
    tri4\ff tri8 tri |
  }

  % Verse 3 Claps
  R2 * 6 |
  cl8\fff r cl r |
  cl r cl r |

  R2 * 6 |
  cl8\fff r cl r |
  cl r cl r |

  \repeat unfold 8 {
    tri4\fff tri8 tri |
  }

  % Coda
  R2 * 4 |
  cl8. cl16 cl8 cl |
  cl4 r |
  cl8. cl16 cl8 cl |
  cl8. cl16 cl8 cl |
  cl4\fff r |
  cl8\fff r r4 \bar "|."
}

% =======================================================================
% 15. TIMPANI (Concert Pitch) — Range: F2 - Eb3 (MIDI 41 - 51)
% In \fixed c': c=60, Range 41-51 = [f,,, ees,,]
% =======================================================================
timpaniConcert = \fixed c' {
  \global
  \clef bass
  \tempo "Allegro Polka" 4 = 126
  % Intro: F2=41 (f,,), Bb2=46 (bes,,), C3=48 (c,), Eb3=51 (ees,)
  R2 |
  bes,,4\f f,, |
  bes,,4 f,, |
  bes,4 r |

  % Verse 1
  bes,,4\f f,, |
  bes,,4 f,, |
  f,,4 c, |
  f,,4 c, |
  bes,,4 f,, |
  bes,,4 f,, |
  bes,8\ff r bes, r |
  bes, r bes, r |

  R2 * 8 |

  % Promenade
  \repeat unfold 4 {
    bes,,4\f f,, |
    ees,4 bes,, |
    f,,4 c, |
    bes,,4 f,, |
  }

  % Verse 2
  bes,,4\ff f,, |
  bes,,4 f,, |
  f,,4 c, |
  f,,4 c, |
  bes,,4 f,, |
  bes,,4 f,, |
  bes,8\fff r bes, r |
  bes, r bes, r |

  R2 * 8 |

  \repeat unfold 4 {
    bes,,4\ff f,, |
    ees,4 bes,, |
    f,,4 c, |
    bes,,4 f,, |
  }

  % Verse 3
  bes,,4\fff f,, |
  bes,,4 f,, |
  f,,4 c, |
  f,,4 c, |
  bes,,4 f,, |
  bes,,4 f,, |
  bes,8\fff r bes, r |
  bes, r bes, r |

  R2 * 8 |

  \repeat unfold 2 {
    bes,,4\fff f,, |
    ees,4 bes,, |
    f,,4 c, |
    bes,,4 f,, |
  }

  % Coda
  bes,,4\fff f,, |
  bes,,4 f,, |
  bes,,4 f,, |
  bes,,8 r r4 |
  bes,8. bes,16 bes,8 bes, |
  bes,4 r |
  bes,8. bes,16 bes,8 bes, |
  f,,8. f,,16 f,,8 f,, |
  bes,,4\fff r |
  bes,,8\fff r r4 \bar "|."
}
% =======================================================================
% FULL SCORE LAYOUT & MIDI DEFINITIONS
% =======================================================================
\score {
  <<
    \new StaffGroup = "Woodwinds" <<
      \new Staff = "Flute" \with { instrumentName = "Flute" shortInstrumentName = "Fl." midiInstrument = "flute" } << \fluteConcert >>
      \new Staff = "Oboe" \with { instrumentName = "Oboe" shortInstrumentName = "Ob." midiInstrument = "oboe" } << \oboeConcert >>
      \new Staff = "Clarinet" \with { instrumentName = "B♭ Clarinet" shortInstrumentName = "Cl." midiInstrument = "clarinet" } << \clarinetConcert >>
      \new Staff = "AltoSax" \with { instrumentName = "Alto Sax" shortInstrumentName = "A.Sx." midiInstrument = "alto sax" } << \altoSaxConcert >>
      \new Staff = "TenorSax" \with { instrumentName = "Tenor Sax" shortInstrumentName = "T.Sx." midiInstrument = "tenor sax" } << \tenorSaxConcert >>
    >>
    \new StaffGroup = "Brass" <<
      \new Staff = "Trumpet" \with { instrumentName = "B♭ Trumpet" shortInstrumentName = "Tpt." midiInstrument = "trumpet" } << \trumpetConcert >>
      \new Staff = "Horn" \with { instrumentName = "F Horn" shortInstrumentName = "Hn." midiInstrument = "french horn" } << \hornConcert >>
      \new Staff = "Trombone" \with { instrumentName = "Trombone" shortInstrumentName = "Tbn." midiInstrument = "trombone" } << \tromboneConcert >>
      \new Staff = "Euphonium" \with { instrumentName = "Euphonium" shortInstrumentName = "Euph." midiInstrument = "tuba" } << \euphoniumConcert >>
      \new Staff = "Tuba" \with { instrumentName = "Tuba" shortInstrumentName = "Tba." midiInstrument = "tuba" } << \tubaConcert >>
    >>
    \new StaffGroup = "Percussion" <<
      \new Staff = "Glockenspiel" \with { instrumentName = "Glockenspiel" shortInstrumentName = "Glk." midiInstrument = "glockenspiel" } << \glockConcert >>
      \new DrumStaff = "Drums" \with { instrumentName = "Snare & Bass" shortInstrumentName = "Drs." } << \percussionOne >>
      \new DrumStaff = "Cymbals" \with { instrumentName = "Crash Cym." shortInstrumentName = "Cym." } << \percussionTwo >>
      \new DrumStaff = "AuxClaps" \with { instrumentName = "Claps/Tri." shortInstrumentName = "Aux." } << \percussionThree >>
      \new Staff = "Timpani" \with { instrumentName = "Timpani" shortInstrumentName = "Timp." midiInstrument = "timpani" } << \timpaniConcert >>
    >>
  >>
  \layout {
    \context {
      \Score
      \override BarNumber.break-visibility = #end-of-line-invisible
      barNumberVisibility = #(every-nth-bar-number-visible 5)
    }
  }
  \midi { }
}
