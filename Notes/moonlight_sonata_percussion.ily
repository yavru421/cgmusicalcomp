\version "2.24.0"

% ============================================================================
% Moonlight Sonata — Classical Concert Percussion
% Suspended Cymbal (Yarn Mallets), Triangle & Concert Bass Drum
% Atmosphere, Subtle Crescendos & Gentle Releases (No Drum Kit)
% ============================================================================

percussionNotes = \drummode {
  % Section I: Intimate Solitary Exposition (mm. 1-8)
  R1 * 8 |

  % Section II: Harmonic Modulation (mm. 9-20)
  R1 * 12 |

  % Section III: Dominant Sostenuto (mm. 21-27)
  % Mark D (m. 21): Gentle suspended cymbal roll swelling into m. 25
  R1 * 4 |
  cyms1\p\< ~ |
  cyms1\> ~ |
  cyms1\p |

  % Section IV: Development & Emotional Crest (mm. 28-41)
  % Mark E (m. 28): Cymbal & Concert Bass Drum dynamic peak
  R1 * 1 |
  cyms1\f\< ~ |
  cyms2\stopTrillSpan\! r2 |
  cyms1\f\< ~ |
  cyms2\stopTrillSpan\! r2 |
  cyms1\ff\< ~ |
  cyms2\stopTrillSpan\! bd2\f |
  cyms1\mf\> ~ |
  cyms1\p |

  % Mark F (m. 37): Resting
  R1 * 5 |

  % Section V: Recapitulation (mm. 42-49)
  % Mark G (m. 42): Subtle soft cymbal swell at climax of hymn
  R1 * 5 |
  cyms1\p\< ~ |
  cyms2\> r2\! |
  R1 * 1 |

  % Section VI: Coda & Transcendent Resolution (mm. 50-60)
  % Mark H (m. 50): Final soft triangle & cymbal release
  R1 * 9 |
  cyms1\ppp\fermata |
}
