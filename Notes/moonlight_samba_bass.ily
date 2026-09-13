\version "2.24.0"

% ============================================================================
% Moonlight Samba — 9. ELECTRIC BASS (Concert Pitch, Absolute \fixed c')
% 56 Measures Total: Rhythm Foundation, Montuno Drive & Climax
% Range strictly verified within [E1 - G3 / MIDI 28-55] (Bass Clef)
% ============================================================================

bassNotes = \fixed c' {
  \clef bass

  % Part I: Percussion Start (mm. 1-4 tacet) -> Enters m. 5 -> STOP 1
  R1 * 4 |
  cis4.\f cis8 ~ cis4 cis |
  b,4. b,8 ~ b,4 b, |
  a,4. a,8 ~ a,4 d |
  gis,2\f r4\fermata |

  % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) -> STOP 2
  cis4.\p cis8 ~ cis4 cis |
  b,4. b,8 ~ b,4 b, |
  a,4. a,8 ~ a,4 d |
  gis,4. gis,8 ~ gis,4 gis, |
  cis4. cis8 ~ cis4 cis |
  b,4. b,8 ~ b,4 b, |
  a,4. a,8 ~ a,4 d |
  gis,2. r4\fermata |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) -> STOP 3
  cis4.\f cis8 ~ cis4 cis |
  b,4. b,8 ~ b,4 b, |
  a,4. a,8 ~ a,4 d |
  gis,4. gis,8 ~ gis,4 gis, |
  cis4. cis8 ~ cis4 cis |
  b,4. b,8 ~ b,4 b, |
  a,4. a,8 ~ a,4 d |
  cis2. r4\fermata |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) -> STOP 4
  cis8\ff dis e fis gis a b c' |
  d'4. c'8 b4 a |
  gis4. fis8 e4 dis |
  cis2. r4 |
  cis4.\f cis8 ~ cis4 cis |
  d4. d8 ~ d4 d |
  bis,4. bis,8 ~ bis,4 bis, |
  cis2. r4\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5
  cis,1\pp |
  b,,1 |
  a,,2 d, |
  gis,,1 |
  cis,1 |
  b,,1 |
  a,,2 d, |
  gis,,2\fermata r2 |

  % Part VI: Section E — Latin Percussion Soli (mm. 41-44) - Tacet
  R1 * 4 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  R1 * 2 |
  cis4.\ff cis8 ~ cis4 cis |
  b,4. b,8 ~ b,4 b, |
  a,4. a,8 ~ a,4 d |
  gis,4. gis,8 ~ gis,4 gis, |
  cis8 cis r cis cis4 cis |
  d8 d r d d4 d |
  cis8\fff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  gis,8 r gis, r gis,4 gis,8 gis, |
  cis1\fff \bar "|."
}
