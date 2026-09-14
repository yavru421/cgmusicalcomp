\version "2.24.4"

\header {
  title = "Trailer Park Boys Theme"
  subtitle = "piano arrangement"
  composer = "Cory & Trevor"
  arranger = "opr. Radosław Imiołek"
  dedication = "Dedykacja dla Mikołaja Króla"
}

\paper {
  #(set-paper-size "letter")
}

global = {
  \key c \major
  \time 6/8
}

upper = \relative c' {
  \global
  \clef treble
  % Measure 1
  g'4( c8 d e a) |
  % Measure 2
  a4. r8 g4( |
  % Measure 3
  g4) r8 r4. |
  % Measure 4
  R2. |
  % Measure 5
  r8 a( d e f a) |
  % Measure 6
  bes8 r r r a4( |
  % Measure 7
  a4.) r8 a4( |
  % Measure 8
  a4) r8 r4. |

  % Measure 9
  b4. r8 a4( |
  % Measure 10
  a8) r r r a4( |
  % Measure 11
  a8) r c2 |
  % Measure 12
  a4. g4. |
  % Measure 13
  g8 a gis a r4 |
  % Measure 14
  R2. |
  % Measure 15
  R2. |
  % Measure 16
  r4. r8 g a |
  % Measure 17
  a4 g4 f8 e |

  % Measure 18
  g,2 r4 |
  % Measure 19
  d''4 b8 ais4 g8 |
  % Measure 20
  f2 r4 |
  % Measure 21
  c8 d e g a c |
  % Measure 22
  c2 r8 a |
  % Measure 23
  r8 g2 r8 |
  % Measure 24
  R2. |
  % Measure 25
  r4. r8 f16 g a8 |

  % Measure 26
  r4. r8 f4 |
  % Measure 27
  g,2 r4 |
  % Measure 28
  r8 f'4 e4. |
  % Measure 29
  g,4 c8 d e a |
  % Measure 30
  a4. r8 g4 |
  % Measure 31
  c2 r4 |
  \bar "|."
}

lower = \relative c {
  \global
  \clef bass
  % Measure 1
  <c e g>4.\p <c e g>4. |
  % Measure 2
  <c e g>4. <c e g>4. |
  % Measure 3
  <c e g>4. <c e g>4. |
  % Measure 4
  <c e g>4. <c e g>4. |
  % Measure 5
  <d f a>4. <d f a>4. |
  % Measure 6
  <d f a>4. <d f a>4. |
  % Measure 7
  <d f a>4. <d f a>4. |
  % Measure 8
  <d f a>4. <d f a>4. |

  % Measure 9
  <a, c f>4. <a, c f>4. |
  % Measure 10
  <a, c f>4. <a, c f>4. |
  % Measure 11
  <a, c f>4. <a, c f>4. |
  % Measure 12
  <a, c f>4. <a, c f>4. |
  % Measure 13
  <c e>4.\p <c e>4. |
  % Measure 14
  <c e>4. <c e>4. |
  % Measure 15
  <c e g>4. <c e g>4. |
  % Measure 16
  <c e>4. <c e>4. |
  % Measure 17
  <a, c f>4. <a, c f>4. |

  % Measure 18
  <c e g>4. <c e g>4. |
  % Measure 19
  <d fis a>4. <d fis a>4. |
  % Measure 20
  <d fis a>4. <d fis a>4. |
  % Measure 21
  <c e g>4. <c e g>4. |
  % Measure 22
  <c e g>4. <c e g>4. |
  % Measure 23
  <c e g>4. <c e g>4. |
  % Measure 24
  <c e g>4. <c e g>4. |
  % Measure 25
  <a, c f>4. <a, c f>4. |

  % Measure 26
  <c e g>4. <c e g>4. |
  % Measure 27
  <b, d g>4. <b, d g>4. |
  % Measure 28
  <b, d g>4. <b, d g>4. |
  % Measure 29
  <c e g>4. <c e g>4. |
  % Measure 30
  <c e g>4. <c e g>4. |
  % Measure 31
  <c e g c'>2. |
  \bar "|."
}

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
  \layout { }
  \midi {
    \tempo 4. = 50
  }
}
