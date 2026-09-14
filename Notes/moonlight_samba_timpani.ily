\version "2.24.0"

% ============================================================================
% Moonlight Samba — 10. TIMPANI (Concert Pitch, Absolute \fixed c')
% 56 Measures Total: Pedal Kettles Tuned to C# and G# Roots & Fifths
% Grounded in Active DuckDB Correction (Authentic C# minor, Bass Clef)
% 5 Stops / Sectional Medley Support / Percussion Soli Breakout
% ============================================================================

timpaniNotes = \fixed c {
  \clef bass

  % Part I: Percussion Start & Groove Build (mm. 1-8) -> STOP 1 at m. 8
  % Enters m. 5 after Snare/BD intro to build groove toward first stop
  R1 * 4 |
  cis4.\f cis8 ~ cis4 cis |
  gis,4. gis,8 ~ gis,4 gis, |
  cis4. cis8 ~ cis4 cis |
  gis,2\f\> cis4:32\p\fermata r |

  % Part II: Section A — Muted Trumpet & Marimba Medley (mm. 9-16) -> STOP 2 at m. 16
  % Gentle acoustic heartbeat pulse under Muted Trumpet
  cis4.\p cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  gis,4. gis,8 ~ gis,4 gis, |
  cis4.\p cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  gis,2\f cis4:32\ff\fermata r |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) -> STOP 3 at m. 24
  % Light syncopated support for Woodwind ensemble
  cis4\mf r cis r |
  cis4 r cis r |
  gis,4 r gis, r |
  cis2. r4 |
  cis4.\f cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  gis,4. gis,8 ~ gis,4 gis, |
  cis2:32\ff cis4:32\fermata r |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) -> STOP 4 at m. 32
  % Heavy root-fifth Latin ostinato driving Trombone & Tuba
  cis4.\ff cis8 ~ cis4 cis |
  gis,4. gis,8 ~ gis,4 gis, |
  cis4. cis8 ~ cis4 cis |
  gis,4. gis,8 ~ gis,4 gis, |
  cis4.\ff cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  gis,4. gis,8 ~ gis,4 gis, |
  cis2:32\ff cis4:32\fermata r |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5 at m. 40
  % Tacet for intimate chamber Bossa woodwind texture
  R1 * 7 |
  r2. r4\fermata |

  % Part VI: Section E — Latin Percussion Soli Breakout (mm. 41-44)
  % Syncopated low-C# and G# punches with Snare rimclicks & Clave
  r4. cis8\f ~ cis4 cis8 cis |
  gis,4. gis,8 ~ gis,4 gis,8 gis, |
  r4. cis8 ~ cis4 cis8 cis |
  gis,4 cis:32\ff r2 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  r2.. gis,8\ff |
  cis4.\ff cis8 cis4. cis8 |
  cis4. cis8 cis2 |
  cis4. cis8 cis4. cis8 |
  cis2 ~ cis8 cis cis cis |
  gis,4. gis,8 gis,4. gis,8 |
  cis4. cis8 cis4 cis |
  cis8 r cis r cis4 cis8 cis |
  cis8\fff r cis r cis4 cis8 cis |
  cis8 r cis r cis4 cis8 cis |
  gis,8 r gis, r gis,4 gis,8 gis, |
  cis1:32\fff \bar "|."
}
