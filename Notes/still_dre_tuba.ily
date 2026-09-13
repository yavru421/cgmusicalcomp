\version "2.24.0"

% ============================================================================
% Still D.R.E. — TUBA (Concert Pitch, Absolute \fixed c')
% Calibrated Range: strictly within [Bb1 - F3 / MIDI 34-53]
% 64 Measures Total
% ============================================================================

tubaNotes = \fixed c' {
  \clef bass

  % Part I: Intro (mm. 1-8)
  R1 * 4 |
  % mm. 5-8: Heavy Bass Entry
  \repeat unfold 2 {
    a,,4.\f a,,8 r8 a,,8 c,8 cis,8 |
    b,,4. b,,8 r8 e,,8 e,8 d,8 |
  }

  % Part II: Section A — Verse 1 (mm. 9-24)
  \repeat unfold 8 {
    a,,4.\mf a,,8 r8 a,,8 c,8 cis,8 |
    b,,4. b,,8 r8 e,,8 e,8 d,8 |
  }

  % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
  \repeat unfold 4 {
    a,,4.\ff a,,8 r8 a,,8 c,8 cis,8 |
    b,,4. b,,8 r8 e,,8 e,8 d,8 |
  }

  % Part IV: Section C — Chamber Interlude (mm. 33-40)
  \repeat unfold 4 {
    a,,4.\p a,,8 r4 c,8 cis,8 |
    b,,4. b,,8 r4 e,,8 d,8 |
  }

  % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
  \repeat unfold 4 {
    a,,4.\mf\< a,,8 r8 a,,8 c,8 cis,8 |
    b,,4. b,,8 r8 e,,8 e,8 d,\! |
  }

  % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
  \repeat unfold 4 {
    a,,4.\fff a,,8 r8 a,,8 c,8 cis,8 |
    b,,4. b,,8 r8 e,,8 e,8 d,8 |
  }

  % Part VII: Section F — Coda & Outro (mm. 57-64)
  \repeat unfold 2 {
    a,,4.\ff a,,8 r8 a,,8 c,8 cis,8 |
    b,,4. b,,8 r8 e,,8 e,8 d,8 |
  }
  % mm. 61-63: Sudden drop
  a,,4.\mp a,,8 r4 c,8 cis,8 |
  b,,4. b,,8 r4 e,,8 d,8 |
  a,,4.\p a,,8 r2 |
  % m. 64: Final stinger
  a,,4-.\fff r4 r2\fermata \bar "|."
}
