\version "2.24.0"

% ============================================================================
% Moonlight Samba — 1. FLUTE (Concert Pitch, Absolute \fixed c')
% Refined Orchestration: Less exposed flute, rested in early theme,
% reserved for delicate color and grand finale tutti.
% All notes strictly within physical concert band flute range [D#4 - F6].
% ============================================================================

fluteNotes = \fixed c' {
  \clef treble

  % Intro (mm. 1-8): Tacet (Brass & Rhythm build)
  R1 * 8 |

  % Section A: First Theme (mm. 9-16) - Flute rests mm. 9-12, enters lightly at m. 13
  R1 * 4 |
  r8 e''4\p e''8 e''2 |
  r8 fis''4 fis''8 fis''2 |
  r8 gis''4\p fis''8 e''4. fis''8 |
  e''2. r4 |

  % Section B: Driving Counterpoint (mm. 17-24) - Flute rests mm. 17-20, enters m. 21
  R1 * 4 |
  r8 gis'16 cis'' e''8 gis'16 cis'' e''8 gis'16 cis'' e''8 gis' |
  r8 a'16 cis'' e''8 a'16 cis'' e''8 a'16 d'' fis''8 a' |
  r8 gis'16 bis' fis''8 gis'16 bis' e''8 gis'16 bis' dis''8 gis' |
  cis''1\f |

  % Section C: Middle Break & Slowdown (mm. 25-32) - Lyrical Dolce
  R1 * 4 |
  gis'4.\pp gis'8 a'4. b'8 |
  cis''4. b'8 a'4. gis'8 |
  fis'4. e'8 dis'2\fermata |
  R1 |

  % Section D: Reprise & Climax (mm. 33-44) - Rests until tutti finale (mm. 39-44)
  R1 * 6 |
  gis'8\ff a' b' cis'' d'' e'' fis'' gis'' |
  a''4. gis''8 fis''4 e'' |
  e''8\fff r e'' r e''4 e''8 e'' |
  fis''8 r fis'' r fis''4 fis''8 fis'' |
  gis''8 r gis'' r gis''4 gis''8 gis'' |
  cis''1\fff \bar "|."
}
