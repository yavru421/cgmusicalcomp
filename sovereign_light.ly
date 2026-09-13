\version "2.24.0"
\include "articulate.ly"

\header {
  title = "Sovereign Light"
  subtitle = "A Pentatonic Tone Poem for Concert Band & Marimba"
  composer = "John Daniel Dondlinger"
  tagline = "Composed & Arranged for Wisconsin Rapids City Band by John Daniel Dondlinger"
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
  \key ees \major
  \time 4/4
  \tempo "Lively & Expansive" 4 = 96
}

% =======================================================================
% 1. FLUTE (Concert Pitch, Absolute Standard Range: E♭4 to C6)
% =======================================================================
fluteConcert = \fixed c' {
  \global
  \clef treble

  % Part I: Solitary Spark & Breaths (mm. 1-8)
  R1 |
  r2 r8 bes\f-. c'-. ees'-. |
  f'-. g'-. r4 r2\fermata |
  R1 |
  r2 r4 r8 bes16\f( c' |
  ees'4. f'8 g'4. bes'8 |
  c''4. bes'8 g'4. ees'8 |
  f'8-.\> g'-. f'-. ees'-. c'4-.)\! r\fermata |

  % Part II: The Staccato Dance & Fluid Melody (mm. 9-16)
  ees'8-.\f ees'-. r4 g'8-. g'-. r4 |
  bes'8-. bes'-. r bes' c''4-^ r |
  bes4.\f c'8 ees'4. f'8 |
  g'4. f'8 ees'2 |
  f'8-.\ff g'-. r4 c''8-. ees''-. r4 |
  bes'8-. bes'-. r bes' g'4-^ r |
  ees'4.\f f'8 g'4. bes'8 |
  c''1\> ~ |

  % Part III: Thick Harmonic Expansion (mm. 17-24)
  c''4.\f\! bes'8 g'4. bes'8 |
  aes'4. g'8 ees'2 |
  f'8-.\ff g'-. r4 bes'8-. c''-. r4 |
  ees''1\> ~ |
  ees''4.\f\! d''8 c''4. bes'8 |
  c''4. bes'8 g'2 |
  bes'8-.\ff c''-. r4 ees''8-. f''-. r4 |
  g''2.\ff r4 |

  % Part IV: The Climax & Grand Pause (mm. 25-30)
  ees''4.\fff f''8 g''4. bes''8 |
  c'''4. bes''8 g''4. c'''8 |
  bes'8-. c''-. bes'8-. g'-. f'8-. ees'-. c'-. bes-. |
  ees''4-^\fff r r2\fermata |
  R1\fermata |
  r2 r4 r8 bes16\p( c' |

  % Part V: Resolution & Ringing Horizon (mm. 31-36)
  ees'8\p\< f' g' bes' c'' ees'' f''4-^)\! |
  ees''1\fff ~ |
  ees''2. r4 |
  ees''4-^\fff r ees''4-^ r |
  ees''1\fff\fermata \bar "|."
}

% =======================================================================
% 2. B♭ CLARINET (Concert Pitch, Written F Major: Ergonomic & Rich)
% =======================================================================
clarinetConcert = \fixed c' {
  \global
  \clef treble

  % Part I: Solitary Spark & Breaths (mm. 1-8)
  R1 |
  r2 r8 g\f-. bes-. c'-. |
  ees'-. f'-. r4 r2\fermata |
  R1 |
  r2 r4 r8 g16\f( bes |
  c'4. ees'8 f'4. g'8 |
  aes'4. g'8 ees'4. c'8 |
  ees'8-.\> f'-. ees'-. c'-. bes4-.)\! r\fermata |

  % Part II: Staccato Dance (mm. 9-16)
  c'8-.\f c'-. r4 ees'8-. ees'-. r4 |
  f'8-. f'-. r f' g'4-^ r |
  g4.\f aes8 bes4. c'8 |
  ees'4. c'8 bes2 |
  c'8-.\ff ees'-. r4 g'8-. bes'-. r4 |
  f'8-. f'-. r f' ees'4-^ r |
  c'4.\f ees'8 f'4. g'8 |
  aes'1\> ~ |

  % Part III: Thick Harmonic Expansion (mm. 17-24)
  aes'4.\f\! g'8 ees'4. g'8 |
  f'4. ees'8 c'2 |
  d'8-.\ff ees'-. r4 f'8-. g'-. r4 |
  bes'1\> ~ |
  bes'4.\f\! bes'8 g'4. f'8 |
  g'4. f'8 ees'2 |
  f'8-.\ff g'-. r4 bes'8-. c''-. r4 |
  ees''2.\ff r4 |

  % Part IV: Climax (mm. 25-30)
  g'4.\fff bes'8 c''4. ees''8 |
  f''4. ees''8 c''4. f''8 |
  ees'8-. f'-. ees'8-. c'-. bes8-. g-. f8-. ees-. |
  g'4-^\fff r r2\fermata |
  R1\fermata |
  r2 r4 r8 g16\p( bes |

  % Part V: Resolution (mm. 31-36)
  c'8\p\< d' ees' f' g' bes' c''4-^)\! |
  bes'1\fff ~ |
  bes'2. r4 |
  bes'4-^\fff r bes'4-^ r |
  bes'1\fff\fermata \bar "|."
}

% =======================================================================
% 3. B♭ TRUMPET (Concert Pitch, Written F Major: Brilliant & Non-Fatiguing)
% =======================================================================
trumpetConcert = \fixed c' {
  \global
  \clef treble

  % Part I: Warm Brass Swell (mm. 1-8)
  R1 * 3 |
  r4 <bes ees' g'>2.\f\> |
  <bes ees' g'>2\! r2\fermata |
  R1 * 2 |
  r2 r4\! r\fermata |

  % Part II: Staccato Grooves & Fanfares (mm. 9-16)
  R1 * 2 |
  bes4.\f c'8 ees'4. f'8 |
  g'4. f'8 ees'2 |
  f'8-.\ff g'-. r4 c''8-. ees''-. r4 |
  bes'8-. bes'-. r bes' c''4-^ r |
  bes4.\f c'8 ees'4. f'8 |
  f'1\> ~ |

  % Part III: Thick Harmonic Expansion (mm. 17-24)
  f'4.\f\! ees'8 c'4. ees'8 |
  c'4. bes8 g2 |
  bes8-.\ff c'-. r4 d'8-. ees'-. r4 |
  g'1\> ~ |
  g'4.\f\! f'8 ees'4. d'8 |
  ees'4. d'8 c'2 |
  d'8-.\ff ees'-. r4 f'8-. g'-. r4 |
  bes'2.\ff r4 |

  % Part IV: Climax & Grand Pause (mm. 25-30)
  bes4.\fff c'8 ees'4. f'8 |
  g'4. f'8 ees'4. g'8 |
  f'8-. g'-. f'8-. ees'-. c'8-. bes-. g-. f-. |
  ees'4-^\fff r r2\fermata |
  R1\fermata |
  R1 |

  % Part V: Resolution (mm. 31-36)
  r2 r4 ees'4-^\fff |
  g'1\fff ~ |
  g'2. r4 |
  g'4-^\fff r g'4-^ r |
  g'1\fff\fermata \bar "|."
}

% =======================================================================
% 4. FRENCH HORN IN F (Concert Pitch, Written B♭ Major: Golden Core)
% =======================================================================
hornConcert = \fixed c' {
  \global
  \clef treble

  % Part I: Warm Swell & Melody (mm. 1-8)
  R1 * 3 |
  r4 <g bes ees'>2.\f\> |
  <g bes ees'>2\! r2\fermata |
  ees4.\p f8 g4. bes8 |
  c'4. bes8 g4. ees8 |
  f2\> ~ f4\! r\fermata |

  % Part II: Staccato Chords & Riffs (mm. 9-16)
  ees8-.\f ees-. r4 g8-. g-. r4 |
  bes8-. bes-. r bes c'4-^ r |
  R1 * 2 |
  aes8-.\ff bes-. r4 f'8-. g'-. r4 |
  ees'8-. ees'-. r ees' ees'4-^ r |
  ees4.\f f8 g4. bes8 |
  c'1\> ~ |

  % Part III: Thick Harmonic Expansion (mm. 17-24)
  c'4.\f\! d'8 ees'4. g'8 |
  aes'4. g'8 ees'2 |
  f8-.\ff g-. r4 bes8-. c'-. r4 |
  ees'1\> ~ |
  ees'4.\f\! d'8 ees'4. f'8 |
  g'4. f'8 ees'2 |
  bes8-.\ff c'-. r4 ees'8-. f'-. r4 |
  ees'2.\ff r4 |

  % Part IV: Climax (mm. 25-30)
  ees'4.\fff f'8 g'4. bes'8 |
  c'4. bes8 g4. c'8 |
  bes8-. c'-. bes8-. g-. f8-. ees-. c-. bes,-. |
  bes4-^\fff r r2\fermata |
  R1\fermata |
  R1 |

  % Part V: Resolution (mm. 31-36)
  r2 r4 bes'4-^\fff |
  ees'1\fff ~ |
  ees'2. r4 |
  ees'4-^\fff r ees'4-^ r |
  ees'1\fff\fermata \bar "|."
}

% =======================================================================
% 5. TROMBONE (Concert Pitch, Bass Clef: E♭2 to G4)
% =======================================================================
tromboneConcert = \fixed c {
  \global
  \clef bass

  % Part I: Warm Foundation (mm. 1-8)
  R1 * 3 |
  r4 <ees, bes, ees>2.\f\> |
  <ees, bes, ees>2\! r2\fermata |
  ees1\p ~ |
  ees1 |
  bes,2\> ~ bes,4\! r\fermata |

  % Part II: Staccato Grooves & Punches (mm. 9-16)
  ees8-.\f ees-. r4 g8-. g-. r4 |
  bes8-. bes-. r bes c'4-^ r |
  ees4.\f f8 g4. bes8 |
  c'4. bes8 g2 |
  f8-.\ff g-. r4 aes8-. c'-. r4 |
  bes8-. bes-. r bes ees4-^ r |
  ees4.\f f8 g4. bes8 |
  aes1\> ~ |

  % Part III: Thick Harmonic Expansion (mm. 17-24)
  aes4.\f\! bes8 g4. bes8 |
  aes4. g8 ees2 |
  bes,8-.\ff c-. r4 d8-. ees-. r4 |
  g1\> ~ |
  g4.\f\! d8 ees4. f8 |
  g4. f8 ees2 |
  f8-.\ff g-. r4 bes8-. c'-. r4 |
  ees'2.\ff r4 |

  % Part IV: Climax & Grand Pause (mm. 25-30)
  ees4.\fff f8 g4. bes8 |
  c'4. bes8 g4. c'8 |
  bes8-. c'-. bes8-. g-. f8-. ees-. c8-. bes,-. |
  ees4-^\fff r r2\fermata |
  R1\fermata |
  R1 |

  % Part V: Resolution (mm. 31-36)
  r2 r4 ees'4-^\fff |
  ees1\fff ~ |
  ees2. r4 |
  ees4-^\fff r ees4-^ r |
  ees1\fff\fermata \bar "|."
}

% =======================================================================
% 6. BASS / TUBA FOUNDATION (Concert Pitch, Bass Clef)
% =======================================================================
bassConcert = \fixed c, {
  \global
  \clef bass

  % Part I: Solitary Ground (mm. 1-8)
  R1 * 3 |
  r4 ees2.\f\> |
  ees2\! r2\fermata |
  ees1\p ~ |
  ees1 |
  bes,2\> ~ bes,4\! r\fermata |

  % Part II: Staccato Foundation (mm. 9-16)
  ees8-.\f ees-. r4 g8-. g-. r4 |
  bes8-. bes-. r bes c4-^ r |
  ees4.\f f8 g4. bes8 |
  c4. bes8 g2 |
  f8-.\ff g-. r4 aes8-. c'-. r4 |
  bes8-. bes-. r bes ees4-^ r |
  ees4.\f f8 g4. bes8 |
  aes1\> ~ |

  % Part III: Thick Harmonic Expansion (mm. 17-24)
  aes4.\f\! d8 ees4. g8 |
  aes4. g8 ees2 |
  bes,8-.\ff c-. r4 d8-. ees-. r4 |
  ees1\> ~ |
  ees4.\f\! d8 ees4. f8 |
  g4. f8 ees2 |
  bes,8-.\ff c-. r4 d8-. ees-. r4 |
  ees2.\ff r4 |

  % Part IV: Climax & Grand Pause (mm. 25-30)
  ees4.\fff f8 g4. bes8 |
  c4. bes8 g4. c8 |
  bes8-. c-. bes8-. g-. f8-. ees-. c8-. bes,-. |
  ees4-^\fff r r2\fermata |
  R1\fermata |
  R1 |

  % Part V: Resolution (mm. 31-36)
  r2 r4 ees4-^\fff |
  ees1\fff ~ |
  ees2. r4 |
  ees4-^\fff r ees4-^ r |
  ees,1\fff\fermata \bar "|."
}

% =======================================================================
% 7. MARIMBA (Rich 4-Mallet Chords, Standard Treble Clef Range)
% =======================================================================
marimbaConcert = \fixed c' {
  \global
  \clef treble

  % Part I: Solitary Warm Marimba Chords Open the Piece (mm. 1-8)
  <ees g bes ees'>2\mf:32 <f bes c' f'>2:32 |
  <g bes d' g'>2:32 <bes c' ees' bes'>2:32 |
  <c' ees' g' c''>2-^\f r2\fermata |
  <ees g bes ees'>1\p\> ~ |
  <ees g bes ees'>2\! r2\fermata |
  <ees g bes ees'>2\p:32 <g bes c' g'>2:32 |
  <aes c' ees' aes'>2:32 <bes c' ees' bes'>2:32 |
  <ees g bes ees'>2:32\> ~ <ees g bes ees'>4\! r\fermata |

  % Part II: Staccato Chords & Pentatonic Groove (mm. 9-16)
  <ees g bes ees'>8-.\f <ees g bes ees'>-. r4 <g bes d' g'>8-. <g bes d' g'>-. r4 |
  <bes c' ees' bes'>8-. <bes c' ees' bes'>-. r <bes c' ees' bes'> <c' ees' g' c''>4-^ r |
  <ees g bes ees'>4.\f <f bes c' f'>8 <g bes d' g'>4. <bes c' ees' bes'>8 |
  <c' ees' g' c''>4. <bes c' ees' bes'>8 <g bes d' g'>2 |
  <f bes c' f'>8-.\ff <g bes d' g'>-. r4 <aes c' ees' aes'>8-. <c' ees' g' c''>-. r4 |
  <bes c' ees' bes'>8-. <bes c' ees' bes'>-. r <bes c' ees' bes'> <ees g bes ees'>4-^ r |
  <ees g bes ees'>4.\f <f bes c' f'>8 <g bes d' g'>4. <bes c' ees' bes'>8 |
  <c' ees' g' c''>1\> ~ |

  % Part III: Thick Harmonic Expansion (mm. 17-24)
  <c' ees' g' c''>1:32\f\! |
  <aes c' ees' aes'>1:32 |
  <bes d' f' bes'>1:32 |
  <ees g bes ees'>1:32 |
  <c' ees' g' c''>2:32\f <d' f' bes' d''>:32 |
  <ees' g' bes' ees''>2:32 <g' bes' d'' g''>:32 |
  <f' bes' c'' f''>8-.\ff <g' bes' d'' g''>-. r4 <bes' c'' ees'' bes''>8-. <c'' ees'' g'' c'''>-. r4 |
  <ees'' g'' bes'' ees'''>2.\ff r4 |

  % Part IV: Climax & Solitary Glowing Chord in the Silence (mm. 25-30)
  <ees' g' bes' ees''>4.\fff <f' bes' c'' f''>8 <g' bes' d'' g''>4. <bes' c'' ees'' bes''>8 |
  <c'' ees'' g'' c'''>4. <bes' c'' ees'' bes''>8 <g' bes' d'' g''>4. <c'' ees'' g'' c'''>8 |
  <bes' c'' ees'' bes''>8-. <c'' ees'' g'' c'''>-. <bes' c'' ees'' bes''>8-. <g' bes' d'' g''>-. <f' bes' c'' f''>8-. <ees' g' bes' ees''>-. <c' ees' g' c''>8-. <bes d' f' bes>-. |
  <ees' g' bes' ees''>4-^\fff r r2\fermata |
  <ees g bes d' g'>1:32\pp\fermata |
  r2 r4 r8 bes16\p( c' |

  % Part V: Resolution & Warm Fade (mm. 31-36)
  ees'16 f' g' bes' c'' ees'' f'' g'' bes''4-^)\! r |
  <ees' g' bes' ees''>1:32\fff ~ |
  <ees' g' bes' ees''>2. r4 |
  <ees' g' bes' ees''>4-^\fff r <ees' g' bes' ees''>4-^ r |
  <ees g bes ees'>1:32\fff\fermata \bar "|."
}

% =======================================================================
% 8. PERCUSSION 1: CONCERT SNARE & BASS DRUM
% =======================================================================
percussionOne = \drummode {
  % Part I: Breaths (mm. 1-8)
  R1 * 2 |
  sn4-^\f r r2\fermata |
  R1 * 4 |
  r2\! r4 r\fermata |

  % Part II: Staccato Groove (mm. 9-16)
  sn8-.\f sn-. r4 sn8-. sn-. r4 |
  sn8-. sn-. r sn sn4-^ r |
  <<
    {
      sn4.\f sn8 sn4 sn |
      sn4. sn8 sn2:32 |
      sn8-.\ff sn-. r4 sn8-. sn-. r4 |
      sn8-. sn-. r sn sn4-^ r |
      sn4.\f sn8 sn4 sn |
      sn1\> ~ |
    }
    \\
    {
      bd4\f r bd r |
      bd4 r bd2 |
      bd8-.\ff bd-. r4 bd8-. bd-. r4 |
      bd8-. bd-. r bd bd4-^ r |
      bd4\f r bd r |
      bd1\> ~ |
    }
  >>

  % Part III: Thick Groove (mm. 17-24)
  <<
    {
      sn4.\f\! sn8 sn4 sn |
      sn4. sn8 sn2:32 |
      sn8-.\ff sn-. r4 sn8-. sn-. r4 |
      sn1\> ~ |
      sn4.\f\! sn8 sn4 sn |
      sn4. sn8 sn2:32 |
      sn8-.\ff sn-. r4 sn8-. sn-. r4 |
      sn2.\ff r4 |
    }
    \\
    {
      bd4\f\! r bd r |
      bd4 r bd2 |
      bd8-.\ff bd-. r4 bd8-. bd-. r4 |
      bd1\> ~ |
      bd4\f\! r bd r |
      bd4 r bd2 |
      bd8-.\ff bd-. r4 bd8-. bd-. r4 |
      bd2.\ff r4 |
    }
  >>

  % Part IV: Climax & Grand Pause (mm. 25-30)
  sn4.\fff sn8 sn4 sn |
  sn4. sn8 sn4. sn8 |
  sn8-. sn-. sn8-. sn-. sn8-. sn-. sn8-. sn-. |
  sn4-^\fff r r2\fermata |
  R1\fermata |
  R1 |

  % Part V: Resolution (mm. 31-36)
  r2 r4 sn4-^\fff |
  sn1:32\fff ~ |
  sn2. r4 |
  sn4-^\fff r sn4-^ r |
  sn1:32\fff\fermata \bar "|."
}

% =======================================================================
% 9. PERCUSSION 2: CYMBALS (Crash & Suspended)
% =======================================================================
percussionTwo = \drummode {
  % Part I: Cymbals (mm. 1-8)
  R1 * 2 |
  cymc4-^\f r r2\fermata |
  cyms1:32\p\< ~ |
  cyms2\> ~ cyms4\! r\fermata |
  R1 * 2 |
  r2\! r4 r\fermata |

  % Part II: Accents (mm. 9-16)
  R1 |
  cymc4-^\f r r2 |
  R1 * 2 |
  cymc4-^\ff r cymc-^ r |
  cymc4-^ r r2 |
  R1 |
  cyms1:32\< |

  % Part III: Expansion (mm. 17-24)
  cymc4-^\f r r2 |
  r1 |
  cymc4-^\ff r cymc-^ r |
  cyms1:32\< |
  cymc4-^\f r r2 |
  r1 |
  cymc4-^\ff r cymc-^ r |
  cymc2.\ff r4 |

  % Part IV: Climax & Grand Pause (mm. 25-30)
  cymc4-^\fff r cymc-^ r |
  cymc4-^ r cymc-^ r |
  r1 |
  cymc4-^\fff r r2\fermata |
  R1\fermata |
  R1 |

  % Part V: Resolution (mm. 31-36)
  cyms2:32\p\< cymc4-^\fff r |
  cymc1:32\fff ~ |
  cymc2. r4 |
  cymc4-^\fff r cymc4-^ r |
  cymc1:32\fff\fermata \bar "|."
}

% =======================================================================
% 10. TIMPANI (Tuned to E♭, B♭, F)
% =======================================================================
timpaniConcert = \fixed c {
  \global
  \clef bass

  % Part I: Solitary Ground (mm. 1-8)
  R1 * 2 |
  ees4-^\f r r2\fermata |
  ees1:32\p\< ~ |
  ees2\> ~ ees4\! r\fermata |
  R1 * 2 |
  r2\! r4 r\fermata |

  % Part II: Staccato Punches (mm. 9-16)
  ees8-.\f ees-. r4 bes,8-. bes,-. r4 |
  ees8-. ees-. r ees bes,4-^ r |
  ees4.\f f8 bes,4. f8 |
  ees4. bes,8 ees2 |
  f8-.\ff f-. r4 bes,8-. bes,-. r4 |
  ees8-. ees-. r ees ees4-^ r |
  ees4.\f f8 bes,4. f8 |
  bes,1\> ~ |

  % Part III: Expansion (mm. 17-24)
  bes,4.\f\! f8 bes,4. f8 |
  bes,4. bes,8 ees2 |
  bes,8-.\ff bes,-. r4 f8-. f-. r4 |
  ees1\> ~ |
  ees4.\f\! d8 ees4. f8 |
  bes,4. bes,8 ees2 |
  bes,8-.\ff bes,-. r4 f8-. f-. r4 |
  ees2.\ff r4 |

  % Part IV: Climax & Grand Pause (mm. 25-30)
  ees4.\fff f8 bes,4. f8 |
  ees4. bes,8 ees4. c8 |
  bes,8-. c-. bes,8-. g,-. f,8-. ees,-. c,8-. bes,,-. |
  ees,4-^\fff r r2\fermata |
  R1\fermata |
  R1 |

  % Part V: Resolution (mm. 31-36)
  r2 r4 ees4-^\fff |
  ees1:32\fff ~ |
  ees2. r4 |
  ees4-^\fff r ees4-^ r |
  ees1:32\fff\fermata \bar "|."
}

% =======================================================================
% 11. VISUAL ENGRAVED SCORE
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

    \new StaffGroup = "Bass" <<
      \new Staff \with { instrumentName = #"Tuba / Bass" shortInstrumentName = #"Bs." } {
        \bassConcert
      }
    >>

    \new StaffGroup = "KeyboardPercussion" <<
      \new Staff \with { instrumentName = #"Marimba" shortInstrumentName = #"Mba." } {
        \marimbaConcert
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
% 12. AUDIO SYNTHESIS SCORE (Expressive Concert Band Rendering)
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
    \new Staff \with { midiInstrument = #"marimba" } {
      \marimbaConcert
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
