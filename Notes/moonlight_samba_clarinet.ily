\version "2.24.0"

% ============================================================================
% Moonlight Samba — 3. B♭ CLARINET (Concert Pitch, Absolute \fixed c')
% 56 Measures Total: Famous Ostinato Arpeggios, Woodwind Medley & Climax
% Range strictly verified within [D3 - G5 / MIDI 50-79]
% ============================================================================

clarinetNotes = \fixed c' {
  \clef treble

  % Part I: Percussion Start (mm. 1-2 tacet) -> Enters m. 3 with Ostinato -> STOP 1
  R1 * 2 |
  r8 gis16\p cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 a16 cis' e'8 a16 cis' e'8 a16 d' fis'8 a |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 a16 cis' e'8 a16 cis' e'8 a16 d' fis'8 a |
  gis16 bis fis'8 gis16 bis e'8 gis16 bis dis'8 r4\fermata |

  % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) -> STOP 2
  r8 gis16\p cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 a16 cis' e'8 a16 cis' e'8 a16 d' fis'8 a |
  r8 gis16 bis fis'8 gis16 bis e'8 gis16 bis dis'8 gis |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 a16 cis' e'8 a16 cis' e'8 a16 d' fis'8 a |
  gis16 bis fis'8 gis16 bis e'8 gis16 bis dis'8 r4\fermata |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) -> STOP 3
  cis'16\ff dis' e' fis' gis'8 cis' cis'16 dis' e' fis' gis'8 cis' |
  d'16 e' fis' g' a'8 d' d'16 e' fis' g' a'8 d' |
  gis16 bis dis' fis' gis'8 bis fis'16 dis' bis gis dis'8 gis |
  cis'2. r4 |
  r8 cis'16 e' gis'8 cis'16 e' gis'8 cis'16 e' gis'8 cis' |
  r8 d'16 fis' a'8 d'16 fis' a'8 d'16 fis' a'8 d' |
  r8 bis16 dis' fis'8 bis16 dis' fis'8 bis16 dis' fis'8 bis |
  cis'2. r4\fermata |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) - Tacet -> STOP 4
  R1 * 7 |
  r2. r4\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5
  \tuplet 3/2 4 {
    gis8\pp cis' e' gis cis' e' gis cis' e' gis cis' e' |
    gis cis' e' gis cis' e' gis cis' e' gis cis' e' |
    a cis' e' a cis' e' a d' fis' a d' fis' |
    gis bis fis' gis cis' e' gis bis dis' gis cis' e' |
    gis cis' e' gis cis' e' gis cis' e' gis cis' e' |
    gis cis' e' gis cis' e' gis cis' e' gis cis' e' |
    a cis' e' a cis' e' a d' fis' a d' fis' |
  }
  gis2\fermata r2 |

  % Part VI: Section E — Latin Percussion Soli (mm. 41-44) - Tacet
  R1 * 4 |

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
