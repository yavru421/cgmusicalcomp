\version "2.24.0"

% ============================================================================
% The Sovereign Forge — 5. TROMBONE (Concert Pitch, Absolute \fixed c')
% Tenor Trombone Authentic Range: E2 to F4/G4 (Bass Clef)
% ============================================================================

tromboneNotes = \fixed c' {
  \clef bass

  % Part I: Lento Pensieroso (Warm, Solemn Foundation, mm. 1-8)
  R1 * 2 |
  d1\p ~ |
  d1 |
  f1 |
  g2 f |
  g2 bes |
  a2\> ~ a4\! r\fermata |

  % Part II: Allegro Risoluto - The Forge (Grit & Driving Low Brass, mm. 9-22)
  d4.\f d8 f4 g |
  a4. g8 f4 e |
  d8\f d r d d4 d |
  d8 d r d d4 d |
  d4.\f e8 f4. g8 |
  a4. bes8 c'2 |
  bes4. a8 g4. bes8 |
  a2. r4 |
  d8\ff e f g a bes c' d' |
  g4. a8 bes4 c' |
  cis'4. d'8 e'4 cis' |
  d'2.\ff r4 |
  r8 d16\fff d r8 d f4 d |
  d1:32\fff\fermata |

  % Part III: Maestoso Nobile (mm. 23-34)
  d4.\f e8 fis4. a8 |
  g4. fis8 d2 |
  e4. d8 cis4. e8 |
  d1 ~ |
  d4. e8 fis4. a8 |
  g4. a8 b2 |
  cis'4. b8 a4. g8 |
  fis2. r4 |
  d'4.\fff a8 g4. fis8 |
  g4. fis8 d2 |
  e4. d8 a,4. a,8 |
  d1\fff \bar "|."
}
