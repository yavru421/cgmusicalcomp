\version "2.24.0"

% ============================================================================
% Moonlight Samba — 9. PERCUSSION 3 (Auxiliary Latin: Cowbell & Shaker)
% 56 Measures Total: Latin Clave Soli Engine & Climax Drive (\drummode)
% 5 Stops / Percussion-Only Starts / Medley Support / Section E Soli Break
% ============================================================================

percussionThreeNotes = \drummode {
  <<
    {
      % Cowbell Clave
      % Part I: Percussion Start & Groove Build (mm. 1-8) -> STOP 1
      % Solo Clave / Cowbell sets Latin foundation from m. 1 with Snare
      \repeat unfold 7 {
        cb4 cb8 cb r cb cb4 |
      }
      cb4 cb8 cb cb2\fermata |

      % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) -> STOP 2
      \repeat unfold 7 {
        cb4 cb8 cb r cb cb4 |
      }
      cb4 cb8 cb cb2\fermata |

      % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) -> STOP 3
      \repeat unfold 7 {
        cb4 cb8 cb r cb cb4 |
      }
      cb8\ff cb16 cb cb8 cb cb2:32\fermata |

      % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) -> STOP 4
      \repeat unfold 7 {
        cb4 cb8 cb r cb cb4 |
      }
      cb8\ff cb16 cb cb8 cb cb2:32\fermata |

      % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5
      % Tacet in Adagio Bossa
      R1 * 7 |
      r2. r4\fermata |

      % Part VI: Section E — Latin Percussion Soli Breakout (mm. 41-44)
      % Driving Syncopated Cowbell Pattern at d = 120
      cb4\f cb8 cb r cb cb4 |
      cb8 cb r cb cb4 cb8 cb |
      cb4 cb8 cb r cb cb4 |
      cb8 cb cb cb cb4\ff cb |

      % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
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
      % Part I: Percussion Start & Groove Build (mm. 1-8)
      \repeat unfold 7 {
        cab16 cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      }
      cab4 cab cab r\fermata |

      % Part II: Section A (mm. 9-16)
      \repeat unfold 7 {
        cab16 cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      }
      cab4 cab cab r\fermata |

      % Part III: Section B (mm. 17-24)
      \repeat unfold 7 {
        cab16 cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      }
      cab4\ff cab cab r\fermata |

      % Part IV: Section C (mm. 25-32)
      \repeat unfold 7 {
        cab16 cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      }
      cab4\ff cab cab r\fermata |

      % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40)
      \repeat unfold 7 {
        cab4\pp r cab r |
      }
      cab1\fermata\pp |

      % Part VI: Section E — Latin Percussion Soli Breakout (mm. 41-44)
      \repeat unfold 4 {
        cab16\f cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      }

      % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
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
