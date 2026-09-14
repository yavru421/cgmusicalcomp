\version "2.24.0"

% ============================================================================
% Moonlight Sonata — B♭ Clarinet (Concert Pitch C# minor)
% The Continuous Hypnotic Legato Triplet Motor
% ============================================================================

clarinetNotes = \relative c' {
  \clef treble
  \tuplet 3/2 4 {
    % Section I: Intimate Solitary Exposition (mm. 1-8)
    gis8\pp( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    gis,8( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    a,8( cis' e')  a,( cis' e')  a,( d' fis')  a,( d' fis') |
    gis,8( bis dis')  gis,( bis dis')  gis,( bis dis')  gis,( bis dis') |

    % m. 5 (Theme 1 Enters in Horn)
    gis,8\p( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    gis,8( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    a,8( cis' e')  a,( cis' e')  a,( d' fis')  a,( d' fis') |
    gis,8( bis dis')  gis,( bis dis')  gis,( cis' e')  gis,( bis dis') |

    % Section II: Harmonic Modulation (mm. 9-20)
    gis,8\p( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    gis,8( b e')  gis,( b e')  gis,( b e')  gis,( b e') |
    gis,8( b e')  gis,( b e')  a,( b dis')  a,( b dis') |
    gis,8( b e')  gis,( b e')  gis,( b e')  gis,( b e') |
    g,8\mp( b e')  g,( b e')  g,( b e')  g,( b e') |
    g,8( ais e')  g,( ais e')  g,( ais e')  g,( ais e') |

    % m. 15 (Neapolitan Drama)
    fis,8\p( b d')  fis,( b d')  fis,( b d')  fis,( b d') |
    fis,8( ais cis')  fis,( ais cis')  fis,( b d')  fis,( bis dis') |
    fis,8\mp( a d')  fis,( a d')  fis,( a d')  fis,( a d') |
    eis,8( b d')  eis,( b d')  fis,( a cis')  fis,( a cis') |
    fis,8\p( a c')  fis,( a c')  fis,( a c')  fis,( a c') |
    fis,8( gis bis)  fis,( gis bis)  fis,( gis bis)  fis,( gis bis) |

    % Section III: Dominant Sostenuto (mm. 21-27)
    e,8\p( gis cis')  e,( gis cis')  e,( gis cis')  e,( gis cis') |
    dis,8( fis bis)  dis,( fis bis)  dis,( fis bis)  dis,( fis bis) |
    e,8( gis cis')  e,( gis cis')  e,( gis cis')  e,( gis cis') |
    dis,8( fis bis)  dis,( fis bis)  dis,( fis bis)  dis,( fis bis) |
    dis,8\<( fis bis)  dis,( fis bis)  e,( gis cis')  e,( gis cis')\! |
    dis,8\>( fis bis)  dis,( fis bis)  e,( gis cis')  e,( gis cis')\! |
    fis,8\p( gis bis)  fis,( gis bis)  e,( gis cis')  e,( gis cis') |

    % Section IV: Development & Cascading Arpeggios (mm. 28-41)
    dis,8\mf( fis bis)  dis,( fis bis)  dis,( fis a)  dis,( fis a) |
    gis,8\f( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    a,8( cis' fis')  a,( cis' fis')  a,( cis' fis')  a,( cis' fis') |
    b,8\f( dis' fis')  b,( dis' fis')  b,( dis' fis')  b,( dis' fis') |
    bis,8\ff( dis' fis')  bis,( dis' fis')  cis'8( e' gis')  cis'8( e' gis') |
    d'8\ff( fis' a')  d'8( fis' a')  d'8( fis' a')  d'8( fis' a') |
    cis'8\f( e' gis')  cis'8( e' gis')  cis'8( e' gis')  cis'8( e' gis') |
    bis8\mf( dis' fis')  bis( dis' fis')  bis( dis' fis')  bis( dis' fis') |
    cis'8\mp( e' gis')  cis'8( e' gis')  cis'8( e' gis')  cis'8( e' gis') |

    % mm. 37-41 (Floating Descent)
    fis,8\p( a d')  fis,( a d')  fis,( a d')  fis,( a d') |
    gis,8( bis dis')  gis,( bis dis')  gis,( bis dis')  gis,( bis dis') |
    gis,8( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    gis,8\pp( bis dis')  gis,( bis dis')  gis,( bis dis')  gis,( bis dis') |
    gis,8( bis dis')  gis,( bis dis')  gis,( bis dis')  gis,( bis dis') |

    % Section V: Recapitulation (mm. 42-49)
    gis,8\p( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    gis,8( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    a,8\mp( cis' e')  a,( cis' e')  a,( d' fis')  a,( d' fis') |
    gis,8( bis dis')  gis,( bis dis')  gis,( bis dis')  gis,( bis dis') |
    gis,8\p( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    gis,8( cis' e')  gis,( cis' e')  a,( cis' e')  a,( d' fis') |
    gis,8( cis' e')  gis,( bis dis')  gis,( cis' e')  gis,( bis dis') |
    gis,8\pp( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |

    % Section VI: Coda & Transcendent Resolution (mm. 50-60)
    a,8\p( cis' e')  a,( cis' e')  a,( cis' e')  a,( cis' e') |
    fis,8( a d')  fis,( a d')  fis,( a d')  fis,( a d') |
    gis,8\pp( bis dis')  gis,( bis dis')  gis,( bis dis')  gis,( bis dis') |
    gis,8( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    gis,8\ppp( bis dis')  gis,( bis dis')  gis,( bis dis')  gis,( bis dis') |
    gis,8( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    gis,8( cis' e')  gis,( cis' e')  gis,( bis dis')  gis,( bis dis') |
    gis,8( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
    gis,8( cis' e')  gis,( cis' e')  gis,( bis dis')  gis,( bis dis') |
    gis,8( cis' e')  gis,( cis' e')  gis,( cis' e')  gis,( cis' e') |
  }
  <e' gis' cis''>2\ppp <e' gis' cis''>2\fermata |
}
