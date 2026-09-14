\version "2.24.0"

% ============================================================================
% Moonlight Sonata — Alto Saxophone (Concert Pitch C# minor)
% Warm Harmonic Bed & Choral Tenor Response
% Range: C4 - F5 (Wisconsin Rapids Grade 3/4 Compliant)
% ============================================================================

altoSaxNotes = \relative c' {
  \clef treble

  % Section I: Intimate Solitary Exposition (mm. 1-8)
  R1 * 4 |
  e2\p( gis) |
  e2. r4 |
  fis2\mp( a) |
  dis,2( fis) |

  % Section II: Harmonic Modulation (mm. 9-20)
  % Mark B (m. 9)
  e2\p( gis) |
  e2( gis) |
  gis2( fis) |
  e2. r4 |
  e2\mp( g) |
  e2( cis) |

  % Mark C (m. 15): Neapolitan Drama
  d2\p( fis) |
  cis2. r4 |
  d2\mp( fis) |
  cis2( fis) |
  c2\p( dis) |
  bis2( dis) |

  % Section III: Dominant Sostenuto (mm. 21-27)
  % Mark D (m. 21)
  cis2\p( e) |
  bis2( dis) |
  cis2( e) |
  bis2( dis) |
  dis4\<( bis cis e\!) |
  dis4\>( bis cis e\!) |
  dis4\p( dis dis cis) |

  % Section IV: Development & Emotional Crest (mm. 28-41)
  % Mark E (m. 28)
  bis2\mf( dis) |
  cis1~\f |
  cis2 dis |
  dis1~\f |
  dis2 e |
  fis1~\ff |
  fis2( e) |
  dis1\mf |
  cis1\mp |

  % Mark F (m. 37): Descending Release
  d2\p( fis) |
  dis1~ |
  dis1 |
  dis1~\pp |
  dis1 |

  % Section V: Recapitulation (mm. 42-49)
  % Mark G (m. 42)
  e2\p( gis) |
  e2. r4 |
  fis2\mp( a) |
  dis,2( fis) |
  e2\p( gis) |
  e2( fis) |
  e4( dis e dis) |
  e1\pp |

  % Section VI: Coda & Transcendent Resolution (mm. 50-60)
  % Mark H (m. 50)
  e1\p |
  d1 |
  dis1\pp |
  e1 |
  dis1\ppp |
  e1 |
  dis1 |
  e1 |
  dis1 |
  e1 |
  e2\fermata r2 |
}
