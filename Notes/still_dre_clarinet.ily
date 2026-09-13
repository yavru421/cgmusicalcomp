\version "2.24.0"

% ============================================================================
% Still D.R.E. — B♭ CLARINET (Concert Pitch, Absolute \fixed c')
% Calibrated Range: strictly within [D3 - G5 / MIDI 50-79]
% 64 Measures Total
% ============================================================================

clarinetNotes = \fixed c' {
  \clef treble

  % Part I: Intro (mm. 1-8)
  % mm. 1-4: Scott Storch Chords in Middle Register
  \repeat unfold 2 {
    <c e a>8-.\mp <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. |
    <b, d fis>8-. <b, d fis>-. <b, d fis>-. <b, e g>-. <b, e g>-. <b, e g>-. <b, e g>-. <b, e g>-. |
  }
  % mm. 5-8: Groove Drop
  \repeat unfold 2 {
    <c e a>8-.\mf <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. |
    <b, d fis>8-. <b, d fis>-. <b, d fis>-. <b, e g>-. <b, e g>-. <b, e g>-. <b, e g>-. <b, e g>-. |
  }

  % Part II: Section A — Verse 1 (mm. 9-24)
  \repeat unfold 6 {
    <c e a>8-.\mp <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. |
    <b, d fis>8-. <b, d fis>-. <b, d fis>-. <b, e g>-. <b, e g>-. <b, e g>-. <b, e g>-. <b, e g>-. |
  }
  % mm. 21-24: Chalumeau build into chorus
  a,4(\mf c e a |
  b4. g8 e2) |
  a,4( c e a |
  b8\< c' d' dis' e'2\f\!) |

  % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
  \repeat unfold 2 {
    c'4.\ff b8 a4 g8 e |
    a4 g8 e g2 |
    c'4. b8 a4 g8 e |
    g8 e fis e e2 |
  }

  % Part IV: Section C — Chamber Interlude (mm. 33-40)
  e2(\p f |
  e4. d8 c2) |
  d2( e |
  a,1) |
  e2( f |
  e4. d8 c2) |
  d4.( e8 a,2) |
  r1 |

  % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
  R1 * 4 |
  r2 a8-.\mf\< b-. c'-. d'-. |
  e'4. d'8 c'4 b |
  c'8-.\f d'-. e'-. fis'-. g'4-. fis'8-. e'-. |
  c'1\ff\! |

  % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
  \repeat unfold 2 {
    e'4.\fff d'8 c'4 b8 a |
    c'4 b8 a b2 |
    e'4. d'8 c'4 b8 a |
    c'8 a b a a2 |
  }

  % Part VII: Section F — Coda & Outro (mm. 57-64)
  \repeat unfold 2 {
    c'8-.\ff r a-. r c'4-. a8-. r |
    b8-. r g-. r b4-. g8-. r |
  }
  % mm. 61-63: Fade back to solo chords
  <c e a>8-.\mp <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. |
  <b, d fis>8-. <b, d fis>-. <b, d fis>-. <b, e g>-. <b, e g>-. <b, e g>-. <b, e g>-. <b, e g>-. |
  <c e a>8-.\p <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. <c e a>-. |
  % m. 64: Final stinger
  a4-.\fff r4 r2\fermata \bar "|."
}
