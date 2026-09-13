\version "2.24.0"

% ============================================================================
% Moonlight Samba — 9. PERCUSSION 3 (Auxiliary Latin: Cowbell & Shaker)
% Traditional Samba Engine & Syncopated Latin Polyrhythms (\drummode)
% ============================================================================

percussionThreeNotes = \drummode {
  <<
    {
      % Cowbell Clave
      \repeat unfold 7 {
        cb4 cb8 cb r cb cb4 |
      }
      cb4 cb8 cb cb2 |
      
      \repeat unfold 15 {
        cb4 cb8 cb r cb cb4 |
      }
      cb8\ff cb16 cb cb8 cb cb2:32\fermata |
      
      % Middle Break
      R1 * 7 |
      r1\fermata |
      
      % Reprise
      r1 |
      \repeat unfold 7 {
        cb4 cb8 cb r cb cb4 |
      }
      cb8\fff cb r cb cb4 cb8 cb |
      cb8 r cb r cb4 cb8 cb |
      cb8 cb cb cb cb4 cb |
      cb1\fff \bar "|."
    }
    \\
    {
      % Shaker / Maracas (Continuous 16th Samba Engine)
      \repeat unfold 8 {
        cab16 cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      }
      \repeat unfold 16 {
        cab16 cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      }
      % Middle Break
      \repeat unfold 7 {
        cab4\pp r cab r |
      }
      cab1\fermata\pp |
      
      % Reprise
      r1 |
      \repeat unfold 7 {
        cab16 cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      }
      cab4\fff cab cab cab |
      cab4 cab cab cab |
      cab4 cab cab cab |
      cab1\fff \bar "|."
    }
  >>
}
