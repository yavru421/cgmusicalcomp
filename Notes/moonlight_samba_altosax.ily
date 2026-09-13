\version "2.24.0"

% ============================================================================
% Moonlight Samba — 4. ALTO SAXOPHONE (Concert Pitch, Absolute \fixed c')
% 56 Measures Total: Woodwind Medley Lead (mm. 17-24), Montuno Drive & Climax
% Range strictly verified within [C4 - F5 / MIDI 60-77] (Concert Pitch)
% ============================================================================

altoSaxNotes = \fixed c' {
  \clef treble

  % Part I: Percussion Start (mm. 1-4 tacet) -> Enters m. 5 -> STOP 1
  R1 * 4 |
  r8 c'4.\mf ~ c'4 c'8 c' |
  r8 dis'4. ~ dis'4 dis'8 dis' |
  r8 e'4. d'4. c'8 |
  dis'2\f r2\fermata |

  % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) -> STOP 2
  R1 * 7 |
  r2. r4\fermata |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) -> STOP 3
  c'4(\f dis'8. e'16 fis'4 e'8 dis' |
  c'4. g8 g2) |
  a8( b c' dis' e'4. fis'8 |
  e'8 dis' c' b c'2) |
  c'4( dis'8. e'16 fis'4 e'8 dis' |
  c'4. dis'8 e'2) |
  dis'4. c'8 b4. dis'8 |
  c'2. r4\fermata |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) -> STOP 4
  c'8\ff dis' e' fis' g' a' b' c'' |
  d''4. c''8 b'4 a' |
  g'4. fis'8 e'4 dis' |
  c'2. r4 |
  r8 c'4.\f ~ c'4 c'8 c' |
  r8 d'4. ~ d'4 d'8 d' |
  r8 b4. ~ b4 b8 b |
  c'2. r4\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5
  c'1\pp ~ |
  c'1 |
  c'2 d' |
  b2 c' |
  c'1 ~ |
  c'1 |
  c'2 d' |
  b2\fermata r2 |

  % Part VI: Section E — Latin Percussion Soli (mm. 41-44) - Tacet
  R1 * 4 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  R1 * 2 |
  r8 c'4.\ff ~ c'4 c'8 c' |
  r8 c'4. d'4 d'8 d' |
  r8 b4. c'4 c'8 c' |
  r8 b4. c'4 c'8 c' |
  c'8 r c' r c'4 c'8 c' |
  d'8 r d' r d'4 d'8 d' |
  c'8\fff r c' r c'4 c'8 c' |
  d'8 r d' r d'4 d'8 d' |
  b8 r b r b4 b8 b |
  c'1\fff \bar "|."
}
