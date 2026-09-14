\version "2.24.0"

% ============================================================================
% Moonlight Sonata — Tuba (Concert Pitch C# minor)
% Profound Pedal Foundation & Low Octave Support (Grade 3/4 Compliant)
% Range: Bb1 - F3 (Rich acoustic low resonance)
% ============================================================================

tubaNotes = \relative c, {
  \clef bass

  % Section I: Intimate Solitary Exposition (mm. 1-8)
  % mm. 1-4: Beethoven's Iconic Octave Bass Pedal
  cis1\pp |
  b1 |
  a1 |
  gis1 |

  % Mark A (m. 5): Theme 1 Pedal Continuation
  cis1\p |
  b1 |
  a1 |
  gis1 |

  % Section II: Harmonic Modulation (mm. 9-20)
  % Mark B (m. 9)
  cis1\p |
  e1 |
  b1 |
  e1 |
  e1\mp |
  e1 |

  % Mark C (m. 15): Neapolitan Drama (D Major Shift)
  d1\p |
  cis1 |
  d1\mp |
  cis1 |
  c1\p |
  gis1 |

  % Section III: Dominant Sostenuto (mm. 21-27)
  % Mark D (m. 21): Dominant G# pedal
  cis1\p |
  gis1 |
  cis1 |
  gis1 |
  gis4\<( gis cis cis\!) |
  gis4\>( gis cis cis\!) |
  gis1\p |

  % Section IV: Development & Emotional Crest (mm. 28-41)
  % Mark E (m. 28): Dynamic Grounding
  gis1\mf |
  cis1~\f |
  cis2 d |
  dis1~\f |
  dis2 e |
  fis1~\ff |
  fis2( e) |
  dis1\mf |
  cis1\mp |

  % Mark F (m. 37): Descending Release
  d1\p |
  gis,1~ |
  gis1 |
  gis1~\pp |
  gis1 |

  % Section V: Recapitulation (mm. 42-49)
  % Mark G (m. 42): Return of C# minor pedal
  cis1\p |
  b1 |
  a1\mp |
  gis1 |
  cis1\p |
  fis,1 |
  gis1 |
  cis1\pp |

  % Section VI: Coda & Transcendent Resolution (mm. 50-60)
  % Mark H (m. 50)
  a1\p |
  d1 |
  gis,1\pp |
  cis1 |
  gis1\ppp |
  cis1 |
  gis1 |
  cis1 |
  gis1 |
  cis1 |
  cis2\fermata r2 |
}
