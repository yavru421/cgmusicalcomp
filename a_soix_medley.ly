\version "2.24.0"
\include "articulate.ly"

\header {
  title = "A Soix Medley"
  subtitle = "A Rhapsodic Concert Band Suite in Six Themes with Solo Toms Invocation"
  composer = "John Daniel Dondlinger"
  arranger = "Arranged for Wisconsin Rapids City Band"
  tagline = "A Soix Medley — Composed & Arranged by John Daniel Dondlinger (2026)"
}

#(set-global-staff-size 12)

\paper {
  #(set-paper-size "letter")
  top-margin = 0.4\in
  bottom-margin = 0.4\in
  left-margin = 0.45\in
  right-margin = 0.4\in
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  system-system-spacing.basic-distance = #10
  score-system-spacing.basic-distance = #10
}

% =======================================================================
% 1. FLUTE (Piccolo / Flute Lead)
% =======================================================================
flutePart = \fixed c' {
  % --- Overture: Solo Concert Toms Invocation (mm. 1-12, 3/4, 120 BPM) ---
  \key ees \major
  \time 3/4
  \tempo "Overture: Solo Toms Invocation — In 3" 4 = 120
  R2.*8 | % mm. 1-8: Silent during Toms and Timpani solo
  ees''4-^\ff r r | % mm. 9-12: Full band dramatic stabs in 3
  bes''4-^ r r |
  c'''4-^ r r |
  bes''2.-^\fermata |

  % --- Theme I: Sovereign Light (mm. 13-20, 4/4, E♭ Major, 96 BPM) ---
  \time 4/4
  \tempo "I. Sovereign Light — Expansive" 4 = 96
  R1*2 |
  r2 r8 bes\p( c' ees' |
  f'8 g' bes' c'' ees''2) |
  bes'4.(\mf c''8 ees''4. f''8 |
  g''4. f''8 ees''4 bes' |
  c''8-. d''-. ees''-. f''-. g''4-.) r |
  f''8-.(\> g''-. f''-. ees''-. c''2)\! |

  % --- Theme II: Moonlight Samba (mm. 21-28, 4/4, C minor, 116 BPM) ---
  \key c \minor
  \tempo "II. Moonlight Samba — Bossa Groove" 4 = 116
  g''8-.\f g''-. r4 ees''8-. ees''-. r4 |
  c''8-. c''-. r c'' d''4-^ r |
  ees''4.(\mf f''8 g''4. aes''8 |
  bes''4. aes''8 g''2) |
  c'''8-.\ff c'''-. r4 bes''8-. bes''-. r4 |
  aes''8-. aes''-. r aes'' g''4-^ r |
  ees''4.(\f f''8 g''4. bes''8 |
  c'''1)\> |

  % --- Theme III: The Buccaneer's Reel (mm. 29-36, 6/8, D minor, 112 BPM) ---
  \key d \minor
  \time 6/8
  \tempo "III. The Buccaneer's Reel — Allegro Con Brio" 4. = 112
  d''8\f f'' g'' a''4. |
  bes''4 a''8 g''4 e''8 |
  f''8 g'' f'' e''4 cis''8 |
  d''4.~ d''4 r8 |
  d''8 f'' g'' a''4. |
  d'''4 c'''8 bes''4 a''8 |
  g''8 a'' bes'' a''4 cis''8 |
  d''4.~ d''4 r8 |

  % --- Theme IV: Groovatude (mm. 37-44, 4/4, B♭ Major, 104 BPM) ---
  \key bes \major
  \time 4/4
  \tempo "IV. Groovatude — Tight Funk Pocket" 4 = 104
  r8 f''16(\mf g'' bes''8-.) r r4 d'''8-^ r |
  r8 c'''8-. r8 bes''-. r2 |
  r8 f''16( g'' bes''8-.) r r4 d'''8-^ r |
  ees'''8-.\f d'''-. c'''-. bes''-. f''4-^ r |
  r8 f''16( g'' bes''8-.) r r4 d'''8-^ r |
  r8 c'''8-. r8 bes''-. r2 |
  f''8-.(\ff g''-. bes''-. c'''-. d'''4-^ bes''-^) |
  c'''1\fermata |

  % --- Theme V: The Next Episode (mm. 45-52, 4/4, G minor, 95 BPM) ---
  \key g \minor
  \tempo "V. The Next Episode — West Coast Groove" 4 = 95
  r8 <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-. r <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-. |
  r8 <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-. r <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-. |
  r8 <g' bes' d''>-.\ff <g' bes' d''>-. <g' bes' d''>-. r <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-. |
  r8 <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-. r <g' bes' d''>-. <g' bes' d''>-. <g' bes' d''>-. |
  d''4.(\fff c''8 bes'4 a' |
  g'1 ~ |
  g'4 a'8 bes' c''4 d'' |
  d''4. c''8 bes'4 a' |
  g'1) |

  % --- Theme VI: Sovereign Forge — Grand Finale (mm. 53-62, 4/4, B♭ Major, 120 BPM) ---
  \key bes \major
  \tempo "VI. Sovereign Forge — Grandioso Finale" 4 = 120
  d'''4.\fff c'''8 bes''4 f'' |
  g''4. f''8 d''4 bes' |
  ees'''8-.(\ffff d'''-. c'''-. bes''-.) f'''4-^ f'''4-^ |
  d'''4. c'''8 bes''4 f'' |
  g''4. f''8 ees''4 d'' |
  ees'''4.\ffff d'''8 c'''4 bes'' |
  c'''4. bes''8 a''4 g'' |
  f''8-. g''-. a''-. bes''-. c'''4-^ d'''-^ |
  ees'''4-^ f'''4-^ bes'''2-^ |
  <bes'' d''' f'''>1\fermata \bar "|."
}

% =======================================================================
% 2. OBOE (Pastoral Singing & Lyrical Counterpoint)
% =======================================================================
oboePart = \fixed c' {
  % --- Overture: Solo Toms Invocation ---
  \key ees \major
  \time 3/4
  R2.*8 |
  bes'4-^\ff r r |
  f'4-^ r r |
  g'4-^ r r |
  f'2.-^\fermata |

  % --- Theme I: Sovereign Light ---
  \time 4/4
  R1 |
  bes'4(\mf c''8. d''16 ees''4 d''8 c'' |
  bes'4. g'8 f'2) |
  g'8(\p a' bes' c'' d''4. ees''8 |
  d''8 c'' bes' a' bes'2) |
  g'4.(\mf f'8 ees'4 g' |
  aes'8-. bes'-. c''-. d''-. ees''4-.) r |
  d''8-.(\> ees''-. d''-. c''-. bes'2)\! |

  % --- Theme II: Moonlight Samba ---
  \key c \minor
  R1*2 |
  c''4.(\mf d''8 ees''4. f''8 |
  g''4. f''8 ees''2) |
  ees''8-.\ff ees''-. r4 d''8-. d''-. r4 |
  c''8-. c''-. r c'' bes'4-^ r |
  c''4.(\f d''8 ees''4. g''8 |
  g''1)\> |

  % --- Theme III: The Buccaneer's Reel ---
  \key d \minor
  \time 6/8
  R2.*4 |
  d''8\f f'' g'' a''4. |
  bes''4 a''8 g''4 e''8 |
  f''8 g'' f'' e''4 cis''8 |
  d''4.~ d''4 r8 |

  % --- Theme IV: Groovatude ---
  \key bes \major
  \time 4/4
  R1*2 |
  r8 d''16(\mf ees'' f''8-.) r r4 bes''8-^ r |
  c''8-.\f bes'-. a'-. g'-. d''4-^ r |
  R1*2 |
  d''8-.(\ff ees''-. f''-. g''-. f''4-^ d''-^) |
  ees''1\fermata |

  % --- Theme V: The Next Episode ---
  \key g \minor
  R1*4 |
  bes'4.(\fff a'8 g'4 f' |
  d'1 ~ |
  d'4 f'8 g' a'4 bes' |
  bes'4. a'8 g'4 f' |
  d'1) |

  % --- Theme VI: Sovereign Forge ---
  \key bes \major
  bes'4.\fff c''8 d''4 d'' |
  ees''4. d''8 bes'4 g' |
  c''8-.(\ffff d''-. ees''-. f''-.) d''4-^ d''4-^ |
  bes'4. c''8 d''4 d'' |
  ees''4. d''8 c''4 bes' |
  c''4.\ffff d''8 ees''4 f'' |
  g''4. f''8 ees''4 d'' |
  c''8-. d''-. ees''-. f''-. g''4-^ a''-^ |
  bes''4-^ c'''4-^ d'''2-^ |
  d''1\fermata \bar "|."
}

% =======================================================================
% 3. B♭ CLARINET (Clarion Sweep & Rich Harmonic Body)
% =======================================================================
clarinetPart = \fixed c' {
  % --- Overture: Solo Toms Invocation ---
  \key ees \major
  \time 3/4
  R2.*8 |
  g'4-^\ff r r |
  d''4-^ r r |
  ees''4-^ r r |
  d''2.-^\fermata |

  % --- Theme I: Sovereign Light ---
  \time 4/4
  g4(\p bes8 ees' g'4. f'8 |
  ees'4. c'8 bes2) |
  R1*2 |
  ees'4.(\mf f'8 g'4. bes'8 |
  bes'4. aes'8 g'4 ees' |
  ees'8-. f'-. g'-. aes'-. bes'4-.) r |
  bes'8-.(\> c''-. bes'-. aes'-. g'2)\! |

  % --- Theme II: Moonlight Samba ---
  \key c \minor
  c'8-.\f c'-. r4 g'8-. g'-. r4 |
  c''8-. c''-. r c'' bes'4-^ r |
  g'4.(\mf aes'8 bes'4. c''8 |
  d''4. c''8 bes'2) |
  g'8-.\ff g'-. r4 f'8-. f'-. r4 |
  ees'8-. ees'-. r ees' d'4-^ r |
  g'4.(\f bes'8 c''4. d''8 |
  ees''1)\> |

  % --- Theme III: The Buccaneer's Reel ---
  \key d \minor
  \time 6/8
  a'8\f d'' e'' f''4. |
  g''4 f''8 e''4 cis''8 |
  d''8 e'' d'' cis''4 a'8 |
  d''4.~ d''4 r8 |
  a'8 d'' e'' f''4. |
  bes''4 a''8 g''4 f''8 |
  e''8 f'' g'' f''4 e''8 |
  d''4.~ d''4 r8 |

  % --- Theme IV: Groovatude ---
  \key bes \major
  \time 4/4
  r8 bes16(\mf c' d'8-.) r r4 f'8-^ r |
  r8 g'8-. r8 f'-. r2 |
  r8 bes16( c' d'8-.) r r4 f'8-^ r |
  g'8-.\f f'-. ees'-. d'-. bes4-^ r |
  r8 bes16( c' d'8-.) r r4 f'8-^ r |
  r8 g'8-. r8 f'-. r2 |
  bes'8-.(\ff c''-. d''-. ees''-. f''4-^ d''-^) |
  f''1\fermata |

  % --- Theme V: The Next Episode ---
  \key g \minor
  r8 <d' g' bes'>-. <d' g' bes'>-. <d' g' bes'>-. r <d' g' bes'>-. <d' g' bes'>-. <d' g' bes'>-. |
  r8 <d' g' bes'>-. <d' g' bes'>-. <d' g' bes'>-. r <d' g' bes'>-. <d' g' bes'>-. <d' g' bes'>-. |
  r8 <d' g' bes'>-.\ff <d' g' bes'>-. <d' g' bes'>-. r <d' g' bes'>-. <d' g' bes'>-. <d' g' bes'>-. |
  r8 <d' g' bes'>-. <d' g' bes'>-. <d' g' bes'>-. r <d' g' bes'>-. <d' g' bes'>-. <d' g' bes'>-. |
  g'4.(\fff a'8 bes'4 c'' |
  bes'1 ~ |
  bes'4 c''8 d'' ees''4 f'' |
  f''4. ees''8 d''4 c'' |
  bes'1) |

  % --- Theme VI: Sovereign Forge ---
  \key bes \major
  f''4.\fff ees''8 d''4 bes' |
  c''4. bes'8 g'4 f' |
  g'8-.(\ffff a'-. bes'-. c''-.) bes'4-^ bes'4-^ |
  f''4. ees''8 d''4 bes' |
  c''4. bes'8 g'4 f' |
  g'4.\ffff a'8 bes'4 c'' |
  d''4. c''8 bes'4 a' |
  bes'8-. c''-. d''-. ees''-. f''4-^ f''-^ |
  g''4-^ a''4-^ bes''2-^ |
  bes'1\fermata \bar "|."
}

% =======================================================================
% 4. ALTO SAXOPHONE (Soulful Jazz / Swing Ballad Punch)
% =======================================================================
altoSaxPart = \fixed c' {
  % --- Overture: Solo Toms Invocation ---
  \key ees \major
  \time 3/4
  R2.*8 |
  c'4-^\ff r r |
  f'4-^ r r |
  g'4-^ r r |
  f'2.-^\fermata |

  % --- Theme I: Sovereign Light ---
  \time 4/4
  R1*4 |
  c'4.(\mf d'8 ees'4. f'8 |
  g'4. f'8 ees'4 c' |
  c'8-. d'-. ees'-. f'-. g'4-.) r |
  f'8-.(\> g'-. f'-. ees'-. c'2)\! |

  % --- Theme II: Moonlight Samba ---
  \key c \minor
  ees'8-.\f ees'-. r4 c'8-. c'-. r4 |
  g'8-. g'-. r g' f'4-^ r |
  c'4.(\mf d'8 ees'4. f'8 |
  g'4. f'8 ees'2) |
  c''8-.\ff c''-. r4 bes'8-. bes'-. r4 |
  aes'8-. aes'-. r aes' g'4-^ r |
  ees'4.(\f g'8 c''4. d''8 |
  ees''1)\> |

  % --- Theme III: The Buccaneer's Reel ---
  \key d \minor
  \time 6/8
  d'8\f f' g' a'4. |
  bes'4 a'8 g'4 e'8 |
  f'8 g' f' e'4 cis'8 |
  d'4.~ d'4 r8 |
  d'8 f' g' a'4. |
  d''4 c''8 bes'4 a'8 |
  g'8 a' bes' a'4 cis'8 |
  d'4.~ d'4 r8 |

  % --- Theme IV: Groovatude ---
  \key bes \major
  \time 4/4
  f'4(\mf g'8. aes'16 bes'4 c''8 bes' |
  aes'8 f' ees' c' ees'4-^ r) |
  f'8-.(\f f'-.) r8 aes'16( bes' c''8-. ees''-. c''4) |
  bes'8( aes' f' ees' f'4-^ r) |
  f'4(\mf g'8. aes'16 bes'4 c''8 bes' |
  aes'8 f' ees' c' ees'4-^ r) |
  f'8-.(\ff g'-. aes'-. bes'-. c''4-^ ees''-^) |
  d''1\fermata |

  % --- Theme V: The Next Episode ---
  \key g \minor
  R1*4 |
  bes'4.(\fff a'8 g'4 f' |
  d'1 ~ |
  d'4 f'8 g' a'4 bes' |
  bes'4. a'8 g'4 f' |
  g'1) |

  % --- Theme VI: Sovereign Forge ---
  \key bes \major
  d''4.\fff c''8 bes'4 f' |
  g'4. f'8 ees'4 d' |
  ees'8-.(\ffff f'-. g'-. a'-.) f'4-^ f'4-^ |
  d''4. c''8 bes'4 f' |
  g'4. f'8 ees'4 d' |
  ees'4.\ffff f'8 g'4 a' |
  bes'4. a'8 g'4 f' |
  g'8-. a'-. bes'-. c''-. d''4-^ d''-^ |
  ees''4-^ f''4-^ f'2-^ |
  f'1\fermata \bar "|."
}

% =======================================================================
% 5. B♭ TRUMPET (Heroic Fanfare & Brilliant Brass Lead)
% =======================================================================
trumpetPart = \fixed c' {
  % --- Overture: Solo Toms Invocation ---
  \key ees \major
  \time 3/4
  R2.*8 |
  bes4-^\ff r r |
  d'4-^ r r |
  ees'4-^ r r |
  bes'2.-^\fermata |

  % --- Theme I: Sovereign Light ---
  \time 4/4
  R1*4 |
  bes4.(\mf c'8 ees'4. f'8 |
  g'4. f'8 ees'4 bes |
  ees'8-. f'-. g'-. aes'-. bes'4-.) r |
  bes'2(\> g'2)\! |

  % --- Theme II: Moonlight Samba ---
  \key c \minor
  c'8-.\f c'-. r4 ees'8-. ees'-. r4 |
  g'8-. g'-. r g' f'4-^ r |
  R1*2 |
  ees''8-.\ff ees''-. r4 d''8-. d''-. r4 |
  c''8-. c''-. r c'' bes'4-^ r |
  R1*2 |

  % --- Theme III: The Buccaneer's Reel ---
  \key d \minor
  \time 6/8
  R2.*4 |
  d'8\f f' g' a'4. |
  bes'4 a'8 g'4 e'8 |
  f'8 g' f' e'4 cis'8 |
  d'4.~ d'4 r8 |

  % --- Theme IV: Groovatude ---
  \key bes \major
  \time 4/4
  r8 f'16(\mf g' bes'8-.) r r4 d''8-^ r |
  r8 c''8-. r8 bes'-. r2 |
  r8 f'16( g' bes'8-.) r r4 d''8-^ r |
  ees''8-.\f d''-. c''-. bes'-. f'4-^ r |
  r8 f'16( g' bes'8-.) r r4 d''8-^ r |
  r8 c''8-. r8 bes'-. r2 |
  f'8-.(\ff g'-. bes'-. c''-. d''4-^ bes'-^) |
  bes'1\fermata |

  % --- Theme V: The Next Episode ---
  \key g \minor
  R1*4 |
  d''4.(\fff c''8 bes'4 a' |
  g'1 ~ |
  g'4 a'8 bes' c''4 d'' |
  d''4. c''8 bes'4 a' |
  g'1) |

  % --- Theme VI: Sovereign Forge ---
  \key bes \major
  bes'4.\fff d''8 f''4 bes'' |
  bes''4. a''8 g''4 f'' |
  ees''8-.(\ffff f''-. g''-. a''-.) bes''4-^ bes''4-^ |
  bes'4. d''8 f''4 bes'' |
  bes''4. a''8 g''4 f'' |
  g'4.\ffff a'8 bes'4 c'' |
  d''4. c''8 bes'4 a' |
  bes'8-. c''-. d''-. ees''-. f''4-^ f''-^ |
  g''4-^ a''4-^ bes''2-^ |
  bes'1\fermata \bar "|."
}

% =======================================================================
% 6. FRENCH HORN (Warm, Noble Middle-Brass Body)
% =======================================================================
hornPart = \fixed c' {
  % --- Overture: Solo Toms Invocation ---
  \key ees \major
  \time 3/4
  R2.*8 |
  g4-^\ff r r |
  bes4-^ r r |
  c'4-^ r r |
  bes2.-^\fermata |

  % --- Theme I: Sovereign Light ---
  \time 4/4
  bes8(\mf d' f' bes' d''4. c''8 |
  bes'4. f'8 d'2) |
  ees'4(\f f'8 g' bes'4. a'8 |
  f'1) |
  R1*4 |

  % --- Theme II: Moonlight Samba ---
  \key c \minor
  g8-.\f g-. r4 c'8-. c'-. r4 |
  ees'8-. ees'-. r ees' d'4-^ r |
  c'4.(\mf d'8 ees'4. f'8 |
  g'4. f'8 ees'2) |
  c'8-.\ff c'-. r4 d'8-. d'-. r4 |
  ees'8-. ees'-. r ees' d'4-^ r |
  R1*2 |

  % --- Theme III: The Buccaneer's Reel ---
  \key d \minor
  \time 6/8
  d'4.\f a |
  d'4. cis' |
  d'4. a |
  d'4.~ d'4 r8 |
  d'4. a |
  d'4. cis' |
  bes4. a |
  d'4.~ d'4 r8 |

  % --- Theme IV: Groovatude ---
  \key bes \major
  \time 4/4
  R1*2 |
  r8 bes16(\mf c' d'8-.) r r4 f'8-^ r |
  g'8-.\f f'-. ees'-. d'-. bes4-^ r |
  R1*2 |
  bes8-.(\ff c'-. d'-. ees'-. f'4-^ d'-^) |
  d'1\fermata |

  % --- Theme V: The Next Episode ---
  \key g \minor
  R1*4 |
  bes4.(\fff c'8 d'4 ees' |
  d'1 ~ |
  d'4 ees'8 f' g'4 a' |
  bes'4. a'8 g'4 f' |
  d'1) |

  % --- Theme VI: Sovereign Forge ---
  \key bes \major
  f'4.\fff g'8 f'4 d' |
  ees'4. d'8 c'4 bes |
  c'8-.(\ffff d'-. ees'-. f'-.) d'4-^ d'4-^ |
  f'4. g'8 f'4 d' |
  ees'4. d'8 c'4 bes |
  ees'4.\ffff f'8 g'4 a' |
  bes'4. a'8 g'4 f' |
  f'8-. g'-. a'-. bes'-. c''4-^ d''-^ |
  ees''4-^ f''4-^ d'2-^ |
  d'1\fermata \bar "|."
}

% =======================================================================
% 7. TENOR TROMBONE (Majestic, Punchy Bass-Tenor Brass)
% =======================================================================
trombonePart = \fixed c' {
  \clef bass
  % --- Overture: Solo Toms Invocation ---
  \key ees \major
  \time 3/4
  R2.*8 |
  ees4-^\ff r r |
  bes,4-^ r r |
  c4-^ r r |
  bes,2.-^\fermata |

  % --- Theme I: Sovereign Light ---
  \time 4/4
  R1*2 |
  bes,4.\f d8 f4 bes |
  d'4. c'8 bes4 r |
  bes,4.(\mf c8 ees4. f8 |
  g4. f8 ees4 bes, |
  c8-. d-. ees-. f-. g4-.) r |
  f8-.(\> g-. f-. ees-. bes,2)\! |

  % --- Theme II: Moonlight Samba ---
  \key c \minor
  c8-.\f c-. r4 g,8-. g,-. r4 |
  c8-. c-. r c g4-^ r |
  c4.(\mf d8 ees4. f8 |
  g4. f8 ees2) |
  c8-.\ff c-. r4 g,8-. g,-. r4 |
  c8-. c-. r c g4-^ r |
  c4.(\f d8 ees4. f8 |
  g1)\> |

  % --- Theme III: The Buccaneer's Reel ---
  \key d \minor
  \time 6/8
  d4.\f a, |
  bes,4. a, |
  g,4. a, |
  d,4.~ d,4 r8 |
  d4. a, |
  bes,4. a, |
  g,4. a, |
  d,4.~ d,4 r8 |

  % --- Theme IV: Groovatude ---
  \key bes \major
  \time 4/4
  bes,4-.\f r8 f, bes,4-. r8 f, |
  bes,4-. d8-. f-. bes4-^ r |
  bes,4-. r8 f, bes,4-. r8 f, |
  ees8-.\f d-. c-. bes,-. f,4-^ r |
  bes,4-. r8 f, bes,4-. r8 f, |
  bes,4-. d8-. f-. bes4-^ r |
  bes8-.(\ff c'-. d'-. ees'-. f'4-^ d'-^) |
  bes1\fermata |

  % --- Theme V: The Next Episode ---
  \key g \minor
  g,4.\f g,8 bes,4 c |
  d4. c8 bes,4 a, |
  g,4.\ff g,8 bes,4 c |
  d4. c8 bes,4 a, |
  g,4.\fff a,8 bes,4 c |
  d1 ~ |
  d4 c8 bes, a,4 g, |
  d4. c8 bes,4 a, |
  g,1 |

  % --- Theme VI: Sovereign Forge ---
  \key bes \major
  d'4.\fff c'8 bes4 f |
  g4. f8 ees4 d |
  ees8-.(\ffff f-. g-. a-.) bes4-^ bes4-^ |
  d'4. c'8 bes4 f |
  g4. f8 ees4 d |
  c4.\ffff d8 ees4 f |
  g4. f8 ees4 d |
  ees8-. f-. g-. a-. bes4-^ bes-^ |
  c'4-^ d'4-^ bes2-^ |
  bes1\fermata \bar "|."
}

% =======================================================================
% 8. TUBA (Deep, Solid Foundational Anchor)
% =======================================================================
tubaPart = \fixed c' {
  \clef bass
  % --- Overture: Solo Toms Invocation ---
  \key ees \major
  \time 3/4
  R2.*8 |
  ees,4-^\ff r r |
  bes,,4-^ r r |
  c,4-^ r r |
  bes,,2.-^\fermata |

  % --- Theme I: Sovereign Light ---
  \time 4/4
  ees,1\f |
  bes,,1 |
  c,1 |
  aes,,2 bes,, |
  ees,4.\mf f,8 g,4. bes,8 |
  c4. bes,8 g,4 ees, |
  aes,,2 bes,, |
  ees,1 |

  % --- Theme II: Moonlight Samba ---
  \key c \minor
  c,4-.\f r8 g,, c,4-. r8 g,, |
  c,4-. ees,8-. g,-. c,4-^ r |
  c,4-. r8 g,, c,4-. r8 g,, |
  c,4-. ees,8-. g,-. c,4-^ r |
  c,4-.\ff r8 g,, c,4-. r8 g,, |
  c,4-. ees,8-. g,-. c,4-^ r |
  c,4.(\f d,8 ees,4. g,8 |
  c,1)\> |

  % --- Theme III: The Buccaneer's Reel ---
  \key d \minor
  \time 6/8
  d,4.\f a,, |
  bes,,4. a,, |
  g,,4. a,, |
  d,,4.~ d,,4 r8 |
  d,4. a,, |
  bes,,4. a,, |
  g,,4. a,, |
  d,,4.~ d,,4 r8 |

  % --- Theme IV: Groovatude ---
  \key bes \major
  \time 4/4
  bes,,4-.\f r8 f,, bes,,4-. r8 f,, |
  bes,,4-. d,8-. f,-. bes,,4-^ r |
  bes,,4-. r8 f,, bes,,4-. r8 f,, |
  ees,8-.\f d,-. c,-. bes,,-. f,,4-^ r |
  bes,,4-. r8 f,, bes,,4-. r8 f,, |
  bes,,4-. d,8-. f,-. bes,,4-^ r |
  bes,,8-.(\ff c,-. d,-. ees,-. f,4-^ f,,4-^) |
  bes,,1\fermata |

  % --- Theme V: The Next Episode ---
  \key g \minor
  g,,4.\f g,,8 bes,,4 c, |
  d,4. c,8 bes,,4 a,, |
  g,,4.\ff g,,8 bes,,4 c, |
  d,4. c,8 bes,,4 a,, |
  g,,4.\fff g,,8 bes,,4 c, |
  d,1 ~ |
  d,4 c,8 bes,, a,,4 g,, |
  d,4. c,8 bes,,4 a,, |
  g,,1 |

  % --- Theme VI: Sovereign Forge ---
  \key bes \major
  bes,,4.\fff d,8 f,4 bes, |
  ees,4. d,8 c,4 f,, |
  bes,,8-.(\ffff c,-. d,-. ees,-.) f,4-^ f,,4-^ |
  bes,,4. d,8 f,4 bes, |
  ees,4. d,8 c,4 f,, |
  c,4.\ffff d,8 ees,4 f, |
  g,4. f,8 ees,4 d, |
  ees,8-. f,-. g,-. a,-. bes,4-^ bes,,4-^ |
  ees,4-^ f,4-^ bes,,2-^ |
  bes,,1\fermata \bar "|."
}

% =======================================================================
% 9. ELECTRIC BASS (Tight, Groovy Funk / Bass Lock)
% =======================================================================
electricBassPart = \fixed c' {
  \clef bass
  % --- Overture: Solo Toms Invocation ---
  \key ees \major
  \time 3/4
  R2.*8 |
  ees,4-^\ff r r |
  bes,,4-^ r r |
  c,4-^ r r |
  bes,,2.-^\fermata |

  % --- Theme I: Sovereign Light ---
  \time 4/4
  ees,1\f |
  bes,,1 |
  c,1 |
  aes,,2 bes,, |
  ees,4.\mf f,8 g,4. bes,8 |
  c4. bes,8 g,4 ees, |
  aes,,2 bes,, |
  ees,1 |

  % --- Theme II: Moonlight Samba ---
  \key c \minor
  c,4-.\f r8 g,, c,4-. r8 g,, |
  c,4-. ees,8-. g,-. c,4-^ r |
  c,4-. r8 g,, c,4-. r8 g,, |
  c,4-. ees,8-. g,-. c,4-^ r |
  c,4-.\ff r8 g,, c,4-. r8 g,, |
  c,4-. ees,8-. g,-. c,4-^ r |
  c,4.(\f d,8 ees,4. g,8 |
  c,1)\> |

  % --- Theme III: The Buccaneer's Reel ---
  \key d \minor
  \time 6/8
  d,4.\f a,, |
  bes,,4. a,, |
  g,,4. a,, |
  d,,4.~ d,,4 r8 |
  d,4. a,, |
  bes,,4. a,, |
  g,,4. a,, |
  d,,4.~ d,,4 r8 |

  % --- Theme IV: Groovatude ---
  \key bes \major
  \time 4/4
  bes,,8-.\f r bes,,16( c, d,8) f,8-. g,16( aes,) f,8-. r |
  bes,,8-. r bes,4-^ r8 f,8-. bes,,4 |
  bes,,8-. r bes,,16( c, d,8) f,8-. g,16( aes,) f,8-. r |
  ees,8-. ees,16( f, g,8) bes,8 c8-. d16( c) bes,8-. f, |
  bes,,8-. r bes,,16( c, d,8) f,8-. g,16( aes,) f,8-. r |
  bes,,8-. r bes,4-^ r8 f,8-. bes,,4 |
  bes,,8-.(\ff c,-. d,-. ees,-. f,4-^ f,,4-^) |
  bes,,1\fermata |

  % --- Theme V: The Next Episode ---
  \key g \minor
  g,,4.\f g,,8 bes,,4 c, |
  d,4. c,8 bes,,4 a,, |
  g,,4.\ff g,,8 bes,,4 c, |
  d,4. c,8 bes,,4 a,, |
  g,,4.\fff g,,8 bes,,4 c, |
  d,1 ~ |
  d,4 c,8 bes,, a,,4 g,, |
  d,4. c,8 bes,,4 a,, |
  g,,1 |

  % --- Theme VI: Sovereign Forge ---
  \key bes \major
  bes,,4.\fff d,8 f,4 bes, |
  ees,4. d,8 c,4 f,, |
  bes,,8-.(\ffff c,-. d,-. ees,-.) f,4-^ f,,4-^ |
  bes,,4. d,8 f,4 bes, |
  ees,4. d,8 c,4 f,, |
  c,4.\ffff d,8 ees,4 f, |
  g,4. f,8 ees,4 d, |
  ees,8-. f,-. g,-. a,-. bes,4-^ bes,,4-^ |
  ees,4-^ f,4-^ bes,,2-^ |
  bes,,1\fermata \bar "|."
}

% =======================================================================
% 10. CELLO (Singing Tenor / Lyrical String Warmth)
% =======================================================================
celloPart = \fixed c' {
  \clef bass
  % --- Overture: Solo Toms Invocation ---
  \key ees \major
  \time 3/4
  R2.*8 |
  ees4-^\ff r r |
  bes,4-^ r r |
  c4-^ r r |
  bes,2.-^\fermata |

  % --- Theme I: Sovereign Light ---
  \time 4/4
  ees4(\p g8 bes ees'4. d'8 |
  c'4. bes8 g2) |
  c4(\mf d8 ees g4. f8 |
  ees1) |
  bes4.(\mf c'8 ees'4. f'8 |
  g'4. f'8 ees'4 bes |
  aes2 bes |
  ees1) |

  % --- Theme II: Moonlight Samba ---
  \key c \minor
  c8-.\f c-. r4 ees8-. ees-. r4 |
  g8-. g-. r g f4-^ r |
  c4.(\mf d8 ees4. f8 |
  g4. f8 ees2) |
  c'8-.\ff c'-. r4 bes8-. bes-. r4 |
  aes8-. aes-. r aes g4-^ r |
  c4.(\f ees8 g4. bes8 |
  c'1)\> |

  % --- Theme III: The Buccaneer's Reel ---
  \key d \minor
  \time 6/8
  d8\f f g a4. |
  bes4 a8 g4 e8 |
  f8 g f e4 cis8 |
  d4.~ d4 r8 |
  d8 f g a4. |
  d'4 c'8 bes4 a8 |
  g8 a bes a4 cis8 |
  d4.~ d4 r8 |

  % --- Theme IV: Groovatude ---
  \key bes \major
  \time 4/4
  bes,4-.\f r8 f, bes,4-. r8 f, |
  bes,4-. d8-. f-. bes4-^ r |
  bes,4-. r8 f, bes,4-. r8 f, |
  ees8-.\f d-. c-. bes,-. f,4-^ r |
  bes,4-. r8 f, bes,4-. r8 f, |
  bes,4-. d8-. f-. bes4-^ r |
  bes8-.(\ff c'-. d'-. ees'-. f'4-^ d'-^) |
  bes1\fermata |

  % --- Theme V: The Next Episode ---
  \key g \minor
  g,4.\f g,8 bes,4 c |
  d4. c8 bes,4 a, |
  g,4.\ff g,8 bes,4 c |
  d4. c8 bes,4 a, |
  g,4.\fff a,8 bes,4 c |
  d1 ~ |
  d4 c8 bes, a,4 g, |
  d4. c8 bes,4 a, |
  g,1 |

  % --- Theme VI: Sovereign Forge ---
  \key bes \major
  bes4.\fff f8 d4 bes, |
  ees4. d8 c4 f, |
  g,8-.(\ffff a,-. bes,-. c-.) d4-^ d4-^ |
  bes4. f8 d4 bes, |
  ees4. d8 c4 f, |
  c4.\ffff d8 ees4 f |
  g4. f8 ees4 d |
  ees8-. f-. g-. a-. bes4-^ bes-^ |
  c'4-^ d'4-^ bes2-^ |
  bes,1\fermata \bar "|."
}

% =======================================================================
% 11. GLOCKENSPIEL (Crystalline High Bell Sparkle)
% =======================================================================
glockPart = \fixed c' {
  % --- Overture: Solo Toms Invocation ---
  \key ees \major
  \time 3/4
  R2.*8 |
  ees'''4-^\ff r r |
  bes'''4-^ r r |
  c''''4-^ r r |
  bes'''2.-^\fermata |

  % --- Theme I: Sovereign Light ---
  \time 4/4
  R1*4 |
  bes''4.(\mf c'''8 ees'''4. f'''8 |
  g'''4. f'''8 ees'''4 bes'' |
  c'''8-. d'''-. ees'''-. f'''-. g'''4-.) r |
  R1 |

  % --- Theme II: Moonlight Samba ---
  \key c \minor
  R1*4 |
  c''''8-.\ff c''''-. r4 bes'''8-. bes'''-. r4 |
  aes'''8-. aes'''-. r aes''' g'''4-^ r |
  R1*2 |

  % --- Theme III: The Buccaneer's Reel ---
  \key d \minor
  \time 6/8
  R2.*4 |
  d'''8\f f''' g''' a'''4. |
  d''''4 c''''8 bes'''4 a'''8 |
  g'''8 a''' bes''' a'''4 cis'''8 |
  d'''4.~ d'''4 r8 |

  % --- Theme IV: Groovatude ---
  \key bes \major
  \time 4/4
  r8 f'''16(\mf g''' bes'''8-.) r r4 d''''8-^ r |
  r8 c''''8-. r8 bes'''-. r2 |
  r8 f'''16( g''' bes'''8-.) r r4 d''''8-^ r |
  ees''''8-.\f d''''-. c''''-. bes'''-. f'''4-^ r |
  R1*2 |
  f'''8-.(\ff g'''-. bes'''-. c''''-. d''''4-^ bes'''-^) |
  bes'''1\fermata |

  % --- Theme V: The Next Episode ---
  \key g \minor
  R1*9 |

  % --- Theme VI: Sovereign Forge ---
  \key bes \major
  d'''4.\fff c'''8 bes''4 f'' |
  g''4. f''8 d''4 bes' |
  ees'''8-.(\ffff d'''-. c'''-. bes''-.) f'''4-^ f'''4-^ |
  d'''4. c'''8 bes''4 f'' |
  g''4. f''8 ees''4 d'' |
  ees'''4.\ffff d'''8 c'''4 bes'' |
  c'''4. bes''8 a''4 g'' |
  f''8-. g''-. a''-. bes''-. c'''4-^ d'''-^ |
  ees'''4-^ f'''4-^ bes'''2-^ |
  bes'''1\fermata \bar "|."
}

% =======================================================================
% 12. MARIMBA (Lush Rolled Chords & Wooden Syncopation)
% =======================================================================
marimbaPart = \fixed c' {
  % --- Overture: Solo Toms Invocation ---
  \key ees \major
  \time 3/4
  R2.*8 |
  <ees g bes ees'>4-^\ff r r |
  <bes, d f bes>4-^ r r |
  <c ees g c'>4-^ r r |
  <bes, d f bes>2.-^\fermata |

  % --- Theme I: Sovereign Light ---
  \time 4/4
  <ees g bes ees'>1\f:32 |
  <c ees g c'>1:32 |
  <aes, c ees aes>2:32 <bes, d f bes>2:32 |
  <ees g bes ees'>1:32\fermata |
  ees'8(\mf g' bes' ees'' g'' ees'' bes' g' |
  c'8 ees' g' c'' ees'' c'' g' ees' |
  aes8 c' ees' aes' bes8 d' f' bes' |
  <ees g bes ees'>1) |

  % --- Theme II: Moonlight Samba ---
  \key c \minor
  <c ees g>8-.\f <c ees g>-. r4 <ees g c'>8-. <ees g c'>-. r4 |
  <g c' ees'>8-. <g c' ees'>-. r <g c' ees'> <f b d'>4-^ r |
  <c ees g>4.(\mf <d f bes>8 <ees g c'>4. <f aes d'>8 |
  <g c' ees'>4. <f aes d'>8 <ees g c'>2) |
  <c' ees' g'>8-.\ff <c' ees' g'>-. r4 <bes d' f'>8-. <bes d' f'>-. r4 |
  <aes c' ees'>8-. <aes c' ees'>-. r <aes c' ees'> <g b d'>4-^ r |
  <c ees g>4.(\f <ees g bes>8 <g c' ees'>4. <bes d' g'>8 |
  <c' ees' g'>1)\> |

  % --- Theme III: The Buccaneer's Reel ---
  \key d \minor
  \time 6/8
  <d f a>4.\f <a, cis e> |
  <bes, d f>4. <a, cis e> |
  <g, bes, d>4. <a, cis e> |
  <d f a>4.~ <d f a>4 r8 |
  <d f a>4. <a, cis e> |
  <bes, d f>4. <a, cis e> |
  <g, bes, d>4. <a, cis e> |
  <d f a>4.~ <d f a>4 r8 |

  % --- Theme IV: Groovatude ---
  \key bes \major
  \time 4/4
  <bes d' f'>8-.\f r <bes d' f'>16( <c' ees' g'> <d' f' bes'>8) <f' a' c''>8-. <g' bes' d''>16( <aes' c'' ees''>) <f' a' c''>8-. r |
  <bes d' f'>8-. r <bes d' f'>4-^ r8 <f' a' c''>8-. <bes d' f'>4 |
  <bes d' f'>8-. r <bes d' f'>16( <c' ees' g'> <d' f' bes'>8) <f' a' c''>8-. <g' bes' d''>16( <aes' c'' ees''>) <f' a' c''>8-. r |
  <ees' g' bes'>8-. <ees' g' bes'>16( <f' a' c''> <g' bes' d''>8) <bes' d'' f''>8 <c'' ees'' g''>8-. <d'' f'' bes''>16( <c'' ees'' g''>) <bes' d'' f''>8-. <f' a' c''> |
  <bes d' f'>8-. r <bes d' f'>16( <c' ees' g'> <d' f' bes'>8) <f' a' c''>8-. <g' bes' d''>16( <aes' c'' ees''>) <f' a' c''>8-. r |
  <bes d' f'>8-. r <bes d' f'>4-^ r8 <f' a' c''>8-. <bes d' f'>4 |
  <bes d' f'>8-.(\ff <c' ees' g'>-. <d' f' bes'>-. <ees' g' bes'>-. <f' a' c''>4-^ <bes d' f'>-^) |
  <bes d' f' bes'>1\fermata |

  % --- Theme V: The Next Episode ---
  \key g \minor
  r8 <g bes d'>-. <g bes d'>-. <g bes d'>-. r <g bes d'>-. <g bes d'>-. <g bes d'>-. |
  r8 <g bes d'>-. <g bes d'>-. <g bes d'>-. r <g bes d'>-. <g bes d'>-. <g bes d'>-. |
  r8 <g bes d'>-.\ff <g bes d'>-. <g bes d'>-. r <g bes d'>-. <g bes d'>-. <g bes d'>-. |
  r8 <g bes d'>-. <g bes d'>-. <g bes d'>-. r <g bes d'>-. <g bes d'>-. <g bes d'>-. |
  <g bes d'>4.(\fff <a c' ees'>8 <bes d' f'>4 <c' ees' g'> |
  <d' f' bes'>1 ~ |
  <d' f' bes'>4 <c' ees' g'>8 <bes d' f'> <a c' ees'>4 <g bes d'> |
  <d' f' bes'>4. <c' ees' g'>8 <bes d' f'>4 <a c' ees'> |
  <g bes d'>1) |

  % --- Theme VI: Sovereign Forge ---
  \key bes \major
  <bes d' f' bes'>4.\fff <c' ees' g' c''>8 <d' f' bes' d''>4 <f' a' c'' f''> |
  <g' bes' d'' g''>4. <f' a' c'' f''>8 <ees' g' bes' ees''>4 <d' f' bes' d''> |
  <ees' g' bes' ees''>8-.(\ffff <f' a' c'' f''>-. <g' bes' d'' g''>-. <a' c'' f'' a''>-.) <bes' d'' f'' bes''>4-^ <bes' d'' f'' bes''>4-^ |
  <bes d' f' bes'>4. <c' ees' g' c''>8 <d' f' bes' d''>4 <f' a' c'' f''> |
  <g' bes' d'' g''>4. <f' a' c'' f''>8 <ees' g' bes' ees''>4 <d' f' bes' d''> |
  <c' ees' g' c''>4.\ffff <d' f' bes' d''>8 <ees' g' bes' ees''>4 <f' a' c'' f''> |
  <g' bes' d'' g''>4. <f' a' c'' f''>8 <ees' g' bes' ees''>4 <d' f' bes' d''> |
  <ees' g' bes' ees''>8-. <f' a' c'' f''>-. <g' bes' d'' g''>-. <a' c'' f'' a''>-. <bes' d'' f'' bes''>4-^ <bes' d'' f'' bes''>-^ |
  <ees' g' bes' ees''>4-^ <f' a' c'' f''>4-^ <bes d' f' bes'>2-^ |
  <bes d' f' bes'>1\fermata \bar "|."
}

% =======================================================================
% 13. TIMPANI (Thunderous Dramatic Impact & Subterranean Pulses)
% =======================================================================
timpaniPart = \fixed c' {
  \clef bass
  % --- Overture: Solo Toms Invocation ---
  \key ees \major
  \time 3/4
  R2.*4 | % mm. 1-4: Absolute silence while Solo Toms play
  ees,4-^\ff r r | % mm. 5-8: Timpani enters with heavy accents on beat 1
  bes,,4-^ r r |
  c,4-^ r r |
  bes,,2.-^\ff:32 |
  ees,4-^\ff r r | % mm. 9-12: Timpani drives the band stabs
  bes,,4-^ r r |
  c,4-^ r r |
  bes,,2.-^\fermata |

  % --- Theme I: Sovereign Light ---
  \time 4/4
  ees,1\f:32 |
  bes,,1:32 |
  c,2:32 bes,,2:32 |
  ees,1:32\fermata |
  ees,4\mf r bes,, r |
  c,4 r bes,, r |
  aes,,4 r bes,, r |
  ees,1 |

  % --- Theme II: Moonlight Samba ---
  \key c \minor
  c,4-.\f r8 g,, c,4-. r8 g,, |
  c,4-. r c,4-^ r |
  c,4-. r8 g,, c,4-. r8 g,, |
  c,4-. r c,4-^ r |
  c,4-.\ff r8 g,, c,4-. r8 g,, |
  c,4-. r c,4-^ r |
  c,4\f r g,, r |
  c,1\> |

  % --- Theme III: The Buccaneer's Reel ---
  \key d \minor
  \time 6/8
  d,4.\f a,, |
  bes,,4. a,, |
  d,4. a,, |
  d,4.~ d,4 r8 |
  d,4. a,, |
  bes,,4. a,, |
  g,,4. a,, |
  d,4.~ d,4 r8 |

  % --- Theme IV: Groovatude ---
  \key bes \major
  \time 4/4
  bes,,4\f r bes,, r |
  bes,,4 r bes,,4-^ r |
  bes,,4 r bes,, r |
  ees,4\f r f,4-^ r |
  bes,,4 r bes,, r |
  bes,,4 r bes,,4-^ r |
  bes,,8-.(\ff c,-. d,-. ees,-. f,4-^ f,,4-^) |
  bes,,1\fermata |

  % --- Theme V: The Next Episode ---
  \key g \minor
  g,,4.\f g,,8 bes,,4 c, |
  d,4. c,8 bes,,4 a,, |
  g,,4.\ff g,,8 bes,,4 c, |
  d,4. c,8 bes,,4 a,, |
  g,,4.\fff g,,8 bes,,4 c, |
  d,1:32 ~ |
  d,4 c,8 bes,, a,,4 g,, |
  d,4. c,8 bes,,4 a,, |
  g,,1 |

  % --- Theme VI: Sovereign Forge ---
  \key bes \major
  bes,,4.\fff r8 f,,4 bes,, |
  ees,4. d,8 c,4 f,, |
  bes,,8-.(\ffff bes,,-. f,,-. f,,-.) bes,,4-^ bes,,4-^ |
  bes,,4. r8 f,,4 bes,, |
  ees,4. d,8 c,4 f,, |
  c,4.\ffff d,8 ees,4 f, |
  g,4. f,8 ees,4 d, |
  ees,8-. f,-. g,-. a,-. bes,4-^ bes,,4-^ |
  ees,4-^ f,4-^ bes,,2-^ |
  bes,,1\fermata \bar "|."
}

% =======================================================================
% 14. CONCERT PERCUSSION / BATTERY (MAIN PERCUSSION TOMS SOLO)
% =======================================================================
percussionPart = \drummode {
  % --- Overture: MAIN PERCUSSION TOMS SOLO IN 3/4 ---
  \time 3/4
  % mm. 1-4: Solo Concert Toms entirely alone!
  tomh8\f tommh toml tommh tomh toml |
  tomh16\ff tommh toml tommh tomh8-> tommh toml4-^ |
  tomh8-> tommh16 toml tommh8-> tomh toml-> tommh |
  toml4:32 tommh:32 tomh4-^ |

  % mm. 5-8: Toms groove intensifies with floor tom and polyrhythms
  tomfl8\ff-> toml tomh tommh toml tomfl |
  tomh16 tommh toml tommh tomh8-> tommh toml8-> tomfl |
  tomh8-> tommh16 toml tommh8-> tomh toml16 toml tommh tommh |
  tomh4:32 tommh:32 toml4-^ |

  % mm. 9-12: Toms drive under the full band stabs
  tomh8\fff tommh toml tommh tomh4-^ |
  tomh8 tommh toml tommh tomh4-^ |
  tomh16 tommh toml tommh tomh8-> tommh toml8-> tomfl |
  cymc2.-^\fermata |

  % --- Theme I: Sovereign Light ---
  \time 4/4
  cymc1\p\< ~ |
  cymc2\f cymc4 r |
  bd4\f r bd r |
  cymc1\fermata |
  bd4\mf r8 sn bd4 r8 sn |
  bd4 r8 sn bd4 r8 sn |
  sn8 sn16 sn sn8 sn bd4 r |
  cymc1\> |

  % --- Theme II: Moonlight Samba ---
  \time 4/4
  hh8\f hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  hh8\mf hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  hh8\ff hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  sn8\f sn16 sn sn8 sn bd4 sn |
  cymc1\> |

  % --- Theme III: The Buccaneer's Reel ---
  \time 6/8
  sn4.\f:32 bd |
  sn4. cymc |
  sn8 sn sn bd4. |
  sn4.~ sn4 r8 |
  sn4.:32 bd |
  sn4. cymc |
  sn8 sn sn bd4. |
  sn4.~ sn4 r8 |

  % --- Theme IV: Groovatude ---
  \time 4/4
  bd4\f r8 sn bd4-^ r8 sn |
  bd8 bd16 bd sn8 bd bd4 sn-^ |
  bd4 r8 sn bd4-^ r8 sn |
  bd8\ff sn16 sn sn8 sn bd4 sn-^ |
  bd4 r8 sn bd4-^ r8 sn |
  bd8 bd16 bd sn8 bd bd4 sn-^ |
  sn8-.(\ffff sn-. sn-. sn-.) cymc4-^ cymc4-^ |
  cymc1\fermata |

  % --- Theme V: The Next Episode ---
  \time 4/4
  hh8\f hh hh hh hh hh hh hh |
  bd4 sn8 bd bd4 sn |
  hh8\ff hh hh hh hh hh hh hh |
  bd4 sn8 bd bd4 sn |
  hh8\fff hh hh hh hh hh hh hh |
  bd4 sn8 bd bd4 sn |
  hh8 hh hh hh hh hh hh hh |
  bd4 sn8 bd bd4 sn |
  cymc1 |

  % --- Theme VI: Sovereign Forge ---
  \time 4/4
  bd4.\fff sn8 bd4 sn |
  bd4 sn8 sn bd4 sn |
  sn8-.(\ffff sn-. sn-. sn-.) cymc4-^ cymc4-^ |
  bd4. sn8 bd4 sn |
  bd4 sn8 sn bd4 sn |
  bd4.\ffff sn8 bd4 sn |
  bd4 sn8 sn bd4 sn |
  sn8-. sn-. sn-. sn-. bd4-^ sn-^ |
  bd4-^ sn4-^ cymc2-^ |
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
