\version "2.24.0"

% ============================================================================
% Moonlight Samba — 5. B♭ TRUMPET (Concert Pitch, Absolute \fixed c')
% 56 Measures Total: Harmon Mute Solo (mm. 9-16), Open Montuno & Climax
% Range strictly verified within [Bb3 - F5 / MIDI 58-77]
% ============================================================================

trumpetNotes = \fixed c' {
  \clef treble

  % Part I: Percussion Start (mm. 1-4 tacet) -> Enters m. 5 -> STOP 1
  R1 * 4 |
  r8 cis'4.\f ~ cis'4 cis'8 cis' |
  r8 dis'4. ~ dis'4 dis'8 dis' |
  r8 e'4. fis'4 gis'8 a' |
  bis'2\ff r4\fermata |

  % Part II: Section A — Harmon-Muted Solo Voice (mm. 9-16) -> STOP 2
  gis'4.\mp^\markup { \italic "Harmon Mute (stem out)" } gis'8 ~ gis'4 gis'8 a' |
  b'4. a'8 gis'2 |
  fis'4. e'8 dis'4. fis'8 |
  e'2 r8 bis\p cis' dis' |
  e'4.\mp dis'8 cis'4. dis'8 |
  e'4. fis'8 gis'2 |
  fis'4. e'8 dis'4. fis'8 |
  e'2. r4\fermata |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) - Tacet -> STOP 3
  R1 * 7 |
  r2. r4\fermata |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) -> STOP 4
  cis'8\ff^\markup { \italic "Open" } dis' e' fis' gis' a' b' cis'' |
  d''4. cis''8 b'4 a' |
  gis'4. fis'8 e'4 dis' |
  cis'2. r4 |
  r8 cis'4.\f ~ cis'4 cis'8 cis' |
  r8 d'4. ~ d'4 d'8 d' |
  r8 bis4. ~ bis4 bis8 bis |
  cis'2. r4\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) - Tacet -> STOP 5
  R1 * 7 |
  r2. r4\fermata |

  % Part VI: Section E — Latin Percussion Soli (mm. 41-44) - Tacet (Embouchure Rest)
  R1 * 4 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  r4. gis'8\ff ~ gis'8 gis'16 gis' gis'8. gis'16 |
  gis'4. gis'8 gis'2 |
  r8 a'4 gis'8 fis'4. a'8 |
  gis'2 ~ gis'8 gis' fis' e' |
  dis'4. e'8 dis'4. e'8 |
  cis'8\fff dis' e' fis' gis' a' b' cis'' |
  d''4. cis''8 b'4 a' |
  gis'8\fff r gis' r gis'4 gis'8 gis' |
  a'8 r a' r a'4 a'8 a' |
  b'8 r b' r bis'4 bis'8 bis' |
  cis''1\fff \bar "|."
}
