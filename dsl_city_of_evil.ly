\version "2.24.0"
\include "articulate.ly"

\header {
  title = "City of Evil Medley"
  subtitle = "A Symphonic Metal Rhapsody for Concert Band & Battery Percussion"
  composer = "Avenged Sevenfold"
  arranger = "Arranged for Wisconsin Rapids City Band by J. D. Dondlinger"
  tagline = "City of Evil Medley — Arranged by Avenged Sevenfold (Deterministic Band DSL Compiler)"
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
}

% ======================================================================
% Flute (Woodwinds)
% ======================================================================
flutePart = \fixed c' {
  \clef treble

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  d'4\f f'8 a' d'2 |
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  c'4\f e'8 g' c'2 |
  d'4\f f'8 a' d'2 |
  d'4\f f'8 a' d'2 |
  f'4\f a'8 c'' f'2 |
  g'4\f b'8 d' g'2 |
  R1 |
  R1 |
  R1 |
  R1 |
  d'4\f f'8 a' d'2 |
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  c'4\f e'8 g' c'2 |
  d'4\f f'8 a' d'2 |
  d'4\f f'8 a' d'2 |
  f'4\f a'8 c'' f'2 |
  g'4\f b'8 d' g'2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g' c'2 |
  d'4\f f'8 a' d'2 |
  a'4\f cis'8 e' a'2 |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  \tempo "II. Bat Country" 4 = 126
  d'4\f f'8 a' d'2 |
  f'4\f a'8 c'' f'2 |
  c''4\f e'8 g' c''2 |
  g'4\f b'8 d' g'2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g' c'2 |
  d'4\f f'8 a' d'2 |
  a'4\f cis'8 e' a'2 |
  R1 |
  R1 |
  R1 |
  R1 |
  d'4\f f'8 a' d'2 |
  f'4\f a'8 c'' f'2 |
  c''4\f e'8 g' c''2 |
  g'4\f b'8 d' g'2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g' c'2 |
  d'4\f f'8 a' d'2 |
  a'4\f cis'8 e' a'2 |
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  c'4\f e'8 g' c'2 |
  a'4\f cis'8 e' a'2 |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  \tempo "III. Seize the Day" 4 = 72
  f'4\f a'8 c'' f'2 |
  c''4\f e'8 g' c''2 |
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  f'4\f a'8 c'' f'2 |
  c''4\f e'8 g' c''2 |
  bes'4\f d'8 f' bes'2 |
  c'4\f e'8 g' c'2 |
  R1 |
  R1 |
  R1 |
  R1 |
  f'4\f a'8 c'' f'2 |
  c''4\f e'8 g' c''2 |
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  f'4\f a'8 c'' f'2 |
  c''4\f e'8 g' c''2 |
  bes'4\f d'8 f' bes'2 |
  c'4\f e'8 g' c'2 |
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  c'4\f e'8 g' c'2 |
  f'4\f a'8 c'' f'2 |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  \key g \minor
  \tempo "IV. The Wicked End" 4 = 88
  g'4.\f bes'8 d'4 |
  ees'4.\f g'8 bes'4 |
  f'4.\f a'8 c''4 |
  d'4.\f fis'8 a'4 |
  g'4.\f bes'8 d'4 |
  c'4.\f ees'8 g'4 |
  d'4.\f fis'8 a'4 |
  g'4.\f bes'8 d'4 |
  R2. |
  R2. |
  R2. |
  R2. |
  g'4.\f bes'8 d'4 |
  ees'4.\f g'8 bes'4 |
  f'4.\f a'8 c''4 |
  d'4.\f fis'8 a'4 |
  g'4.\f bes'8 d'4 |
  c'4.\f ees'8 g'4 |
  d'4.\f fis'8 a'4 |
  g'4.\f bes'8 d'4 |
  ees'4.\f g'8 bes'4 |
  f'4.\f a'8 c''4 |
  d'4.\f fis'8 a'4 |
  g'4.\f bes'8 d'4 |
  R2. |
  R2. |
  R2. |
  R2. |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  d'8 f' a' d'4. |
  c''8 e' g' c''4. |
  bes'8 d' f' bes'4. |
  a'8 cis' e' a'4. |
  d'8 f' a' d'4. |
  f'8 a' c'' f'4. |
  g'8 b' d' g'4. |
  a8 cis' e' a4. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  bes8 d' f' bes4. |
  a'8 cis' e' a'4. |
  d'8 f' a' d'4. |
  f'8 a' c'' f'4. |
  g'8 b' d' g'4. |
  a8 cis' e' a4. |
  d'8 f' a' d'4. |
  bes'8 d' f' bes'4. |
  c'8 e' g' c'4. |
  a'8 cis' e' a'4. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  f'4\f a'8 c'' f'2 |
  c''4\f e'8 g' c''2 |
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  c'4\f e'8 g' c'2 |
  d'4\f fis'8 a' d'2 |
  R1 |
  R1 |
  R1 |
  R1 |
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  f'4\f a'8 c'' f'2 |
  c''4\f e'8 g' c''2 |
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  c'4\f e'8 g' c'2 |
  d'4\f fis'8 a' d'2 |
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  f'4\f a'8 c'' f'2 |
  a'4\f cis'8 e' a'2 |
  R1 |
  R1 |
  R1 |
  R1 |
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  c'4\f e'8 g' c'2 |
  d'4\f fis'8 a' d'2 |
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  f'4\f a'8 c'' f'2 |
  a'4\f cis'8 e' a'2 |
  d'4\f f'8 a' d'2 |
  bes'4\f d'8 f' bes'2 |
  R1 |
  R1 |
  \bar "|."
}

% ======================================================================
% Oboe (Woodwinds)
% ======================================================================
oboePart = \fixed c' {
  \clef treble

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  d'4\mf r d' r |
  d'4\mf r d' r |
  bes4\mf r bes r |
  c'4\mf r c' r |
  d'4\mf r d' r |
  d'4\mf r d' r |
  f4\mf r f r |
  g4\mf r g r |
  R1 |
  R1 |
  R1 |
  R1 |
  d'4\mf r d' r |
  d'4\mf r d' r |
  bes4\mf r bes r |
  c'4\mf r c' r |
  d'4\mf r d' r |
  d'4\mf r d' r |
  f4\mf r f r |
  g4\mf r g r |
  bes4\mf r bes r |
  c'4\mf r c' r |
  d'4\mf r d' r |
  a4\mf r a r |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  \tempo "II. Bat Country" 4 = 126
  a1\mf |
  c'1\mf |
  g1\mf |
  d'1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  e1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  a1\mf |
  c'1\mf |
  g1\mf |
  d'1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  e1\mf |
  a1\mf |
  f1\mf |
  g1\mf |
  e1\mf |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  \tempo "III. Seize the Day" 4 = 72
  f4\f a8 c' f2 |
  c'4\f e8 g c'2 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  c'4\f e8 g c'2 |
  bes4\f d'8 f bes2 |
  c'4\f e8 g c'2 |
  R1 |
  R1 |
  R1 |
  R1 |
  f4\f a8 c' f2 |
  c'4\f e8 g c'2 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  c'4\f e8 g c'2 |
  bes4\f d'8 f bes2 |
  c'4\f e8 g c'2 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  c'4\f e8 g c'2 |
  f4\f a8 c' f2 |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  \key g \minor
  \tempo "IV. The Wicked End" 4 = 88
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d'2.\mf |
  g2.\mf |
  c'2.\mf |
  d'2.\mf |
  g2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d'2.\mf |
  g2.\mf |
  c'2.\mf |
  d'2.\mf |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d'2.\mf |
  g2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  a2.\mf |
  g2.\mf |
  f2.\mf |
  e2.\mf |
  a2.\mf |
  c'2.\mf |
  d'2.\mf |
  e2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  f2.\mf |
  e2.\mf |
  a2.\mf |
  c'2.\mf |
  d'2.\mf |
  e2.\mf |
  a2.\mf |
  f2.\mf |
  g2.\mf |
  e2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
  a1\mf |
  f1\mf |
  c'1\mf |
  g1\mf |
  a1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  a1\mf |
  f1\mf |
  c'1\mf |
  g1\mf |
  a1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  a1\mf |
  f1\mf |
  c'1\mf |
  e1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  a1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  a1\mf |
  f1\mf |
  c'1\mf |
  e1\mf |
  a1\mf |
  f1\mf |
  R1 |
  R1 |
  \bar "|."
}

% ======================================================================
% Bb Clarinet (Woodwinds)
% ======================================================================
clarinetPart = \fixed c' {
  \clef treble

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  a1\mf |
  a1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  a1\mf |
  c'1\mf |
  d'1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  a1\mf |
  a1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  a1\mf |
  c'1\mf |
  d'1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  e1\mf |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  \tempo "II. Bat Country" 4 = 126
  d4\f f8 a d2 |
  f4\f a8 c' f2 |
  c'4\f e'8 g c'2 |
  g4\f b8 d' g2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  d4\f f8 a d2 |
  a4\f cis'8 e' a2 |
  R1 |
  R1 |
  R1 |
  R1 |
  d'4\f f8 a d'2 |
  f4\f a8 c' f2 |
  c'4\f e'8 g c'2 |
  g4\f b8 d' g2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  d4\f f8 a d2 |
  a4\f cis'8 e' a2 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  a4\f cis'8 e' a2 |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  \tempo "III. Seize the Day" 4 = 72
  f4\f a8 c' f2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  c'4\f e'8 g c'2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  R1 |
  R1 |
  R1 |
  R1 |
  f4\f a8 c' f2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  c'4\f e'8 g c'2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  f4\f a8 c' f2 |
  R1 |
  R1 |
  R1 |
  R1 |

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
  R2. |
  R2. |
  R2. |
  R2. |
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
  R2. |
  R2. |
  R2. |
  R2. |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  a2.\mf |
  g2.\mf |
  f2.\mf |
  e2.\mf |
  a2.\mf |
  c'2.\mf |
  d'2.\mf |
  e'2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  f2.\mf |
  e2.\mf |
  a2.\mf |
  c'2.\mf |
  d'2.\mf |
  e'2.\mf |
  a2.\mf |
  f2.\mf |
  g2.\mf |
  e2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  d4\f fis8 a d2 |
  R1 |
  R1 |
  R1 |
  R1 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  d4\f fis8 a d2 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  a4\f cis'8 e' a2 |
  R1 |
  R1 |
  R1 |
  R1 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  d4\f fis8 a d2 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  a4\f cis'8 e' a2 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  R1 |
  R1 |
  \bar "|."
}

% ======================================================================
% Alto Saxophone (Woodwinds)
% ======================================================================
altosaxPart = \fixed c' {
  \clef treble

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  d4\f f8 a d2 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  c'4\f e8 g c'2 |
  d4\f f8 a d2 |
  d'4\f f8 a d'2 |
  f4\f a8 c' f2 |
  g4\f b8 d' g2 |
  R1 |
  R1 |
  R1 |
  R1 |
  d'4\f f8 a d'2 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  c'4\f e8 g c'2 |
  d4\f f8 a d2 |
  d'4\f f8 a d'2 |
  f4\f a8 c' f2 |
  g4\f b8 d' g2 |
  bes4\f d'8 f bes2 |
  c'4\f e8 g c'2 |
  d4\f f8 a d2 |
  a4\f cis'8 e a2 |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  \tempo "II. Bat Country" 4 = 126
  a1\mf |
  c'1\mf |
  g1\mf |
  d1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  e1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  a1\mf |
  c'1\mf |
  g1\mf |
  d1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  e1\mf |
  a1\mf |
  f1\mf |
  g1\mf |
  e1\mf |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  \tempo "III. Seize the Day" 4 = 72
  c'1\mf |
  g1\mf |
  a1\mf |
  f1\mf |
  c'1\mf |
  g1\mf |
  f1\mf |
  g1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  c'1\mf |
  g1\mf |
  a1\mf |
  f1\mf |
  c'1\mf |
  g1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  f1\mf |
  g1\mf |
  c'1\mf |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  \key g \minor
  \tempo "IV. The Wicked End" 4 = 88
  bes2.\mf |
  g2.\mf |
  a2.\mf |
  fis2.\mf |
  bes2.\mf |
  ees2.\mf |
  fis2.\mf |
  bes2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |
  bes2.\mf |
  g2.\mf |
  a2.\mf |
  fis2.\mf |
  bes2.\mf |
  ees2.\mf |
  fis2.\mf |
  bes2.\mf |
  g2.\mf |
  a2.\mf |
  fis2.\mf |
  bes2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  d'8 f a d'4. |
  c'8 e g c'4. |
  bes8 d' f bes4. |
  a8 cis' e a4. |
  d8 f a d4. |
  f8 a c' f4. |
  g8 b d' g4. |
  a8 cis' e a4. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  bes8 d' f bes4. |
  a8 cis' e a4. |
  d8 f a d4. |
  f8 a c' f4. |
  g8 b d' g4. |
  a8 cis' e a4. |
  d8 f a d4. |
  bes8 d' f bes4. |
  c'8 e g c'4. |
  a8 cis' e a4. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  c'4\f e8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  c'4\f e8 g c'2 |
  d4\f fis8 a d2 |
  R1 |
  R1 |
  R1 |
  R1 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  c'4\f e8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  c'4\f e8 g c'2 |
  d4\f fis8 a d2 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  a4\f cis'8 e a2 |
  R1 |
  R1 |
  R1 |
  R1 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  c'4\f e8 g c'2 |
  d4\f fis8 a d2 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  a4\f cis'8 e a2 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  R1 |
  R1 |
  \bar "|."
}

% ======================================================================
% Tenor Saxophone (Woodwinds)
% ======================================================================
tenorsaxPart = \fixed c' {
  \clef treble

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  a,1\mf |
  a,1\mf |
  f,1\mf |
  g,1\mf |
  a,1\mf |
  a,1\mf |
  c1\mf |
  d1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  a,1\mf |
  a,1\mf |
  f,1\mf |
  g,1\mf |
  a,1\mf |
  a,1\mf |
  c1\mf |
  d1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  e1\mf |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  \tempo "II. Bat Country" 4 = 126
  d4\mf r d r |
  f4\mf r f r |
  c4\mf r c r |
  g,4\mf r g, r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  d4\mf r d r |
  a,4\mf r a, r |
  R1 |
  R1 |
  R1 |
  R1 |
  d4\mf r d r |
  f4\mf r f r |
  c4\mf r c r |
  g,4\mf r g, r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  d4\mf r d r |
  a,4\mf r a, r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  a,4\mf r a, r |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  \tempo "III. Seize the Day" 4 = 72
  f,4\mf r f, r |
  c,4\mf r c, r |
  d,4\mf r d, r |
  bes,4\mf r bes, r |
  f,4\mf r f, r |
  c,4\mf r c, r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  R1 |
  R1 |
  R1 |
  R1 |
  f4\mf r f r |
  c4\mf r c r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  f,4\mf r f, r |
  c,4\mf r c, r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  f4\mf r f r |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  \key g \minor
  \tempo "IV. The Wicked End" 4 = 88
  d2.\mf |
  bes,2.\mf |
  c2.\mf |
  a,2.\mf |
  d2.\mf |
  g2.\mf |
  a2.\mf |
  d2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |
  d2.\mf |
  bes,2.\mf |
  c2.\mf |
  a,2.\mf |
  d2.\mf |
  g2.\mf |
  a2.\mf |
  d2.\mf |
  bes,2.\mf |
  c2.\mf |
  a,2.\mf |
  d2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  d2.\mf |
  c2.\mf |
  bes,2.\mf |
  a,2.\mf |
  d2.\mf |
  f2.\mf |
  g2.\mf |
  a2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  bes,2.\mf |
  a,2.\mf |
  d2.\mf |
  f2.\mf |
  g2.\mf |
  a2.\mf |
  d2.\mf |
  bes,2.\mf |
  c2.\mf |
  a,2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
  f,1\mf |
  d,1\mf |
  a,1\mf |
  e,1\mf |
  f,1\mf |
  d,1\mf |
  e,1\mf |
  fis,1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  f,1\mf |
  d,1\mf |
  a,1\mf |
  e,1\mf |
  f,1\mf |
  d,1\mf |
  e,1\mf |
  fis,1\mf |
  f,1\mf |
  d,1\mf |
  a,1\mf |
  cis1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  f1\mf |
  d1\mf |
  e1\mf |
  fis1\mf |
  f1\mf |
  d1\mf |
  a,1\mf |
  cis1\mf |
  f1\mf |
  d1\mf |
  R1 |
  R1 |
  \bar "|."
}

% ======================================================================
% Bb Trumpet (Brass)
% ======================================================================
trumpetPart = \fixed c' {
  \clef treble

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  R1 |
  R1 |
  R1 |
  R1 |
  d4\f f8 a d2 |
  d'4\f f8 a d'2 |
  f4\f a8 c' f2 |
  g4\f b8 d' g2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  d4\f f8 a d2 |
  a4\f cis'8 e a2 |
  d4\f f8 a d2 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  R1 |
  R1 |
  R1 |
  R1 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  d4\f f8 a d2 |
  a4\f cis'8 e a2 |
  R1 |
  R1 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  \tempo "II. Bat Country" 4 = 126
  R1 |
  R1 |
  R1 |
  R1 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  d4\f f8 a d2 |
  a4\f cis'8 e a2 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  a4\f cis'8 e a2 |
  d4\f f8 a d2 |
  f4\f a8 c' f2 |
  c'4\f e8 g c'2 |
  g4\f b8 d' g2 |
  R1 |
  R1 |
  R1 |
  R1 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  a4\f cis'8 e a2 |
  R1 |
  R1 |
  c4\f e8 g c2 |
  g4\f b8 d' g2 |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  \tempo "III. Seize the Day" 4 = 72
  R1 |
  R1 |
  R1 |
  R1 |
  a1\mf |
  e1\mf |
  d1\mf |
  e1\mf |
  f1\mf |
  d1\mf |
  e1\mf |
  a1\mf |
  a1\mf |
  e1\mf |
  f1\mf |
  d1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  f1\mf |
  d1\mf |
  e1\mf |
  a1\mf |
  R1 |
  R1 |
  f1\mf |
  d1\mf |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  \key g \minor
  \tempo "IV. The Wicked End" 4 = 88
  R2. |
  R2. |
  R2. |
  R2. |
  g4.\f bes8 d'4 |
  c'4.\f ees8 g4 |
  d4.\f fis8 a4 |
  g4.\f bes8 d'4 |
  ees4.\f g8 bes4 |
  f4.\f a8 c'4 |
  d'4.\f fis8 a4 |
  g4.\f bes8 d'4 |
  g4.\f bes8 d'4 |
  ees4.\f g8 bes4 |
  f4.\f a8 c'4 |
  d'4.\f fis8 a4 |
  R2. |
  R2. |
  R2. |
  R2. |
  ees4.\f g8 bes4 |
  f4.\f a8 c'4 |
  d'4.\f fis8 a4 |
  g4.\f bes8 d'4 |
  R2. |
  R2. |
  f4.\f a8 c'4 |
  d'4.\f fis8 a4 |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  g8 b d' g4. |
  a8 cis' e a4. |
  d8 f a d4. |
  bes8 d' f bes4. |
  c8 e g c4. |
  a8 cis' e a4. |
  d8 f a d4. |
  c'8 e g c'4. |
  bes8 d' f bes4. |
  a8 cis' e a4. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  c8 e g c4. |
  a8 cis' e a4. |
  d8 f a d4. |
  c'8 e g c'4. |
  bes8 d' f bes4. |
  a8 cis' e a4. |
  R2. |
  R2. |
  g8 b d' g4. |
  a8 cis' e a4. |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
  R1 |
  R1 |
  R1 |
  R1 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  d4\f fis8 a d2 |
  d'4\f f8 a d'2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  a4\f cis'8 e a2 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  c'4\f e8 g c'2 |
  R1 |
  R1 |
  R1 |
  R1 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  a4\f cis'8 e a2 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  f4\f a8 c' f2 |
  c'4\f e8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f bes2 |
  c4\f e8 g c2 |
  d4\f fis8 a d2 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  f4\f a8 c' f2 |
  c'4\f e8 g c'2 |
  \bar "|."
}

% ======================================================================
% French Horn in F (Brass)
% ======================================================================
frenchhornPart = \fixed c' {
  \clef treble

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  R1 |
  R1 |
  R1 |
  R1 |
  f1\mf |
  f1\mf |
  a1\mf |
  b1\mf |
  d'1\mf |
  e1\mf |
  f1\mf |
  cis1\mf |
  f1\mf |
  f1\mf |
  d1\mf |
  e1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  d1\mf |
  e1\mf |
  f1\mf |
  cis1\mf |
  R1 |
  R1 |
  d1\mf |
  e1\mf |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  \tempo "II. Bat Country" 4 = 126
  R1 |
  R1 |
  R1 |
  R1 |
  d1\mf |
  e1\mf |
  f1\mf |
  cis1\mf |
  f1\mf |
  d1\mf |
  e1\mf |
  cis1\mf |
  f1\mf |
  a1\mf |
  e1\mf |
  b1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  f1\mf |
  d1\mf |
  e1\mf |
  cis1\mf |
  R1 |
  R1 |
  e1\mf |
  b1\mf |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  \tempo "III. Seize the Day" 4 = 72
  R1 |
  R1 |
  R1 |
  R1 |
  c'1\mf |
  g1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  f1\mf |
  g1\mf |
  c'1\mf |
  c'1\mf |
  g1\mf |
  a1\mf |
  f1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  a1\mf |
  f1\mf |
  g1\mf |
  c'1\mf |
  R1 |
  R1 |
  a1\mf |
  f1\mf |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  \key g \minor
  \tempo "IV. The Wicked End" 4 = 88
  R2. |
  R2. |
  R2. |
  R2. |
  d2.\mf |
  g2.\mf |
  a2.\mf |
  d'2.\mf |
  bes2.\mf |
  c'2.\mf |
  a2.\mf |
  d'2.\mf |
  d'2.\mf |
  bes2.\mf |
  c'2.\mf |
  a2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |
  bes2.\mf |
  c'2.\mf |
  a2.\mf |
  d'2.\mf |
  R2. |
  R2. |
  c'2.\mf |
  a2.\mf |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  b2.\mf |
  cis'2.\mf |
  f2.\mf |
  d2.\mf |
  e2.\mf |
  cis2.\mf |
  f2.\mf |
  e2.\mf |
  d2.\mf |
  cis2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  e2.\mf |
  cis2.\mf |
  f2.\mf |
  e2.\mf |
  d2.\mf |
  cis2.\mf |
  R2. |
  R2. |
  b2.\mf |
  cis'2.\mf |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
  R1 |
  R1 |
  R1 |
  R1 |
  a1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  a1\mf |
  f1\mf |
  c1\mf |
  e1\mf |
  a1\mf |
  f1\mf |
  c1\mf |
  g1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  a1\mf |
  f1\mf |
  c1\mf |
  e1\mf |
  a1\mf |
  f1\mf |
  c1\mf |
  g1\mf |
  a1\mf |
  f1\mf |
  g1\mf |
  a1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  c'1\mf |
  g1\mf |
  \bar "|."
}

% ======================================================================
% Tenor Trombone (Brass)
% ======================================================================
trombonePart = \fixed c {
  \clef bass

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  R1 |
  R1 |
  R1 |
  R1 |
  f1\mf |
  f1\mf |
  a1\mf |
  b1\mf |
  d'1\mf |
  e'1\mf |
  f1\mf |
  cis1\mf |
  f1\mf |
  f1\mf |
  d1\mf |
  e1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  d1\mf |
  e1\mf |
  f1\mf |
  cis1\mf |
  R1 |
  R1 |
  d1\mf |
  e1\mf |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  \tempo "II. Bat Country" 4 = 126
  R1 |
  R1 |
  R1 |
  R1 |
  d1\mf |
  e1\mf |
  f1\mf |
  cis1\mf |
  f1\mf |
  d1\mf |
  e1\mf |
  cis1\mf |
  f1\mf |
  a1\mf |
  e1\mf |
  b,1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  f1\mf |
  d1\mf |
  e1\mf |
  cis1\mf |
  R1 |
  R1 |
  e1\mf |
  b,1\mf |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  \tempo "III. Seize the Day" 4 = 72
  R1 |
  R1 |
  R1 |
  R1 |
  a,1\mf |
  e1\mf |
  d1\mf |
  e1\mf |
  f1\mf |
  d1\mf |
  e1\mf |
  a1\mf |
  a1\mf |
  e1\mf |
  f1\mf |
  d1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  f1\mf |
  d1\mf |
  e1\mf |
  a1\mf |
  R1 |
  R1 |
  f1\mf |
  d1\mf |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  \key g \minor
  \tempo "IV. The Wicked End" 4 = 88
  R2. |
  R2. |
  R2. |
  R2. |
  bes,2.\mf |
  ees2.\mf |
  fis2.\mf |
  bes2.\mf |
  g2.\mf |
  a2.\mf |
  fis2.\mf |
  bes2.\mf |
  bes2.\mf |
  g2.\mf |
  a2.\mf |
  fis2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |
  g2.\mf |
  a2.\mf |
  fis2.\mf |
  bes2.\mf |
  R2. |
  R2. |
  a2.\mf |
  fis2.\mf |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  b2.\mf |
  cis'2.\mf |
  f2.\mf |
  d2.\mf |
  e2.\mf |
  cis2.\mf |
  f2.\mf |
  e2.\mf |
  d2.\mf |
  cis2.\mf |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  e2.\mf |
  cis2.\mf |
  f2.\mf |
  e2.\mf |
  d2.\mf |
  cis2.\mf |
  R2. |
  R2. |
  b,2.\mf |
  cis2.\mf |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
  R1 |
  R1 |
  R1 |
  R1 |
  f1\mf |
  d1\mf |
  e1\mf |
  fis1\mf |
  f1\mf |
  d1\mf |
  a,1\mf |
  cis1\mf |
  f1\mf |
  d1\mf |
  a,1\mf |
  e1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  f1\mf |
  d1\mf |
  a,1\mf |
  cis1\mf |
  f1\mf |
  d1\mf |
  a,1\mf |
  e1\mf |
  f1\mf |
  d1\mf |
  e1\mf |
  fis1\mf |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  a1\mf |
  e1\mf |
  \bar "|."
}

% ======================================================================
% Tuba (Brass)
% ======================================================================
tubaPart = \fixed c, {
  \clef bass

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  R1 |
  R1 |
  R1 |
  R1 |
  d,2\mf d,2 |
  d,2\mf d,2 |
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
  R1 |
  R1 |
  R1 |
  R1 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  a,2\mf a,2 |
  R1 |
  R1 |
  bes,2\mf bes,2 |
  c2\mf c2 |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  \tempo "II. Bat Country" 4 = 126
  R1 |
  R1 |
  R1 |
  R1 |
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
  R1 |
  R1 |
  R1 |
  R1 |
  d,2\mf d,2 |
  bes,,2\mf bes,,2 |
  c,2\mf c,2 |
  a,2\mf a,2 |
  R1 |
  R1 |
  c2\mf c2 |
  g,2\mf g,2 |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  \tempo "III. Seize the Day" 4 = 72
  R1 |
  R1 |
  R1 |
  R1 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  bes,,2\mf bes,,2 |
  c,2\mf c,2 |
  d,2\mf d,2 |
  bes,,2\mf bes,,2 |
  c,2\mf c,2 |
  f,2\mf f,2 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  d,2\mf d,2 |
  bes,,2\mf bes,,2 |
  R1 |
  R1 |
  R1 |
  R1 |
  d,2\mf d,2 |
  bes,,2\mf bes,,2 |
  c,2\mf c,2 |
  f,2\mf f,2 |
  R1 |
  R1 |
  d,2\mf d,2 |
  bes,,2\mf bes,,2 |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  \key g \minor
  \tempo "IV. The Wicked End" 4 = 88
  R2. |
  R2. |
  R2. |
  R2. |
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
  R2. |
  R2. |
  R2. |
  R2. |
  ees,2.\mf |
  f,2.\mf |
  d,2.\mf |
  g,2.\mf |
  R2. |
  R2. |
  f,2.\mf |
  d,2.\mf |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
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
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  R2. |
  c2.\mf |
  a,2.\mf |
  d2.\mf |
  c2.\mf |
  bes,2.\mf |
  a,2.\mf |
  R2. |
  R2. |
  g,2.\mf |
  a,2.\mf |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
  R1 |
  R1 |
  R1 |
  R1 |
  d2\mf d2 |
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
  R1 |
  R1 |
  R1 |
  R1 |
  d,2\mf d,2 |
  bes,,2\mf bes,,2 |
  f,2\mf f,2 |
  a,2\mf a,2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  d,2\mf d,2 |
  bes,,2\mf bes,,2 |
  c,2\mf c,2 |
  d,2\mf d,2 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  f,2\mf f,2 |
  c,2\mf c,2 |
  \bar "|."
}

% ======================================================================
% Electric Bass (Strings)
% ======================================================================
electricbassPart = \fixed c, {
  \clef "bass_8"

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  d2\mf d2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  d2\mf d2 |
  f2\mf f2 |
  g2\mf g2 |
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
  f2\mf f2 |
  g2\mf g2 |
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
  \tempo "II. Bat Country" 4 = 126
  d2\mf d2 |
  f2\mf f2 |
  c2\mf c2 |
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
  f2\mf f2 |
  c2\mf c2 |
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
  f2\mf f2 |
  c2\mf c2 |
  g,2\mf g,2 |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  \tempo "III. Seize the Day" 4 = 72
  f,2\mf f,2 |
  c2\mf c2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  c2\mf c2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  f2\mf f2 |
  f2\mf f2 |
  c2\mf c2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  c2\mf c2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  f2\mf f2 |
  f2\mf f2 |
  c2\mf c2 |
  d2\mf d2 |
  bes,2\mf bes,2 |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  \key g \minor
  \tempo "IV. The Wicked End" 4 = 88
  g,2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |
  g2.\mf |
  c2.\mf |
  d2.\mf |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |
  g2.\mf |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |
  g2.\mf |
  c2.\mf |
  d2.\mf |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |
  g2.\mf |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  d2.\mf |
  c2.\mf |
  bes,2.\mf |
  a,2.\mf |
  d2.\mf |
  f2.\mf |
  g2.\mf |
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
  f2.\mf |
  g2.\mf |
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
  f2.\mf |
  g2.\mf |
  a,2.\mf |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
  d2\mf d2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  c2\mf c2 |
  d2\mf d2 |
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
  c2\mf c2 |
  d2\mf d2 |
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
  c2\mf c2 |
  d2\mf d2 |
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
  c2\mf c2 |
  \bar "|."
}

% ======================================================================
% Cello (Strings)
% ======================================================================
celloPart = \fixed c {
  \clef bass

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  d4\mf r d r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  d4\mf r d r |
  d4\mf r d r |
  f4\mf r f r |
  g4\mf r g r |
  bes4\mf r bes r |
  c'4\mf r c' r |
  d4\mf r d r |
  a,4\mf r a, r |
  d4\mf r d r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  d4\mf r d r |
  d4\mf r d r |
  f4\mf r f r |
  g4\mf r g r |
  bes4\mf r bes r |
  c'4\mf r c' r |
  d4\mf r d r |
  a,4\mf r a, r |
  d4\mf r d r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  c4\mf r c r |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  \tempo "II. Bat Country" 4 = 126
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
  \tempo "III. Seize the Day" 4 = 72
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
  \tempo "IV. The Wicked End" 4 = 88
  g,2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |
  g2.\mf |
  c'2.\mf |
  d2.\mf |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |
  g2.\mf |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |
  g2.\mf |
  c'2.\mf |
  d2.\mf |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |
  g2.\mf |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  d2.\mf |
  c2.\mf |
  bes,2.\mf |
  a,2.\mf |
  d2.\mf |
  f2.\mf |
  g2.\mf |
  a2.\mf |
  d2.\mf |
  bes,2.\mf |
  c2.\mf |
  a,2.\mf |
  d2.\mf |
  c2.\mf |
  bes,2.\mf |
  a,2.\mf |
  d2.\mf |
  f2.\mf |
  g2.\mf |
  a2.\mf |
  d2.\mf |
  bes,2.\mf |
  c2.\mf |
  a,2.\mf |
  d2.\mf |
  c2.\mf |
  bes,2.\mf |
  a,2.\mf |
  d2.\mf |
  f2.\mf |
  g2.\mf |
  a2.\mf |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
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
% Timpani (Percussion)
% ======================================================================
timpaniPart = \fixed c, {
  \clef bass

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  f4\f r f r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |
  f4\f r f r |
  f4\f r f r |
  f4\f r f r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |
  f4\f r f r |
  f4\f r f r |
  f4\f r f r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  \tempo "II. Bat Country" 4 = 126
  f4\f r f r |
  f4\f r f r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |
  bes4\f r bes r |
  f4\f r f r |
  f4\f r f r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |
  bes4\f r bes r |
  f4\f r f r |
  f4\f r f r |
  c'4\f r c' r |
  f4\f r f r |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  \tempo "III. Seize the Day" 4 = 72
  f4\f r f r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  c'4\f r c' r |
  bes4\f r bes r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |
  f4\f r f r |
  f4\f r f r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  c'4\f r c' r |
  bes4\f r bes r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |
  f4\f r f r |
  f4\f r f r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  \key g \minor
  \tempo "IV. The Wicked End" 4 = 88
  bes2.\f |
  ees'2.\f |
  f2.\f |
  ees'2.\f |
  bes2.\f |
  c'2.\f |
  ees'2.\f |
  bes2.\f |
  ees'2.\f |
  f2.\f |
  c'2.\f |
  bes2.\f |
  bes2.\f |
  ees'2.\f |
  f2.\f |
  ees'2.\f |
  bes2.\f |
  c'2.\f |
  ees'2.\f |
  bes2.\f |
  ees'2.\f |
  f2.\f |
  c'2.\f |
  bes2.\f |
  bes2.\f |
  ees'2.\f |
  f2.\f |
  ees'2.\f |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  f4.\f f4. |
  c'4.\f c'4. |
  bes4.\f bes4. |
  bes4.\f bes4. |
  f4.\f f4. |
  f4.\f f4. |
  f4.\f f4. |
  bes4.\f bes4. |
  f4.\f f4. |
  bes4.\f bes4. |
  c'4.\f c'4. |
  bes4.\f bes4. |
  f4.\f f4. |
  c'4.\f c'4. |
  bes4.\f bes4. |
  bes4.\f bes4. |
  f4.\f f4. |
  f4.\f f4. |
  f4.\f f4. |
  bes4.\f bes4. |
  f4.\f f4. |
  bes4.\f bes4. |
  c'4.\f c'4. |
  bes4.\f bes4. |
  f4.\f f4. |
  c'4.\f c'4. |
  bes4.\f bes4. |
  bes4.\f bes4. |
  f4.\f f4. |
  f4.\f f4. |
  f4.\f f4. |
  bes4.\f bes4. |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |
  ees'4\f r ees' r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |
  ees'4\f r ees' r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  c'4\f r c' r |
  f4\f r f r |
  bes4\f r bes r |
  c'4\f r c' r |
  ees'4\f r ees' r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  bes4\f r bes r |
  f4\f r f r |
  c'4\f r c' r |
  \bar "|."
}

% ======================================================================
% Marimba (Percussion)
% ======================================================================
marimbaPart = \fixed c' {
  \clef treble

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \key d \minor
  \tempo "I. Beast and the Harlot" 4 = 144
  d4\mf r d r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  d4\mf r d r |
  d4\mf r d r |
  f4\mf r f r |
  g4\mf r g r |
  bes4\mf r bes r |
  c'4\mf r c' r |
  d'4\mf r d' r |
  a4\mf r a r |
  d'4\mf r d' r |
  d'4\mf r d' r |
  bes4\mf r bes r |
  c'4\mf r c' r |
  d'4\mf r d' r |
  d'4\mf r d' r |
  f4\mf r f r |
  g4\mf r g r |
  bes4\mf r bes r |
  c'4\mf r c' r |
  d'4\mf r d' r |
  a4\mf r a r |
  d'4\mf r d' r |
  d'4\mf r d' r |
  bes4\mf r bes r |
  c'4\mf r c' r |

  % --- II. Bat Country (mm. 29-56) ---
  \time 4/4
  \key d \minor
  \tempo "II. Bat Country" 4 = 126
  d'4\mf r d' r |
  f4\mf r f r |
  c4\mf r c r |
  g,4\mf r g, r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  d4\mf r d r |
  a,4\mf r a, r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  a,4\mf r a, r |
  d4\mf r d r |
  f4\mf r f r |
  c4\mf r c r |
  g,4\mf r g, r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  d4\mf r d r |
  a,4\mf r a, r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  a,4\mf r a, r |
  d4\mf r d r |
  f4\mf r f r |
  c4\mf r c r |
  g,4\mf r g, r |

  % --- III. Seize the Day (mm. 57-84) ---
  \time 4/4
  \key f \major
  \tempo "III. Seize the Day" 4 = 72
  f,4\mf r f, r |
  c4\mf r c r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  f,4\mf r f, r |
  c4\mf r c r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  f4\mf r f r |
  f4\mf r f r |
  c4\mf r c r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  f,4\mf r f, r |
  c4\mf r c r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  f4\mf r f r |
  f4\mf r f r |
  c4\mf r c r |
  d4\mf r d r |
  bes,4\mf r bes, r |

  % --- IV. The Wicked End (mm. 85-112) ---
  \time 3/4
  \key g \minor
  \tempo "IV. The Wicked End" 4 = 88
  g,2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |
  g2.\mf |
  c'2.\mf |
  d'2.\mf |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |
  g2.\mf |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |
  g2.\mf |
  c'2.\mf |
  d'2.\mf |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |
  g2.\mf |
  g2.\mf |
  ees2.\mf |
  f2.\mf |
  d2.\mf |

  % --- V. Blinded in Chains & Sidewinder (mm. 113-144) ---
  \time 6/8
  \key d \minor
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
  d2.\mf |
  c2.\mf |
  bes,2.\mf |
  a,2.\mf |
  d2.\mf |
  f2.\mf |
  g2.\mf |
  a2.\mf |
  d'2.\mf |
  bes2.\mf |
  c'2.\mf |
  a2.\mf |
  d'2.\mf |
  c'2.\mf |
  bes2.\mf |
  a2.\mf |
  d'2.\mf |
  f2.\mf |
  g2.\mf |
  a2.\mf |
  d'2.\mf |
  bes2.\mf |
  c'2.\mf |
  a2.\mf |
  d'2.\mf |
  c'2.\mf |
  bes2.\mf |
  a2.\mf |
  d'2.\mf |
  f2.\mf |
  g2.\mf |
  a2.\mf |

  % --- VI. M.I.A. (mm. 145-184) ---
  \time 4/4
  \key d \minor
  \tempo "VI. M.I.A." 4 = 140
  d'4\mf r d' r |
  bes4\mf r bes r |
  f4\mf r f r |
  c4\mf r c r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  d4\mf r d r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  f,4\mf r f, r |
  a,4\mf r a, r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  f,4\mf r f, r |
  c4\mf r c r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  d4\mf r d r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  f,4\mf r f, r |
  a,4\mf r a, r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  f,4\mf r f, r |
  c4\mf r c r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  c4\mf r c r |
  d4\mf r d r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  f,4\mf r f, r |
  a,4\mf r a, r |
  d4\mf r d r |
  bes,4\mf r bes, r |
  f,4\mf r f, r |
  c4\mf r c r |
  \bar "|."
}

% ======================================================================
% Concert Percussion (Percussion)
% ======================================================================
drumkitPart = \drummode {

  % --- I. Beast and the Harlot (mm. 1-28) ---
  \time 4/4
  \tempo "I. Beast and the Harlot" 4 = 144
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
  \tempo "II. Bat Country" 4 = 126
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
  \tempo "III. Seize the Day" 4 = 72
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
  \tempo "IV. The Wicked End" 4 = 88
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
  \tempo "V. Blinded in Chains & Sidewinder" 4 = 136
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
  \tempo "VI. M.I.A." 4 = 140
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
    \new StaffGroup = "Woodwinds" <<
      \new Staff \with { instrumentName = #"Flute" } { \flutePart }
      \new Staff \with { instrumentName = #"Oboe" } { \oboePart }
      \new Staff \with { instrumentName = #"Bb Clarinet" } { \clarinetPart }
      \new Staff \with { instrumentName = #"Alto Saxophone" } { \altosaxPart }
      \new Staff \with { instrumentName = #"Tenor Saxophone" } { \tenorsaxPart }
    >>
    \new StaffGroup = "Brass" <<
      \new Staff \with { instrumentName = #"Bb Trumpet" } { \trumpetPart }
      \new Staff \with { instrumentName = #"French Horn in F" } { \frenchhornPart }
      \new Staff \with { instrumentName = #"Tenor Trombone" } { \trombonePart }
      \new Staff \with { instrumentName = #"Tuba" } { \tubaPart }
    >>
    \new StaffGroup = "Strings" <<
      \new Staff \with { instrumentName = #"Electric Bass" } { \electricbassPart }
      \new Staff \with { instrumentName = #"Cello" } { \celloPart }
    >>
    \new StaffGroup = "Percussion" <<
      \new Staff \with { instrumentName = #"Timpani" } { \timpaniPart }
      \new Staff \with { instrumentName = #"Marimba" } { \marimbaPart }
      \new DrumStaff \with { instrumentName = #"Concert Drums" } { \drumkitPart }
    >>
  >>
  \layout { }
  \midi { }
}