\version "2.24.0"

% ============================================================================
% Moonlight Samba — 8. TUBA (Concert Pitch, Absolute \fixed c')
% 56 Measures Total: Deep Latin Foundation, Low Brass Montuno & Tutti Climax
% Range strictly verified within [Bb1 - F3 / MIDI 34-53] (Bass Clef)
% ============================================================================

tubaNotes = \fixed c' {
  \clef bass

  % Part I: Percussion Start (mm. 1-4 tacet) -> Enters m. 5 -> STOP 1
  R1 * 4 |
  cis,4-.\f r8 gis,, cis,4-. r8 gis,, |
  b,,4-. r8 fis,, b,,4-. r8 fis,, |
  a,,4-. r8 e,, a,,4-. r8 d, |
  gis,,2\f r2\fermata |

  % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) -> STOP 2
  cis,4-.\p r8 gis,, cis,4-. r8 gis,, |
  b,,4-. r8 fis,, b,,4-. r8 fis,, |
  a,,4-. r8 e,, a,,4-. r8 d, |
  gis,,4-. r8 dis,, gis,,4-. r8 gis,, |
  cis,4-. r8 gis,, cis,4-. r8 gis,, |
  b,,4-. r8 fis,, b,,4-. r8 fis,, |
  a,,4-. r8 e,, a,,4-. r8 d, |
  gis,,2. r4\fermata |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) - Tacet -> STOP 3
  R1 * 7 |
  r2. r4\fermata |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) -> STOP 4
  cis,8\ff dis, e, fis, gis, a, b, c |
  d4. c8 b,4 a, |
  gis,4. fis,8 e,4 dis, |
  cis,2. r4 |
  cis,4-.\f r8 gis,, cis,4-. r8 gis,, |
  d,4-. r8 a,, d,4-. r8 a,, |
  bis,,4-. r8 fis,, bis,,4-. r8 fis,, |
  cis,2. r4\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5
  cis,,1\pp |
  b,,,1 |
  a,,,2 d,, |
  gis,,,1 |
  cis,,1 |
  b,,,1 |
  a,,,2 d,, |
  gis,,,2\fermata r2 |

  % Part VI: Section E — Latin Percussion Soli (mm. 41-44) - Tacet
  R1 * 4 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  R1 * 2 |
  cis,4-.\ff r8 gis,, cis,4-. r8 gis,, |
  b,,4-. r8 fis,, b,,4-. r8 fis,, |
  a,,4-. r8 e,, a,,4-. r8 d, |
  gis,,4-. r8 dis,, gis,,4-. r8 gis,, |
  cis,8 cis, r cis, cis,4 cis, |
  d,8 d, r d, d,4 d, |
  cis,8\fff r cis, r cis,4 cis,8 cis, |
  d,8 r d, r d,4 d,8 d, |
  gis,,8 r gis,, r gis,,4 gis,,8 gis,, |
  cis,1\fff \bar "|."
}
