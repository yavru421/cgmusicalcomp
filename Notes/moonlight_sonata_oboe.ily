\version "2.24.0"

% ============================================================================
% Moonlight Sonata — Oboe (Concert Pitch C# minor)
% Plaintive Solo Counter-Voice & Expressive Choral Harmony
% Range: D4 - Eb5 (Wisconsin Rapids Grade 3/4 Compliant)
% ============================================================================

oboeNotes = \relative c' {
  \clef treble

  % Section I: Intimate Solitary Exposition (mm. 1-8)
  R1 * 8 |

  % Section II: Harmonic Modulation (mm. 9-20)
  % Mark B (m. 9): Warm middle-register response
  R1 * 4 |
  r8 g'4\mp( fis8) e4.( g8) |
  fis2. r4 |

  % Mark C (m. 15): Neapolitan Drama
  fis4.\p fis8 fis4. fis8 |
  fis2. r4 |
  r8 fis4\mp( e8) d4.( fis8) |
  eis2( fis) |
  r8 fis4\p( e8) d4.( fis8) |
  dis2( dis) |

  % Section III: Dominant Sostenuto (mm. 21-27)
  % Mark D (m. 21)
  cis2\p( e) |
  bis2( dis) |
  cis2( e) |
  bis2( dis) |
  bis4\<( bis cis cis\!) |
  bis4\>( bis cis cis\!) |
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
  r8 fis4\p( e8) d4.( fis8) |
  dis1~ |
  dis1 |
  dis1~\pp |
  dis1 |

  % Section V: Recapitulation (mm. 42-49)
  % Mark G (m. 42)
  R1 * 4 |
  e4.\p e8 e4. e8 |
  e2( fis) |
  e4( dis e dis) |
  e1\pp |

  % Section VI: Coda & Transcendent Resolution (mm. 50-60)
  % Mark H (m. 50)
  cis'1\p |
  a1 |
  gis1\pp |
  gis1 |
  gis1\ppp |
  gis1 |
  gis1 |
  gis1 |
  gis1 |
  gis1 |
  gis2\fermata r2 |
}
