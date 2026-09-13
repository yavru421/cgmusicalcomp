\version "2.24.0"

% ============================================================================
% The Sovereign Forge — 8. PERCUSSION 2 (Crash & Suspended Cymbals)
% Concert Band Metallic Percussion (\drummode)
% ============================================================================

percussionTwoNotes = \drummode {
  % Part I: Lento Pensieroso (Suspended Cymbal Mallet Roll mm. 1-8)
  R1 * 6 |
  cyms1:32\p\< ~ |
  cyms2\> ~ cyms4\! r\fermata |

  % Part II: Allegro Risoluto (mm. 9-22)
  R1 * 2 |
  cymc4\f r r2 |
  r1 |
  cymc4\f r r2 |
  r1 |
  cyms1:32\< |
  cymc4\ff r r2 |
  cymc4\ff r cymc r |
  cymc4 r cymc r |
  cyms1:32\< |
  cymc2.\ff r4 |
  cymc4\fff r cymc r |
  cymc1:32\fff\fermata |

  % Part III: Maestoso Nobile (mm. 23-34)
  cymc4\f r r2 |
  r1 |
  cyms1:32\p\< ~ |
  cyms1\f |
  cymc4\f r r2 |
  r1 |
  cyms1:32\< |
  cymc4\ff r r2 |
  cymc4\fff r cymc r |
  cymc4 r cymc r |
  cyms1:32\< |
  cymc1:32\fff \bar "|."
}
