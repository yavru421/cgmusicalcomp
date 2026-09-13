\version "2.24.0"

% ============================================================================
% Still D.R.E. — PERCUSSION 1: Concert Snare & Bass Drum (\drummode)
% Tight West Coast Backbeat (Snare on 2 & 4, G-Funk Kick Pattern)
% 64 Measures Total
% ============================================================================

percussionOneNotes = \drummode {
  <<
    {
      % Upper Voice: Snare Drum Backbeat & Rolls
      % Part I: Intro (mm. 1-8)
      % mm. 1-4: Tacet during keyboard intro
      R1 * 4 |
      % mm. 5-8: Groove Drop (Snare cracks on 2 & 4)
      \repeat unfold 3 {
        r4 sn4\f r4 sn4 |
      }
      r4 sn4 sn8 sn16 sn sn4 |

      % Part II: Section A — Verse 1 (mm. 9-24)
      \repeat unfold 15 {
        r4 sn4\mf r4 sn4 |
      }
      r4 sn4 sn8 sn16 sn sn4 |

      % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
      \repeat unfold 7 {
        r4 sn4\ff r4 sn4 |
      }
      sn8 sn16 sn sn8 sn sn2:32\ff |

      % Part IV: Section C — Chamber Interlude (mm. 33-40)
      % Soft rim clicks
      \repeat unfold 8 {
        r4 sn4\p r4 sn4 |
      }

      % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
      \repeat unfold 6 {
        r4 sn4\mf\< r4 sn4 |
      }
      sn16 sn sn sn sn8 sn sn4:32 sn |
      sn1\f:32\< |

      % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
      \repeat unfold 7 {
        r4 sn4\fff r4 sn4 |
      }
      sn8\fff sn16 sn sn8 sn sn4 sn |

      % Part VII: Section F — Coda & Outro (mm. 57-64)
      \repeat unfold 4 {
        r4 sn4\ff r4 sn4 |
      }
      % mm. 61-63: Sudden drop
      R1 * 3 |
      % m. 64: Final stinger
      sn4-.\fff r4 r2\fermata \bar "|."
    }
    \\
    {
      % Lower Voice: Concert Bass Drum (Kick Drum)
      % Part I: Intro (mm. 1-8)
      R1 * 4 |
      \repeat unfold 4 {
        bd4.\f bd8 r8 bd8 bd4 |
      }

      % Part II: Section A — Verse 1 (mm. 9-24)
      \repeat unfold 16 {
        bd4.\mf bd8 r8 bd8 bd4 |
      }

      % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
      \repeat unfold 8 {
        bd4.\ff bd8 r8 bd8 bd4 |
      }

      % Part IV: Section C — Chamber Interlude (mm. 33-40)
      \repeat unfold 8 {
        bd4.\p bd8 r2 |
      }

      % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
      \repeat unfold 8 {
        bd4.\mf\< bd8 r8 bd8 bd4\! |
      }

      % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
      \repeat unfold 8 {
        bd4.\fff bd8 r8 bd8 bd4 |
      }

      % Part VII: Section F — Coda & Outro (mm. 57-64)
      \repeat unfold 4 {
        bd4.\ff bd8 r8 bd8 bd4 |
      }
      R1 * 3 |
      bd4-.\fff r4 r2\fermata \bar "|."
    }
  >>
}
