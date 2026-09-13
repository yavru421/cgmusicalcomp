\version "2.24.0"

% ============================================================================
% Moonlight Samba — 6. BASS (Electric Bass / Tuba Foundation)
% Absolute Concert Pitch \fixed c' (Bass Clef)
% ============================================================================

bassNotes = \fixed c' {
  \clef bass

  % Intro (mm. 1-8)
  cis4.\f cis8 ~ cis4 cis |
  b,4. b,8 ~ b,4 b, |
  a,4. a,8 ~ a,4 d |
  gis,4. gis,8 ~ gis,4 gis, |
  cis4. cis8 ~ cis4 cis |
  b,4. b,8 ~ b,4 b, |
  a,4. a,8 ~ a,4 d |
  gis,2\f\> cis4\p r |

  % Section A (mm. 9-16)
  cis4.\f cis8 ~ cis4 cis |
  b,4. b,8 ~ b,4 b, |
  a,4. a,8 ~ a,4 d |
  gis,4. gis,8 ~ gis,4 gis, |
  cis4. cis8 ~ cis4 cis |
  b,4. b,8 ~ b,4 b, |
  a,4. a,8 ~ a,4 d |
  gis,1\f |

  % Section B (mm. 17-24)
  cis8\ff dis e fis gis a b c' |
  d'4. c'8 b4 a |
  gis4. fis8 e4 dis |
  cis2. r4 |
  cis4.\f cis8 ~ cis4 cis |
  d4. d8 ~ d4 d |
  bis,4. bis,8 ~ bis,4 bis, |
  cis1\ff |

  % Section C: Middle Break & Slowdown (mm. 25-32)
  cis,1\pp |
  b,,1 |
  a,,2 d, |
  gis,,1 |
  cis,1 |
  b,,1 |
  a,,2 d, |
  gis,,1\fermata |

  % Section D: Reprise (mm. 33-44)
  R1 |
  cis4.\ff cis8 ~ cis4 cis |
  b,4. b,8 ~ b,4 b, |
  a,4. a,8 ~ a,4 d |
  gis,4. gis,8 ~ gis,4 gis, |
  gis,4. gis,8 ~ gis,4 gis, |
  cis8 cis r cis cis4 cis |
  d8 d r d d4 d |
  cis8\fff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  gis,8 r gis, r gis4 gis8 gis |
  cis1\fff \bar "|."
}
