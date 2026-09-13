\version "2.24.0"

% ============================================================================
% Moonlight Samba — 1. FLUTE (Concert Pitch, Absolute \fixed c')
% 56 Measures Total: Woodwind Medley Lead (mm. 17-24) & Grand Tutti Climax
% Range strictly verified within [D#4 - F6 / MIDI 63-89]
% ============================================================================

fluteNotes = \fixed c' {
  \clef treble

  % Part I: Percussion Start & Groove Build (mm. 1-8) - Tacet -> STOP 1
  R1 * 7 |
  r2. r4\fermata |

  % Part II: Section A — Muted Trumpet & Marimba (mm. 9-16) - Tacet -> STOP 2
  R1 * 7 |
  r2. r4\fermata |

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) -> STOP 3
  % Flute leads lyrical melody with Alto Sax & Clarinet support
  gis'4(\f a'8. b'16 cis''4 b'8 a' |
  gis'4. e'8 dis'2) |
  fis'8( gis' a' b' cis''4. dis''8 |
  cis''8 b' a' gis' gis'2) |
  gis'4( a'8. b'16 cis''4 b'8 a' |
  gis'4. a'8 b'2) |
  a'8( gis' fis' e' dis'4. fis'8 |
  e'2. r4\fermata) |

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) - Tacet -> STOP 4
  R1 * 7 |
  r2. r4\fermata |

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5
  % Tender expressive countermelody at d = 58
  R1 * 4 |
  gis'4.\pp gis'8 a'4. b'8 |
  cis''4. b'8 a'4. gis'8 |
  fis'4. e'8 dis'2 |
  r2. r4\fermata |

  % Part VI: Section E — Latin Percussion Soli (mm. 41-44) - Tacet
  R1 * 4 |

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  R1 * 4 |
  gis8\ff a b cis' d' e' fis' gis' |
  a'4. gis'8 fis'4 e' |
  e'8\fff r e' r e'4 e'8 e' |
  fis'8 r fis' r fis'4 fis'8 fis' |
  gis'8 r gis' r gis'4 gis'8 gis' |
  cis'1\fff \bar "|."
}
