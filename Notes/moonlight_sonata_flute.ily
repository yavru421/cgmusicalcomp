\version "2.24.0"

% ============================================================================
% Moonlight Sonata — Flute (Concert Pitch C# minor)
% Lyrical Descant & Celestial Counter-Melody
% Range: E4 - F6 (Wisconsin Rapids Grade 3/4 Compliant)
% ============================================================================

fluteNotes = \relative c'' {
  \clef treble

  % Section I: Intimate Solitary Exposition (mm. 1-8)
  R1 * 8 |

  % Section II: Harmonic Modulation (mm. 9-20)
  % Mark B (m. 9): Delicate high descant answering Horn
  r2 r4. gis8\p |
  b'4.( gis8) e'4.( b8) |
  gis'2.( fis8 e) |
  dis2. r4 |
  r8 e4\mp( d8) b4.( d8) |
  cis2. r4 |

  % Mark C (m. 15): Neapolitan Drama
  fis,4.\p fis8 fis4. fis8 |
  cis'2. r4 |
  r8 d'4\mp( cis'8) a4.( c'8) |
  b2( a) |
  r8 a4\p( gis8) fis4.( a8) |
  gis2( bis) |

  % Section III: Dominant Sostenuto (mm. 21-27)
  % Mark D (m. 21)
  R1 * 4 |
  dis'4\<( dis' e' e'\!) |
  dis'4\>( dis' e' e'\!) |
  fis'4\p( gis' bis' e') |

  % Section IV: Development & Cascading Arpeggios (mm. 28-41)
  % Mark E (m. 28)
  dis'2\mf( a') |
  gis'1~\f |
  gis'2 a' |
  b'1~\f |
  b'2 cis'' |
  d''1~\ff |
  d''2( cis'') |
  bis'1\mf |
  cis''1\mp |

  % Mark F (m. 37): Descending Release
  r8 a'4\p( gis'8) fis'4.( a'8) |
  gis'1~ |
  gis'1 |
  gis'1~\pp |
  gis'1 |

  % Section V: Recapitulation (mm. 42-49)
  % Mark G (m. 42): Descant with Horn
  R1 * 4 |
  gis'4.\p gis'8 gis'4. gis'8 |
  gis'2( a') |
  gis'4( bis' gis' bis') |
  gis'1\pp |

  % Section VI: Coda & Transcendent Resolution (mm. 50-60)
  % Mark H (m. 50)
  e''1\p |
  d''1 |
  bis'1\pp |
  cis''1 |
  bis'1\ppp |
  cis''1 |
  bis'1 |
  cis''1 |
  bis'1 |
  cis''1 |
  cis''2\fermata r2 |
}
