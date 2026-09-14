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

upper = {
  \global
  \clef treble

  % Bar 1
  g'4( c''8 d''8 e''8 a''8) |
  % Bar 2
  a''4. r8 g''4( |
  % Bar 3
  g''4) r8 r4. |
  % Bar 4
  R2. |
  % Bar 5
  r8 a'8( d''8 e''8 f''8 a''8) |
  % Bar 6
  bes''8 r8 r8 r8 a''4( |
  % Bar 7
  a''4.) r8 a''4( |
  % Bar 8
  a''4) r8 r4. |

  % Bar 9
  b''4. r8 a''4( |
  % Bar 10
  a''8) r8 r8 r8 a''4( |
  % Bar 11
  a''8) r8 c'''2 |
  % Bar 12
  a''4. g''4. |
  % Bar 13
  \acciaccatura { g'16 a' gis' } a'2 r4 |
  % Bar 14
  R2. |
  % Bar 15
  R2. |
  % Bar 16
  r4. r8 g''8 a''8 |
  % Bar 17
  a''4 g''4 f''8 e''8 |

  % Bar 18
  g'2 r4 |
  % Bar 19
  d'''4 b''8 ais''4 g''8 |
  % Bar 20
  f'2 r4 |
  % Bar 21
  c'8 d'8 e'8 g'8 a'8 c''8 |
  % Bar 22
  c'''2 r8 a''8 |
  % Bar 23
  r8 g''2 r8 |
  % Bar 24
  R2. |
  % Bar 25
  r4. r8 f''16 g''16 a''8 |

  % Bar 26
  r4. r8 f''4 |
  % Bar 27
  g'2 r4 |
  % Bar 28
  r8 f''4 e''4. |
  % Bar 29
  g'4( c''8 d''8 e''8 a''8) |
  % Bar 30
  a''4. r8 g''4 |
  % Bar 31
  c'''2 r4 |
  \bar "|."
}

lower = {
  \global
  \clef bass

  % Bar 1-4 (C)
  <c e g>4.\p <c e g>4. |
  <c e g>4. <c e g>4. |
  <c e g>4. <c e g>4. |
  <c e g>4. <c e g>4. |

  % Bar 5-8 (Dm)
  <d f a>4. <d f a>4. |
  <d f a>4. <d f a>4. |
  <d f a>4. <d f a>4. |
  <d f a>4. <d f a>4. |

  % Bar 9-12 (F)
  <a, c f>4. <a, c f>4. |
  <a, c f>4. <a, c f>4. |
  <a, c f>4. <a, c f>4. |
  <a, c f>4. <a, c f>4. |

  % Bar 13-16 (C)
  <c e>4.\p <c e>4. |
  <c e>4. <c e>4. |
  <c e g>4. <c e g>4. |
  <c e>4. <c e>4. |

  % Bar 17 (F)
  <a, c f>4. <a, c f>4. |

  % Bar 18 (C)
  <c e g>4. <c e g>4. |

  % Bar 19-20 (D)
  <d fis a>4. <d fis a>4. |
  <d fis a>4. <d fis a>4. |

  % Bar 21-24 (C)
  <c e g>4. <c e g>4. |
  <c e g>4. <c e g>4. |
  <c e g>4. <c e g>4. |
  <c e g>4. <c e g>4. |

  % Bar 25 (F)
  <a, c f>4. <a, c f>4. |

  % Bar 26 (C)
  <c e g>4. <c e g>4. |

  % Bar 27-28 (G)
  <b, d g>4. <b, d g>4. |
  <b, d g>4. <b, d g>4. |

  % Bar 29-30 (C)
  <c e g>4. <c e g>4. |
  <c e g>4. <c e g>4. |

  % Bar 31 (C)
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
