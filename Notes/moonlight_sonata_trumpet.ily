\version "2.24.0"

% ============================================================================
% Moonlight Sonata — B♭ Trumpet (Concert Pitch C# minor)
% Noble Harmonic Support & Climax Reinforcement (Grade 3/4 Compliant)
% Range: Bb3 - F5 (Sustained within safe tessitura to prevent lip fatigue)
% ============================================================================

trumpetNotes = \relative c' {
  \clef treble

  % Section I: Intimate Solitary Exposition (mm. 1-8)
  % Tacet for breath and embouchure freshness
  R1 * 8 |

  % Section II: Harmonic Modulation (mm. 9-20)
  % Tacet through intimate woodwind & horn meditation
  R1 * 12 |

  % Section III: Dominant Sostenuto (mm. 21-27)
  % Mark D (m. 21): Warm, soft chorale entrance
  gis2\p( bis) |
  gis2( bis) |
  gis2( bis) |
  gis2( bis) |
  gis4\<( bis gis cis\!) |
  gis4\>( bis gis cis\!) |
  bis4\p( dis gis, bis) |

  % Section IV: Development & Emotional Crest (mm. 28-41)
  % Mark E (m. 28): Majestic, resonant brass presence
  bis2\mf( dis) |
  e1~\f |
  e2 fis |
  fis1~\f |
  fis2 gis |
  a1~\ff |
  a2( gis) |
  fis1\mf |
  e1\mp |

  % Mark F (m. 37): Full rest for recovery
  R1 * 5 |

  % Section V: Recapitulation (mm. 42-49)
  % Mark G (m. 42): Noble Hymn
  R1 * 4 |
  gis4.\p gis8 gis4. gis8 |
  gis2( a) |
  gis4( bis gis bis) |
  gis1\pp |

  % Section VI: Coda & Transcendent Resolution (mm. 50-60)
  % Mark H (m. 50)
  R1 * 2 |
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
