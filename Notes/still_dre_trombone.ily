\version "2.24.0"

% ============================================================================
% Still D.R.E. — TENOR TROMBONE (Concert Pitch, Absolute \fixed c')
% Heavy G-Funk Brass Stabs, Punchy Low-Mid Power & Chorus Reinforcement
% 64 Measures Total
% ============================================================================

tromboneNotes = \fixed c' {
  \clef bass

  % Part I: Intro (mm. 1-8)
  R1 * 8 |

  % Part II: Section A — Verse 1 (mm. 9-24)
  \repeat unfold 7 {
    r4 <a, e>8-.\mf r8 r8 <a, e>8-. r4 |
    r4 <g, d>8-. r8 <e, b,>4-. r4 |
  }
  % mm. 23-24: Build into Chorus
  r4 <a, e>8-. r8 r8 <a, e>8-. r4 |
  <g, d>8 <a, e> <b, fis> <c g> <d a>2\f |

  % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
  \repeat unfold 2 {
    c4.\ff b,8 a,4 g,8 e, |
    a,4 g,8 e, g,2 |
    c4. b,8 a,4 g,8 e, |
    g,8 e, fis, e, e,2 |
  }

  % Part IV: Section C — Chamber Interlude (mm. 33-40)
  a,1\p |
  b,1 |
  g,1 |
  a,1 |
  a,1 |
  b,1 |
  g,2( a, |
  e,1) |

  % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
  \repeat unfold 3 {
    <a, e>4-.\mf\< <a, e>-. r8 <a, e>-. r4 |
    <g, d>4-. <g, d>-. <e, b,>2\! |
  }
  % mm. 47-48: Dynamic build
  <a, e>8-.\f <b, f>-. <c g>-. <d a>-. <e b>4-. <f c'>-. |
  <g d'>1\ff |

  % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
  \repeat unfold 2 {
    c4.\fff b,8 a,4 g,8 e, |
    a,4 g,8 e, g,2 |
    c4. b,8 a,4 g,8 e, |
    g,8 e, fis, e, e,2 |
  }

  % Part VII: Section F — Coda & Outro (mm. 57-64)
  \repeat unfold 2 {
    <a, e>8-.\ff r <a, e>-. r <a, e>4-. <a, e>8-. r |
    <g, d>8-. r <g, d>-. r <e, b,>4-. <e, b,>8-. r |
  }
  % mm. 61-63: Sudden drop
  R1 * 3 |
  % m. 64: Final stinger
  <a,, e, a,>4-.\fff r4 r2\fermata \bar "|."
}
