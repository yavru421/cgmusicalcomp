\version "2.24.0"

% ============================================================================
% Still D.R.E. — ALTO SAXOPHONE (Concert Pitch, Absolute \fixed c')
% Calibrated Range: strictly within [C4 - F5 / MIDI 60-77]
% 64 Measures Total
% ============================================================================

altoSaxNotes = \fixed c' {
  \clef treble

  % Part I: Intro (mm. 1-8)
  R1 * 6 |
  r2 r4 e8(\mf fis |
  g8 e a4) r2 |

  % Part II: Section A — Verse 1 (mm. 9-24)
  \repeat unfold 7 {
    r4 <e a>8-.\mf r8 r8 <e a>8-. r4 |
    r4 <d g>8-. r8 <e g>4-. r4 |
  }
  % mm. 23-24: Build into Chorus
  r4 <e a>8-. r8 r8 <e a>8-. r4 |
  <d g>8 <e a> <fis b> <g c'> <a d'>2\f |

  % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
  \repeat unfold 2 {
    c'4.\ff b8 a4 g8 e |
    a4 g8 e g2 |
    c'4. b8 a4 g8 e |
    g8 e fis e e2 |
  }

  % Part IV: Section C — Chamber Interlude (mm. 33-40)
  a2(\p b |
  c'4. b8 a2) |
  fis2( g |
  e1) |
  a2( b |
  c'4. b8 a2) |
  fis4.( g8 e2) |
  r1 |

  % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
  \repeat unfold 3 {
    <e a>4-.\mf\< <e a>-. r8 <e a>-. r4 |
    <d g>4-. <d g>-. <e g>2\! |
  }
  % mm. 47-48: Dynamic build
  <e a>8-.\f <f b>-. <g c'>-. <a d'>-. <b e'>4-. <c' f'>-. |
  <d' g>1\ff |

  % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
  \repeat unfold 2 {
    c'4.\fff b8 a4 g8 e |
    a4 g8 e g2 |
    c'4. b8 a4 g8 e |
    g8 e fis e e2 |
  }

  % Part VII: Section F — Coda & Outro (mm. 57-64)
  \repeat unfold 2 {
    <e a>8-.\ff r <e a>-. r <e a>4-. <e a>8-. r |
    <d g>8-. r <d g>-. r <e g>4-. <e g>8-. r |
  }
  R1 * 3 |
  <e a c'>4-.\fff r4 r2\fermata \bar "|."
}
