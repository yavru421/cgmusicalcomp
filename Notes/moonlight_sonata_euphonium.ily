\version "2.24.0"

% ============================================================================
% Moonlight Sonata — Euphonium (Concert Pitch C# minor)
% Singing Cello-like Baritone Melody & Noble Tenor Counterpoint
% Range: C2 - F4 (Wisconsin Rapids Grade 3/4 Compliant)
% ============================================================================

euphoniumNotes = \relative c {
  \clef bass

  % Section I: Intimate Solitary Exposition (mm. 1-8)
  R1 * 4 |
  gis4.\p gis8 gis4. gis8 |
  gis2. r4 |
  a2\mp( c) |
  gis2( bis) |

  % Section II: Harmonic Modulation (mm. 9-20)
  % Mark B (m. 9)
  gis4.\p gis8 gis4. gis8 |
  b2. r4 |
  b2( a) |
  gis2. r4 |
  g4.\mp g8 g4. g8 |
  g2( ais) |

  % Mark C (m. 15): Neapolitan Drama
  fis4.\p fis8 fis4. fis8 |
  ais2. r4 |
  b2\mp( a) |
  gis2( fis) |
  r8 a4\p( gis8) fis4.( a8) |
  gis2( bis) |

  % Section III: Dominant Sostenuto (mm. 21-27)
  % Mark D (m. 21)
  e2\p( gis) |
  dis2( bis) |
  e2( gis) |
  dis2( bis) |
  dis4\<( bis cis e\!) |
  dis4\>( bis cis e\!) |
  dis4\p( dis dis e) |

  % Section IV: Development & Emotional Crest (mm. 28-41)
  % Mark E (m. 28)
  dis2\mf( a) |
  gis1~\f |
  gis2 a |
  b1~\f |
  b2 cis |
  d1~\ff |
  d2( cis) |
  bis1\mf |
  cis1\mp |

  % Mark F (m. 37): Descending Release
  r8 a4\p( gis8) fis4.( a8) |
  gis1~ |
  gis1 |
  gis1~\pp |
  gis1 |

  % Section V: Recapitulation (mm. 42-49)
  % Mark G (m. 42)
  gis4.\p gis8 gis4. gis8 |
  gis2. r4 |
  r8 a4\mp( gis8) fis4.( a8) |
  gis2( bis) |
  gis4.\p gis8 gis4. gis8 |
  gis2( a) |
  gis4( bis gis bis) |
  gis1\pp |

  % Section VI: Coda & Transcendent Resolution (mm. 50-60)
  % Mark H (m. 50)
  cis1\p |
  d1 |
  bis1\pp |
  cis1 |
  bis1\ppp |
  cis1 |
  bis1 |
  cis1 |
  bis1 |
  cis1 |
  cis2\fermata r2 |
}
