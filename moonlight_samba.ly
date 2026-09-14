\version "2.24.0"

\header {
  title = "Moonlight Samba"
  subtitle = "Adagio Maestoso con Samba — For Concert Band"
  composer = "Ludwig van Beethoven"
  arranger = "John Daniel Dondlinger"
  tagline = "Dedicated to the Wisconsin Rapids City Band by John Daniel Dondlinger"
}

#(set-global-staff-size 14)

\paper {
  #(set-paper-size "letter")
  top-margin = 0.5\in
  bottom-margin = 0.5\in
  left-margin = 0.5\in
  right-margin = 0.5\in
}

global = {
  \key cis \minor
  \time 4/4
}

% =======================================================================
% 1. B♭ CLARINET (The Hypnotic Moonlight Triplet Stream - Sostenuto)
% =======================================================================
clarinetConcert = \relative c' {
  \global
  \clef treble
  \tempo "Adagio Maestoso con Samba" 4 = 88
  \tuplet 3/2 4 {
    % Phase 1: Solitary Ache (mm. 1-8) - pp
    gis8\pp cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
    gis8 cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
    a8 cis' e'  a cis' e'  a d' fis'  a d' fis' |
    gis8 bis dis'  gis bis dis'  gis bis dis'  gis bis dis' |
    gis8\p cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
    gis8 cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
    a8 cis' e'  a cis' e'  a d' fis'  a d' fis' |
    gis8 bis dis'  gis bis dis'  gis cis' e'  gis bis dis' |

    % Phase 2: Layering Tears (mm. 9-16) - p / mp
    gis8\p cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
    gis8 cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
    a8 cis' e'  a cis' e'  a d' fis'  a d' fis' |
    gis8 bis dis'  gis bis dis'  gis cis' e'  gis bis dis' |
    a8\mp cis' e'  a cis' e'  a cis' e'  a cis' e' |
    fis8 a d'  fis a d'  fis a d'  fis a d' |
    gis8 bis dis'  gis bis dis'  gis bis dis'  gis bis dis' |
    gis8 bis dis'  gis bis dis'  gis bis dis'  gis bis dis' |

    % Phase 3: THE DROP (mm. 17-28) - Swelling into f / ff
    cis'8\f e' gis'  cis' e' gis'  cis' e' gis'  cis' e' gis' |
    d'8 fis' a'  d' fis' a'  d' fis' a'  d' fis' a' |
    bis8 dis' fis'  bis dis' fis'  bis dis' fis'  bis dis' fis' |
    cis'8 e' gis'  cis' e' gis'  cis' e' gis'  cis' e' gis' |
    cis'8\ff e' gis'  cis' e' gis'  cis' e' gis'  cis' e' gis' |
    d'8 fis' a'  d' fis' a'  d' fis' a'  d' fis' a' |
    bis8 dis' fis'  bis dis' fis'  bis dis' fis'  bis dis' fis' |
    cis'8 e' gis'  cis' e' gis'  cis' e' gis'  cis' e' gis' |
    e'8 gis' cis''  e' gis' cis''  e' gis' cis''  e' gis' cis'' |
    fis'8 a' d''  fis' a' d''  fis' a' d''  fis' a' d'' |
    dis'8 fis' bis'  dis' fis' bis'  dis' fis' bis'  dis' fis' bis' |
    cis'8 e' gis'  cis' e' gis'  cis' e' gis'  cis' e' gis' |

    % Phase 4: THE FADE OUT (mm. 29-36) - Softening mp -> p
    gis8\mp cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
    gis8 cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
    a8 cis' e'  a cis' e'  a d' fis'  a d' fis' |
    gis8 bis dis'  gis bis dis'  gis cis' e'  gis bis dis' |
    gis8\p cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
    gis8 cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
    a8 cis' e'  a cis' e'  a d' fis'  a d' fis' |
    gis8 bis dis'  gis bis dis'  gis cis' e'  gis bis dis' |

    % Phase 5: Transcendent Resolution (mm. 37-44) - pp -> ppp
    gis8\pp cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
    gis8 cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
    a8 cis' e'  a cis' e'  a d' fis'  a d' fis' |
    gis8 bis dis'  gis bis dis'  gis cis' e'  gis bis dis' |
    gis8\ppp cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
    gis8 cis' e'  gis cis' e'  gis cis' e'  gis cis' e' |
  }
  cis'1\fermata\ppp \bar "|."
}

% =======================================================================
% 2. FRENCH HORN IN F (Noble Lyrical Heart - Horn Medley Lead)
% =======================================================================
hornConcert = \relative c' {
  \global
  \clef treble
  \tempo "Adagio Maestoso con Samba" 4 = 88
  % Phase 1: Solitary Ache (mm. 1-8) - Enters alone in m. 5
  R1 * 4 |
  r4. gis8\p gis8. gis16 gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4\mp gis8 fis4. a8 |
  gis1 ~ |

  % Phase 2: Layering (mm. 9-16) - Horn harmonizes with entering Trombone
  gis4. gis8 gis8. gis16 gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4\mp gis8 fis4. a8 |
  gis2 ~ gis8 fis e dis |
  cis4.\mf dis8 e4. fis8 |
  fis4. gis8 a2 |
  bis4. cis'8 dis'4. bis8 |
  bis2.\> r4\p |

  % Phase 3: THE DROP (mm. 17-28) - Horn Choir Power
  cis'4.\f dis'8 e'4. fis'8 |
  fis'4. gis'8 a'2 |
  gis'4. fis'8 e'4. dis'8 |
  cis'2. r4 |
  cis'4.\ff dis'8 e'4. fis'8 |
  a'4. gis'8 fis'2 |
  bis'4. a'8 gis'4. fis'8 |
  e'2 ~ e'8 dis' e' fis' |
  gis'4.\ff a'8 gis'4. a'8 |
  a'4. b'8 a'2 |
  bis'4. cis''8 bis'4. a'8 |
  gis'2. r4 |

  % Phase 4: THE FADE OUT (mm. 29-36) - Gentle Horn Chorale
  gis4.\mp gis8 gis8. gis16 gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4 gis8 fis4. a8 |
  gis1 ~ |
  gis4.\p gis8 gis4. gis8 |
  a4. a8 a2 |
  gis4. gis8 fis4. a8 |
  gis2. r4 |

  % Phase 5: Transcendent Resolution (mm. 37-44) - Solitary Horn Echo
  gis4.\pp gis8 gis8. gis16 gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4 gis8 fis4. a8 |
  gis1 ~ |
  gis1\ppp ~ |
  gis1 |
  cis1\fermata\ppp \bar "|."
}

% =======================================================================
% 3. TROMBONE (Deep Velvet Tenor - Layers in at m. 9)
% =======================================================================
tromboneConcert = \relative c {
  \global
  \clef bass
  \tempo "Adagio Maestoso con Samba" 4 = 88
  % Phase 1: Solitary Ache (mm. 1-8) - Silent, letting Horn open alone
  R1 * 8 |

  % Phase 2: Layering Tears (mm. 9-16) - Enters with mournful tenor counterpoint
  e4.\p dis8 cis4. dis8 |
  e4. fis8 gis2 |
  r8 fis4\mp e8 dis4. fis8 |
  e2 ~ e8 dis cis b, |
  a,4.\mf b,8 cis4. dis8 |
  d4. e8 fis2 |
  gis4. a8 bis4. gis8 |
  gis2.\> r4\p |

  % Phase 3: THE DROP (mm. 17-28) - Resonant Brass Power
  cis8\f dis e fis gis a b cis' |
  d'4. cis'8 b4 a |
  gis4. fis8 e4 dis |
  cis2. r4 |
  cis'4.\ff b8 a4. b8 |
  d'4. cis'8 b2 |
  gis4. a8 b4. a8 |
  gis2 ~ gis8 fis e dis |
  cis4.\ff dis8 e4. fis8 |
  fis4. gis8 a2 |
  bis4. cis'8 bis4. a8 |
  gis2. r4 |

  % Phase 4: THE FADE OUT (mm. 29-36) - Warm Velvet Chorale
  e4.\mp dis8 cis2 |
  e4. dis8 e2 |
  r8 fis4 e8 dis4. fis8 |
  e1 ~ |
  e4.\p e8 e4. e8 |
  fis4. fis8 fis2 |
  dis4. dis8 dis4. dis8 |
  cis2. r4 |

  % Phase 5: Transcendent Resolution (mm. 37-44) - Low Pedal
  cis2\pp gis, |
  cis2 gis, |
  a,2 d |
  gis,1 |
  cis1\ppp ~ |
  cis1 |
  cis,1\fermata\ppp \bar "|."
}

% =======================================================================
% 4. B♭ TRUMPET (Lyrical Soul - Layers in at m. 13, Soars in Phase 3)
% =======================================================================
trumpetConcert = \relative c' {
  \global
  \clef treble
  \tempo "Adagio Maestoso con Samba" 4 = 88
  % Phase 1: Solitary Ache (mm. 1-8) - Silent
  R1 * 8 |

  % Phase 2: Layering (mm. 9-16) - Enters gently at m. 13 in warm 3-part chord
  R1 * 4 |
  e'4.\mf fis'8 gis'4. a'8 |
  a'4. b'8 cis''2 |
  dis''4. e''8 fis''4. dis''8 |
  dis''2.\> r4\p |

  % Phase 3: THE DROP (mm. 17-28) - Crying, Soaring Lyrical Passion
  e''8\f fis'' gis'' a'' b'' cis''' d''' e''' |
  fis'''4. e'''8 d'''4 cis''' |
  bis''4. a''8 gis''4 fis'' |
  e''2. r4 |
  e''4.\ff fis''8 gis''4. a''8 |
  fis'''4. e'''8 d'''2 |
  dis'''4. cis'''8 bis''4. a''8 |
  gis''2 ~ gis''8 fis'' e'' dis'' |
  cis''4.\ff dis''8 e''4. fis''8 |
  d''4. e''8 fis''2 |
  dis''4. e''8 dis''4. cis''8 |
  cis''2. r4 |

  % Phase 4: THE FADE OUT (mm. 29-36) - Softens into Warm Lead
  e''4.\mp dis''8 cis''2 |
  b'4. a'8 gis'2 |
  r8 a'4 gis'8 fis'4. a'8 |
  gis'1 ~ |
  gis'4.\p gis'8 cis''4. cis''8 |
  d''4. d''8 d''2 |
  bis'4. bis'8 bis'4. bis'8 |
  cis'2. r4 |

  % Phase 5: Transcendent Resolution (mm. 37-44) - Silent, leaving Horn solo
  R1 * 6 |
  cis'1\fermata\ppp \bar "|."
}

% =======================================================================
% 5. FLUTE (Ethereal Air - Peaks at the Climax mm. 17-28)
% =======================================================================
fluteConcert = \relative c'' {
  \global
  \clef treble
  \tempo "Adagio Maestoso con Samba" 4 = 88
  % Silent for Phases 1 and 2
  R1 * 16 |

  % Phase 3: THE DROP - Soaring ethereal high octaves above the horns
  r2 r8 gis''4.\f ~ |
  gis''4. a''8 b''2 |
  bis''4. a''8 gis''4. fis''8 |
  e''2. r4 |
  gis''4.\ff a''8 b''4. cis'''8 |
  d'''4. cis'''8 b''2 |
  bis''4. cis'''8 dis'''4. bis''8 |
  cis'''2 ~ cis'''8 gis'' a'' b'' |
  cis'''4.\ff b''8 a''4. b''8 |
  cis'''4. d'''8 e'''2 |
  dis'''4. e'''8 dis'''4. bis''8 |
  cis'''2. r4 |

  % Phase 4 & 5: Fades away
  R1 * 8 |
  R1 * 6 |
  cis'''1\fermata\ppp \bar "|."
}

% =======================================================================
% 6. BASS (Deep Acoustic Foundation - Enters with Drop in m. 17)
% =======================================================================
bassConcert = \relative c, {
  \global
  \clef bass
  \tempo "Adagio Maestoso con Samba" 4 = 88
  % Phase 1: Pure pedal tone on C# (mm. 1-8)
  cis,1\pp ~ |
  cis,1 |
  a,,2( d,) |
  gis,,1 |
  cis,1\p ~ |
  cis,1 |
  a,,2( d,) |
  gis,,1 |

  % Phase 2: Warm Harmonic Movement (mm. 9-16)
  cis,1\p |
  b,,1 |
  a,,2( d,) |
  gis,,1 |
  a,,1\mp |
  d,1 |
  gis,,1 ~ |
  gis,,1 |

  % Phase 3: THE DROP (mm. 17-28) - Deep Walking Samba Pocket
  cis,4.\f cis8 r4 cis |
  d,4. d8 r4 d |
  bis,,4. bis,8 r4 bis, |
  cis,4. cis8 r4 cis |
  cis,4.\ff cis8 r4 cis |
  d,4. d8 r4 d |
  bis,,4. bis,8 r4 bis, |
  cis,4. cis8 r4 cis |
  cis,4.\ff cis8 r4 cis |
  d,4. d8 r4 d |
  gis,,4. gis,8 r4 gis, |
  cis,4. cis8 r4 cis |

  % Phase 4: THE FADE OUT (mm. 29-36) - Softening Pulse -> Pedal
  cis,4.\mp cis8 r4 cis |
  cis,4. cis8 r4 cis |
  a,,4. a,8 r4 d |
  gis,,4. gis,8 r4 gis, |
  cis,4.\p cis8 r4 cis |
  d,4. d8 r4 d |
  gis,,1 |
  cis,1 |

  % Phase 5: Transcendent Resolution (mm. 37-44) - Subterranean Pedal
  cis,,1\pp ~ |
  cis,,1 |
  a,,2( d,) |
  gis,,1 |
  cis,,1\ppp ~ |
  cis,,1 |
  cis,,1\fermata\ppp \bar "|."
}

% =======================================================================
% 7. PERCUSSION: THE DROP & FADE-OUT SAMBA BATTERY
% =======================================================================
percussionOne = \drummode {
  <<
    {
      % Shaker / Caixa Rimshot Engine
      % Phase 1: Silent (mm. 1-8)
      R1 * 8 |

      % Phase 2: Silent (mm. 9-15), subtle swell in m. 16
      R1 * 7 |
      cyms1:32\p\< |

      % Phase 3: THE DROP (mm. 17-28) - Crisp, Infectious Samba Groove!
      \repeat unfold 4 {
        sn8.\f sn16 ~ sn8 sn r8 sn sn4 |
      }
      \repeat unfold 4 {
        sn8.\ff sn16 ~ sn8 sn r8 sn sn4 |
      }
      \repeat unfold 4 {
        sn8.\ff sn16 ~ sn8 sn r8 sn sn4 |
      }

      % Phase 4: THE FADE OUT (mm. 29-36) - Fading into nothing
      sn8.\mp sn16 ~ sn8 sn r8 sn sn4 |
      sn8. sn16 ~ sn8 sn r8 sn sn4 |
      sn8.\p sn16 ~ sn8 sn r8 sn sn4 |
      sn8. sn16 ~ sn8 sn r8 sn sn4 |
      cab16\pp cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      cab16 cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      cyms1:32\ppp\> ~ |
      cyms2\ppp r2 |

      % Phase 5: Transcendent Resolution (mm. 37-44) - 100% Silent
      R1 * 6 |
      r1\fermata \bar "|."
    }
    \\
    {
      % Heavy Surdo Heartbeat (Bass Drum)
      % Phase 1: Silent (mm. 1-8)
      R1 * 8 |

      % Phase 2: Silent (mm. 9-16)
      R1 * 8 |

      % Phase 3: THE DROP (mm. 17-28) - Deep Heartbeat Punch!
      \repeat unfold 4 {
        bd4\f r8 bd bd4 r |
      }
      \repeat unfold 4 {
        bd4\ff r8 bd bd4 r |
      }
      \repeat unfold 4 {
        bd4\ff r8 bd bd4 r |
      }

      % Phase 4: THE FADE OUT (mm. 29-36) - Calming heartbeat
      bd4\mp r8 bd bd4 r |
      bd4 r8 bd bd4 r |
      bd4\p r8 bd bd4 r |
      bd4 r8 bd bd4 r |
      bd4\pp r bd r |
      bd4 r bd r |
      bd1\ppp ~ |
      bd2\ppp r2 |

      % Phase 5: Silent (mm. 37-44)
      R1 * 6 |
      r1\fermata \bar "|."
    }
  >>
}

% =======================================================================
% SCORE DEFINITIONS
% =======================================================================
\score {
  <<
    \new StaffGroup = "Winds" <<
      \new Staff \with { instrumentName = #"Flute" shortInstrumentName = #"Fl." } {
        \fluteConcert
      }
      \new Staff \with { instrumentName = #"B♭ Clarinet" shortInstrumentName = #"Cl." } {
        \transpose bes c' \clarinetConcert
      }
    >>

    \new StaffGroup = "Mixed Horn Medley" <<
      \new Staff \with { instrumentName = #"Horn in F" shortInstrumentName = #"Hn." } {
        \transpose f c' \hornConcert
      }
      \new Staff \with { instrumentName = #"Trombone" shortInstrumentName = #"Tbn." } {
        \tromboneConcert
      }
      \new Staff \with { instrumentName = #"B♭ Trumpet" shortInstrumentName = #"Tpt." } {
        \transpose bes c' \trumpetConcert
      }
    >>

    \new StaffGroup = "Rhythm" <<
      \new Staff \with { instrumentName = #"Bass" shortInstrumentName = #"Bs." } {
        \bassConcert
      }
      \new DrumStaff \with { instrumentName = #"Surdo & Samba Battery" shortInstrumentName = #"Perc." } {
        \percussionOne
      }
    >>
  >>
  \layout {
    \context {
      \Score
      \override BarNumber.break-visibility = ##(#f #t #t)
    }
  }
}

\score {
  <<
    \new Staff \with { midiInstrument = #"clarinet" } {
      \clarinetConcert
    }
    \new Staff \with { midiInstrument = #"french horn" } {
      \hornConcert
    }
    \new Staff \with { midiInstrument = #"trombone" } {
      \tromboneConcert
    }
    \new Staff \with { midiInstrument = #"trumpet" } {
      \trumpetConcert
    }
    \new Staff \with { midiInstrument = #"flute" } {
      \fluteConcert
    }
    \new Staff \with { midiInstrument = #"acoustic bass" } {
      \bassConcert
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      \percussionOne
    }
  >>
  \midi { }
}
