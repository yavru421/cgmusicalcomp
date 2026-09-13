\version "2.24.0"

% ============================================================================
% Still D.R.E. — FLUTE (Concert Pitch, Absolute \fixed c')
% Calibrated Range: strictly within [Eb4 - F6 / MIDI 63-89]
% 64 Measures Total
% ============================================================================

fluteNotes = \fixed c' {
  \clef treble

  % Part I: Intro (mm. 1-8)
  R1 * 8 |

  % Part II: Section A — Verse 1 (mm. 9-24)
  R1 * 8 |
  % mm. 17-24: Syncopated countermelody
  \repeat unfold 3 {
    r2 r8 c'16(\mf d' e'8 c' |
    b4.) a8 b2 |
  }
  r2 r8 c'16( d' e'8 c' |
  b8 a gis a b2\f) |

  % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
  \repeat unfold 2 {
    e'4.\ff d'8 c'4 b8 a |
    c'4 b8 a b2 |
    e'4. d'8 c'4 b8 a |
    c'8 a b a a2 |
  }

  % Part IV: Section C — Chamber Interlude (mm. 33-40)
  e'2(\p d' |
  c'4. b8 a2) |
  fis'2( g' |
  e'1) |
  e'2( d' |
  c'4. b8 a2) |
  fis'4.( g'8 e'2) |
  r1 |

  % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
  R1 * 4 |
  r2 e'8-.\mf\< f'-. g'-. a'-. |
  b'4. a'8 g'4 fis' |
  g'8-.\f a'-. b'-. c''-. d''4-. c''8-. b'-. |
  a'1\ff\! |

  % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
  % Climax melody in high register (up to E6 = MIDI 88 <= 89)
  \repeat unfold 2 {
    e''4.\fff d''8 c''4 b'8 a' |
    c''4 b'8 a' b'2 |
    e''4. d''8 c''4 b'8 a' |
    c''8 a' b' a' a'2 |
  }

  % Part VII: Section F — Coda & Outro (mm. 57-64)
  \repeat unfold 2 {
    c''8-.\ff r a'-. r c''4-. a'8-. r |
    b'8-. r g'-. r b'4-. g'8-. r |
  }
  R1 * 3 |
  a'4-.\fff r4 r2\fermata \bar "|."
}
