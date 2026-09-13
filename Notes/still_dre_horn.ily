\version "2.24.0"

% ============================================================================
% Still D.R.E. — FRENCH HORN IN F (Concert Pitch, Absolute \fixed c')
% Calibrated Range: strictly within [Bb3 - F5 / MIDI 58-77]
% 64 Measures Total
% ============================================================================

hornNotes = \fixed c' {
  \clef treble

  % Part I: Intro (mm. 1-8)
  R1 * 8 |

  % Part II: Section A — Verse 1 (mm. 9-24)
  \repeat unfold 7 {
    r4 <c e>8-.\mf r8 r8 <c e>8-. r4 |
    r4 <b, d>8-. r8 <b, e>4-. r4 |
  }
  % mm. 23-24: Build into Chorus
  r4 <c e>8-. r8 r8 <c e>8-. r4 |
  <b, d>8 <c e> <d fis> <e g> <fis a>2\f |

  % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
  \repeat unfold 2 {
    a4.\ff g8 e4 d8 c |
    e4 d8 c d2 |
    a4. g8 e4 d8 c |
    e8 c d c c2 |
  }

  % Part IV: Section C — Chamber Interlude (mm. 33-40)
  c1\p |
  d1 |
  b,1 |
  c1 |
  c1 |
  d1 |
  b,2( c |
  c1) |

  % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
  \repeat unfold 3 {
    <c e>4-.\mf\< <c e>-. r8 <c e>-. r4 |
    <b, d>4-. <b, d>-. <b, e>2\! |
  }
  % mm. 47-48: Dynamic build
  <c e>8-.\f <d f>-. <e g>-. <f a>-. <g b>4-. <a c'>-. |
  <b d'>1\ff |

  % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
  \repeat unfold 2 {
    a4.\fff g8 e4 d8 c |
    e4 d8 c d2 |
    a4. g8 e4 d8 c |
    e8 c d c c2 |
  }

  % Part VII: Section F — Coda & Outro (mm. 57-64)
  \repeat unfold 2 {
    <c e>8-.\ff r <c e>-. r <c e>4-. <c e>8-. r |
    <b, d>8-. r <b, d>-. r <b, e>4-. <b, e>8-. r |
  }
  R1 * 3 |
  <c e a>4-.\fff r4 r2\fermata \bar "|."
}
