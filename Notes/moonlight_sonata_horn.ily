\version "2.24.0"

% ============================================================================
% Moonlight Sonata — French Horn in F (Concert Pitch C# minor)
% The Noble Lyrical Lead Melody (Entering at m. 5)
% ============================================================================

hornNotes = \relative c' {
  \clef treble

  % Section I: Intimate Solitary Exposition (mm. 1-8)
  % mm. 1-4: Resting while woodwind triplets establish atmosphere
  R1 * 4 |

  % Mark A (m. 5): Main Lyrical Theme enters softly
  gis4.\p gis8 gis4. gis8 |
  gis2. r4 |
  r8 a4\mp( gis8) fis4.( a8) |
  gis2( bis) |

  % Section II: Harmonic Modulation (mm. 9-20)
  % Mark B (m. 9)
  gis4.\p gis8 gis4. gis8 |
  b2. r4 |
  r8 c'4\mp( b8) a4.( c'8) |
  b2. r4 |
  r8 b4\mp( ais8) g4.( b8) |
  ais2. r4 |

  % Mark C (m. 15): Neapolitan Drama
  fis4.\p fis8 fis4. fis8 |
  ais2. r4 |
  r8 b4\mp( a8) fis4.( a8) |
  gis2( fis) |
  r8 a4\p( gis8) fis4.( a8) |
  gis2( bis) |

  % Section III: Dominant Sostenuto (mm. 21-27)
  % Mark D (m. 21)
  e2\p( gis) |
  dis2( bis) |
  e2( gis) |
  dis2( bis) |
  dis4\<( dis e e\!) |
  dis4\>( dis e e\!) |
  fis4\p( gis bis e) |

  % Section IV: Development & Emotional Crest (mm. 28-41)
  % Mark E (m. 28)
  dis2\mf( a) |
  gis1~\f |
  gis2 a |
  b1~\f |
  b2 cis' |
  d'1~\ff |
  d'2( cis') |
  bis1\mf |
  cis'1\mp |

  % Mark F (m. 37): Descending Release
  r8 a4\p( gis8) fis4.( a8) |
  gis1~ |
  gis1 |
  gis1~\pp |
  gis1 |

  % Section V: Recapitulation (mm. 42-49)
  % Mark G (m. 42): Noble Hymn Lead
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
  a1\p |
  fis1 |
  gis1\pp |
  cis'1 |
  bis1\ppp |
  cis'1 |
  bis1 |
  cis'1 |
  bis1 |
  cis'1 |
  cis'2\fermata r2 |
}
