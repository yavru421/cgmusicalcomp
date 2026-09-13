\version "2.24.0"

% ============================================================================
% Moonlight Samba — TENOR SAXOPHONE (Concert Pitch, Absolute \fixed c')
% Standard Concert Band Voice: Warm Woodwind Tenor Core & Bossa Countermelody
% Range: G#2 to D5 (MIDI 44 - 74)
% ============================================================================

tenorSaxNotes = \fixed c' {
  \clef treble

  % Part I: Percussion Start & Groove Build (mm. 1-8) - Tacet
  R1 * 7 |
  r2. r4\fermata |

  % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) - Tacet
  R1 * 7 |
  r2. r4\fermata |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24)
  % Tenor Sax harmonizes with Alto Sax and Clarinet under Flute lead
  e4(\mf fis8. gis16 a4 gis8 fis |
  e4. cis8 b,2) |
  dis8( e fis gis a4. b8 |
  a8 gis fis e e2) |
  e4( fis8. gis16 a4 gis8 fis |
  e4. fis8 gis2) |
  fis8( e dis cis b,4. dis8 |
  e2. r4\fermata) |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32)
  % Punchy syncopated stabs doubling Horn/Euphonium
  gis8\mf r gis r gis4 gis8 b |
  cis'8 r cis' r cis'4 cis'8 b |
  gis8 r gis r gis4 gis8 b |
  e8 r e r e4 e8 gis |
  gis8 r gis r gis4 gis8 b |
  cis'8 r cis' r cis'4 cis'8 b |
  a8 r a r a4 gis8 fis |
  gis2. r4\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40)
  R1 * 4 |
  e4.\pp e8 fis4. gis8 |
  a4. gis8 fis4. e8 |
  dis4. cis8 b,2 |
  r2. r4\fermata |

  % Part VI: Section E — Latin Percussion Soli (mm. 41-44) - Tacet
  R1 * 4 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  R1 * 4 |
  e8\ff fis gis a b cis' dis' e' |
  fis'4. e'8 dis'4 cis' |
  gis8\fff r gis r gis4 gis8 gis |
  a8 r a r a4 a8 a |
  b8 r b r b4 b8 b |
  cis'1\fff \bar "|."
}
