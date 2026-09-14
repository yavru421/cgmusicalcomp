\version "2.24.0"

% ============================================================================
% Moonlight Sonata — Marimba (Concert Pitch C# minor)
% Soft Mallet Resonance Doubling Triplet Bed (Grade 3/4 Compliant)
% Range: C3 - G5
% ============================================================================

marimbaNotes = \relative c {
  \clef treble

  % Section I: Intimate Solitary Exposition (mm. 1-8)
  % Tacet for solitary woodwind atmosphere
  R1 * 8 |

  % Section II: Harmonic Modulation (mm. 9-20)
  % Mark B (m. 9): Soft yarn mallets enter
  \tuplet 3/2 4 {
    gis8\p( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    gis,8( b e')  gis,( b e')  gis,( b e')  gis,( b e') |
    gis,8( b e')  gis,( b e')  a,( b dis')  a,( b dis') |
    gis,8( b e')  gis,( b e')  gis,( b e')  gis,( b e') |
    g,8\mp( b e')  g,( b e')  g,( b e')  g,( b e') |
    g,8( ais e')  g,( ais e')  g,( ais e')  g,( ais e') |

    % Mark C (m. 15): Neapolitan Drama
    fis,8\p( b d')  fis,( b d')  fis,( b d')  fis,( b d') |
    fis,8( ais cis')  fis,( ais cis')  fis,( b d')  fis,( bis dis') |
    fis,8\mp( a d')  fis,( a d')  fis,( a d')  fis,( a d') |
    eis,8( b d')  eis,( b d')  fis,( a cis')  fis,( a cis') |
    fis,8\p( a c')  fis,( a c')  fis,( a c')  fis,( a c') |
    fis,8( gis bis)  fis,( gis bis)  fis,( gis bis)  fis,( gis bis) |
  }

  % Section III: Dominant Sostenuto (mm. 21-27)
  R1 * 7 |

  % Section IV: Development & Emotional Crest (mm. 28-41)
  % Mark E (m. 28): Arpeggiated texture
  \tuplet 3/2 4 {
    dis,8\mf( fis bis)  dis,( fis bis)  dis,( fis a)  dis,( fis a) |
    gis,8\f( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    a,8( cis' fis')  a,( cis' fis')  a,( cis' fis')  a,( cis' fis') |
    b,8\f( dis' fis')  b,( dis' fis')  b,( dis' fis')  b,( dis' fis') |
    bis,8\ff( dis' fis')  bis,( dis' fis')  cis'8( e' gis')  cis'8( e' gis') |
    d'8\ff( fis' a')  d'8( fis' a')  d'8( fis' a')  d'8( fis' a') |
    cis'8\f( e' gis')  cis'8( e' gis')  cis'8( e' gis')  cis'8( e' gis') |
    bis8\mf( dis' fis')  bis( dis' fis')  bis( dis' fis')  bis( dis' fis') |
    cis'8\mp( e' gis')  cis'8( e' gis')  cis'8( e' gis')  cis'8( e' gis') |
  }

  % Mark F (m. 37): Resting
  R1 * 5 |

  % Section V: Recapitulation (mm. 42-49)
  % Mark G (m. 42)
  R1 * 8 |

  % Section VI: Coda & Transcendent Resolution (mm. 50-60)
  % Mark H (m. 50)
  R1 * 10 |
  <e' gis' cis''>2\fermata r2 |
}
