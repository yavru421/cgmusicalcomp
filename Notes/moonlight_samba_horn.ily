\version "2.24.0"

% ============================================================================
% Moonlight Samba — 3. FRENCH HORN IN F (Concert Pitch, Absolute \fixed c')
% ============================================================================

hornNotes = \fixed c' {
  \clef treble

  % Intro (mm. 1-8) - Horn enters in m. 3
  R1 * 2 |
  r4 cis'\mf d'4. cis'8 |
  bis2 cis' |
  r8 cis'4.\f ~ cis'4 cis'8 cis' |
  r8 cis'4. ~ cis'4 cis'8 cis' |
  r8 cis'4. d'4 d'8 d' |
  bis2\f r4 cis'8 dis' |

  % Section A: Countermelody & Swells (mm. 9-16)
  e'4.\f dis'8 cis'4. e'8 |
  gis'4. fis'8 e'2 |
  d'4. cis'8 bis4. dis'8 |
  cis'2 r4 cis'8 dis' |
  e'4. dis'8 cis'4. e'8 |
  gis'4. a'8 b'2 |
  a'4. gis'8 fis'4. a'8 |
  gis'2. r4 |

  % Section B: Horn Fanfares (mm. 17-24)
  cis'8\ff r cis' r cis'4 cis'8 cis' |
  d'8 r d' r d'4 d'8 d' |
  bis8 r bis r bis4 bis8 bis |
  cis'2. r4 |
  r8 cis'4.\f ~ cis'4 cis'8 cis' |
  r8 d'4. ~ d'4 d'8 d' |
  r8 bis4. ~ bis4 bis8 bis |
  cis'1\ff |

  % Section C: Middle Break & Slowdown (mm. 25-32)
  cis'1\pp ~ |
  cis'1 |
  cis'2 d' |
  bis2 cis' |
  cis'1 ~ |
  cis'1 |
  cis'2 d' |
  bis2\fermata r2 |

  % Section D: Reprise (mm. 33-44)
  R1 |
  r8 cis'4.\ff ~ cis'4 cis'8 cis' |
  r8 cis'4. ~ cis'4 cis'8 cis' |
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
