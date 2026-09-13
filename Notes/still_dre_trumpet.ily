\version "2.24.0"

% ============================================================================
% Still D.R.E. — B♭ TRUMPET (Concert Pitch, Absolute \fixed c')
% Calibrated Range: strictly within [Bb3 - F5 / MIDI 58-77]
% 64 Measures Total
% ============================================================================

trumpetNotes = \fixed c' {
  \clef treble

  % Part I: Intro (mm. 1-8)
  R1 * 8 |

  % Part II: Section A — Verse 1 (mm. 9-24)
  \repeat unfold 7 {
    r4 <e a>8-.\mf r8 r8 <e a>8-. r4 |
    r4 <d g>8-. r8 <b, e>4-. r4 |
  }
  % mm. 23-24: Build into Chorus
  r4 <e a>8-. r8 r8 <e a>8-. r4 |
  <d g>8 <e a> <fis b> <g c'> <a d'>2\f |

  % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
  \repeat unfold 2 {
    e'4.\ff d'8 c'4 b8 a |
    c'4 b8 a b2 |
    e'4. d'8 c'4 b8 a |
    c'8 a b a a2 |
  }

  % Part IV: Section C — Chamber Interlude (mm. 33-40)
  R1 * 8 |

  % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
  \repeat unfold 3 {
    <e a>4-.\mf\< <e a>-. r8 <e a>-. r4 |
    <d g>4-. <d g>-. <b, e>2\! |
  }
  % mm. 47-48: Dynamic build
  <e a>8-.\f <f b>-. <g c'>-. <a d'>-. <b e'>4-. <c' f'>-. |
  <d' g>1\ff |

  % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
  \repeat unfold 2 {
    e'4.\fff d'8 c'4 b8 a |
    c'4 b8 a b2 |
    e'4. d'8 c'4 b8 a |
    c'8 a b a a2 |
  }

  % Part VII: Section F — Coda & Outro (mm. 57-64)
  \repeat unfold 2 {
    <e a>8-.\ff r <e a>-. r <e a>4-. <e a>8-. r |
    <d g>8-. r <d g>-. r <b, e>4-. <b, e>8-. r |
  }
  R1 * 3 |
  <e a c'>4-.\fff r4 r2\fermata \bar "|."
}
