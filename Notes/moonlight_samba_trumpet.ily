\version "2.24.0"

% ============================================================================
% Moonlight Samba — 2. B♭ TRUMPET (Concert Pitch, Absolute \fixed c')
% Commanding Lead Brass: Driving Latin Theme & Layered Build
% Strictly within Concert Band Playability Range [Bb3 - F5 / MIDI 58-77]
% ============================================================================

trumpetNotes = \fixed c' {
  \clef treble

  % Intro (mm. 1-8): Rests mm. 1-4, enters m. 5 to build layer
  R1 * 4 |
  r8 cis'4.\f ~ cis'4 cis'8 cis' |
  r8 dis'4. ~ dis'4 dis'8 dis' |
  r8 e'4. fis'4 gis'8 a' |
  bis'2\ff r8 dis'\f e' fis' |

  % Section A: Commanding Lead Melody (mm. 9-16) - Beethoven Samba Motif
  gis'4.\f gis'8 ~ gis'4 gis'8 a' |
  b'4. a'8 gis'2 |
  fis'4. e'8 dis'4. fis'8 |
  e'2 r8 bis\f cis' dis' |
  e'4.\f dis'8 cis'4. dis'8 |
  e'4. fis'8 gis'2 |
  fis'4. e'8 dis'4. fis'8 |
  e'2. r4 |

  % Section B: High Brass Lead (mm. 17-24)
  cis'8\ff dis' e' fis' gis' a' b' cis'' |
  d''4. cis''8 b'4 a' |
  gis'4. fis'8 e'4 dis' |
  cis'2. r4 |
  r8 cis'4.\f ~ cis'4 cis'8 cis' |
  r8 d'4. ~ d'4 d'8 d' |
  r8 bis4. ~ bis4 bis8 bis |
  cis'1\ff\fermata |

  % Section C: Middle Break & Slowdown (mm. 25-32)
  R1 * 3 |
  r2 r8 dis'\p e' fis' |
  e'1 ~ |
  e'4. e'8 fis'4. gis'8 |
  a'4. gis'8 fis'4. e'8 |
  dis'4. cis'8 bis2\fermata |

  % Section D: Reprise & Climax (mm. 33-44) - Brass Driving the Climax
  R1 |
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
