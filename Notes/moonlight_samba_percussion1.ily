\version "2.24.0"

% ============================================================================
% Moonlight Samba — 7. PERCUSSION 1 (Concert Snare & Bass Drum)
% 56 Measures Total: Latin Clave Soli, Surdo Heartbeat & Climax Slams (\drummode)
% 5 Stops / Percussion-Only Starts / Medley Support / Section E Soli Break
% ============================================================================

percussionOneNotes = \drummode {
  <<
    {
      % Snare Drum Samba Clave & Accents
      % Part I: Percussion Start & Groove Build (mm. 1-8) -> STOP 1
      % Solo Snare starts with authentic samba rhythm mm. 1-2
      sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      \repeat unfold 5 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      % m. 8 Roll into STOP 1
      sn4 sn8 sn sn2:32\fermata |

      % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) -> STOP 2
      % Soft rim clicks & subtle groove under Muted Trumpet
      \repeat unfold 7 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      sn4\p sn8 sn sn2:32\fermata |

      % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) -> STOP 3
      \repeat unfold 7 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      sn8\ff sn16 sn sn8 sn sn2:32\fermata |

      % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) -> STOP 4
      % Aggressive Latin rimshots driving Low Brass Montuno
      \repeat unfold 7 {
        sn8. sn16 r8 sn sn8. sn16 r8 sn |
      }
      sn8\ff sn16 sn sn8 sn sn2:32\fermata |

      % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5
      % Delicate brushes / soft rim clicks at half tempo (d = 58)
      \repeat unfold 7 {
        sn4\pp r sn r |
      }
      sn2:32\fermata\pp r2 |

      % Part VI: Section E — Latin Percussion Soli Breakout (mm. 41-44)
      % Authentic 3:2 Son Clave Rimclick Pattern at d = 120
      sn8.\f sn16 r8 sn r sn sn4 |
      r8 sn4 sn8 r sn sn4 |
      sn8. sn16 r8 sn r sn sn4 |
      sn8 sn16 sn sn8 sn sn2:32\< |

      % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
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
      % Part I: Percussion Start & Groove Build (mm. 1-8)
      bd4-^\ff r r2 |
      bd4\mf bd8 bd ~ bd4 bd |
      \repeat unfold 5 {
        bd4-^\f bd8 bd ~ bd4 bd8 bd |
      }
      bd4 bd8 bd bd2:32\fermata |

      % Part II: Section A (mm. 9-16): Gentle Surdo Pulse under Muted Trumpet
      \repeat unfold 7 {
        bd4\p bd8 bd ~ bd4 bd |
      }
      bd4\p r bd2:32\fermata |

      % Part III: Section B (mm. 17-24): Woodwinds support
      \repeat unfold 7 {
        bd4-^\mf r8 bd bd4-^ bd |
      }
      bd4-^\ff bd-^ bd-^ r\fermata |

      % Part IV: Section C (mm. 25-32): Punched Low Brass Montuno Accents
      \repeat unfold 7 {
        bd4-^\ff r8 bd bd4-^ bd8 bd |
      }
      bd4-^\ff bd-^ bd-^ r\fermata |

      % Part V: Section D (mm. 33-40): Intimate Adagio soft heartbeats
      \repeat unfold 7 {
        bd4\pp r r2 |
      }
      bd1\fermata\pp |

      % Part VI: Section E (mm. 41-44): Driving Surdo Heartbeat in Soli
      bd4-^\f bd8 bd ~ bd4 bd8 bd |
      bd4 bd8 bd ~ bd4 bd |
      bd4-^\f bd8 bd ~ bd4 bd8 bd |
      bd4 bd8 bd bd2:32\< |

      % Part VII: Section F (mm. 45-56): Building Back & Climax
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
