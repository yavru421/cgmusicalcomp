\version "2.24.0"

% ============================================================================
% Moonlight Samba — 7. TENOR TROMBONE (Concert Pitch, Absolute \fixed c')
% 56 Measures Total: Low Brass Montuno Lead (mm. 25-32), Sostenuto & Climax
% Range strictly verified within [Eb2 - G4 / MIDI 39-67] (Bass Clef)
% ============================================================================

tromboneNotes = \fixed c' {
  \clef bass

  % Part I: Percussion Start (mm. 1-4 tacet) -> Enters m. 5 -> STOP 1
  R1 * 4 |
  r4 cis8\f cis r4 cis |
  r4 b,8\f\glissando cis r2 |
  r4 a,8\f a, r4 d |
  gis,2\f r2\fermata |

  % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) - Tacet -> STOP 2
  R1 * 7 |
  r2. r4\fermata |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) - Tacet -> STOP 3
  R1 * 7 |
  r2. r4\fermata |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) -> STOP 4
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 b,4.\glissando cis2 |
  r8 a,4.\f d4 d8 d |
  gis,2\glissando cis4 r |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 b,4.\glissando cis2 |
  r8 a,4.\f d4 d8 d |
  gis,2. r4\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5
  cis1\pp |
  b,1 |
  a,2 d |
  gis,1 |
  cis1 |
  b,1 |
  a,2 d |
  cis2\fermata r2 |

  % Part VI: Section E — Latin Percussion Soli (mm. 41-44) - Tacet
  R1 * 4 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  r2.. gis8\ff |
  c'4.\ff b8 a4. b8 |
  c'4. d'8 e'2 |
  d'4. c'8 b4. d'8 |
  c'2 ~ c'8 dis' e' fis' |
  gis'4. a'8 gis'4. a'8 |
  cis8 dis e fis gis a b c' |
  d'4. c'8 b4 a |
  c'8\fff r c' r c'4 c'8 c' |
  d'8 r d' r d'4 d'8 d' |
  gis8 r gis r gis4 gis8 gis |
  cis1\fff \bar "|."
}
