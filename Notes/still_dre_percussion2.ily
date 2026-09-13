\version "2.24.0"

% ============================================================================
% Still D.R.E. — PERCUSSION 2: Hi-Hat & Cymbals (\drummode)
% Ticking 16th Hi-Hat Pocket & Sectional Crash Punctuation
% 64 Measures Total
% ============================================================================

percussionTwoNotes = \drummode {
  % Part I: Intro (mm. 1-8)
  % mm. 1-4: Tacet during keyboard intro
  R1 * 4 |
  % mm. 5-8: Hi-Hat joins with crash on m. 5
  cymc4\f hh16 hh hh hh hh8 hh16 hh hh8 hho8 |
  \repeat unfold 3 {
    hh16 hh hh hh hh8 hh16 hh hh8 hh16 hh hh8 hho8 |
  }

  % Part II: Section A — Verse 1 (mm. 9-24)
  \repeat unfold 16 {
    hh16\mf hh hh hh hh8 hh16 hh hh8 hh16 hh hh8 hho8 |
  }

  % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
  cymc4\ff hh16 hh hh hh hh8 hh16 hh hh8 hho8 |
  \repeat unfold 7 {
    hh16 hh hh hh hh8 hh16 hh hh8 hh16 hh hh8 hho8 |
  }

  % Part IV: Section C — Chamber Interlude (mm. 33-40)
  % Delicate closed hat
  \repeat unfold 8 {
    hh8\p hh hh hh hh hh hh hho |
  }

  % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
  cymc4\mf\< hh16 hh hh hh hh8 hh16 hh hh8 hho8 |
  \repeat unfold 6 {
    hh16 hh hh hh hh8 hh16 hh hh8 hh16 hh hh8 hho8 |
  }
  cymc2\f:32\< cymc2:32\! |

  % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
  cymc4\fff hh16 hh hh hh hh8 hh16 hh hh8 hho8 |
  \repeat unfold 7 {
    hh16 hh hh hh hh8 hh16 hh hh8 hh16 hh hh8 hho8 |
  }

  % Part VII: Section F — Coda & Outro (mm. 57-64)
  cymc4\ff hh16 hh hh hh hh8 hh16 hh hh8 hho8 |
  \repeat unfold 3 {
    hh16 hh hh hh hh8 hh16 hh hh8 hh16 hh hh8 hho8 |
  }
  % mm. 61-63: Sudden drop
  R1 * 3 |
  % m. 64: Final stinger
  cymc4-.\fff r4 r2\fermata \bar "|."
}
