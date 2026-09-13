\version "2.24.0"

% ============================================================================
% The Sovereign Forge — 6. TUBA / BASS (Concert Pitch, Absolute \fixed c')
% Standard Concert Band Low Brass Foundation (Bass Clef)
% ============================================================================

bassNotes = \fixed c' {
  \clef bass

  % Part I: Lento Pensieroso (mm. 1-8)
  d,1\pp ~ |
  d,1 |
  d,1 |
  bes,,1 |
  f,,1 |
  g,,2 d, |
  g,,2 g, |
  a,,2\> ~ a,,4\! r\fermata |

  % Part II: Allegro Risoluto - The Forge (mm. 9-22)
  d,4.\f d,8 f,4 g, |
  a,4. g,8 f,4 e, |
  d,8\f d, r d, d,4 d, |
  d,8 d, r d, d,4 d, |
  d,4.\f e,8 f,4. g,8 |
  a,4. bes,8 c2 |
  g,4. f,8 e,4. g,8 |
  a,2. r4 |
  d,8\ff e, f, g, a, bes, c d |
  g,4. a,8 bes,4 c |
  cis4. d8 e4 cis |
  d2.\ff r4 |
  d8\fff r d r d4 d |
  d1:32\fff\fermata |

  % Part III: Maestoso Nobile (mm. 23-34)
  d,4.\f e,8 fis,4. a,8 |
  g,4. fis,8 d,2 |
  e,4. d,8 a,,4. a,,8 |
  d,1 ~ |
  d,4. e,8 fis,4. a,8 |
  g,4. a,8 b,2 |
  cis4. b,8 a,4. g,8 |
  fis,2. r4 |
  d4.\fff cis8 b,4. a,8 |
  g,4. fis,8 d,2 |
  e,4. fis,8 a,,4. a,,8 |
  d,,1\fff \bar "|."
}
