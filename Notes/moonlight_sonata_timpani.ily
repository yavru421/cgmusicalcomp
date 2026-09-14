\version "2.24.0"

% ============================================================================
% Moonlight Sonata — Timpani (Concert Pitch C# minor)
% Tuned to Cis and Gis (Felt Mallet Rolls & Dramatic Swells)
% ============================================================================

timpaniNotes = \relative c {
  \clef bass

  % Section I: Intimate Solitary Exposition (mm. 1-8)
  R1 * 8 |

  % Section II: Harmonic Modulation (mm. 9-20)
  R1 * 12 |

  % Section III: Dominant Sostenuto (mm. 21-27)
  % Mark D (m. 21): Soft G# pedal roll
  gis1\pp\startTrillSpan |
  gis1 |
  gis1 |
  gis1 |
  gis4\stopTrillSpan\<( gis gis gis\!) |
  gis4\>( gis gis gis\!) |
  gis1\p\startTrillSpan |

  % Section IV: Development & Emotional Crest (mm. 28-41)
  % Mark E (m. 28): Swelling into climax
  gis1\stopTrillSpan\mf |
  cis1\f\startTrillSpan |
  cis2\stopTrillSpan r2 |
  gis1\f\startTrillSpan |
  gis2\stopTrillSpan r2 |
  cis1\ff\startTrillSpan |
  cis2\stopTrillSpan r2 |
  gis1\mf\startTrillSpan |
  cis1\stopTrillSpan\mp |

  % Mark F (m. 37): Full rest
  R1 * 5 |

  % Section V: Recapitulation (mm. 42-49)
  % Mark G (m. 42)
  R1 * 4 |
  cis1\p\startTrillSpan |
  cis2\stopTrillSpan r2 |
  gis1\pp\startTrillSpan |
  cis1\stopTrillSpan |

  % Section VI: Coda & Transcendent Resolution (mm. 50-60)
  % Mark H (m. 50)
  R1 * 2 |
  gis1\pp\startTrillSpan |
  cis1\stopTrillSpan |
  gis1\ppp\startTrillSpan |
  cis1\stopTrillSpan |
  gis1\startTrillSpan |
  cis1\stopTrillSpan |
  gis1\startTrillSpan |
  cis1\stopTrillSpan |
  cis2\fermata r2 |
}
