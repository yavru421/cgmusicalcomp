\version "2.24.0"

% ============================================================================
% Moonlight Samba — 10. GLOCKENSPIEL (Concert Pitch, Absolute \fixed c')
% 56 Measures Total: Woodwind Medley Bells (mm. 17-24) & Grand Climax
% ============================================================================

glockenspielNotes = \fixed c' {
  \clef treble

  % Part I: Percussion Start (mm. 1-6 tacet) -> Enters m. 7-8 -> STOP 1
  R1 * 6 |
  r2 r8 dis''\f e'' fis'' |
  bis''2\ff r2\fermata |

  % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) - Tacet -> STOP 2
  R1 * 7 |
  r2. r4\fermata |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) -> STOP 3
  gis''4-^\f r r2 |
  gis''4-^ r r2 |
  fis''4-^ r r2 |
  e''2. r4 |
  e''4-^ r r2 |
  e''4-^ r r2 |
  dis''4-^ r dis''4-^ r |
  e''2. r4\fermata |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) - Tacet -> STOP 4
  R1 * 7 |
  r2. r4\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) - Tacet -> STOP 5
  R1 * 7 |
  r2. r4\fermata |

  % Part VI: Section E — Latin Percussion Soli (mm. 41-44) - Tacet
  R1 * 4 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  R1 * 4 |
  cis''8\fff dis'' e'' fis'' gis'' a'' b'' cis''' |
  d'''4. cis'''8 b''4 a'' |
  gis''8\fff r gis'' r gis''4 gis''8 gis'' |
  a''8 r a'' r a''4 a''8 a'' |
  b''8 r b'' r bis''4 bis''8 bis'' |
  cis'''1\fff \bar "|."
}
