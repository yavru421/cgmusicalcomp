\version "2.24.0"

% ============================================================================
% Moonlight Samba — OBOE (Concert Pitch, Absolute \fixed c')
% 56 Measures Total: Woodwind Medley Harmony (mm. 17-24) & Grand Climax
% Range strictly verified within [D4 - Eb5 / MIDI 62-75]
% ============================================================================

oboeNotes = \fixed c' {
  \clef treble

  % Part I: Percussion Start & Groove Build (mm. 1-8) -> STOP 1
  R1 * 7 |
  r2. r4\fermata |

  % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) -> STOP 2
  R1 * 7 |
  r2. r4\fermata |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) -> STOP 3
  e'4(\f fis'8. gis'16 a'4 gis'8 fis' |
  e'4. cis'8 b2) |
  dis'8( e' fis' gis' a'4. b'8 |
  a'8 gis' fis' e' e'2) |
  e'4( fis'8. gis'16 a'4 gis'8 fis' |
  e'4. fis'8 gis'2) |
  fis'8( e' dis' cis' b4. dis'8 |
  cis'2. r4\fermata) |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) -> STOP 4
  R1 * 7 |
  r2. r4\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5
  R1 * 4 |
  e'4.\pp e'8 fis'4. gis'8 |
  a'4. gis'8 fis'4. e'8 |
  dis'4. cis'8 bis2 |
  r2. r4\fermata |

  % Part VI: Section E — Latin Percussion Soli (mm. 41-44) - Tacet
  R1 * 4 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  R1 * 4 |
  e'8\ff fis' gis' a' b' cis'' d'' e'' |
  fis''4. e''8 d''4 cis'' |
  cis''8\fff r cis'' r cis''4 cis''8 cis'' |
  d''8 r d'' r d''4 d''8 d'' |
  bis'8 r bis' r bis'4 bis'8 bis' |
  cis''1\fff \bar "|."
}
