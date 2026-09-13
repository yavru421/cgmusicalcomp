\version "2.24.0"

% ============================================================================
% Moonlight Samba — 10. TIMPANI (Concert Pitch, Absolute \fixed c')
% Standard Concert Band Pedal Kettles Tuned to C# and G# Roots & Fifths
% Grounded in Active DuckDB Correction (Authentic C# minor, Bass Clef)
% ============================================================================

timpaniNotes = \fixed c' {
  \clef bass

  % Intro (mm. 1-8)
  R1 * 4 |
  cis4.\f cis8 ~ cis4 cis |
  gis,4. gis,8 ~ gis,4 gis, |
  cis4. cis8 ~ cis4 cis |
  gis,2\f\> cis4\p r |

  % Section A: First Theme Drive (mm. 9-16)
  cis4.\f cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  gis,4. gis,8 ~ gis,4 gis, |
  cis4.\f cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  gis,1\f |

  % Section B: Latin Pushes (mm. 17-24)
  cis4\ff r cis r |
  cis4 r cis r |
  gis,4 r gis, r |
  cis2. r4 |
  cis4.\f cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  gis,4. gis,8 ~ gis,4 gis, |
  cis2:32\ff cis4:32\fermata r |

  % Section C: Middle Break (Tacet mm. 25-32)
  R1 * 8 |

  % Section D: Reprise & Thunderous Drive (mm. 33-44)
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
