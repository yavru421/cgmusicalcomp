\version "2.24.0"

% ============================================================================
% Still D.R.E. — OBOE (Concert Pitch, Absolute \fixed c')
% Calibrated Range: strictly within [D4 - Eb5 / MIDI 62-75]
% 64 Measures Total
% ============================================================================

oboeNotes = \fixed c' {
  \clef treble

  % Part I: Intro (mm. 1-8)
  R1 * 8 |

  % Part II: Section A — Verse 1 (mm. 9-24)
  R1 * 4 |
  r2 r8 a(\mp b c' |
  b4. a8 e2) |
  r2 r8 a( b c' |
  d'4. c'8 b2) |

  % mm. 17-24: Weaving around flute
  \repeat unfold 3 {
    r2 r8 a16(\mf b c'8 a |
    g4.) fis8 g2 |
  }
  r2 r8 a16( b c'8 a |
  gis8 a b a gis2\f) |

  % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
  % Harmony strictly within D4 - C5 (MIDI 62-72)
  \repeat unfold 2 {
    c'4.\ff b8 a4 g8 e |
    a4 g8 e g2 |
    c'4. b8 a4 g8 e |
    g8 e fis e e2 |
  }

  % Part IV: Section C — Chamber Interlude (mm. 33-40)
  c'2(\p b |
  a4. g8 f2) |
  d2( e |
  c1) |
  c'2( b |
  a4. g8 f2) |
  d4.( e8 c2) |
  r1 |

  % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
  R1 * 4 |
  r2 c'8-.\mf\< d'-. e'-. f'-. |
  g4. f8 e4 d |
  e8-.\f f-. g-. a-. b4-. a8-. g-. |
  e1\ff\! |

  % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
  \repeat unfold 2 {
    c'4.\fff b8 a4 g8 e |
    a4 g8 e g2 |
    c'4. b8 a4 g8 e |
    g8 e fis e e2 |
  }

  % Part VII: Section F — Coda & Outro (mm. 57-64)
  \repeat unfold 2 {
    a8-.\ff r e'-. r a4-. e'8-. r |
    g8-. r d'-. r g4-. d'8-. r |
  }
  R1 * 3 |
  a4-.\fff r4 r2\fermata \bar "|."
}
