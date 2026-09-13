\version "2.24.0"

% ============================================================================
% Moonlight Samba — 5. B♭ CLARINET (Concert Pitch, Absolute \fixed c')
% Famous Moonlight Ostinato Triplet Arpeggios & Samba 16th Engine
% ============================================================================

clarinetNotes = \fixed c' {
  \clef treble

  % Intro (mm. 1-8)
  r8 gis16\p cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 a16 cis' e'8 a16 cis' e'8 a16 d' fis'8 a |
  r8 gis16 bis fis'8 gis16 bis e'8 gis16 bis dis'8 gis |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 a16 cis' e'8 a16 cis' e'8 a16 d' fis'8 a |
  r8 gis16 bis fis'8 gis16 bis e'8 gis16 bis dis'8 gis |

  % Section A (mm. 9-16)
  r8 gis16\f cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 a16 cis' e'8 a16 cis' e'8 a16 d' fis'8 a |
  r8 gis16 bis fis'8 gis16 bis e'8 gis16 bis dis'8 gis |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 a16 cis' e'8 a16 cis' e'8 a16 d' fis'8 a |
  r8 gis16 bis fis'8 gis16 bis e'8 gis16 bis dis'8 gis |

  % Section B (mm. 17-24)
  cis'16\ff dis' e' fis' gis'8 cis' cis'16 dis' e' fis' gis'8 cis' |
  d'16 e' fis' g' a'8 d' d'16 e' fis' g' a'8 d' |
  gis16 bis dis' fis' gis'8 bis fis'16 dis' bis gis dis'8 gis |
  cis'2. r4 |
  r8 cis'16 e' gis'8 cis'16 e' gis'8 cis'16 e' gis'8 cis' |
  r8 d'16 fis' a'8 d'16 fis' a'8 d'16 fis' a'8 d' |
  r8 bis16 dis' fis'8 bis16 dis' fis'8 bis16 dis' fis'8 bis |
  cis'1\ff |

  % Section C: Middle Break & Slowdown (mm. 25-32)
  \tuplet 3/2 4 {
    gis8\pp cis' e' gis cis' e' gis cis' e' gis cis' e' |
    gis cis' e' gis cis' e' gis cis' e' gis cis' e' |
    a cis' e' a cis' e' a d' fis' a d' fis' |
    gis bis fis' gis cis' e' gis bis dis' gis cis' e' |
    gis cis' e' gis cis' e' gis cis' e' gis cis' e' |
    gis cis' e' gis cis' e' gis cis' e' gis cis' e' |
    a cis' e' a cis' e' a d' fis' a d' fis' |
    gis bis dis' gis cis' e'
  }
  gis2\fermata |

  % Section D: Reprise (mm. 33-44)
  R1 |
  r8 gis16\ff cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
  r8 gis16 cis' e'8 gis16 cis' e'8 gis16 cis' e'8 gis |
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
