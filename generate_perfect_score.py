import os
import subprocess

def create_score():
    score_content = r"""\version "2.24.0"
\include "articulate.ly"

\header {
  title = "City of Evil Medley"
  subtitle = "A Symphonic Metal Rhapsody for Concert Band & Battery Percussion"
  composer = "Avenged Sevenfold"
  arranger = "Arranged for Wisconsin Rapids City Band by J. D. Dondlinger"
  tagline = "City of Evil Medley — Avenged Sevenfold (2005) | Arranged by John Daniel Dondlinger (2026)"
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
% 1. FLUTE (Piccolo / Flute Lead - Range: Eb4 to F6 [63-89])
% =======================================================================
flutePart = \fixed c {
  \clef treble
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \key d \minor
  \time 4/4
  \tempo "I. Beast and the Harlot — Allegro Feroce" 4 = 144
  R1*8 | % mm. 1-8: Rest
  % mm. 9-16: Main Riff Lead
  d''8.\f d''16 d''8 f'' g''8. f''16 d''8 c'' |
  d''4 r8 f'' g'' a'' bes'' a'' |
  g''8. f''16 d''8 f'' g''4 c''' |
  a''2. r4 |
  d''8. d''16 d''8 f'' g''8. f''16 d''8 c'' |
  d''4 r8 f'' g'' a'' bes'' a'' |
  g''8. f''16 d''8 f'' g''4 e'' |
  d''2. r4 |
  % mm. 17-20: Counterpoint
  f''8-.\f g''-. a''-. bes''-. c'''4-^ a''-^ |
  g''8-. f''-. d''-. f''-. g''4-^ r |
  f''8-. g''-. a''-. bes''-. c'''4-^ d'''-^ |
  a''2. r4 |
  % mm. 21-24: Rest (Breath recovery)
  R1*4 |
  % mm. 25-28: Chorus Climax Descants
  f''4.\ff e''8 d''4 c'' |
  bes'2. d''4 |
  e''4. f''8 g''4 a'' |
  d''1-^ |

  % --- Movement II: Bat Country (mm. 29-56) ---
  \tempo "II. Bat Country — Vivace con Brio" 4 = 126
  % mm. 29-32: Syncopated Lead Riff
  r8 d''16\ff d'' d''8 f'' g'' gis'' a'' r |
  r8 a''16 a'' g''8 f'' d'' c'' d'' r |
  r8 d''16 d'' d''8 f'' g'' gis'' a'' r |
  f''8-. e''-. d''-. c''-. d''4-^ r |
  % mm. 33-40: Rest (Breath recovery)
  R1*8 |
  % mm. 41-48: Pre-Chorus Swell & Flourish
  r2 r8 d''\mf( e'' f'' |
  g''8 a'' bes'' c''' d'''4.) r8 |
  r2 r8 d''8( e'' f'' |
  g''8 a'' bes'' c''' d'''2)\< |
  f''8-.\f g''-. a''-. bes''-. c'''4-^ d'''-^ |
  bes''8-. a''-. g''-. f''-. e''4-^ r |
  f''8-.\ff g''-. a''-. bes''-. c'''4-^ d'''-^ |
  e'''2.-^ r4 |
  % mm. 49-56: Bat Country Chorus Lead
  d'''4.\fff c'''8 a''4 f'' |
  g''4. a''8 bes''2 |
  a''4. g''8 f''4 d'' |
  e''2. r4 |
  d'''4. c'''8 a''4 f'' |
  g''4. a''8 bes''2 |
  c'''4. bes''8 a''4 g'' |
  f''1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  \key f \major
  \tempo "III. Seize the Day — Adagio Cantabile" 4 = 72
  % mm. 57-60: Pastoral Intro (Oboe Solo)
  R1*4 |
  % mm. 61-68: Lyrical Verse Melody
  f''4.\mf e''8 d''4 c'' |
  bes'4. a'8 g'2 |
  a'4. bes'8 c''4 d'' |
  c''2. r4 |
  f''4. e''8 d''4 c'' |
  bes'4. c''8 d''2 |
  e''4. f''8 g''4 e'' |
  f''1 |
  % mm. 69-72: Breath Recovery
  R1*4 |
  % mm. 73-76: Chorus Support & Countermelody
  d''4.\f c''8 bes'4 a' |
  bes'4. c''8 d''2 |
  c''4. bes'8 a'4 g' |
  f'2. r4 |
  % mm. 77-80: Breath Recovery
  R1*4 |
  % mm. 81-84: Solo Outro Duet
  d''4.\p e''8 f''4 g'' |
  a''2. g''4 |
  f''8( e'' d'' c'' bes' a' g' e') |
  f'1\fermata |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \key g \minor
  \time 3/4
  \tempo "IV. The Wicked End — Andante Maestoso" 4 = 88
  % mm. 85-96: Rest while low brass & choir lead
  R2.*12 |
  % mm. 97-100: Symphonic Choral Swell (in 3/4)
  d''4.\f c''8 bes'4 |
  a'2 g'4 |
  c''4. bes'8 a'4 |
  bes'2.\ff |
  % mm. 101-112: Orchestral March (in 4/4)
  \time 4/4
  \tempo "Moderato e Marcato" 4 = 100
  g''8-.\ff g''-. r4 bes''8-. bes''-. r4 |
  d'''8-. d'''-. r d''' c'''4-^ r |
  ees'''4.(\f d'''8 c'''4. bes''8 |
  a''2 d''2) |
  g''8-. g''-. r4 bes''8-. bes''-. r4 |
  c'''8-. c'''-. r c''' d'''4-^ r |
  ees'''4. d'''8 c'''4 a'' |
  g''2. r4 |
  bes''8-.\ff c'''-. d'''-. ees'''-. f'''4-^ d'''-^ |
  ees'''4. d'''8 c'''4 bes'' |
  a''8-. bes''-. c'''-. d'''-. ees'''4-^ c'''-^ |
  d'''1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \key d \minor
  \time 4/4
  \tempo "V. Blinded in Chains & Sidewinder — Presto Flamenco" 4 = 136
  % mm. 113-120: Rest during Thrash Breakdown
  R1*8 |
  % mm. 121-128: Sidewinder Flamenco Theme I (in 6/8)
  \time 6/8
  \tempo 4. = 92
  d''16\f e'' f'' g'' a'' bes'' a''8 g'' f'' |
  e''16 f'' g'' f'' e'' d'' cis''8 d'' e'' |
  f''16 g'' a'' g'' f'' e'' d''8 e'' f'' |
  e''4.~ e''4 r8 |
  d''16 e'' f'' g'' a'' bes'' a''8 g'' f'' |
  e''16 f'' g'' f'' e'' d'' cis''8 d'' e'' |
  f''16 g'' a'' bes'' c''' d''' cis'''8 d''' e''' |
  d'''4.~ d'''4 r8 |
  % mm. 129-136: Sidewinder Duel Trade-off (in 6/8)
  a''16\ff bes'' c''' bes'' a'' g'' f''8 g'' a'' |
  g''16 a'' bes'' a'' g'' f'' e''8 f'' g'' |
  f''16 g'' a'' g'' f'' e'' d''8 cis'' d'' |
  e''4.~ e''4 r8 |
  a''16 bes'' c''' bes'' a'' g'' f''8 g'' a'' |
  g''16 a'' bes'' a'' g'' f'' e''8 f'' g'' |
  f''16 g'' a'' bes'' c''' d''' e'''4-^ d'''8-^ |
  d'''4.~ d'''4 r8 |
  % mm. 137-144: Rest during accelerating gallop
  \time 4/4
  \tempo 4 = 136
  R1*8 |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  \tempo "VI. M.I.A. — Allegro Maestoso e Grandioso" 4 = 140
  % mm. 145-152: Acoustic Funeral March Lead
  d''4.\mf e''8 f''4. g''8 |
  a''2. g''4 |
  f''4. e''8 d''4. cis''8 |
  d''2. r4 |
  d''4. e''8 f''4. g''8 |
  a''2. c'''4 |
  bes''4. a''8 g''4. e''8 |
  d''1 |
  % mm. 153-160: Rest during heavy gallop rhythm
  R1*8 |
  % mm. 161-164: Pre-Chorus Lead-in
  f''8-.\f g''-. a''-. bes''-. c'''4-^ d'''-^ |
  ees'''4. d'''8 c'''4 bes'' |
  a''8-. bes''-. c'''-. d'''-. ees'''8-. f'''-. g'''4-^ |
  f'''1-^ |
  % mm. 165-176: Triumphant Anthem Chorus in D Major
  \key d \major
  d'''4.\ffff cis'''8 b''4 a'' |
  b''4. cis'''8 d'''2 |
  e'''4. d'''8 cis'''4 b'' |
  a''2. r4 |
  fis''4. e''8 d''4 cis'' |
  b'4. cis''8 d''2 |
  e''4. fis''8 g''4 a'' |
  d''2. r4 |
  d'''4. cis'''8 b''4 a'' |
  b''4. cis'''8 d'''2 |
  e'''4. fis'''8 e'''4 d''' |
  fis'''1 |
  % mm. 177-184: Grandioso Coda Finale
  d'''8-.\ffff cis'''-. b''-. a''-. g''-. fis''-. e''-. d''-. |
  fis''4-^ g''-^ a''2-^ |
  b''4-^ cis'''-^ d'''2-^ |
  e'''4-^ fis'''-^ g''2-^ |
  a''4-^ g''8-. fis''-. e''4-^ cis''-^ |
  d''2-^ fis''2-^ |
  a''2-^ d'''2-^ |
  <d'' fis'' a'' d'''>1\fermata\ffff \bar "|."
}

% =======================================================================
% 2. OBOE (Lyrical Pastoral Heart - Range: D4 to Eb5 [62-75])
% =======================================================================
oboePart = \fixed c {
  \clef treble
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \key d \minor
  \time 4/4
  R1*12 | % mm. 1-12: Rest
  % mm. 13-20: Lyrical Counterpoint
  a'4(\mf bes'8 c'' d''4 c''8 bes' |
  a'4. f'8 e'2) |
  f'8(\p g' a' bes' c''4. d''8 |
  c''8 bes' a' g' a'2) |
  d'4.(\mf e'8 f'4. g'8 |
  a'4. g'8 f'4 d') |
  e'8-. f'-. g'-. a'-. bes'4-. r |
  a'8-.(\> bes'-. a'-. g'-. f'2)\! |
  % mm. 21-28: Rest (Breath recovery)
  R1*8 |

  % --- Movement II: Bat Country (mm. 29-56) ---
  % mm. 29-36: Harmonic Rhythm
  r8 a\f( d' f' a'4) r |
  r8 g( c' e' g'4) r |
  r8 a( d' f' a'4) r |
  f'8-. e'-. d'-. c'-. d'4-^ r |
  f'4.(\mf g'8 a'4. bes'8 |
  c''4. bes'8 a'2) |
  g'4.(\p a'8 bes'4. c''8 |
  d''4. c''8 bes'2) |
  % mm. 37-44: Rest (Breath recovery)
  R1*8 |
  % mm. 45-56: Pre-Chorus Swell & Chorus Harmony
  f'8-.\f g'-. a'-. bes'-. c''4-^ d''-^ |
  bes'8-. a'-. g'-. f'-. e'4-^ r |
  f'8-.\ff g'-. a'-. bes'-. c''4-^ d''-^ |
  c''2.-^ r4 |
  d''4.\fff c''8 a'4 f' |
  g'4. a'8 bes'2 |
  f'4. e'8 d'4 f' |
  g'2. r4 |
  a'4. g'8 f'4 d' |
  e'4. f'8 g'2 |
  a'4. g'8 f'4 e' |
  d'1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  \key f \major
  % mm. 57-68: Solo Pastoral Oboe Theme & Duet
  c''4.\p(\< a'8 f'4. g'8\! |
  a'2.\> r4)\! |
  bes'4.\p(\< a'8 g'4. f'8\! |
  g'2.\> r4)\! |
  c''4.\mf( a'8 f'4. g'8 |
  a'4. bes'8 c''2) |
  d''4.( c''8 bes'4 a' |
  g'1) |
  f'4.(\p g'8 a'4 bes' |
  c''4. d''8 c''2) |
  bes'4.( a'8 g'4 f' |
  e'1) |
  % mm. 69-76: Rest (Breath recovery)
  R1*8 |
  % mm. 77-84: Solo Outro Singing Line
  f'4.(\mf g'8 a'4. bes'8 |
  c''4. d''8 c''2) |
  bes'4.( a'8 g'4. f'8 |
  g'1) |
  f'4.(\p g'8 a'4 bes' |
  c''2. bes'4 |
  a'8 g' f' e' d' c' bes c') |
  a1\fermata |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \key g \minor
  \time 3/4
  % mm. 85-96: Rest
  R2.*12 |
  % mm. 97-100: Symphonic Choir Harmony (in 3/4)
  bes'4.\f a'8 g'4 |
  fis'2 g'4 |
  g'4. fis'8 g'4 |
  g'2.\ff |
  % mm. 101-112: Orchestral March (in 4/4)
  \time 4/4
  d'8-.\ff d'-. r4 g'8-. g'-. r4 |
  bes'8-. bes'-. r bes' a'4-^ r |
  c''4.(\f bes'8 a'4. g'8 |
  fis'2 d'2) |
  d'8-. d'-. r4 g'8-. g'-. r4 |
  a'8-. a'-. r a' bes'4-^ r |
  c''4. bes'8 a'4 fis' |
  g'2. r4 |
  g'8-.\ff a'-. bes'-. c''-. d''4-^ bes'-^ |
  c''4. bes'8 a'4 g' |
  fis'8-. g'-. a'-. bes'-. c''4-^ a'-^ |
  bes'1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \key d \minor
  \time 4/4
  % mm. 113-120: Rest
  R1*8 |
  \time 6/8
  % mm. 121-126: Rest in 6/8
  R2.*6 |
  % mm. 127-136: Sidewinder Counter-Flamenco
  d'16\f e' f' g' a' bes' a'8 g' f' |
  e'16 f' g' f' e' d' cis'8 d' e' |
  f'16 g' a' bes' c'' d'' cis''8 d'' e'' |
  d''4.~ d''4 r8 |
  f'16\ff g' a' g' f' e' d'8 e' f' |
  e'16 f' g' f' e' d' cis'8 d' e' |
  d'16 e' f' g' a' bes' a'8 g' f' |
  e'4.~ e'4 r8 |
  f'16 g' a' bes' c'' d'' cis''8 d'' e'' |
  d''4.~ d''4 r8 |
  % mm. 137-144: Rest
  \time 4/4
  R1*8 |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Acoustic Funeral March Melody Duet
  a4.\mf b8 c'4. d'8 |
  e'2. d'4 |
  c'4. b8 a4. gis8 |
  a2. r4 |
  f'4. g'8 a'4. bes'8 |
  c''2. a'4 |
  g'4. f'8 e'4. cis'8 |
  d'1 |
  % mm. 153-164: Rest (Breath recovery)
  R1*12 |
  % mm. 165-172: Anthem Chorus Inner Harmony
  \key d \major
  fis'4.\ffff e'8 d'4 cis' |
  d'4. e'8 fis'2 |
  g'4. fis'8 e'4 d' |
  cis'2. r4 |
  d'4. cis'8 b4 a |
  g4. a8 b2 |
  cis'4. d'8 e'4 fis' |
  b2. r4 |
  % mm. 173-176: Rest (Breath recovery)
  R1*4 |
  % mm. 177-184: Grand Coda Finale
  fis'8-.\ffff e'-. d'-. cis'-. b-. a-. g-. fis-. |
  a4-^ b-^ d'2-^ |
  fis'4-^ g'-^ a'2-^ |
  b'4-^ cis''-^ d''2-^ |
  d''4-^ cis''8-. b'-. a'4-^ g'-^ |
  fis'2-^ a'2-^ |
  d''2-^ fis'2-^ |
  <d' fis' a'>1\fermata\ffff \bar "|."
}

% =======================================================================
% 3. B♭ CLARINET (Concert Pitch - Range: D3 to G5 [50-79])
% =======================================================================
clarinetPart = \fixed c {
  \clef treble
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \key d \minor
  \time 4/4
  R1*8 | % mm. 1-8: Rest
  % mm. 9-16: Dual Lead Harmony (in 3rds below Flute)
  a'8.\f a'16 a'8 d'' e''8. d''16 a'8 g' |
  a'4 r8 d'' e'' f'' g'' f'' |
  e''8. d''16 a'8 d'' e''4 g'' |
  f''2. r4 |
  a'8. a'16 a'8 d'' e''8. d''16 a'8 g' |
  a'4 r8 d'' e'' f'' g'' f'' |
  e''8. d''16 a'8 d'' e''4 c'' |
  a'2. r4 |
  % mm. 17-20: Rest (Breath recovery)
  R1*4 |
  % mm. 21-28: Chorus Lead & Arpeggio
  f'4.\ff e'8 d'4 c' |
  bes2. d'4 |
  e'4. f'8 g'4 a' |
  f'2. a'4 |
  d''4. c''8 bes'4 a' |
  g'2. bes'4 |
  c''4. d''8 e''4 f'' |
  d''1-^ |

  % --- Movement II: Bat Country (mm. 29-56) ---
  % mm. 29-32: Rest
  R1*4 |
  % mm. 33-44: Swaggering Verse Lead
  d'8\f d' d' d' d' c' a4 |
  c'8 c' c' c' c' a g4 |
  a8 a a a a g f4 |
  g8 f e f d2 |
  d'8 d' d' d' d' c' a4 |
  c'8 c' c' c' c' a g4 |
  a8 a a a a g f4 |
  d'1 |
  f'8-.\mf g'-. a'-. bes'-. c''4-^ a'-^ |
  bes'8-. a'-. g'-. f'-. e'4-^ r |
  f'8-. g'-. a'-. bes'-. c''4-^ d''-^ |
  a'2. r4 |
  % mm. 45-48: Rest (Breath recovery)
  R1*4 |
  % mm. 49-56: Chorus Harmonized Lead
  a'4.\fff g'8 f'4 d' |
  e'4. f'8 g'2 |
  f'4. e'8 d'4 bes |
  c'2. r4 |
  a'4. g'8 f'4 d' |
  e'4. f'8 g'2 |
  a'4. g'8 f'4 e' |
  d'1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  \key f \major
  % mm. 57-64: Harmonized 3rds under Oboe & Flute
  a4.\p(\< f8 d4. e8\! |
  f2.\> r4)\! |
  g4.\p(\< f8 e4. d8\! |
  e2.\> r4)\! |
  d'4.\mf c'8 bes4 a |
  g4. f8 e2 |
  f4. g8 a4 bes |
  a2. r4 |
  % mm. 65-68: Rest (Breath recovery)
  R1*4 |
  % mm. 69-80: Warm Clarinet Chorale
  f'4.\f e'8 d'4 c' |
  d'4. e'8 f'2 |
  g'4. f'8 e'4 d' |
  c'2. r4 |
  bes4. c'8 d'4 e' |
  f'4. g'8 a'2 |
  g'4. f'8 e'4 c' |
  f'2. r4 |
  a4.\mf bes8 c'4 d' |
  f'4. e'8 d'2 |
  g4. a8 bes4 c' |
  e'4. d'8 c'2 |
  % mm. 81-84: Rest (Breath recovery)
  R1*4 |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \key g \minor
  \time 3/4
  % mm. 85-96: Rest
  R2.*12 |
  % mm. 97-100: Symphonic Choir Line
  g'4.\f fis'8 g'4 |
  c''2 bes'4 |
  ees''4. d''8 c''4 |
  d''2.\ff |
  % mm. 101-112: Orchestral March (in 4/4)
  \time 4/4
  bes'8-.\ff bes'-. r4 d''8-. d''-. r4 |
  g''8-. g''-. r g'' f''4-^ r |
  g''4.(\f f''8 ees''4. d''8 |
  c''2 d'2) |
  bes'8-. bes'-. r4 d''8-. d''-. r4 |
  ees''8-. ees''-. r ees'' f''4-^ r |
  g''4. f''8 ees''4 c'' |
  bes'2. r4 |
  d''8-.\ff ees''-. f''-. g''-. a''4-^ f''-^ |
  g''4. f''8 ees''4 d'' |
  c''8-. d''-. ees''-. f''-. g''4-^ ees''-^ |
  fis''1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \key d \minor
  \time 4/4
  % mm. 113-120: Rest
  R1*8 |
  % mm. 121-132: Sidewinder Virtuosic Flamenco Solo (in 6/8)
  \time 6/8
  \tempo 4. = 92
  d'16\ff e' f' g' a' bes' a'8 g' f' |
  e'16 f' g' f' e' d' cis'8 d' e' |
  f'16 g' a' g' f' e' d'8 e' f' |
  e'4.~ e'4 r8 |
  d'16 e' f' g' a' bes' a'8 g' f' |
  e'16 f' g' f' e' d' cis'8 d' e' |
  f'16 g' a' bes' c'' d'' cis''8 d'' e'' |
  d''4.~ d''4 r8 |
  f'16 g' a' g' f' e' d'8 e' f' |
  g'16 a' bes' a' g' f' e'8 f' g' |
  a'16 bes' c'' bes' a' g' f'8 g' a' |
  e'4.~ e'4 r8 |
  % mm. 133-136: Rest (Breath recovery)
  R2.*4 |
  % mm. 137-144: Accelerating Gallop Drive (in 4/4)
  \time 4/4
  \tempo 4 = 136
  d'8-.\f e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ bes'-^ |
  a'2. r4 |
  d'8-.\ff e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ c''-^ |
  d''1-^ |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Rest during military march
  R1*8 |
  % mm. 153-164: Driving Gallop Tutti
  d'8-.\f e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ bes'-^ |
  c''1-^ |
  d'8-.\ff e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ d''-^ |
  a'1-^ |
  f'8-.\fff g'-. a'-. bes'-. c''4-^ d''-^ |
  e''4. d''8 c''4 bes' |
  a'8-. bes'-. c''-. d''-. e''-. f''-. g''4-^ |
  a'1-^ |
  % mm. 165-176: Triumphant Anthem Chorus in D Major
  \key d \major
  d''4.\ffff cis''8 b'4 a' |
  b'4. cis''8 d''2 |
  e''4. d''8 cis''4 b' |
  a'2. r4 |
  fis'4. e'8 d'4 cis' |
  b4. cis'8 d'2 |
  e'4. fis'8 g'4 a' |
  d'2. r4 |
  d''4. cis''8 b'4 a' |
  b'4. cis''8 d''2 |
  e''4. fis''8 g''4 a' |
  fis'1 |
  % mm. 177-184: Grand Coda Finale
  d''8-.\ffff cis''-. b'-. a'-. g'-. fis'-. e'-. d'-. |
  fis'4-^ g'-^ a'2-^ |
  b'4-^ cis''-^ d''2-^ |
  e''4-^ fis''-^ g'2-^ |
  a'4-^ g'8-. fis'-. e'4-^ cis'-^ |
  d'2-^ fis'2-^ |
  a'2-^ d''2-^ |
  <d' fis' a'>1\fermata\ffff \bar "|."
}

% =======================================================================
% 4. E♭ ALTO SAXOPHONE (Concert Pitch - Range: C4 to F5 [60-77])
% =======================================================================
altoSaxPart = \fixed c {
  \clef treble
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \key d \minor
  \time 4/4
  R1*8 | % mm. 1-8: Rest
  % mm. 9-20: Twin Lead Guitar Voice
  d'8.\f d'16 d'8 f' g'8. f'16 d'8 c' |
  d'4 r8 f' g' a' bes' a' |
  g'8. f'16 d'8 f' g'4 c'' |
  a'2. r4 |
  d'8. d'16 d'8 f' g'8. f'16 d'8 c' |
  d'4 r8 f' g' a' bes' a' |
  g'8. f'16 d'8 f' g'4 e' |
  d'2. r4 |
  d'8-.\f e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ bes'-^ |
  a'2. r4 |
  % mm. 21-24: Rest (Breath recovery)
  R1*4 |
  % mm. 25-28: Chorus Climax
  d''4.\ff c''8 bes'4 a' |
  g'2. bes'4 |
  c''4. d''8 e''4 f'' |
  d'1-^ |

  % --- Movement II: Bat Country (mm. 29-56) ---
  % mm. 29-32: Lead Staccato Riff
  r8 d'16\ff d' d'8 f' g' gis' a' r |
  r8 a'16 a' g'8 f' d' c' d' r |
  r8 d'16 d' d'8 f' g' gis' a' r |
  f'8-. e'-. d'-. c'-. d'4-^ r |
  % mm. 33-40: Rest (Breath recovery)
  R1*8 |
  % mm. 41-56: Pre-Chorus Swell & Chorus Lead
  r2 r8 d'\mf( e' f' |
  g'8 a' bes' c'' d''4.) r8 |
  r2 r8 d'( e' f' |
  g'8 a' bes' c'' d''2)\< |
  d'8-.\f e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-.\ff e'-. f'-. g'-. a'4-^ bes'-^ |
  a'2.-^ r4 |
  d''4.\fff c''8 a'4 f' |
  g'4. a'8 bes'2 |
  a'4. g'8 f'4 d' |
  e'2. r4 |
  d''4. c''8 a'4 f' |
  g'4. a'8 bes'2 |
  c''4. bes'8 a'4 g' |
  f'1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  \key f \major
  % mm. 57-68: Rest (Deep breath recovery before solo)
  R1*12 |
  % mm. 69-84: Synyster Gates Guitar Solo Lead (Concert Band Alto Sax)
  f'4.\f e'8 d'4 c' |
  d'4. e'8 f'2 |
  g'4. f'8 e'4 d' |
  c'2. r4 |
  d'4. c'8 bes4 a |
  bes4. c'8 d'2 |
  c'4. bes8 a4 g |
  f2. r4 |
  a'8.\ff bes'16 c''8 d'' f''4. e''8 |
  d''8 c'' bes' a' g'2 |
  bes'8. c''16 d''8 e'' g''4. f''8 |
  e''8 d'' c'' bes' a'2 |
  d'4. e'8 f'4 g' |
  a'2. g'4 |
  f'8( e' d' c' bes a g e) |
  f1\fermata |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \key g \minor
  \time 3/4
  % mm. 85-96: Rest
  R2.*12 |
  % mm. 97-100: Symphonic Choral Swell (in 3/4)
  d''4.\f c''8 bes'4 |
  a'2 g'4 |
  c''4. bes'8 a'4 |
  bes'2.\ff |
  % mm. 101-112: Orchestral March (in 4/4)
  \time 4/4
  g'8-.\ff g'-. r4 bes'8-. bes'-. r4 |
  d''8-. d''-. r d'' c''4-^ r |
  ees''4.(\f d''8 c''4. bes'8 |
  a'2 d'2) |
  g'8-. g'-. r4 bes'8-. bes'-. r4 |
  c''8-. c''-. r c'' d''4-^ r |
  ees''4. d''8 c''4 a' |
  g'2. r4 |
  bes'8-.\ff c''-. d''-. ees''-. f''4-^ d''-^ |
  ees''4. d''8 c''4 bes' |
  a'8-. bes'-. c''-. d''-. ees''4-^ c''-^ |
  d''1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \key d \minor
  \time 4/4
  % mm. 113-120: Blinded in Chains Stabs
  r8 <d' f' a'>4-^\f r8 <c' e' g'>4-^ r4 |
  r8 <d' f' a'>4-^ r8 <bes d' f'>4-^ r4 |
  r8 <d' f' a'>4-^\ff r8 <c' e' g'>4-^ r4 |
  r8 <d' f' a'>4-^ r8 <g bes d'>4-^ r4 |
  d'8-.\f e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ bes'-^ |
  a'1-^ |
  % mm. 121-128: Rest (Breath recovery)
  \time 6/8
  R2.*8 |
  % mm. 129-136: Sidewinder Flamenco Duel Partner
  a'16\ff bes' c'' bes' a' g' f'8 g' a' |
  g'16 a' bes' a' g' f' e'8 f' g' |
  f'16 g' a' g' f' e' d'8 cis' d' |
  e'4.~ e'4 r8 |
  a'16 bes' c'' bes' a' g' f'8 g' a' |
  g'16 a' bes' a' g' f' e'8 f' g' |
  f'16 g' a' bes' c'' d'' e''4-^ d''8-^ |
  d''4.~ d''4 r8 |
  % mm. 137-144: Transition Gallop
  \time 4/4
  \tempo 4 = 136
  d'8-.\f e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ bes'-^ |
  a'2. r4 |
  % mm. 141-144: Rest
  R1*4 |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Rest (Deep breath recovery)
  R1*8 |
  % mm. 153-168: Driving Gallop Lead
  d'8-.\ff e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ bes'-^ |
  c''1-^ |
  d'8-.\fff e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ d''-^ |
  a'1-^ |
  f'8-.\fff g'-. a'-. bes'-. c''4-^ d''-^ |
  e''4. d''8 c''4 bes' |
  a'8-. bes'-. c''-. d''-. e''-. f''-. g'4-^ |
  a'1-^ |
  d''4.\ffff c''8 bes'4 a' |
  g'4. a'8 bes'2 |
  c''4. bes'8 a'4 g' |
  a'1 |
  % mm. 169-172: Rest (Breath recovery)
  \key d \major
  R1*4 |
  % mm. 173-184: Triumphant Anthem Chorus & Grand Coda
  d''4.\ffff cis''8 b'4 a' |
  b'4. cis''8 d''2 |
  e''4. fis''8 g'4 a' |
  fis'1 |
  d''8-.\ffff cis''-. b'-. a'-. g'-. fis'-. e'-. d'-. |
  fis'4-^ g'-^ a'2-^ |
  b'4-^ cis''-^ d''2-^ |
  e''4-^ fis''-^ g'2-^ |
  a'4-^ g'8-. fis'-. e'4-^ cis'-^ |
  d'2-^ fis'2-^ |
  a'2-^ d''2-^ |
  <d' fis' a'>1\fermata\ffff \bar "|."
}

% =======================================================================
% 5. B♭ TRUMPET (Concert Pitch - Range: Bb3 to F5 [58-77])
% =======================================================================
trumpetPart = \fixed c {
  \clef treble
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \key d \minor
  \time 4/4
  R1*8 | % mm. 1-8: Rest
  % mm. 9-16: Punchy Fanfares
  d'4-^\f r r8 d' f' g' |
  a'4-^ r8 d'' a' g' f' e' |
  d'4-^ r r8 d' f' g' |
  a'2. r4 |
  d'4-^ r r8 d' f' g' |
  a'4-^ r8 d'' a' g' f' e' |
  d'4-^ r8 f' g'4 e' |
  d'2. r4 |
  % mm. 17-20: Rest (Breath recovery)
  R1*4 |
  % mm. 21-28: Chorus Lead Melody
  a'4.\ff g'8 f'4 e' |
  d'2. f'4 |
  g'4. f'8 e'4 d' |
  c'2. e'4 |
  f'4. e'8 d'4 c' |
  bes2. d'4 |
  e'4. f'8 g'4 a' |
  d'1-^ |

  % --- Movement II: Bat Country (mm. 29-56) ---
  % mm. 29-32: Chromatic Stabs
  r8 d'16\ff d' d'8 f' g' gis' a' r |
  r8 a'16 a' g'8 f' d' c' d' r |
  r8 d'16 d' d'8 f' g' gis' a' r |
  f'8-. e'-. d'-. c'-. d'4-^ r |
  % mm. 33-44: Rest (Breath recovery)
  R1*12 |
  % mm. 45-56: Pre-Chorus Swell & Soaring Chorus
  f'8-.\f g'-. a'-. bes'-. c''4-^ d''-^ |
  bes'8-. a'-. g'-. f'-. e'4-^ r |
  f'8-.\ff g'-. a'-. bes'-. c''4-^ d''-^ |
  e''2.-^ r4 |
  d''4.\fff c''8 a'4 f' |
  g'4. a'8 bes'2 |
  a'4. g'8 f'4 d' |
  e'2. r4 |
  d''4. c''8 a'4 f' |
  g'4. a'8 bes'2 |
  c''4. bes'8 a'4 g' |
  f'1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  \key f \major
  % mm. 57-68: Rest (Deep breath recovery before solo lead)
  R1*12 |
  % mm. 69-84: Soaring Solo Trumpet Theme & Duet
  f'4.\f e'8 d'4 c' |
  d'4. e'8 f'2 |
  g'4. f'8 e'4 d' |
  c'2. r4 |
  d'4. c'8 bes4 a |
  bes4. c'8 d'2 |
  c'4. bes8 a4 g |
  f2. r4 |
  a'8.\ff bes'16 c''8 d'' f''4. e''8 |
  d''8 c'' bes' a' g'2 |
  bes'8. c''16 d''8 e'' g'4. f'8 |
  e'8 d' c' bes a2 |
  d'4. e'8 f'4 g' |
  a'2. g'4 |
  f'8( e' d' c' bes a g e) |
  f1\fermata |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \key g \minor
  \time 3/4
  % mm. 85-96: Rest
  R2.*12 |
  % mm. 97-100: Symphonic Choral Climax (in 3/4)
  d''4.\f c''8 bes'4 |
  a'2 g'4 |
  c''4. bes'8 a'4 |
  bes'2.\ff |
  % mm. 101-112: Orchestral March (in 4/4)
  \time 4/4
  g'8-.\ff g'-. r4 bes'8-. bes'-. r4 |
  d''8-. d''-. r d'' c''4-^ r |
  ees''4.(\f d''8 c''4. bes'8 |
  a'2 d'2) |
  g'8-. g'-. r4 bes'8-. bes'-. r4 |
  c''8-. c''-. r c'' d''4-^ r |
  ees''4. d''8 c''4 a' |
  g'2. r4 |
  bes'8-.\ff c''-. d''-. ees''-. f''4-^ d''-^ |
  ees''4. d''8 c''4 bes' |
  a'8-. bes'-. c''-. d''-. ees''4-^ c''-^ |
  d''1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \key d \minor
  \time 4/4
  % mm. 113-120: Staccato Stabs
  r8 <d' f' a'>4-^\f r8 <c' e' g'>4-^ r4 |
  r8 <d' f' a'>4-^ r8 <bes d' f'>4-^ r4 |
  r8 <d' f' a'>4-^\ff r8 <c' e' g'>4-^ r4 |
  r8 <d' f' a'>4-^ r8 <g bes d'>4-^ r4 |
  d'4-^ r8 f' g'4-^ r8 a' |
  d'4-^ r8 f' g'4-^ r8 a' |
  d'8-.\f e'-. f'-. g'-. a'4-^ bes'-^ |
  a'1-^ |
  % mm. 121-128: Rest (Breath recovery)
  \time 6/8
  R2.*8 |
  % mm. 129-136: Sidewinder Duel Lead
  a'16\ff bes' c'' bes' a' g' f'8 g' a' |
  g'16 a' bes' a' g' f' e'8 f' g' |
  f'16 g' a' g' f' e' d'8 cis' d' |
  e'4.~ e'4 r8 |
  a'16 bes' c'' bes' a' g' f'8 g' a' |
  g'16 a' bes' a' g' f' e'8 f' g' |
  f'16 g' a' bes' c'' d'' e''4-^ d''8-^ |
  d''4.~ d''4 r8 |
  % mm. 137-144: Rest
  \time 4/4
  R1*8 |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Rest (Deep breath recovery)
  R1*8 |
  % mm. 153-168: Driving Gallop Fanfares
  d'4-^\ff r8 f' g'4-^ r8 a' |
  d'4-^ r8 f' g'4-^ r8 a' |
  d'8-.\fff e'-. f'-. g'-. a'4-^ bes'-^ |
  c''1-^ |
  d'4-^ r8 f' g'4-^ r8 a' |
  d'4-^ r8 f' g'4-^ r8 a' |
  d'8-. e'-. f'-. g'-. a'4-^ d''-^ |
  a'1-^ |
  f'8-.\fff g'-. a'-. bes'-. c''4-^ d''-^ |
  e''4. d''8 c''4 bes' |
  a'8-. bes'-. c''-. d''-. e''-. f''-. g'4-^ |
  a'1-^ |
  d''4.\ffff c''8 bes'4 a' |
  g'4. a'8 bes'2 |
  c''4. bes'8 a'4 g' |
  a'1 |
  % mm. 169-172: Rest (Breath recovery)
  \key d \major
  R1*4 |
  % mm. 173-184: Triumphant Anthem Chorus & Grand Coda
  d''4.\ffff cis''8 b'4 a' |
  b'4. cis''8 d''2 |
  e''4. fis''8 g'4 a' |
  fis'1 |
  d''8-.\ffff cis''-. b'-. a'-. g'-. fis'-. e'-. d'-. |
  fis'4-^ g'-^ a'2-^ |
  b'4-^ cis''-^ d''2-^ |
  e''4-^ fis''-^ g'2-^ |
  a'4-^ g'8-. fis'-. e'4-^ cis'-^ |
  d'2-^ fis'2-^ |
  a'2-^ d''2-^ |
  <d' fis' a'>1\fermata\ffff \bar "|."
}

% =======================================================================
% 6. FRENCH HORN IN F (Concert Pitch - Range: Bb3 to F5 [58-77])
% =======================================================================
hornPart = \fixed c {
  \clef treble
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \key d \minor
  \time 4/4
  R1*8 | % mm. 1-8: Rest
  % mm. 9-20: Mid-Register Riffs & Chords
  d'8.\f d'16 d'8 f' g'8. f'16 d'8 c' |
  d'4 r8 f' g' a' bes' a' |
  g'8. f'16 d'8 f' g'4 c'' |
  a'2. r4 |
  d'8. d'16 d'8 f' g'8. f'16 d'8 c' |
  d'4 r8 f' g' a' bes' a' |
  g'8. f'16 d'8 f' g'4 e' |
  d'2. r4 |
  f'4-.\f r8 c' f'4-. r8 c' |
  d'4-. f'8-. a'-. d''4-^ r |
  f'4-. r8 c' f'4-. r8 c' |
  d'2. r4 |
  % mm. 21-24: Rest (Breath recovery)
  R1*4 |
  % mm. 25-28: Chorus Climax
  d'4.\ff c'8 bes4 a |
  g2. bes4 |
  c'4. d'8 e'4 f' |
  d'1-^ |

  % --- Movement II: Bat Country (mm. 29-56) ---
  % mm. 29-32: Syncopated Stabs
  r8 a\ff( d' f' a'4) r |
  r8 g( c' e' g'4) r |
  r8 a( d' f' a'4) r |
  f'8-. e'-. d'-. c'-. d'4-^ r |
  % mm. 33-44: Rest (Breath recovery)
  R1*12 |
  % mm. 45-56: Pre-Chorus Swell & Chorus Lead
  f'8-.\f g'-. a'-. bes'-. c''4-^ d''-^ |
  bes'8-. a'-. g'-. f'-. e'4-^ r |
  f'8-.\ff g'-. a'-. bes'-. c''4-^ d''-^ |
  c''2.-^ r4 |
  a'4.\fff g'8 f'4 d' |
  e'4. f'8 g'2 |
  f'4. e'8 d'4 bes |
  c'2. r4 |
  a'4. g'8 f'4 d' |
  e'4. f'8 g'2 |
  a'4. g'8 f'4 e' |
  d'1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  \key f \major
  % mm. 57-68: Pastoral Warm French Horn Chorale
  c'1\p\< ~ |
  c'2\> r4\! c'\p |
  d'1\< ~ |
  d'2\> r4\! c'\p |
  f'4.\mf e'8 d'4 c' |
  bes4. a8 g2 |
  a4. bes8 c'4 d' |
  c'2. r4 |
  d'4. c'8 bes4 a |
  bes4. c'8 d'2 |
  c'4. bes8 a4 g |
  f1 |
  % mm. 69-72: Rest (Breath recovery)
  R1*4 |
  % mm. 73-84: Rich Horn Harmonies
  d'4.\f c'8 bes4 a |
  bes4. c'8 d'2 |
  c'4. bes8 a4 g |
  f2. r4 |
  f'4.\mf g'8 a'4 bes' |
  c''4. d''8 c''2 |
  bes'4. a'8 g'4 f' |
  e'2. r4 |
  f'4.\p g'8 a'4 bes' |
  c''2. bes'4 |
  a'8( g' f' e' d' c' bes c') |
  a1\fermata |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \key g \minor
  \time 3/4
  % mm. 85-96: Classical Choral Counterpoint (in 3/4)
  g4.\p fis8 g4 |
  a2 bes4 |
  c'4. bes8 a4 |
  bes2 g4 |
  d'4. c'8 bes4 |
  a2 g4 |
  fis2. ~ |
  fis2 r4 |
  g4.\mf fis8 g4 |
  a2 bes4 |
  c'4. bes8 a4 |
  bes2 g4 |
  % mm. 97-100: Rest (Breath recovery)
  R2.*4 |
  % mm. 101-112: Orchestral March (in 4/4)
  \time 4/4
  d'8-.\ff d'-. r4 g'8-. g'-. r4 |
  bes'8-. bes'-. r bes' a'4-^ r |
  c''4.(\f bes'8 a'4. g'8 |
  fis'2 d'2) |
  d'8-. d'-. r4 g'8-. g'-. r4 |
  a'8-. a'-. r a' bes'4-^ r |
  c''4. bes'8 a'4 fis' |
  g'2. r4 |
  g'8-.\ff a'-. bes'-. c''-. d''4-^ bes'-^ |
  c''4. bes'8 a'4 g' |
  fis'8-. g'-. a'-. bes'-. c''4-^ a'-^ |
  bes'1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \key d \minor
  \time 4/4
  % mm. 113-120: Stabs
  r8 <d' f' a'>4-^\f r8 <c' e' g'>4-^ r4 |
  r8 <d' f' a'>4-^ r8 <bes d' f'>4-^ r4 |
  r8 <d' f' a'>4-^\ff r8 <c' e' g'>4-^ r4 |
  r8 <d' f' a'>4-^ r8 <g bes d'>4-^ r4 |
  f'4-^ r8 c' f'4-^ r8 c' |
  d'4-^ r8 f' a'4-^ r8 d'' |
  d'8-.\f e'-. f'-. g'-. a'4-^ bes'-^ |
  a'1-^ |
  % mm. 121-132: Rest (Breath recovery)
  \time 6/8
  R2.*12 |
  % mm. 133-144: Sidewinder Pads & Transition Gallop
  f'4.~\mf f'4 r8 |
  g'4.~ g'4 r8 |
  a'4.~ a'4 r8 |
  e'4.~ e'4 r8 |
  \time 4/4
  \tempo 4 = 136
  d'8-.\f e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ bes'-^ |
  a'2. r4 |
  d'8-.\ff e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ c''-^ |
  d'1-^ |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Rest (Breath recovery)
  R1*8 |
  % mm. 153-168: Driving Gallop Chords
  d'4-^\ff r8 a d'4-^ r8 a |
  d'4-^ r8 a d'4-^ r8 a |
  d'8-.\fff e'-. f'-. g'-. a'4-^ bes'-^ |
  c''1-^ |
  d'4-^ r8 a d'4-^ r8 a |
  d'4-^ r8 a d'4-^ r8 a |
  d'8-. e'-. f'-. g'-. a'4-^ d''-^ |
  a'1-^ |
  f'8-.\fff g'-. a'-. bes'-. c''4-^ d''-^ |
  e''4. d''8 c''4 bes' |
  a'8-. bes'-. c''-. d''-. e''-. f''-. g'4-^ |
  a'1-^ |
  a'4.\ffff g'8 f'4 d' |
  e'4. f'8 g'2 |
  a'4. g'8 f'4 e' |
  f'1 |
  % mm. 169-172: Rest (Breath recovery)
  \key d \major
  R1*4 |
  % mm. 173-184: Triumphant Anthem Chorus & Grand Coda
  d'4.\ffff cis'8 b4 a |
  b4. cis'8 d'2 |
  e'4. fis'8 g'4 a' |
  fis'1 |
  d''8-.\ffff cis''-. b'-. a'-. g'-. fis'-. e'-. d'-. |
  fis'4-^ g'-^ a'2-^ |
  b'4-^ cis''-^ d''2-^ |
  e''4-^ fis''-^ g'2-^ |
  a'4-^ g'8-. fis'-. e'4-^ cis'-^ |
  d'2-^ fis'2-^ |
  a'2-^ d''2-^ |
  <d' fis' a'>1\fermata\ffff \bar "|."
}

% =======================================================================
% 7. TENOR TROMBONE (Bass Clef - Range: Eb2 to G4 [39-67])
% =======================================================================
trombonePart = \fixed c {
  \clef bass
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \key d \minor
  \time 4/4
  R1*8 | % mm. 1-8: Rest
  % mm. 9-20: Heavy Metal Power Riff
  d4-^\f r8 a, d4-^ r8 a, |
  d4-^ f8-. g-. a4-^ r |
  d4-^ r8 a, d4-^ r8 a, |
  f2. r4 |
  d4-^ r8 a, d4-^ r8 a, |
  d4-^ f8-. g-. a4-^ r |
  bes,4-^ r8 f, c4-^ r8 g, |
  d2. r4 |
  f4-.\f r8 c f4-. r8 c |
  d4-. f8-. a-. d'4-^ r |
  f4-. r8 c f4-. r8 c |
  d2. r4 |
  % mm. 21-24: Rest (Breath recovery)
  R1*4 |
  % mm. 25-28: Chorus Heavy Foundation
  bes,4.\ff c8 d4 f |
  g2. bes4 |
  c'4. d'8 e'4 f' |
  d1-^ |

  % --- Movement II: Bat Country (mm. 29-56) ---
  % mm. 29-32: Heavy Rhythmic Stabs
  d4-^\ff r8 a, d4-^ r |
  c4-^ r8 g, c4-^ r |
  d4-^ r8 a, d4-^ r |
  f8-. e-. d-. c-. d4-^ r |
  % mm. 33-40: Rest (Breath recovery)
  R1*8 |
  % mm. 41-56: Pre-Chorus Swell & Chorus Power Chords
  bes,8\mf bes, bes, bes, c c c c |
  d d d d f f f f |
  bes, bes, bes, bes, c c c c |
  d8\< e f g a2 |
  d4-.\f r8 a, d4-. r8 a, |
  c4-. r8 g, c4-. r8 g, |
  bes,4-.\ff r8 f, bes,4-. r8 f, |
  a,2.-^ r4 |
  d4.\fff e8 f4 a |
  bes4. c'8 d'2 |
  a4. g8 f4 d |
  c2. r4 |
  d4. e8 f4 a |
  bes4. c'8 d'2 |
  c'4. bes8 a4 g |
  f1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  \key f \major
  % mm. 57-68: Rest (Breath recovery during pastoral intro)
  R1*12 |
  % mm. 69-80: Warm Expressive Chorale
  f4.\f g8 a4 bes |
  c'4. d'8 c'2 |
  bes4. a8 g4 f |
  e2. r4 |
  bes,4. c8 d4 e |
  f4. g8 a2 |
  g4. f8 e4 c |
  f2. r4 |
  f4.\mf g8 a4 bes |
  c'4. d'8 c'2 |
  bes4. a8 g4 f |
  c1 |
  % mm. 81-84: Rest (Breath recovery)
  R1*4 |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \key g \minor
  \time 3/4
  % mm. 85-88: Rest in 3/4
  R2.*4 |
  % mm. 89-100: Classical Choral Counterpoint (in 3/4)
  g,4.\p fis,8 g,4 |
  a,2 bes,4 |
  c4. bes,8 a,4 |
  bes,2 g,4 |
  d4. c8 bes,4 |
  a,2 g,4 |
  fis,2. ~ |
  fis,2 r4 |
  g,4.\mf fis,8 g,4 |
  c2 bes,4 |
  ees4. d8 c4 |
  d2.\ff |
  % mm. 101-104: Rest (Breath recovery)
  \time 4/4
  R1*4 |
  % mm. 105-112: Heavy March Climax (in 4/4)
  g,8-.\ff g,-. r4 bes,8-. bes,-. r4 |
  c8-. c-. r c d4-^ r |
  ees4. d8 c4 a, |
  g,2. r4 |
  g,8-.\ff a,-. bes,-. c-. d4-^ bes,-^ |
  c4. bes,8 a,4 g, |
  fis,8-. g,-. a,-. bes,-. c4-^ a,-^ |
  bes,1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \key d \minor
  \time 4/4
  % mm. 113-120: Thrash Breakdown Heavy Rhythm
  d4-^\f r8 a, d4-^ r8 a, |
  d4-^ r8 a, d4-^ r8 a, |
  d4-^\ff r8 a, d4-^ r8 a, |
  d4-^ r8 a, d4-^ r8 a, |
  d8-. e-. f-. g-. a4-^ f-^ |
  g8-. f-. e-. d-. cis4-^ r |
  d8-. e-. f-. g-. a4-^ bes-^ |
  a1-^ |
  % mm. 121-132: Rest (Breath recovery during flamenco acoustic duel)
  \time 6/8
  R2.*12 |
  % mm. 133-144: Low Brass Driving Gallop
  d4.~\mf d4 r8 |
  c4.~ c4 r8 |
  bes,4.~ bes,4 r8 |
  a,4.~ a,4 r8 |
  \time 4/4
  \tempo 4 = 136
  d8-.\f e-. f-. g-. a4-^ f-^ |
  g8-. f-. e-. d-. cis4-^ r |
  d8-. e-. f-. g-. a4-^ bes-^ |
  a2. r4 |
  d8-.\ff e-. f-. g-. a4-^ f-^ |
  g8-. f-. e-. d-. cis4-^ r |
  d8-. e-. f-. g-. a4-^ c-^ |
  d1-^ |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Rest (Breath recovery during military march)
  R1*8 |
  % mm. 153-168: Blistering Metal Gallop & Power Chords
  d4-^\ff r8 a, d4-^ r8 a, |
  d4-^ r8 a, d4-^ r8 a, |
  d8-.\fff e-. f-. g-. a4-^ bes-^ |
  c'1-^ |
  d4-^ r8 a, d4-^ r8 a, |
  d4-^ r8 a, d4-^ r8 a, |
  d8-. e-. f-. g-. a4-^ d-^ |
  a1-^ |
  f8-.\fff g-. a-. bes-. c'4-^ d'-^ |
  e'4. d'8 c'4 bes |
  a8-. bes-. c'-. d'-. e'-. f'-. g4-^ |
  a1-^ |
  d4.\ffff e8 f4 a |
  bes4. c'8 d'2 |
  c'4. bes8 a4 g |
  f1 |
  % mm. 169-172: Rest (Breath recovery)
  \key d \major
  R1*4 |
  % mm. 173-184: Triumphant Anthem Chorus & Grand Coda
  d4.\ffff e8 fis4 a |
  b4. cis'8 d'2 |
  e'4. fis'8 g'4 a' |
  fis1 |
  d'8-.\ffff cis'-. b-. a-. g-. fis-. e-. d-. |
  fis4-^ g-^ a2-^ |
  b4-^ cis'-^ d'2-^ |
  e'4-^ fis'-^ g'2-^ |
  a4-^ g8-. fis-. e4-^ cis-^ |
  d2-^ fis2-^ |
  a2-^ d'2-^ |
  <d fis a>1\fermata\ffff \bar "|."
}

% =======================================================================
% 8. TUBA (Bass Clef - Range: Bb1 to F3 [34-53])
% =======================================================================
tubaPart = \fixed c {
  \clef bass
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \key d \minor
  \time 4/4
  R1*8 | % mm. 1-8: Rest
  % mm. 9-20: Thunderous Pedal Riff
  d,4-^\f r8 a,, d,4-^ r8 a,, |
  d,4-^ f,8-. g,-. a,4-^ r |
  d,4-^ r8 a,, d,4-^ r8 a,, |
  f,2. r4 |
  d,4-^ r8 a,, d,4-^ r8 a,, |
  d,4-^ f,8-. g,-. a,4-^ r |
  bes,,4-^ r8 f,, c,4-^ r8 g,, |
  d,2. r4 |
  f,4-.\f r8 c, f,4-. r8 c, |
  d,4-. f,8-. a,-. d4-^ r |
  f,4-. r8 c, f,4-. r8 c, |
  d,2. r4 |
  % mm. 21-24: Rest (Breath recovery)
  R1*4 |
  % mm. 25-28: Chorus Foundation
  bes,,4.\ff c,8 d,4 f, |
  g,2. bes,4 |
  c,4. d,8 e,4 f, |
  d,1-^ |

  % --- Movement II: Bat Country (mm. 29-56) ---
  % mm. 29-32: Syncopated Rhythmic Foundation
  d,4-^\ff r8 a,, d,4-^ r |
  c,4-^ r8 g,, c,4-^ r |
  d,4-^ r8 a,, d,4-^ r |
  f,8-. e,-. d,-. c,-. d,4-^ r |
  % mm. 33-40: Rest (Breath recovery)
  R1*8 |
  % mm. 41-56: Driving Pedal Points & Chorus
  bes,,8\mf bes,, bes,, bes,, c, c, c, c, |
  d, d, d, d, f, f, f, f, |
  bes,, bes,, bes,, bes,, c, c, c, c, |
  d,8\< e, f, g, a,2 |
  d,4-.\f r8 a,, d,4-. r8 a,, |
  c,4-. r8 g,, c,4-. r8 g,, |
  bes,,4-.\ff r8 f,, bes,,4-. r8 f,, |
  a,,2.-^ r4 |
  d,4.\fff e,8 f,4 a, |
  bes,4. c8 d2 |
  a,4. g,8 f,4 d, |
  c,2. r4 |
  d,4. e,8 f,4 a, |
  bes,4. c8 d2 |
  c,4. bes,,8 a,,4 g,, |
  f,,1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  \key f \major
  % mm. 57-68: Rest (Breath recovery)
  R1*12 |
  % mm. 69-80: Gentle Bass Foundation
  f,,4.\f g,,8 a,,4 bes,, |
  c,4. d,8 c,2 |
  bes,,4. a,,8 g,,4 f,, |
  c,2. r4 |
  bes,,4. c,8 d,4 e, |
  f,4. g,8 a,2 |
  g,4. f,8 e,4 c, |
  f,2. r4 |
  f,,4.\mf g,,8 a,,4 bes,, |
  c,4. d,8 c,2 |
  bes,,4. a,,8 g,,4 f,, |
  c,1 |
  % mm. 81-84: Rest (Breath recovery)
  R1*4 |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \key g \minor
  \time 3/4
  % mm. 85-88: Rest in 3/4
  R2.*4 |
  % mm. 89-100: Classical Low Choral Base (in 3/4)
  g,,4.\p fis,,8 g,,4 |
  a,,2 bes,,4 |
  c,4. bes,,8 a,,4 |
  bes,,2 g,,4 |
  d,4. c,8 bes,,4 |
  a,,2 g,,4 |
  fis,,2. ~ |
  fis,,2 r4 |
  g,,4.\mf fis,,8 g,,4 |
  c,2 bes,,4 |
  ees,4. d,8 c,4 |
  d,2.\ff |
  % mm. 101-104: Rest (Breath recovery)
  \time 4/4
  R1*4 |
  % mm. 105-112: March Climax
  g,,8-.\ff g,,-. r4 bes,,8-. bes,,-. r4 |
  c,8-. c,-. r c, d,4-^ r |
  ees,4. d,8 c,4 a,, |
  g,,2. r4 |
  g,,8-.\ff a,,-. bes,,-. c,-. d,4-^ bes,,-^ |
  c,4. bes,,8 a,,4 g,, |
  fis,,8-. g,,-. a,,-. bes,,-. c,4-^ a,,-^ |
  bes,,1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \key d \minor
  \time 4/4
  % mm. 113-120: Thrash Foundation
  d,4-^\f r8 a,, d,4-^ r8 a,, |
  d,4-^ r8 a,, d,4-^ r8 a,, |
  d,4-^\ff r8 a,, d,4-^ r8 a,, |
  d,4-^ r8 a,, d,4-^ r8 a,, |
  d,8-. e,-. f,-. g,-. a,4-^ f,-^ |
  g,8-. f,-. e,-. d,-. cis,4-^ r |
  d,8-. e,-. f,-. g,-. a,4-^ bes,-^ |
  a,1-^ |
  % mm. 121-132: Rest (Breath recovery)
  \time 6/8
  R2.*12 |
  % mm. 133-144: Low Driving Rhythm
  d,4.~\mf d,4 r8 |
  c,4.~ c,4 r8 |
  bes,,4.~ bes,,4 r8 |
  a,,4.~ a,,4 r8 |
  \time 4/4
  \tempo 4 = 136
  d,8-.\f e,-. f,-. g,-. a,4-^ f,-^ |
  g,8-. f,-. e,-. d,-. cis,4-^ r |
  d,8-. e,-. f,-. g,-. a,4-^ bes,-^ |
  a,2. r4 |
  d,8-.\ff e,-. f,-. g,-. a,4-^ f,-^ |
  g,8-. f,-. e,-. d,-. cis,4-^ r |
  d,8-. e,-. f,-. g,-. a,4-^ c,-^ |
  d,1-^ |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Rest (Breath recovery)
  R1*8 |
  % mm. 153-168: Epic Gallop Foundation
  d,4-^\ff r8 a,, d,4-^ r8 a,, |
  d,4-^ r8 a,, d,4-^ r8 a,, |
  d,8-.\fff e,-. f,-. g,-. a,4-^ bes,-^ |
  c,1-^ |
  d,4-^ r8 a,, d,4-^ r8 a,, |
  d,4-^ r8 a,, d,4-^ r8 a,, |
  d,8-. e,-. f,-. g,-. a,4-^ d-^ |
  a,1-^ |
  f,8-.\fff g,-. a,-. bes,-. c4-^ d-^ |
  e4. d8 c4 bes, |
  a,8-. bes,-. c-. d-. e-. f-. g4-^ |
  a1-^ |
  d,4.\ffff e,8 f,4 a, |
  bes,4. c8 d2 |
  c4. bes,8 a,4 g, |
  f,1 |
  % mm. 169-172: Rest (Breath recovery)
  \key d \major
  R1*4 |
  % mm. 173-184: Triumphant Anthem Chorus & Grand Coda
  d,4.\ffff e,8 fis,4 a, |
  b,4. cis8 d2 |
  e4. fis8 g4 a |
  d,1 |
  d,8-.\ffff cis,-. b,,-. a,,-. g,,-. fis,,-. e,,-. d,,-. |
  fis,,4-^ g,,-^ a,,2-^ |
  b,,4-^ cis,-^ d,2-^ |
  e,4-^ fis,-^ g,2-^ |
  a,,4-^ g,,8-. fis,,-. e,,4-^ cis,,-^ |
  d,,2-^ fis,,2-^ |
  a,,2-^ d,2-^ |
  d,,1\fermata\ffff \bar "|."
}

% =======================================================================
% 9. ELECTRIC BASS (Johnny Christ Basslines - Range: E1 to G3 [28-55])
% =======================================================================
electricBassPart = \fixed c {
  \clef bass
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \key d \minor
  \time 4/4
  R1*4 | % mm. 1-4: Drum solo
  % mm. 5-12: Johnny Christ Gallop
  d,8\ff d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, a, c |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, g, |
  bes,,8 bes,,16 bes,, bes,,8 bes,,16 bes,, c,8 c,16 c, c,8 c,16 c, |
  d,8 d,16 d, d,8 d,16 d, d,4 r |
  % mm. 13-20: Driving Verse Bass
  d,8\f d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, a, c |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,4 r |
  f,8\mf f,16 f, f,8 f,16 f, f,8 f, g, a, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, a, |
  f,8 f,16 f, f,8 f,16 f, f,8 f, g, a, |
  d,8 d,16 d, d,8 d,16 d, d,4 r |
  % mm. 21-28: Chorus Bass Foundation
  bes,,4.\ff c,8 d,4 f, |
  g,2. bes,4 |
  c,4. d,8 e,4 f, |
  d,2. a,4 |
  bes,,4. c,8 d,4 f, |
  g,2. bes,4 |
  c,4. d,8 e,4 f, |
  d,1-^ |

  % --- Movement II: Bat Country (mm. 29-56) ---
  % mm. 29-32: Syncopated Half-Time Verse Groove
  d,8\ff r r d,16 d, f,8 g, gis, a, |
  c,8 r r c,16 c, e,8 f, fis, g, |
  d,8 r r d,16 d, f,8 g, gis, a, |
  f,8-. e,-. d,-. c,-. d,4-^ r |
  % mm. 33-40: Walking Rock Bassline
  d,8\f d,16 d, d,8 d,16 d, d,8 d, f, a, |
  c,8 c,16 c, c,8 c,16 c, c,8 c, e, g, |
  bes,,8 bes,,16 bes,, bes,,8 bes,,16 bes,, bes,,8 bes,, d, f, |
  a,,8 a,,16 a,, a,,8 a,,16 a,, a,,4 r |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, a, |
  c,8 c,16 c, c,8 c,16 c, c,8 c, e, g, |
  bes,,8 bes,,16 bes,, bes,,8 bes,,16 bes,, bes,,8 bes,, d, f, |
  d,1 |
  % mm. 41-48: Pre-Chorus Driving 8ths
  bes,,8\mf bes,, bes,, bes,, c, c, c, c, |
  d, d, d, d, f, f, f, f, |
  bes,, bes,, bes,, bes,, c, c, c, c, |
  d,8\< e, f, g, a,2 |
  d,8\f d,16 d, d,8 d,16 d, d,8 d, f, a, |
  c,8 c,16 c, c,8 c,16 c, c,8 c, e, g, |
  bes,,8\ff bes,,16 bes,, bes,,8 bes,,16 bes,, bes,,8 bes,, d, f, |
  a,,2.-^ r4 |
  % mm. 49-56: Soaring Chorus
  d,4.\fff e,8 f,4 a, |
  bes,4. c8 d2 |
  a,4. g,8 f,4 d, |
  c,2. r4 |
  d,4. e,8 f,4 a, |
  bes,4. c8 d2 |
  c,4. bes,,8 a,,4 g,, |
  f,,1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  \key f \major
  % mm. 57-68: Lyrical Ballad Foundation
  f,,1\p\< ~ |
  f,,2\> r4\! f,, |
  d,1\< ~ |
  d,2\> r4\! d, |
  f,,4.\mf g,,8 a,,4 bes,, |
  c,4. d,8 c,2 |
  d,4. e,8 f,4 g, |
  c,2. r4 |
  f,,4. g,,8 a,,4 bes,, |
  c,4. d,8 c,2 |
  bes,,4. a,,8 g,,4 f,, |
  c,1 |
  % mm. 69-80: Swelling Expressive Bass
  f,,4.\f g,,8 a,,4 bes,, |
  c,4. d,8 c,2 |
  bes,,4. a,,8 g,,4 f,, |
  c,2. r4 |
  bes,,4. c,8 d,4 e, |
  f,4. g,8 a,2 |
  g,4. f,8 e,4 c, |
  f,2. r4 |
  f,,4.\mf g,,8 a,,4 bes,, |
  c,4. d,8 c,2 |
  bes,,4. a,,8 g,,4 f,, |
  c,1 |
  % mm. 81-84: Soft Resolving Outro
  f,,4.\p g,,8 a,,4 bes,, |
  c,2. bes,,4 |
  a,,8( g,, f,, e,, d,, c,, bes,, c,) |
  f,,1\fermata |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \key g \minor
  \time 3/4
  % mm. 85-100: Symphonic Choral Base (in 3/4)
  g,,4.\p fis,,8 g,,4 |
  a,,2 bes,,4 |
  c,4. bes,,8 a,,4 |
  bes,,2 g,,4 |
  d,4. c,8 bes,,4 |
  a,,2 g,,4 |
  fis,,2. ~ |
  fis,,2 r4 |
  g,,4.\mf fis,,8 g,,4 |
  a,,2 bes,,4 |
  c,4. bes,,8 a,,4 |
  bes,,2 g,,4 |
  g,,4.\f fis,,8 g,,4 |
  c,2 bes,,4 |
  ees,4. d,8 c,4 |
  d,2.\ff |
  % mm. 101-112: Orchestral March (in 4/4)
  \time 4/4
  g,,8-.\ff g,,-. r4 bes,,8-. bes,,-. r4 |
  d,8-. d,-. r d, c,4-^ r |
  ees,4.(\f d,8 c,4. bes,,8 |
  a,,2 d,2) |
  g,,8-. g,,-. r4 bes,,8-. bes,,-. r4 |
  c,8-. c,-. r c, d,4-^ r |
  ees,4. d,8 c,4 a,, |
  g,,2. r4 |
  g,,8-.\ff a,,-. bes,,-. c,-. d,4-^ bes,,-^ |
  c,4. bes,,8 a,,4 g,, |
  fis,,8-. g,,-. a,,-. bes,,-. c,4-^ a,,-^ |
  bes,,1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \key d \minor
  \time 4/4
  % mm. 113-120: Fast Galloping Thrash Bass
  d,8\ff d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, a, c |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,4 r |
  d,8-. e,-. f,-. g,-. a,4-^ f,-^ |
  g,8-. f,-. e,-. d,-. cis,4-^ r |
  d,8-. e,-. f,-. g,-. a,4-^ bes,-^ |
  a,1-^ |
  % mm. 121-136: Sidewinder Flamenco Walking Groove (in 6/8)
  \time 6/8
  d,4.\f f,8 g, a, |
  c,4. e,8 f, g, |
  bes,,4. d,8 e, f, |
  a,,4. cis,8 d, e, |
  d,4. f,8 g, a, |
  c,4. e,8 f, g, |
  bes,,4. c,8 d, e, |
  d,4.~ d,4 r8 |
  d,4.\ff f,8 g, a, |
  c,4. e,8 f, g, |
  bes,,4. d,8 e, f, |
  a,,4. cis,8 d, e, |
  d,4. f,8 g, a, |
  c,4. e,8 f, g, |
  bes,,8 c, d, e,4-^ d,8-^ |
  d,4.~ d,4 r8 |
  % mm. 137-144: Driving Accelerating Gallop (in 4/4)
  \time 4/4
  \tempo 4 = 136
  d,8-.\f e,-. f,-. g,-. a,4-^ f,-^ |
  g,8-. f,-. e,-. d,-. cis,4-^ r |
  d,8-. e,-. f,-. g,-. a,4-^ bes,-^ |
  a,2. r4 |
  d,8-.\ff e,-. f,-. g,-. a,4-^ f,-^ |
  g,8-. f,-. e,-. d,-. cis,4-^ r |
  d,8-. e,-. f,-. g,-. a,4-^ c,-^ |
  d,1-^ |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Acoustic Funeral March Sustained Foundation
  d,1\mf ~ |
  d,2. c,4 |
  bes,,1 ~ |
  bes,,2. a,,4 |
  d,1 ~ |
  d,2. f,4 |
  g,1 |
  d,1 |
  % mm. 153-164: Double-Kick Gallop Bassline
  d,8\ff d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, a, c |
  d,8-.\fff e,-. f,-. g,-. a,4-^ bes,-^ |
  c,1-^ |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, a, c |
  d,8-. e,-. f,-. g,-. a,4-^ d-^ |
  a,1-^ |
  f,8-.\fff g,-. a,-. bes,-. c4-^ d-^ |
  e4. d8 c4 bes, |
  a,8-. bes,-. c-. d-. e-. f-. g4-^ |
  a1-^ |
  % mm. 165-176: Triumphant Anthem Chorus in D Major
  \key d \major
  d,4.\ffff e,8 fis,4 a, |
  b,4. cis8 d2 |
  e4. fis8 g4 a |
  fis,2. r4 |
  d,4. e,8 fis,4 a, |
  b,4. cis8 d2 |
  e4. fis8 g4 a |
  d,2. r4 |
  d,4. e,8 fis,4 a, |
  b,4. cis8 d2 |
  e4. fis8 g4 a |
  d1 |
  % mm. 177-184: Grandioso Coda Finale
  d,8-.\ffff cis,-. b,,-. a,,-. g,,-. fis,,-. e,,-. d,,-. |
  fis,,4-^ g,,-^ a,,2-^ |
  b,,4-^ cis,-^ d,2-^ |
  e,4-^ fis,-^ g,2-^ |
  a,,4-^ g,,8-. fis,,-. e,,4-^ cis,,-^ |
  d,,2-^ fis,,2-^ |
  a,,2-^ d,2-^ |
  d,,1\fermata\ffff \bar "|."
}

% =======================================================================
% 10. CELLO (Lyrical Low Strings Support - Range: C2 to E4 [36-64])
% =======================================================================
celloPart = \fixed c {
  \clef bass
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \key d \minor
  \time 4/4
  R1*4 | % mm. 1-4: Drum solo
  % mm. 5-12: Rhythmic Support
  d,8\ff d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, a, c |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, g, |
  bes,,8 bes,,16 bes,, bes,,8 bes,,16 bes,, c,8 c,16 c, c,8 c,16 c, |
  d,8 d,16 d, d,8 d,16 d, d,4 r |
  % mm. 13-20: Counter-melodic Tenor Line
  f4(\f g8 a bes4 a8 g |
  f4. d8 c2) |
  d8(\mf e f g a4. bes8 |
  a8 g f e f2) |
  f4.(\f g8 a4. bes8 |
  c'4. bes8 a4 f) |
  g8-. a-. bes-. c'-. d'4-. r |
  c'8-.(\> d'-. c'-. bes-. a2)\! |
  % mm. 21-28: Chorus Foundation
  bes,4.\ff c8 d4 f |
  g2. bes4 |
  c4. d8 e4 f |
  d2. a4 |
  bes,4. c8 d4 f |
  g2. bes4 |
  c4. d8 e4 f |
  d1-^ |

  % --- Movement II: Bat Country (mm. 29-56) ---
  % mm. 29-32: Syncopated Riff Support
  d,8\ff r r d,16 d, f,8 g, gis, a, |
  c,8 r r c,16 c, e,8 f, fis, g, |
  d,8 r r d,16 d, f,8 g, gis, a, |
  f,8-. e,-. d,-. c,-. d,4-^ r |
  % mm. 33-40: Lyrical Low String Countermelody
  f4.(\mf g8 a4. bes8 |
  c'4. bes8 a2) |
  g4.( a8 bes4. c'8 |
  d'4. c'8 bes2) |
  f4.( g8 a4. bes8 |
  c'4. bes8 a2) |
  g4.( f8 e4 d |
  d1) |
  % mm. 41-48: Pre-Chorus Swell
  bes,8\mf bes, bes, bes, c c c c |
  d d d d f f f f |
  bes, bes, bes, bes, c c c c |
  d8\< e f g a2 |
  d4-.\f r8 a, d4-. r8 a, |
  c4-. r8 g, c4-. r8 g, |
  bes,4-.\ff r8 f, bes,4-. r8 f, |
  a,2.-^ r4 |
  % mm. 49-56: Chorus Power
  d4.\fff e8 f4 a |
  bes4. c'8 d'2 |
  a4. g8 f4 d |
  c2. r4 |
  d4. e8 f4 a |
  bes4. c'8 d'2 |
  c4. bes,8 a,4 g, |
  f,1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  \key f \major
  % mm. 57-68: Singing Tenor Melody Support
  f,1\p\< ~ |
  f,2\> r4\! f, |
  d,1\< ~ |
  d,2\> r4\! d, |
  f,4.\mf g,8 a,4 bes, |
  c4. d8 c2 |
  d4. e8 f4 g |
  c2. r4 |
  f,4. g,8 a,4 bes, |
  c4. d8 c2 |
  bes,4. a,8 g,4 f, |
  c1 |
  % mm. 69-80: Warm Singing Cello Lead
  f4.\f g8 a4 bes |
  c'4. d'8 c'2 |
  bes4. a8 g4 f |
  e2. r4 |
  bes,4. c8 d4 e |
  f4. g8 a2 |
  g4. f8 e4 c |
  f2. r4 |
  f4.\mf g8 a4 bes |
  c'4. d'8 c'2 |
  bes4. a8 g4 f |
  c1 |
  % mm. 81-84: Soft Resolving Outro
  f,4.\p g,8 a,4 bes, |
  c2. bes,4 |
  a,8( g, f, e, d, c, bes, c) |
  f,1\fermata |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \key g \minor
  \time 3/4
  % mm. 85-100: Classical Choral Counterpoint (in 3/4)
  g,4.\p fis,8 g,4 |
  a,2 bes,4 |
  c4. bes,8 a,4 |
  bes,2 g,4 |
  d4. c8 bes,4 |
  a,2 g,4 |
  fis,2. ~ |
  fis,2 r4 |
  g,4.\mf fis,8 g,4 |
  a,2 bes,4 |
  c4. bes,8 a,4 |
  bes,2 g,4 |
  g,4.\f fis,8 g,4 |
  c2 bes,4 |
  ees4. d8 c4 |
  d2.\ff |
  % mm. 101-112: Orchestral March (in 4/4)
  \time 4/4
  g,8-.\ff g,-. r4 bes,8-. bes,-. r4 |
  d8-. d-. r d c4-^ r |
  ees4.(\f d8 c4. bes,8 |
  a,2 d,2) |
  g,8-. g,-. r4 bes,8-. bes,-. r4 |
  c8-. c-. r c d4-^ r |
  ees4. d8 c4 a, |
  g,2. r4 |
  g,8-.\ff a,-. bes,-. c-. d4-^ bes,-^ |
  c4. bes,8 a,4 g, |
  fis,8-. g,-. a,-. bes,-. c4-^ a,-^ |
  bes,1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \key d \minor
  \time 4/4
  % mm. 113-120: Thrash Heavy Rhythm
  d,8\ff d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,8 d, a, c |
  d,8 d,16 d, d,8 d,16 d, d,8 d, f, g, |
  d,8 d,16 d, d,8 d,16 d, d,4 r |
  d8-. e-. f-. g-. a4-^ f-^ |
  g8-. f-. e-. d-. cis4-^ r |
  d8-. e-. f-. g-. a4-^ bes-^ |
  a1-^ |
  % mm. 121-136: Sidewinder Flamenco Harmony (in 6/8)
  \time 6/8
  d4.\f f8 g a |
  c4. e8 f g |
  bes,4. d8 e f |
  a,4. cis8 d e |
  d4. f8 g a |
  c4. e8 f g |
  bes,4. c8 d e |
  d4.~ d4 r8 |
  d4.\ff f8 g a |
  c4. e8 f g |
  bes,4. d8 e f |
  a,4. cis8 d e |
  d4. f8 g a |
  c4. e8 f g |
  bes,8 c d e4-^ d8-^ |
  d4.~ d4 r8 |
  % mm. 137-144: Driving Accelerating Gallop (in 4/4)
  \time 4/4
  \tempo 4 = 136
  d8-.\f e-. f-. g-. a4-^ f-^ |
  g8-. f-. e-. d-. cis4-^ r |
  d8-. e-. f-. g-. a4-^ bes-^ |
  a2. r4 |
  d8-.\ff e-. f-. g-. a4-^ f-^ |
  g8-. f-. e-. d-. cis4-^ r |
  d8-. e-. f-. g-. a4-^ c-^ |
  d1-^ |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Acoustic Funeral March Countermelody
  d1\mf ~ |
  d2. c4 |
  bes,1 ~ |
  bes,2. a,4 |
  d1 ~ |
  d2. f4 |
  g1 |
  d1 |
  % mm. 153-164: Double-Kick Gallop Support
  d4-^\ff r8 a, d4-^ r8 a, |
  d4-^ r8 a, d4-^ r8 a, |
  d8-.\fff e-. f-. g-. a4-^ bes-^ |
  c'1-^ |
  d4-^ r8 a, d4-^ r8 a, |
  d4-^ r8 a, d4-^ r8 a, |
  d8-. e-. f-. g-. a4-^ d-^ |
  a1-^ |
  f8-.\fff g-. a-. bes-. c'4-^ d'-^ |
  e'4. d'8 c'4 bes |
  a8-. bes-. c'-. d'-. e'-. f'-. g4-^ |
  a1-^ |
  % mm. 165-176: Triumphant Anthem Chorus in D Major
  \key d \major
  d4.\ffff e8 fis4 a |
  b4. cis'8 d'2 |
  e'4. fis'8 g4 a |
  fis2. r4 |
  d4. e8 fis4 a |
  b4. cis'8 d'2 |
  e'4. fis'8 g4 a |
  d2. r4 |
  d4. e8 fis4 a |
  b4. cis'8 d'2 |
  e'4. fis'8 g4 a |
  d'1 |
  % mm. 177-184: Grandioso Coda Finale
  d'8-.\ffff cis'-. b-. a-. g-. fis-. e-. d-. |
  fis4-^ g-^ a2-^ |
  b4-^ cis'-^ d'2-^ |
  e'4-^ fis'-^ g2-^ |
  a4-^ g8-. fis-. e4-^ cis-^ |
  d2-^ fis2-^ |
  a2-^ d'2-^ |
  <d fis a>1\fermata\ffff \bar "|."
}

% =======================================================================
% 11. GLOCKENSPIEL (Metallic Sparkle - Range: Bb5 to D7 [82-98])
% =======================================================================
glockPart = \fixed c' {
  \clef treble
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \key d \minor
  \time 4/4
  R1*20 | % mm. 1-20: Rest
  % mm. 21-28: Chorus Sparkle
  d'''4.\ff c'''8 bes''4 a'' |
  g''2. bes''4 |
  c'''4. d'''8 e'''4 f''' |
  d'''2. a''4 |
  d'''4. c'''8 bes''4 a'' |
  g''2. bes''4 |
  c'''4. d'''8 e'''4 f''' |
  d'''1-^ |

  % --- Movement II: Bat Country (mm. 29-56) ---
  R1*20 | % mm. 29-48: Rest
  % mm. 49-56: Bat Country Chorus Climax Sparkle
  d'''4.\fff c'''8 a''4 f'' |
  g''4. a''8 bes''2 |
  a''4. g''8 f''4 d'' |
  e''2. r4 |
  d'''4. c'''8 a''4 f'' |
  g''4. a''8 bes''2 |
  c'''4. bes''8 a''4 g'' |
  f''1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  \key f \major
  R1*12 | % mm. 57-68: Rest
  % mm. 69-84: Soft Shimmer over Guitar Solo
  f''4.\p g''8 a''4 bes'' |
  c'''4. d'''8 c'''2 |
  bes''4. a''8 g''4 f'' |
  e''2. r4 |
  bes''4. c'''8 d'''4 e''' |
  f'''4. g''8 a''2 |
  g''4. f''8 e''4 c'' |
  f''2. r4 |
  a''8.\mf bes''16 c'''8 d''' f'''4. e'''8 |
  d'''8 c''' bes'' a'' g''2 |
  bes''8. c'''16 d'''8 e''' g''4. f''8 |
  e''8 d'' c'' bes' a'2 |
  d'''4. e'''8 f'''4 g'' |
  a''2. g''4 |
  f'''8( e''' d''' c''' bes'' a'' g'' e'') |
  f''1\fermata |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \key g \minor
  \time 3/4
  R2.*16 | % mm. 85-100: Rest
  % mm. 101-112: Orchestral March Sparkle (in 4/4)
  \time 4/4
  g''8-.\ff g''-. r4 bes''8-. bes''-. r4 |
  d'''8-. d'''-. r d''' c'''4-^ r |
  ees'''4.(\f d'''8 c'''4. bes''8 |
  a''2 d''2) |
  g''8-. g''-. r4 bes''8-. bes''-. r4 |
  c'''8-. c'''-. r c''' d'''4-^ r |
  ees'''4. d'''8 c'''4 a'' |
  g''2. r4 |
  bes''8-.\ff c'''-. d'''-. ees'''-. f'''4-^ d'''-^ |
  ees'''4. d'''8 c'''4 bes'' |
  a''8-. bes''-. c'''-. d'''-. ees'''4-^ c'''-^ |
  d'''1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \key d \minor
  \time 4/4
  R1*8 | % mm. 113-120: Rest
  \time 6/8
  R2.*16 | % mm. 121-136: Rest
  \time 4/4
  R1*8 | % mm. 137-144: Rest

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  R1*16 | % mm. 145-160: Rest
  % mm. 161-164: Pre-Chorus Shimmer
  f''8-.\f g''-. a''-. bes''-. c'''4-^ d'''-^ |
  e'''4. d'''8 c'''4 bes'' |
  a''8-. bes''-. c'''-. d'''-. e'''-. f'''-. g''4-^ |
  a''1-^ |
  % mm. 165-176: Anthem Chorus in D Major
  \key d \major
  d'''4.\ffff cis'''8 b''4 a'' |
  b''4. cis'''8 d'''2 |
  e'''4. d'''8 cis'''4 b'' |
  a''2. r4 |
  fis''4. e''8 d''4 cis'' |
  b'4. cis''8 d''2 |
  e''4. fis''8 g''4 a'' |
  d''2. r4 |
  d'''4. cis'''8 b''4 a'' |
  b''4. cis'''8 d'''2 |
  e'''4. fis'''8 g''4 a'' |
  fis''1 |
  % mm. 177-184: Grand Coda Shimmer
  d'''8-.\ffff cis'''-. b''-. a''-. g''-. fis''-. e''-. d''-. |
  fis''4-^ g''-^ a''2-^ |
  b''4-^ cis'''-^ d'''2-^ |
  e'''4-^ fis'''-^ g''2-^ |
  a''4-^ g''8-. fis''-. e''4-^ cis''-^ |
  d''2-^ fis''2-^ |
  a''2-^ d'''2-^ |
  <d'' fis'' a'' d'''>1\fermata\ffff \bar "|."
}

% =======================================================================
% 12. MARIMBA (Flamenco & Mallets - Range: C3 to G5 [48-79])
% =======================================================================
marimbaPart = \fixed c {
  \clef treble
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \key d \minor
  \time 4/4
  R1*8 | % mm. 1-8: Rest
  % mm. 9-16: Staccato Mallet Riff
  d'8.\f d'16 d'8 f' g'8. f'16 d'8 c' |
  d'4 r8 f' g' a' bes' a' |
  g'8. f'16 d'8 f' g'4 c'' |
  a'2. r4 |
  d'8. d'16 d'8 f' g'8. f'16 d'8 c' |
  d'4 r8 f' g' a' bes' a' |
  g'8. f'16 d'8 f' g'4 e' |
  d'2. r4 |
  % mm. 17-20: Drive
  d'8-.\f e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ bes'-^ |
  a'2. r4 |
  % mm. 21-28: Chorus Arpeggios
  bes4.\ff c'8 d'4 f' |
  g'2. bes'4 |
  c'4. d'8 e'4 f' |
  d'2. a'4 |
  bes4. c'8 d'4 f' |
  g'2. bes'4 |
  c'4. d'8 e'4 f' |
  d'1-^ |

  % --- Movement II: Bat Country (mm. 29-56) ---
  % mm. 29-32: Syncopated Stabs
  r8 d'16\ff d' d'8 f' g' gis' a' r |
  r8 a'16 a' g'8 f' d' c' d' r |
  r8 d'16 d' d'8 f' g' gis' a' r |
  f'8-. e'-. d'-. c'-. d'4-^ r |
  % mm. 33-40: Mallet Arpeggios
  d'8\mf a' f' a' d' a' f' a' |
  c'8 g' e' g' c' g' e' g' |
  bes8 f' d' f' bes f' d' f' |
  a8 e' cis' e' a e' cis' e' |
  d'8 a' f' a' d' a' f' a' |
  c'8 g' e' g' c' g' e' g' |
  bes8 f' d' f' bes f' d' f' |
  d'1 |
  % mm. 41-48: Pre-Chorus
  bes8\mf bes bes bes c' c' c' c' |
  d' d' d' d' f' f' f' f' |
  bes bes bes bes c' c' c' c' |
  d'8\< e' f' g' a'2 |
  d'8\f a' f' a' d' a' f' a' |
  c'8 g' e' g' c' g' e' g' |
  bes8\ff f' d' f' bes f' d' f' |
  a2.-^ r4 |
  % mm. 49-56: Chorus
  d'4.\fff e'8 f'4 a' |
  bes'4. c''8 d''2 |
  a'4. g'8 f'4 d' |
  c'2. r4 |
  d'4. e'8 f'4 a' |
  bes'4. c''8 d''2 |
  c'4. bes8 a4 g |
  f1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  \key f \major
  % mm. 57-68: Rolling Mallet Arpeggios
  f8\p c' a c' f c' a c' |
  f8 c' a c' f c' a c' |
  d8 a f a d a f a |
  d8 a f a d a f a |
  f8\mf c' a c' f c' a c' |
  c8 g e g c g e g |
  d8 a f a d a f a |
  c8 g e g c g e g |
  f8 c' a c' f c' a c' |
  c8 g e g c g e g |
  bes,8 f d f bes, f d f |
  c8 g e g c g e g |
  % mm. 69-84: Warm Chorus Accompaniment
  f8\f c' a c' f c' a c' |
  c8 g e g c g e g |
  bes,8 f d f bes, f d f |
  c8 g e g c g e g |
  bes,8 f d f bes, f d f |
  f8 c' a c' f c' a c' |
  g8 d' bes d' c8 g e g |
  f8 c' a c' f c' a c' |
  f8\mf c' a c' f c' a c' |
  c8 g e g c g e g |
  bes,8 f d f bes, f d f |
  c8 g e g c g e g |
  f8\p c' a c' f c' a c' |
  c8 g e g c g e g |
  bes,8 f d f c g e g |
  f1\fermata |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \key g \minor
  \time 3/4
  R2.*16 | % mm. 85-100: Rest
  % mm. 101-112: Orchestral March (in 4/4)
  \time 4/4
  g8-.\ff g-. r4 bes8-. bes-. r4 |
  d'8-. d'-. r d' c'4-^ r |
  ees'4.(\f d'8 c'4. bes8 |
  a2 d'2) |
  g8-. g-. r4 bes8-. bes-. r4 |
  c'8-. c'-. r c' d'4-^ r |
  ees'4. d'8 c'4 a |
  g2. r4 |
  g8-.\ff a-. bes-. c'-. d'4-^ bes-^ |
  c'4. bes8 a4 g |
  fis8-. g-. a-. bes-. c'4-^ a-^ |
  bes1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \key d \minor
  \time 4/4
  R1*8 | % mm. 113-120: Rest
  % mm. 121-136: Sidewinder Spanish Flamenco Duel (in 6/8)
  \time 6/8
  d'16\ff e' f' g' a' bes' a'8 g' f' |
  e'16 f' g' f' e' d' cis'8 d' e' |
  f'16 g' a' g' f' e' d'8 e' f' |
  e'4.~ e'4 r8 |
  d'16 e' f' g' a' bes' a'8 g' f' |
  e'16 f' g' f' e' d' cis'8 d' e' |
  f'16 g' a' bes' c'' d'' cis''8 d'' e'' |
  d''4.~ d''4 r8 |
  f'16 g' a' g' f' e' d'8 e' f' |
  g'16 a' bes' a' g' f' e'8 f' g' |
  a'16 bes' c'' bes' a' g' f'8 g' a' |
  e'4.~ e'4 r8 |
  f'16 g' a' bes' c'' d'' cis''8 d'' e'' |
  d''4.~ d''4 r8 |
  f'16 g' a' bes' c'' d'' e''4-^ d''8-^ |
  d''4.~ d''4 r8 |
  % mm. 137-144: Driving Accelerating Gallop (in 4/4)
  \time 4/4
  \tempo 4 = 136
  d'8-.\f e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ bes'-^ |
  a'2. r4 |
  d'8-.\ff e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ c''-^ |
  d''1-^ |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Acoustic Funeral March Mallet Arpeggios
  d8\mf a f a d a f a |
  d8 a f a c g e g |
  bes,8 f d f bes, f d f |
  a,8 e cis e a, e cis e |
  d8 a f a d a f a |
  d8 a f a f c' a c' |
  g8 d' bes d' e b g b |
  d1 |
  % mm. 153-164: Driving Gallop
  d'8-.\ff e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-.\fff e'-. f'-. g'-. a'4-^ bes'-^ |
  c''1-^ |
  d'8-.\fff e'-. f'-. g'-. a'4-^ f'-^ |
  g'8-. f'-. e'-. d'-. cis'4-^ r |
  d'8-. e'-. f'-. g'-. a'4-^ d''-^ |
  a'1-^ |
  f'8-.\fff g'-. a'-. bes'-. c''4-^ d''-^ |
  e''4. d''8 c''4 bes' |
  a'8-. bes'-. c''-. d''-. e''-. f''-. g'4-^ |
  a'1-^ |
  % mm. 165-176: Anthem Chorus in D Major
  \key d \major
  d'4.\ffff cis'8 b4 a |
  b4. cis'8 d'2 |
  e'4. d'8 cis'4 b |
  a2. r4 |
  fis'4. e'8 d'4 cis' |
  b4. cis'8 d'2 |
  e'4. fis'8 g'4 a' |
  d'2. r4 |
  d'4. cis'8 b4 a |
  b4. cis'8 d'2 |
  e'4. fis'8 g'4 a' |
  fis'1 |
  % mm. 177-184: Grandioso Coda Finale
  d''8-.\ffff cis''-. b'-. a'-. g'-. fis'-. e'-. d'-. |
  fis'4-^ g'-^ a'2-^ |
  b'4-^ cis''-^ d''2-^ |
  e''4-^ fis''-^ g'2-^ |
  a'4-^ g'8-. fis'-. e'4-^ cis'-^ |
  d'2-^ fis'2-^ |
  a'2-^ d''2-^ |
  <d' fis' a'>1\fermata\ffff \bar "|."
}

% =======================================================================
% 13. TIMPANI (4 Kettles Strictly: F2, Bb2, C3, Eb3 -> f,, bes,, c, ees, [41, 46, 48, 51])
% =======================================================================
timpaniPart = \fixed c' {
  \clef bass
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \key d \minor
  \time 4/4
  R1*4 | % mm. 1-4: Drum solo
  % mm. 5-12: Timpani Accents (F2, Bb2, C3)
  f,,4-^\ff r8 f,, f,,4-^ r8 f,, |
  f,,4-^ r8 f,, c,4-^ r |
  f,,4-^ r8 f,, f,,4-^ r8 f,, |
  f,,2. r4 |
  f,,4-^ r8 f,, f,,4-^ r8 f,, |
  f,,4-^ r8 f,, c,4-^ r |
  bes,,4-^ r8 bes,, c,4-^ r8 c, |
  f,,2. r4 |
  % mm. 13-20: Driving Verse Accents
  f,,4-.\f r8 f,, f,,4-. r8 f,, |
  f,,4-. r8 f,, c,4-^ r |
  f,,4-. r8 f,, f,,4-. r8 f,, |
  f,,2. r4 |
  f,,4-.\mf r8 f,, f,,4-. r8 f,, |
  f,,4-. r8 f,, c,4-^ r |
  bes,,4-. r8 bes,, c,4-^ r8 c, |
  f,,2. r4 |
  % mm. 21-28: Chorus Climax (F2, Bb2, C3)
  bes,,4.\ff c,8 bes,,4 f,, |
  bes,,2. bes,,4 |
  c,4. c,8 c,4 f,, |
  f,,2. c,4 |
  bes,,4. c,8 bes,,4 f,, |
  bes,,2. bes,,4 |
  c,4. c,8 c,4 c, |
  f,,1-^ |

  % --- Movement II: Bat Country (mm. 29-56) ---
  % mm. 29-32: Syncopated Accents
  f,,4-^\ff r8 f,, f,,4-^ r |
  c,4-^ r8 c, c,4-^ r |
  f,,4-^ r8 f,, f,,4-^ r |
  f,,8-. f,,-. f,,-. f,,-. f,,4-^ r |
  % mm. 33-40: Rest
  R1*8 |
  % mm. 41-48: Pre-Chorus Swell Roll (Bb2 & C3)
  bes,,8\mf bes,, bes,, bes,, c, c, c, c, |
  f,, f,, f,, f,, f,, f,, f,, f,, |
  bes,, bes,, bes,, bes,, c, c, c, c, |
  f,,1:32\< |
  f,,4-.\f r8 f,, f,,4-. r8 f,, |
  c,4-. r8 c, c,4-. r8 c, |
  bes,,4-.\ff r8 bes,, bes,,4-. r8 bes,, |
  c,2.-^ r4 |
  % mm. 49-56: Chorus Climax
  f,,4.\fff c,8 f,,4 f,, |
  bes,,4. bes,,8 bes,,2 |
  c,4. c,8 f,,4 f,, |
  c,2. r4 |
  f,,4. c,8 f,,4 f,, |
  bes,,4. bes,,8 bes,,2 |
  c,4. bes,,8 c,4 c, |
  f,,1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  \key f \major
  % mm. 57-68: Rest during pastoral theme
  R1*12 |
  % mm. 69-80: Soft Warm Rolls (F2, Bb2, C3)
  f,,1:32\p\< ~ |
  f,,2\f\> f,,4 r\! |
  bes,,1:32\p\< ~ |
  bes,,2\f\> bes,,4 r\! |
  bes,,4.\f c,8 bes,,4 r |
  bes,,4. c,8 bes,,2 |
  c,4. c,8 c,4 c, |
  f,,2. r4 |
  f,,1:32\mf ~ |
  f,,2. r4 |
  bes,,1:32 ~ |
  bes,,2. r4 |
  % mm. 81-84: Soft Resolution
  f,,1:32\p ~ |
  f,,2. r4 |
  c,1:32 |
  f,,1\fermata |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \key g \minor
  \time 3/4
  % mm. 85-100: Neoclassical Choral Timpani (Bb2, C3, Eb3, F2)
  R2.*8 |
  bes,,4.\mf bes,,8 bes,,4 |
  c,2 c,4 |
  ees,4. ees,8 ees,4 |
  f,,2. |
  bes,,4.\f bes,,8 bes,,4 |
  c,2 c,4 |
  ees,4. ees,8 ees,4 |
  f,,2.\ff:32 |
  % mm. 101-112: Orchestral March (in 4/4)
  \time 4/4
  f,,8-.\ff f,,-. r4 bes,,8-. bes,,-. r4 |
  c,8-. c,-. r c, f,,4-^ r |
  ees,4.(\f ees,8 c,4. bes,,8 |
  f,,2 f,,2) |
  f,,8-. f,,-. r4 bes,,8-. bes,,-. r4 |
  c,8-. c,-. r c, f,,4-^ r |
  ees,4. ees,8 c,4 c, |
  f,,2. r4 |
  bes,,8-.\ff bes,,-. c,-. c,-. f,,4-^ bes,,-^ |
  ees,4. ees,8 c,4 bes,, |
  f,,8-. f,,-. bes,,-. bes,,-. c,4-^ c,-^ |
  f,,1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \key d \minor
  \time 4/4
  % mm. 113-120: Thrash Accents
  f,,4-^\f r8 f,, f,,4-^ r8 f,, |
  f,,4-^ r8 f,, f,,4-^ r8 f,, |
  f,,4-^\ff r8 f,, f,,4-^ r8 f,, |
  f,,4-^ r8 f,, f,,4-^ r8 f,, |
  f,,8-. f,,-. bes,,-. bes,,-. c,4-^ f,,-^ |
  c,8-. c,-. f,,-. f,,-. f,,4-^ r |
  f,,8-. f,,-. bes,,-. bes,,-. c,4-^ bes,,-^ |
  f,,1-^ |
  % mm. 121-136: Rest during Flamenco
  \time 6/8
  R2.*16 |
  % mm. 137-144: Driving Roll Crescendo (in 4/4)
  \time 4/4
  \tempo 4 = 136
  f,,1:32\f\< ~ |
  f,,1 |
  bes,,1:32 ~ |
  bes,,1 |
  c,1:32\ff ~ |
  c,1 |
  f,,1:32\fff ~ |
  f,,1-^ |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Rest
  R1*8 |
  % mm. 153-164: Epic Gallop Rolls & Accents
  f,,4-^\ff r8 f,, f,,4-^ r8 f,, |
  f,,4-^ r8 f,, f,,4-^ r8 f,, |
  f,,8-.\fff f,,-. bes,,-. bes,,-. c,4-^ bes,,-^ |
  c,1-^ |
  f,,4-^ r8 f,, f,,4-^ r8 f,, |
  f,,4-^ r8 f,, f,,4-^ r8 f,, |
  f,,8-. f,,-. bes,,-. bes,,-. c,4-^ f,,-^ |
  f,,1-^ |
  f,,8-.\fff f,,-. bes,,-. bes,,-. c,4-^ f,,-^ |
  c,4. c,8 c,4 bes,, |
  f,,8-. f,,-. bes,,-. bes,,-. c,-. c,-. c,4-^ |
  f,,1-^ |
  % mm. 165-176: Triumphant Anthem Chorus
  \key d \major
  f,,4.\ffff c,8 f,,4 f,, |
  bes,,4. bes,,8 bes,,2 |
  c,4. c,8 c,4 c, |
  f,,2. r4 |
  f,,4. c,8 f,,4 f,, |
  bes,,4. bes,,8 bes,,2 |
  c,4. c,8 c,4 c, |
  f,,2. r4 |
  f,,4. c,8 f,,4 f,, |
  bes,,4. bes,,8 bes,,2 |
  c,4. c,8 c,4 c, |
  f,,1 |
  % mm. 177-184: Grand Coda Roll Finale
  f,,8-.\ffff f,,-. bes,,-. bes,,-. c,-. c,-. f,,-. f,,-- |
  f,,4-^ bes,,-^ c,2-^ |
  bes,,4-^ c,-^ f,,2-^ |
  bes,,4-^ c,-^ f,,2-^ |
  f,,4-^ c,8-. c,-. c,4-^ f,,-^ |
  f,,2-^ c,2-^ |
  bes,,2-^ c,2-^ |
  f,,1:32\fermata\ffff \bar "|."
}

% =======================================================================
% 14. PERCUSSION / BATTERY (The Rev Drums Tribute)
% =======================================================================
percussionPart = \drummode {
  % --- Movement I: Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  % mm. 1-4: The Rev Signature Drum Intro!
  sn8\ff sn16 sn sn8 sn bd4 sn-^ |
  bd4 sn8 sn bd4-^ sn8 sn |
  tomh8-> tommh16 toml tommh8-> tomh toml-> tommh toml4-^ |
  sn8-. sn-. sn-. sn-. cymc4-^ cymc4-^ |
  % mm. 5-12: Driving Gallop Beat
  hh8\ff hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  hh8 hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  hh8 hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  hh8 hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4-^ sn-^ cymc2-^ |
  % mm. 13-20: Verse Beat
  hh8\f hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  hh8 hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  hh8 hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  hh8 hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4-^ sn-^ cymc2-^ |
  % mm. 21-28: Chorus Climax
  cymc4\ff sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  cymc4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  cymc4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  sn8-. sn-. sn-. sn-. bd4-^ sn-^ |
  cymc1-^ |

  % --- Movement II: Bat Country (mm. 29-56) ---
  % mm. 29-32: Syncopated Half-Time Groove
  bd4\ff sn8. bd16 r8 bd sn4 |
  bd4 sn8. bd16 r8 bd sn4 |
  bd4 sn8. bd16 r8 bd sn4 |
  sn8-. sn-. sn-. sn-. cymc4-^ r |
  % mm. 33-40: Swaggering Rock Beat
  hh8\f hh hh hh hh hh hh hh |
  bd4 sn8 bd bd4 sn |
  hh8 hh hh hh hh hh hh hh |
  bd4 sn8 bd bd4 sn |
  hh8 hh hh hh hh hh hh hh |
  bd4 sn8 bd bd4 sn |
  hh8 hh hh hh hh hh hh hh |
  bd4-^ sn-^ cymc2-^ |
  % mm. 41-48: Pre-Chorus Build
  sn8\mf sn sn sn sn sn sn sn |
  bd4 sn8 bd bd4 sn |
  sn8 sn sn sn sn sn sn sn |
  sn1:32\< |
  hh8\f hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  hh8\ff hh16 hh hh8 hh hh hh16 hh hh8 hh |
  cymc2.-^ r4 |
  % mm. 49-56: Bat Country Chorus Beat
  cymc4\fff sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  cymc4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  cymc4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  sn8-. sn-. sn-. sn-. bd4-^ sn-^ |
  cymc1\> |

  % --- Movement III: Seize the Day (mm. 57-84) ---
  % mm. 57-68: Soft Ballad Cymbals & Cross-Stick
  cymc1\p\< ~ |
  cymc2\> r |
  cymc1\< ~ |
  cymc2\> r |
  bd4\p r8 sn bd4 r8 sn |
  bd4 r8 sn bd4 r8 sn |
  bd4 r8 sn bd4 r8 sn |
  bd4 r8 sn bd4 r8 sn |
  bd4 r8 sn bd4 r8 sn |
  bd4 r8 sn bd4 r8 sn |
  bd4 r8 sn bd4 r8 sn |
  bd4 r8 sn bd4 r8 sn |
  % mm. 69-80: Full Expressive Ballad Beat
  bd4\mf sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4\f sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  % mm. 81-84: Resolving Swell
  cymc1\p\< ~ |
  cymc2. r4\! |
  sn1:32\p |
  cymc1\fermata |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \time 3/4
  % mm. 85-100: Classical Choral Percussion (in 3/4)
  R2.*8 |
  bd4\mf r bd |
  sn4 r sn |
  bd4 r bd |
  cymc2. |
  bd4\f r bd |
  sn4 r sn |
  bd4 r bd |
  cymc2.-^\ff |
  % mm. 101-112: Orchestral March (in 4/4)
  \time 4/4
  sn8-.\ff sn-. r4 sn8-. sn-. r4 |
  bd4 sn8 bd bd4 sn |
  hh8\f hh hh hh hh hh hh hh |
  bd4 sn8 bd bd4 sn |
  sn8-.\ff sn-. r4 sn8-. sn-. r4 |
  bd4 sn8 bd bd4 sn |
  sn8-. sn-. sn-. sn-. bd4-^ sn-^ |
  cymc2. r4 |
  bd4.\ff sn8 bd4 sn |
  bd4 sn8 bd bd4 sn |
  sn8-. sn-. sn-. sn-. bd4-^ sn-^ |
  cymc1\fermata |

  % --- Movement V: Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 4/4
  % mm. 113-120: Thrash Polyrhythm Breakdown
  bd8\ff sn16 sn sn8 sn bd4 sn-^ |
  bd4 r8 sn bd4-^ r8 sn |
  bd8 sn16 sn sn8 sn bd4 sn-^ |
  bd4 r8 sn bd4-^ r8 sn |
  tomh8-> tommh16 toml tommh8-> tomh toml8-> tommh tomfl8-> toml |
  tomfl8-> toml tomh tommh toml tomfl toml4-^ |
  sn8-. sn-. sn-. sn-. bd4-^ sn-^ |
  cymc1-^ |
  % mm. 121-136: Sidewinder Flamenco Rim-Clicks & Claps (in 6/8)
  \time 6/8
  sn8\f r sn sn r sn |
  sn8 r sn sn r sn |
  sn8 r sn sn r sn |
  sn8 r sn sn r sn |
  sn8 r sn sn r sn |
  sn8 r sn sn r sn |
  sn8 r sn sn r sn |
  bd4.~ bd4 r8 |
  sn8\ff r sn sn r sn |
  sn8 r sn sn r sn |
  sn8 r sn sn r sn |
  sn8 r sn sn r sn |
  sn8 r sn sn r sn |
  sn8 r sn sn r sn |
  sn8-. sn-. sn-. cymc4-^ r8 |
  cymc4.~ cymc4 r8 |
  % mm. 137-144: Driving Accelerating Gallop (in 4/4)
  \time 4/4
  \tempo 4 = 136
  sn1:32\f\< ~ |
  sn1 |
  hh8\ff hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  hh8 hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  sn8-.(\fff sn-. sn-. sn-.) cymc4-^ cymc4-^ |
  cymc1-^ |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Military Funeral March Snare Solo
  sn8\mf sn16 sn sn8 sn sn sn16 sn sn8 sn |
  sn8 sn16 sn sn8 sn sn4 r |
  sn8 sn16 sn sn8 sn sn sn16 sn sn8 sn |
  sn8 sn16 sn sn8 sn sn4 r |
  sn8 sn16 sn sn8 sn sn sn16 sn sn8 sn |
  sn8 sn16 sn sn8 sn sn4 r |
  sn8 sn16 sn sn8 sn sn sn16 sn sn8 sn |
  cymc1\> |
  % mm. 153-164: Double-Kick Gallop Metal Eruption
  cymc4\ff sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  hh8\fff hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  cymc4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  hh8 hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4-^ sn-^ cymc2-^ |
  hh8\fff hh16 hh hh8 hh hh hh16 hh hh8 hh |
  bd4 sn8 bd bd4 sn |
  sn8-.(\ffff sn-. sn-. sn-.) bd4-^ sn-^ |
  cymc1-^ |
  % mm. 165-176: Triumphant Anthem Chorus
  cymc4\ffff sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  cymc4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  cymc4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  cymc4 sn8 bd bd4 sn |
  bd4-^ sn-^ cymc2-^ |
  cymc4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  sn8-. sn-. sn-. sn-. bd4-^ sn-^ |
  cymc1-^ |
  % mm. 177-184: Grand Coda Finale
  bd4.\ffff sn8 bd4 sn |
  bd4 sn8 bd bd4 sn |
  sn8-. sn-. sn-. sn-. bd4-^ sn-^ |
  bd4. sn8 bd4 sn |
  bd4 sn8 bd bd4 sn |
  sn8-. sn-. sn-. sn-. bd4-^ sn-^ |
  bd4-^ sn-^ cymc2-^ |
  cymc1\fermata\ffff \bar "|."
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
"""
    with open("city_of_evil_medley.ly", "w", encoding="utf-8") as f:
        f.write(score_content)
    print("city_of_evil_medley.ly written perfectly.")

if __name__ == "__main__":
    create_score()
