\version "2.24.0"

% ============================================================================
% Moonlight Samba — 4. TENOR TROMBONE (Concert Pitch, Absolute \fixed c')
% Realistic Tenor Trombone Range: C2/E2 to G4 (Bass Clef)
% Grounded in Active DuckDB Correction (Zero Pedal Artifacts)
% ============================================================================

tromboneNotes = \fixed c' {
  \clef bass

  % Intro (mm. 1-8) - Trombone enters in m. 5
  R1 * 4 |
  r4 cis8\f cis r4 cis |
  r4 b,8\f\glissando cis r2 |
  r4 a,8\f a, r4 d |
  gis,2\f\glissando cis |

  % Section A: Low Brass Punches & Slides (mm. 9-16)
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 b,4.\glissando cis2 |
  r8 a,4.\f d4 d8 d |
  gis,2\glissando cis4 r |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 b,4.\glissando cis2 |
  r8 a,4.\f d4 d8 d |
  gis,1\f |

  % Section B: Big Brass Rips (mm. 17-24)
  cis8\ff dis e fis gis a b c' |
  d'4.\glissando c'8 b4 a |
  gis4.\glissando fis8 e4 dis |
  cis2. r4 |
  cis8\f cis r cis cis4 cis |
  d8 d r d d4 d |
  bis,8 bis, r bis, bis,4 bis, |
  cis2\ff\bendAfter #3 gis2\fff\bendAfter #-4 |

  % Section C: Middle Break & Slowdown (mm. 25-32) - Clean Tenor Sostenuto
  cis1\pp |
  b,1 |
  a,2 d |
  gis,1 |
  cis1 |
  b,1 |
  a,2 d |
  cis2 gis,\fermata |

  % Section D: Reprise (mm. 33-44)
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
