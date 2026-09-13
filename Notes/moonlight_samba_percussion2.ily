\version "2.24.0"

% ============================================================================
% Moonlight Samba — 8. PERCUSSION 2 (Crash & Suspended Cymbals)
% 56 Measures Total: Dramatic Swells, Accented Punches, and Tutti Climax (\drummode)
% 5 Stops / Percussion-Only Starts / Medley Support / Section E Soli Break
% ============================================================================

percussionTwoNotes = \drummode {
  % Part I: Percussion Start & Groove Build (mm. 1-8) -> STOP 1 at m. 8
  % Enters m. 3 with suspended cymbal swell behind the solo snare/claves
  r1 |
  r1 |
  cyms1:32\p\< ~ |
  cyms1\mf\> |
  cyms1:32\mf\< ~ |
  cyms1\f ~ |
  cyms2:32 cyms4:32 cyms8 cyms |
  cyms2:32\< cyms8\ff cyms cymc4\fermata |

  % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) -> STOP 2 at m. 16
  % Soft brushed cymbal accents under Muted Trumpet
  cymc4-^\ff r r2 |
  r2 cyms4:32\p r |
  cyms1:32\p\< ~ |
  cyms2:32\mf cyms4:32 r |
  cymc4-^\ff r r2 |
  cyms1:32\p\< ~ |
  cyms2:32\mf cyms8\f cyms cyms4 |
  cymc2:32\ff cymc4\fermata r |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) -> STOP 3 at m. 24
  cymc4-^\ff r cymc-^ r |
  cymc4-^ r cymc-^ r |
  cymc4-^ r cymc-^ r |
  cymc4-^ r cymc-^ r |
  cyms1:32\f\< ~ |
  cyms1\ff |
  cyms2:32\ff\< cyms8 cyms cyms4 |
  cymc1:32\ff\fermata |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) -> STOP 4 at m. 32
  % Punched crashes on brass montuno hits
  cymc4-^\ff r cymc-^ r |
  cymc4-^ r cymc-^ r |
  cymc4-^ r cymc-^ r |
  cymc4-^ r cymc-^ r |
  cyms1:32\f\< ~ |
  cyms1\ff |
  cyms2:32\ff\< cyms8 cyms cyms4 |
  cymc1:32\ff\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5 at m. 40
  % Delicate soft yarn-mallet suspended cymbal roll (d = 58)
  cyms1:32\pp ~ |
  cyms1 |
  cyms1:32 ~ |
  cyms1 |
  cyms1:32 ~ |
  cyms1 |
  cyms1:32\< ~ |
  cyms1\fermata\p |

  % Part VI: Section E — Latin Percussion Soli Breakout (mm. 41-44)
  r1 |
  r2 cyms4:32\mf r |
  r1 |
  cyms2:32\f\< cyms8\ff cyms cyms4 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  r1 |
  cymc4-^\fff r r2 |
  cyms1:32\f\< ~ |
  cyms1\ff |
  cymc4-^\ff r cymc-^ r |
  cymc4-^ r cymc-^ r |
  cyms1:32\ff\< ~ |
  cyms1\fff |
  cymc4-^\fff cymc-^ cymc-^ cymc-^ |
  cymc4-^ cymc-^ cymc-^ cymc-^ |
  cymc4-^ cymc-^ cymc-^ cymc-^ |
  cymc1-^\fff \bar "|."
}
