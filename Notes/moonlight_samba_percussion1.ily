\version "2.24.0"

% ============================================================================
% Moonlight Samba — 7. PERCUSSION 1 (Concert Snare & Bass Drum)
% Heavy Surdo Heartbeat, Accented Hits, and Climax Drive (\drummode)
% ============================================================================

percussionOneNotes = \drummode {
  <<
    {
      % Snare Drum Samba Clave & Accents
      \repeat unfold 7 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      % m. 8 Roll into Section A
      sn4 sn8 sn sn2:32\< |
      
      \repeat unfold 15 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      % m. 24 Fermata Roll
      sn8\ff sn16 sn sn8 sn sn2:32\fermata |
      
      % Section C: Middle Break (Soft Rim Clicks)
      sn4\pp r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn2:32\fermata\pp r2 |
      
      % Section D: Reprise (m. 33 Solo Snare Breakout)
      sn16\fff sn sn sn toml toml tommh tommh toml toml tommh tommh sn8 sn |
      \repeat unfold 7 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      sn8\fff sn16 sn sn8 sn sn4 sn |
      sn8 sn16 sn sn8 sn sn4 sn |
      sn8 sn sn sn sn2:32\< |
      sn1\fff \bar "|."
    }
    \\
    {
      % Concert Bass Drum (Prominent Surdo Heartbeat & Accented Slams)
      bd4-^\ff r r2 |
      \repeat unfold 3 {
        bd4\mf bd8 bd ~ bd4 bd |
      }
      \repeat unfold 3 {
        bd4-^\f bd8 bd ~ bd4 bd8 bd |
      }
      % m. 8 Bass Drum Roll Swell
      bd4 bd8 bd bd2:32\< |
      
      % Section A (mm. 9-16): Heavy driving surdo heartbeat
      \repeat unfold 7 {
        bd4-^\ff bd8 bd ~ bd4 bd8 bd |
      }
      bd4-^\ff r bd2:32\< |
      
      % Section B (mm. 17-24): Punched accents with brass
      \repeat unfold 7 {
        bd4-^\ff r8 bd bd4-^ bd |
      }
      bd4-^\ff bd-^ bd-^ r\fermata |
      
      % Middle Break (mm. 25-32): Gentle soft heartbeats
      \repeat unfold 7 {
        bd4\pp r r2 |
      }
      bd1\fermata\pp |
      
      % Section D: Reprise & Climax (mm. 33-44)
      r1 |
      \repeat unfold 7 {
        bd4-^\fff bd8 bd ~ bd4 bd8 bd |
      }
      bd4-^\fff bd-^ bd-^ bd-^ |
      bd4-^ bd-^ bd-^ bd-^ |
      bd4-^ bd-^ bd-^ bd-^ |
      bd1-^\fff \bar "|."
    }
  >>
}
