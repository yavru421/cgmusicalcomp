\version "2.24.0"
\include "articulate.ly"

\header {
  title = "City of Evil Medley"
  subtitle = "A Symphonic Metal Rhapsody for Concert Band & Battery Percussion [Core Medley Lead]"
  composer = "Avenged Sevenfold"
  arranger = "Arranged for Wisconsin Rapids City Band by J. D. Dondlinger"
  tagline = "City of Evil Medley — Core Medley Lead (Deterministic Band DSL Compiler)"
}

#(set-global-staff-size 15)

\paper {
  #(set-paper-size "letter")
  top-margin = 0.5\in
  bottom-margin = 0.5\in
  left-margin = 0.55\in
  right-margin = 0.5\in
  ragged-last-bottom = ##f
}

% ======================================================================
% Harmony Chords
% ======================================================================
chordTrack = \chordmode {

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  d1:m |
  d1:m |
  bes1 |
  c1 |
  d1:m |
  d1:m |
  f1 |
  g1 |
  bes1 |
  c1 |
  d1:m |
  a1:7 |
  d1:m |
  d1:m |
  bes1 |
  c1 |
  d1:m |
  d1:m |
  f1 |
  g1 |
  bes1 |
  c1 |
  d1:m |
  a1:7 |
  d1:m |
  d1:m |
  bes1 |
  c1 |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  d1:m |
  f1 |
  c1 |
  g1 |
  bes1 |
  c1 |
  d1:m |
  a1 |
  d1:m |
  bes1 |
  c1 |
  a1:7 |
  d1:m |
  f1 |
  c1 |
  g1 |
  bes1 |
  c1 |
  d1:m |
  a1 |
  d1:m |
  bes1 |
  c1 |
  a1:7 |
  d1:m |
  f1 |
  c1 |
  g1 |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  f1 |
  c1 |
  d1:m |
  bes1 |
  f1 |
  c1 |
  bes1 |
  c1 |
  d1:m |
  bes1 |
  c1 |
  f1 |
  f1 |
  c1 |
  d1:m |
  bes1 |
  f1 |
  c1 |
  bes1 |
  c1 |
  d1:m |
  bes1 |
  c1 |
  f1 |
  f1 |
  c1 |
  d1:m |
  bes1 |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  g2.:m |
  ees2. |
  f2. |
  d2. |
  g2.:m |
  c2.:m |
  d2. |
  g2.:m |
  ees2. |
  f2. |
  d2.:7 |
  g2.:m |
  g2.:m |
  ees2. |
  f2. |
  d2. |
  g2.:m |
  c2.:m |
  d2. |
  g2.:m |
  ees2. |
  f2. |
  d2.:7 |
  g2.:m |
  g2.:m |
  ees2. |
  f2. |
  d2. |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  d2.:m |
  c2. |
  bes2. |
  a2. |
  d2.:m |
  f2. |
  g2. |
  a2. |
  d2.:m |
  bes2. |
  c2. |
  a2.:7 |
  d2.:m |
  c2. |
  bes2. |
  a2. |
  d2.:m |
  f2. |
  g2. |
  a2. |
  d2.:m |
  bes2. |
  c2. |
  a2.:7 |
  d2.:m |
  c2. |
  bes2. |
  a2. |
  d2.:m |
  f2. |
  g2. |
  a2. |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  d1:m |
  bes1 |
  f1 |
  c1 |
  d1:m |
  bes1 |
  c1 |
  d1 |
  d1:m |
  bes1 |
  f1 |
  a1:7 |
  d1:m |
  bes1 |
  f1 |
  c1 |
  d1:m |
  bes1 |
  c1 |
  d1 |
  d1:m |
  bes1 |
  f1 |
  a1:7 |
  d1:m |
  bes1 |
  f1 |
  c1 |
  d1:m |
  bes1 |
  c1 |
  d1 |
  d1:m |
  bes1 |
  f1 |
  a1:7 |
  d1:m |
  bes1 |
  f1 |
  c1 |
}

% ======================================================================
% Core Lead (Melody)
% ======================================================================
coreLeadPart = \fixed c' {
  \clef treble

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  d4\f f8 a d2 |
  d'4\f f'8 a d'2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  d'4\f f'8 a d'2 |
  f4\f a8 c' f2 |
  g4\f b8 d' g2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  a4\f cis'8 e' a2 |
  d'4\f f'8 a d'2 |
  d'4\f f'8 a d'2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  d'4\f f'8 a d'2 |
  f4\f a8 c' f2 |
  g4\f b8 d' g2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  a4\f cis'8 e' a2 |
  d'4\f f'8 a d'2 |
  d'4\f f'8 a d'2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  \tempo "II. Bat Country" 4 = 126
  d4\f f8 a d2 |
  f4\f a8 c' f2 |
  c'4\f e'8 g c'2 |
  g4\f b8 d' g2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  a4\f cis'8 e' a2 |
  d'4\f f'8 a d'2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  a4\f cis'8 e' a2 |
  d'4\f f'8 a d'2 |
  f4\f a8 c' f2 |
  c'4\f e'8 g c'2 |
  g4\f b8 d' g2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  a4\f cis'8 e' a2 |
  d'4\f f'8 a d'2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  a4\f cis'8 e' a2 |
  d'4\f f'8 a d'2 |
  f4\f a8 c' f2 |
  c'4\f e'8 g c'2 |
  g4\f b8 d' g2 |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  \tempo "III. Seize the Day" 4 = 72
  f'4\f a8 c' f'2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  c'4\f e'8 g c'2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  f4\f a8 c' f2 |
  f'4\f a8 c' f'2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  c'4\f e'8 g c'2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  f4\f a8 c' f2 |
  f'4\f a8 c' f'2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f' bes2 |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  \key g \minor
  \tempo "IV. The Wicked End" 4 = 88
  g4.\f bes8 d'4 |
  ees'4.\f g8 bes4 |
  f4.\f a8 c'4 |
  d'4.\f fis8 a4 |
  g4.\f bes8 d'4 |
  c'4.\f ees'8 g4 |
  d4.\f fis8 a4 |
  g4.\f bes8 d'4 |
  ees'4.\f g8 bes4 |
  f4.\f a8 c'4 |
  d'4.\f fis8 a4 |
  g4.\f bes8 d'4 |
  g4.\f bes8 d'4 |
  ees'4.\f g8 bes4 |
  f4.\f a8 c'4 |
  d'4.\f fis8 a4 |
  g4.\f bes8 d'4 |
  c'4.\f ees'8 g4 |
  d4.\f fis8 a4 |
  g4.\f bes8 d'4 |
  ees'4.\f g8 bes4 |
  f4.\f a8 c'4 |
  d'4.\f fis8 a4 |
  g4.\f bes8 d'4 |
  g4.\f bes8 d'4 |
  ees'4.\f g8 bes4 |
  f4.\f a8 c'4 |
  d'4.\f fis8 a4 |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  d'8 f' a d'4. |
  c'8 e' g c'4. |
  bes8 d' f' bes4. |
  a8 cis' e' a4. |
  d'8 f' a d'4. |
  f8 a c' f4. |
  g8 b d' g4. |
  a8 cis' e' a4. |
  d'8 f' a d'4. |
  bes8 d' f' bes4. |
  c'8 e' g c'4. |
  a8 cis' e' a4. |
  d'8 f' a d'4. |
  c'8 e' g c'4. |
  bes8 d' f' bes4. |
  a8 cis' e' a4. |
  d'8 f' a d'4. |
  f8 a c' f4. |
  g8 b d' g4. |
  a8 cis' e' a4. |
  d'8 f' a d'4. |
  bes8 d' f' bes4. |
  c'8 e' g c'4. |
  a8 cis' e' a4. |
  d'8 f' a d'4. |
  c'8 e' g c'4. |
  bes8 d' f' bes4. |
  a8 cis' e' a4. |
  d'8 f' a d'4. |
  f8 a c' f4. |
  g8 b d' g4. |
  a8 cis' e' a4. |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
  d'4\f f'8 a d'2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  d4\f fis8 a d2 |
  d'4\f f'8 a d'2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  a4\f cis'8 e' a2 |
  d'4\f f'8 a d'2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  d4\f fis8 a d2 |
  d'4\f f'8 a d'2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  a4\f cis'8 e' a2 |
  d'4\f f'8 a d'2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  d4\f fis8 a d2 |
  d'4\f f'8 a d'2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  a4\f cis'8 e' a2 |
  d'4\f f'8 a d'2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  c'4\f e'8 g c'2 |
  \bar "|."
}

% ======================================================================
% Core Bass / Accompaniment
% ======================================================================
coreBassPart = \fixed c {
  \clef bass

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  d,2\mf d,2 |
  d,2\mf d,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  d2\mf d2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  a,2\mf a,2 |
  d2\mf d2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  d2\mf d2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  a,2\mf a,2 |
  d2\mf d2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  c2\mf c2 |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  d2\mf d2 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  g,2\mf g,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  a,2\mf a,2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  a,2\mf a,2 |
  d2\mf d2 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  g,2\mf g,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  a,2\mf a,2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  a,2\mf a,2 |
  d2\mf d2 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  g,2\mf g,2 |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  f,2\mf f,2 |
  c,2\mf c,2 |
  d,2\mf d,2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  d,2\mf d,2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  d,2\mf d,2 |
  bes,2\mf bes,2 |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  \key g \minor
  g,2.\mf |
  ees,2.\mf |
  f,2.\mf |
  d,2.\mf |
  g,2.\mf |
  c2.\mf |
  d2.\mf |
  g,2.\mf |
  ees,2.\mf |
  f,2.\mf |
  d,2.\mf |
  g,2.\mf |
  g,2.\mf |
  ees,2.\mf |
  f,2.\mf |
  d,2.\mf |
  g,2.\mf |
  c2.\mf |
  d2.\mf |
  g,2.\mf |
  ees,2.\mf |
  f,2.\mf |
  d,2.\mf |
  g,2.\mf |
  g,2.\mf |
  ees,2.\mf |
  f,2.\mf |
  d,2.\mf |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  d,2.\mf |
  c,2.\mf |
  bes,2.\mf |
  a,2.\mf |
  d2.\mf |
  f,2.\mf |
  g,2.\mf |
  a,2.\mf |
  d2.\mf |
  bes,2.\mf |
  c2.\mf |
  a,2.\mf |
  d2.\mf |
  c2.\mf |
  bes,2.\mf |
  a,2.\mf |
  d2.\mf |
  f,2.\mf |
  g,2.\mf |
  a,2.\mf |
  d2.\mf |
  bes,2.\mf |
  c2.\mf |
  a,2.\mf |
  d2.\mf |
  c2.\mf |
  bes,2.\mf |
  a,2.\mf |
  d2.\mf |
  f,2.\mf |
  g,2.\mf |
  a,2.\mf |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  d2\mf d2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  d,2\mf d,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  a,2\mf a,2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  d,2\mf d,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  a,2\mf a,2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  d,2\mf d,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  a,2\mf a,2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  \bar "|."
}

% ======================================================================
% Core Drums
% ======================================================================
coreDrumsPart = \drummode {

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |
  bd4 sn sn |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  \bar "|."
}

\score {
  <<
    \new ChordNames { \chordTrack }
    \new StaffGroup = "CoreMedley" \with { instrumentName = #"Core Medley" shortInstrumentName = #"Core" } <<
      \new Staff = "upper" \with { instrumentName = #"Concert Lead" shortInstrumentName = #"Lead" } { \coreLeadPart }
      \new Staff = "lower" \with { instrumentName = #"Tuba / Bass" shortInstrumentName = #"Bass" } { \coreBassPart }
    >>
    \new DrumStaff \with { instrumentName = #"Drums" shortInstrumentName = #"Dr." } { \coreDrumsPart }
  >>
  \layout { }
  \midi { }
}