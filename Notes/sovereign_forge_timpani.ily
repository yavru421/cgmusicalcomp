\version "2.24.0"

% ============================================================================
% The Sovereign Forge — 9. TIMPANI (Concert Pitch, Absolute \fixed c')
% Standard 4-Kettle Pedal Timpani Tuned to D, A, F Roots & Fifths (Bass Clef)
% ============================================================================

timpaniNotes = \fixed c' {
  \clef bass

  % Part I: Lento Pensieroso (mm. 1-8)
  d,1\pp ~ |
  d,1 |
  R1 * 4 |
  a,1:32\p\< ~ |
  a,2\> ~ a,4\! r\fermata |

  % Part II: Allegro Risoluto (The Forge mm. 9-22)
  d,4.\f d,8 f,4 g, |
  a,4. g,8 f,4 e, |
  d,8\f d, r d, d,4 d, |
  d,8 d, r d, d,4 d, |
  d,4.\f d,8 d,4. d,8 |
  a,4. a,8 a,2 |
  g,4. f,8 e,4. g,8 |
  a,2. r4 |
  d,8\ff d, d, d, d, d, d, d, |
  g,4. a,8 bes,4 c |
  a,4. a,8 a,4 a, |
  d,2.\ff r4 |
  d,8\fff r d, r d,4 d, |
  d,1:32\fff\fermata |

  % Part III: Maestoso Nobile (mm. 23-34)
  d,4.\f d,8 d,4. d,8 |
  g,4. fis,8 d,2 |
  a,4. a,8 a,4. a,8 |
  d,1 ~ |
  d,4. d,8 d,4. d,8 |
  g,4. a,8 b,2 |
  a,4. a,8 a,4. a,8 |
  d,2. r4 |
  d,4.\fff d,8 d,4. d,8 |
  g,4. fis,8 d,2 |
  a,4. a,8 a,4. a,8 |
  d,1:32\fff \bar "|."
}
