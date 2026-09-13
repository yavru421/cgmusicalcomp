\version "2.24.0"

% ============================================================================
% Moonlight Samba — EUPHONIUM / BARITONE (Concert Pitch, Absolute \fixed c')
% Standard Concert Band Voice: Warm Tenor Countermelody & Montuno Punch
% Range: F2 to G4 (MIDI 41 - 67)
% ============================================================================

euphoniumNotes = \fixed c' {
  \clef bass

  % Part I: Percussion Start & Groove Build (mm. 1-8) - Tacet
  R1 * 7 |
  r2. r4\fermata |

  % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) - Tacet
  R1 * 7 |
  r2. r4\fermata |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24)
  % Warm singing tenor counterpoint underneath woodwind lead
  cis4(\mp dis8. e16 fis4 e8 dis |
  cis4. b,8 a,2) |
  gis,8( a, b, cis dis4. e8 |
  dis8 cis b, a, gis,2) |
  cis4( dis8. e16 fis4 e8 dis |
  cis4. dis8 e2) |
  dis8( cis b, a, gis,4. b,8 |
  cis2. r4\fermata) |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32)
  % Rhythmic syncopated bass-tenor punch
  cis8\mf r cis r cis4 cis8 dis |
  e8 r e r e4 e8 dis |
  cis8 r cis r cis4 cis8 dis |
  gis,8 r gis, r gis,4 gis,8 b, |
  cis8 r cis r cis4 cis8 dis |
  e8 r e r e4 e8 dis |
  fis8 r fis r fis4 e8 dis |
  cis2. r4\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40)
  R1 * 4 |
  cis4.\pp cis8 dis4. e8 |
  fis4. e8 dis4. cis8 |
  b,4. a,8 gis,2 |
  r2. r4\fermata |

  % Part VI: Section E — Latin Percussion Soli (mm. 41-44) - Tacet
  R1 * 4 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  R1 * 4 |
  gis,8\ff a, b, cis d e fis gis |
  a4. gis8 fis4 e |
  e8\fff r e r e4 e8 e |
  fis8 r fis r fis4 fis8 fis |
  gis8 r gis r gis4 gis8 gis |
  cis1\fff \bar "|."
}
