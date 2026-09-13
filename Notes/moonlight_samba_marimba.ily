\version "2.24.0"

% ============================================================================
% Moonlight Samba — 11. MARIMBA (Concert Pitch, Absolute \fixed c')
% 56 Measures Total: Soft Rolled Chords in Section A, Montuno & Climax
% ============================================================================

marimbaNotes = \fixed c' {
  \clef treble

  % Part I: Percussion Start (mm. 1-2 tacet) -> Enters m. 3 -> STOP 1
  R1 * 2 |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 a16 cis' e'8 a16 cis' e'8 a16 d' fis'8 a |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 a16 cis' e'8 a16 cis' e'8 a16 d' fis'8 a |
  gis16 bis fis'8 gis16 bis e'8 gis16 bis dis'8 r4\fermata |

  % Part II: Section A — Soft Rolled Marimba Chords under Muted Trumpet (mm. 9-16) -> STOP 2
  \repeat tremolo 16 { <cis' e' gis'>16\pp } |
  \repeat tremolo 16 { <cis' e' gis'>16 } |
  \repeat tremolo 16 { <a c' e'>16 } |
  \repeat tremolo 16 { <gis b dis'>16 } |
  \repeat tremolo 16 { <cis' e' gis'>16 } |
  \repeat tremolo 16 { <cis' e' gis'>16 } |
  \repeat tremolo 16 { <a c' e'>16 } |
  <gis b dis'>2. r4\fermata |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) -> STOP 3
  cis'16\ff dis' e' fis' gis'8 cis' cis'16 dis' e' fis' gis'8 cis' |
  d'16 e' fis' g' a'8 d' d'16 e' fis' g' a'8 d' |
  gis16 bis dis' fis' gis'8 bis fis'16 dis' bis gis dis'8 gis |
  cis'2. r4 |
  r8 cis'16 e' gis'8 cis'16 e' gis'8 cis'16 e' gis'8 cis' |
  r8 d'16 fis' a'8 d'16 fis' a'8 d'16 fis' a'8 d' |
  r8 bis16 dis' fis'8 bis16 dis' fis'8 bis16 dis' fis'8 bis |
  cis'2. r4\fermata |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) -> STOP 4
  cis'16\ff dis' e' fis' gis'8 cis' cis'16 dis' e' fis' gis'8 cis' |
  d'16 e' fis' g' a'8 d' d'16 e' fis' g' a'8 d' |
  gis16 bis dis' fis' gis'8 bis fis'16 dis' bis gis dis'8 gis |
  cis'2. r4 |
  r8 cis'16 e' gis'8 cis'16 e' gis'8 cis'16 e' gis'8 cis' |
  r8 d'16 fis' a'8 d'16 fis' a'8 d'16 fis' a'8 d' |
  r8 bis16 dis' fis'8 bis16 dis' fis'8 bis16 dis' fis'8 bis |
  cis'2. r4\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5
  \repeat tremolo 16 { <cis' e' gis'>16\pp } |
  \repeat tremolo 16 { <cis' e' gis'>16 } |
  \repeat tremolo 16 { <a c' e'>16 } |
  \repeat tremolo 16 { <gis bis dis'>16 } |
  \repeat tremolo 16 { <cis' e' gis'>16 } |
  \repeat tremolo 16 { <cis' e' gis'>16 } |
  \repeat tremolo 16 { <a c' e'>16 } |
  <gis bis dis'>2\fermata r2 |

  % Part VI: Section E — Latin Percussion Soli (Montuno Riff, mm. 41-44)
  r8 cis'16 e' gis'8 cis'16 e' r8 cis'16 e' gis'8 cis' |
  r8 d'16 fis' a'8 d'16 fis' r8 d'16 fis' a'8 d' |
  r8 cis'16 e' gis'8 cis'16 e' r8 cis'16 e' gis'8 cis' |
  <gis bis dis' fis'>2:32\ff r2 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  R1 * 2 |
  r8 gis16\ff cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 a16 cis' e'8 a16 cis' e'8 a16 d' fis'8 a |
  r8 gis16 bis fis'8 gis16 bis e'8 gis16 bis dis'8 gis |
  r8 gis16 bis fis'8 gis16 bis e'8 gis16 bis dis'8 gis |
  cis'16 dis' e' fis' gis'8 cis' cis'16 dis' e' fis' gis'8 cis' |
  d'16 e' fis' g' a'8 d' d'16 e' fis' g' a'8 d' |
  cis'8\fff r cis' r cis'4 cis'8 cis' |
  d'8 r d' r d'4 d'8 d' |
  bis8 r bis r bis4 bis8 bis |
  cis'1\fff \bar "|."
}
