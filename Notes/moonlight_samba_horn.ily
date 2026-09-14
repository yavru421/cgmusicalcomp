\version "2.24.0"

% ============================================================================
% Moonlight Samba — 6. FRENCH HORN IN F (Concert Pitch, Absolute \fixed c')
% 56 Measures Total: Warm Harmonic Bed, Brass Montuno & Tutti Climax
% Range strictly verified within [Bb3 - F5 / MIDI 58-77]
% ============================================================================

hornNotes = \fixed c {
  \clef treble

  % Part I: Percussion Start (mm. 1-4 tacet) -> Enters m. 5 -> STOP 1
  R1 * 4 |
  r8 cis'4.\f ~ cis'4 cis'8 cis' |
  r8 cis'4. ~ cis'4 cis'8 cis' |
  r8 cis'4. d'4 d'8 d' |
  bis2\f r2\fermata |

  % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) -> STOP 2
  e'4.\p dis'8 cis'4. e'8 |
  gis'4. fis'8 e'2 |
  d'4. cis'8 bis4. dis'8 |
  cis'2 r4 cis'8 dis' |
  e'4. dis'8 cis'4. e'8 |
  gis'4. a'8 b'2 |
  a'4. gis'8 fis'4. a'8 |
  gis'2. r4\fermata |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) -> STOP 3
  cis'8\ff r cis' r cis'4 cis'8 cis' |
  d'8 r d' r d'4 d'8 d' |
  bis8 r bis r bis4 bis8 bis |
  cis'2. r4 |
  r8 cis'4.\f ~ cis'4 cis'8 cis' |
  r8 d'4. ~ d'4 d'8 d' |
  r8 bis4. ~ bis4 bis8 bis |
  cis'2. r4\fermata |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) -> STOP 4
  e'4.\ff dis'8 cis'4. e'8 |
  gis'4. fis'8 e'2 |
  d'4. cis'8 bis4. dis'8 |
  cis'2. r4 |
  r8 cis'4.\f ~ cis'4 cis'8 cis' |
  r8 d'4. ~ d'4 d'8 d' |
  r8 bis4. ~ bis4 bis8 bis |
  cis'2. r4\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5
  cis'1\pp ~ |
  cis'1 |
  cis'2 d' |
  bis2 cis' |
  cis'1 ~ |
  cis'1 |
  cis'2 d' |
  bis2\fermata r2 |

  % Part VI: Section E — Latin Percussion Soli (mm. 41-44) - Tacet
  R1 * 4 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  R1 * 2 |
  r8 cis'4.\ff ~ cis'4 cis'8 cis' |
  r8 cis'4. d'4 d'8 d' |
  r8 bis4. cis'4 cis'8 cis' |
  r8 bis4. cis'4 cis'8 cis' |
  cis'8 r cis' r cis'4 cis'8 cis' |
  d'8 r d' r d'4 d'8 d' |
  cis'8\fff r cis' r cis'4 cis'8 cis' |
  d'8 r d' r d'4 d'8 d' |
  bis8 r bis r bis4 bis8 bis |
  cis'1\fff \bar "|."
}
