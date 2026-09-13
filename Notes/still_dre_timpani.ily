\version "2.24.0"

% ============================================================================
% Still D.R.E. — TIMPANI (Concert Pitch, Absolute \fixed c')
% 4 Standard Concert Kettles: F2 (41), Bb2 (46), C3 (48), Eb3 (51)
% 64 Measures Total
% ============================================================================

timpaniNotes = \fixed c' {
  \clef bass

  % Part I: Intro (mm. 1-8)
  R1 * 4 |
  % mm. 5-8: Groove Drop Hits (strictly on tuned kettles C3 & Eb3)
  \repeat unfold 2 {
    c,4.\f c,8 r2 |
    ees,4.\f bes,,8 r2 |
  }

  % Part II: Section A — Verse 1 (mm. 9-24)
  \repeat unfold 8 {
    c,4.\mp c,8 r2 |
    ees,4.\mp bes,,8 r2 |
  }

  % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
  \repeat unfold 4 {
    c,4.\ff c,8 r2 |
    ees,4.\ff bes,,8 r2 |
  }

  % Part IV: Section C — Chamber Interlude (mm. 33-40)
  R1 * 8 |

  % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
  \repeat unfold 3 {
    c,4.\mf\< c,8 r2 |
    ees,4. bes,,8 r2\! |
  }
  % mm. 47-48: Dramatic Timpani Roll building to Tutti
  c,1\f:32\< |
  ees,1\ff:32\! |

  % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
  \repeat unfold 4 {
    c,4.\fff c,8 r2 |
    ees,4.\fff bes,,8 r2 |
  }

  % Part VII: Section F — Coda & Outro (mm. 57-64)
  \repeat unfold 2 {
    c,4.\ff c,8 r2 |
    ees,4.\ff bes,,8 r2 |
  }
  R1 * 3 |
  c,4-.\fff r4 r2\fermata \bar "|."
}
