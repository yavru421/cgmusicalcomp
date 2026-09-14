\version "2.24.0"

% ============================================================================
% Moonlight Sonata — Glockenspiel (Concert Pitch C# minor)
% Subtle Celestial Sparkle at Dynamic & Harmonic Peaks (Grade 3/4 Compliant)
% Range: Bb5 - D7 (Concert Pitch)
% ============================================================================

glockenspielNotes = \relative c''' {
  \clef treble

  % Section I: Intimate Solitary Exposition (mm. 1-8)
  R1 * 8 |

  % Section II: Harmonic Modulation (mm. 9-20)
  % Mark B (m. 9): Delicate high sparkle on cadence
  R1 * 3 |
  gis2.\p r4 |
  R1 * 7 |
  gis2\p( bis) |

  % Section III: Dominant Sostenuto (mm. 21-27)
  R1 * 7 |

  % Section IV: Development & Emotional Crest (mm. 28-41)
  % Mark E (m. 28): Subtle metallic shimmer over climax
  R1 * 4 |
  bis2\f( cis') |
  d'1~\ff |
  d'2( cis') |
  bis1\mf |
  cis'1\mp |

  % Mark F (m. 37): Resting
  R1 * 5 |

  % Section V: Recapitulation (mm. 42-49)
  % Mark G (m. 42)
  R1 * 6 |
  gis2\p( bis) |
  gis1\pp |

  % Section VI: Coda & Transcendent Resolution (mm. 50-60)
  % Mark H (m. 50)
  R1 * 9 |
  cis''1\ppp\fermata |
}
