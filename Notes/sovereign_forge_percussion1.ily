\version "2.24.0"

% ============================================================================
% The Sovereign Forge — 7. PERCUSSION 1 (Concert Snare & Bass Drum)
% Standard Concert Band Percussion Battery (\drummode)
% ============================================================================

percussionOneNotes = \drummode {
  % Part I: Lento Pensieroso (Tacet mm. 1-8)
  R1 * 8 |

  % Part II: Allegro Risoluto (Forge Cadence mm. 9-22)
  sn8\f sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn8\f sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn8 sn sn sn sn2:32 |
  sn2. r4 |
  sn8\ff sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn2.\ff r4 |
  sn8\fff sn16 sn sn8 sn sn4 sn |
  sn1:32\fff\fermata |

  % Part III: Maestoso Nobile (Noble March & Heartbeat mm. 23-34)
  <<
    {
      sn4.\f sn8 sn4 sn |
      sn4. sn8 sn2:32 |
      sn4. sn8 sn4 sn |
      sn1:32 ~ |
      sn4. sn8 sn4 sn |
      sn4. sn8 sn2:32 |
      sn4. sn8 sn4 sn |
      sn2. r4 |
      sn4.\fff sn8 sn4 sn |
      sn4. sn8 sn2:32 |
      sn4. sn8 sn4 sn |
      sn1:32\fff \bar "|."
    }
    \\
    {
      bd4\f r bd r |
      bd4 r bd2 |
      bd4 r bd r |
      bd1 ~ |
      bd4 r bd r |
      bd4 r bd2 |
      bd4 r bd r |
      bd2. r4 |
      bd4\fff r bd r |
      bd4 r bd2 |
      bd4 r bd r |
      bd1\fff \bar "|."
    }
  >>
}
