\version "2.24.0"

% ============================================================================
% Moonlight Sonata — Tenor Trombone (Concert Pitch C# minor)
% Warm Velvet Choral Harmony & Tenor Counterpoint (Grade 3/4 Compliant)
% Range: E2 - G4 (Physical slide positions optimized)
% ============================================================================

tromboneNotes = \relative c {
  \clef bass

  % Section I: Intimate Solitary Exposition (mm. 1-8)
  R1 * 4 |
  gis2\p( bis) |
  gis2. r4 |
  a2\mp( c) |
  gis2( bis) |

  % Section II: Harmonic Modulation (mm. 9-20)
  % Mark B (m. 9)
  gis2\p( bis) |
  gis2( b) |
  b2( a) |
  gis2. r4 |
  g2\mp( b) |
  g2( ais) |

  % Mark C (m. 15): Neapolitan Drama
  fis2\p( b) |
  fis2( ais) |
  fis2\mp( a) |
  eis2( a) |
  fis2\p( a) |
  fis2( gis) |

  % Section III: Dominant Sostenuto (mm. 21-27)
  % Mark D (m. 21)
  e2\p( gis) |
  dis2( gis) |
  e2( gis) |
  dis2( gis) |
  gis4\<( dis e gis\!) |
  gis4\>( dis e gis\!) |
  dis4\p( dis dis e) |

  % Section IV: Development & Emotional Crest (mm. 28-41)
  % Mark E (m. 28)
  dis2\mf( fis) |
  e1~\f |
  e2 fis |
  fis1~\f |
  fis2 gis |
  a1~\ff |
  a2( gis) |
  fis1\mf |
  e1\mp |

  % Mark F (m. 37): Descending Release
  fis2\p( a) |
  gis1~ |
  gis1 |
  gis1~\pp |
  gis1 |

  % Section V: Recapitulation (mm. 42-49)
  % Mark G (m. 42)
  gis2\p( bis) |
  gis2. r4 |
  a2\mp( c) |
  gis2( bis) |
  gis2\p( bis) |
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
