\version "2.24.0"

% ============================================================================
% Moonlight Sonata — Tenor Saxophone (Concert Pitch C# minor)
% Singing Tenor Counterpoint & Low Woodwind Anchor
% Range: C3 - E5 (Wisconsin Rapids Grade 3/4 Compliant)
% ============================================================================

tenorSaxNotes = \relative c {
  \clef treble

  % Section I: Intimate Solitary Exposition (mm. 1-8)
  R1 * 4 |
  cis'2\p( e) |
  cis2. r4 |
  d2\mp( fis) |
  bis,2( dis) |

  % Section II: Harmonic Modulation (mm. 9-20)
  % Mark B (m. 9)
  cis2\p( e) |
  b2( e) |
  e2( b) |
  b2. r4 |
  b2\mp( e) |
  ais,2( cis) |

  % Mark C (m. 15): Neapolitan Drama
  b2\p( d) |
  ais2. r4 |
  b2\mp( d) |
  gis,2( cis) |
  a2\p( c) |
  gis2( bis) |

  % Section III: Dominant Sostenuto (mm. 21-27)
  % Mark D (m. 21)
  gis2\p( cis) |
  gis2( bis) |
  gis2( cis) |
  gis2( bis) |
  gis4\<( bis gis cis\!) |
  gis4\>( bis gis cis\!) |
  bis4\p( dis gis, cis) |

  % Section IV: Development & Emotional Crest (mm. 28-41)
  % Mark E (m. 28)
  gis2\mf( bis) |
  cis1~\f |
  cis2 d |
  dis1~\f |
  dis2 e |
  fis1~\ff |
  fis2( e) |
  dis1\mf |
  cis1\mp |

  % Mark F (m. 37): Descending Release
  b2\p( d) |
  bis1~ |
  bis1 |
  bis1~\pp |
  bis1 |

  % Section V: Recapitulation (mm. 42-49)
  % Mark G (m. 42)
  cis2\p( e) |
  cis2. r4 |
  d2\mp( fis) |
  bis,2( dis) |
  cis2\p( e) |
  cis2( d) |
  cis4( bis cis bis) |
  cis1\pp |

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
