\version "2.24.0"
\include "articulate.ly"

\header {
  title = "The Buccaneer's Reel & Island Horizon"
  subtitle = "An Original Swashbuckling Caribbean Adventure for Concert Band & Percussion"
  composer = "John Daniel Dondlinger"
  arranger = "Concert Band & Caribbean Rhythm Section"
  tagline = "The Buccaneer's Reel — Composed by John Daniel Dondlinger (2026)"
}

#(set-global-staff-size 13.5)

\paper {
  #(set-paper-size "letter")
  top-margin = 0.5\in
  bottom-margin = 0.5\in
  left-margin = 0.5\in
  right-margin = 0.5\in
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  system-system-spacing.basic-distance = #11
  score-system-spacing.basic-distance = #11
}

global = {
  \key d \minor
  \time 6/8
  \tempo "Allegro Con Brio — Swashbuckler Groove" 4. = 112
}

% =======================================================================
% 1. FLUTE (Swashbuckling Whistle & Soaring Tropical Melody)
% =======================================================================
fluteConcert = \fixed c' {
  \global
  \clef treble

  % mm. 1-4: The Fog of Port Royal (Nautical Call)
  R2. |
  r4. r8 a'-.\p cis''-. |
  d''4.~ d''8 c'' bes' |
  a'4. cis''4. |

  % mm. 5-12: The Swashbuckler's Reel (Theme A - D minor)
  d''8\f f'' g'' a''4. |
  bes''4 a''8 g''4 e''8 |
  f''8 g'' f'' e''4 cis''8 |
  d''4.~ d''4 r8 |
  d''8 f'' g'' a''4. |
  d'''4 c'''8 bes''4 a''8 |
  g''8 a'' bes'' a''4 cis''8 |
  d''4.~ d''4 r8 |

  % mm. 13-20: Trade Winds & Caribbean Shores (Theme B - F Major Calypso Lift)
  f''8\mf g'' a'' c'''4. |
  bes''4 a''8 g''4 f''8 |
  g''8 a'' g'' f''4 d''8 |
  c''4.~ c''4 r8 |
  f''8 a'' c''' d'''4. |
  c'''4 bes''8 a''4 g''8 |
  f''8 g'' a'' g''4 e''8 |
  f''4.~ f''4 r8 |

  % mm. 21-28: Full Sail & Cannons (Tutti Finale & Picardy Third)
  d''8\ff f'' g'' a''4. |
  bes''4 a''8 g''4 e''8 |
  f''8 g'' f'' e''4 cis''8 |
  d''4.~ d''8 e'' f'' |
  g''8 a'' bes'' a''4 cis''8 |
  d'''4. c'''8 bes'' a'' |
  g''8 f'' e'' cis''4. |
  <d' fis' d''>2.\fff \bar "|."
}

% =======================================================================
% 2. B♭ CLARINET (Concert Pitch Definition, Transposed to Written E minor)
% =======================================================================
clarinetConcert = \fixed c' {
  \global
  \clef treble

  % mm. 1-4: Atmospheric Ocean Winds
  R2. |
  R2. |
  R2. |
  r4. cis'4.\p |

  % mm. 5-12: Reel Harmony
  d'8\f f' g' a'4. |
  bes'4 a'8 g'4 e'8 |
  f'8 g' f' e'4 cis'8 |
  d'4.~ d'4 r8 |
  d'8 f' g' a'4. |
  d''4 c''8 bes'4 a'8 |
  g'8 a' bes' a'4 cis'8 |
  d'4.~ d'4 r8 |

  % mm. 13-20: Calypso Counterline in F Major
  a'8\mf c'' d'' f''4. |
  d''4 c''8 bes'4 a'8 |
  bes'8 c'' bes' a'4 f'8 |
  e'4.~ e'4 r8 |
  c''8 f'' a'' bes''4. |
  a''4 g''8 f''4 e''8 |
  d''8 e'' f'' e''4 c''8 |
  f'4.~ f'4 r8 |

  % mm. 21-28: Tutti Charge
  d''8\ff f'' g'' a''4. |
  bes''4 a''8 g''4 e''8 |
  f''8 g'' f'' e''4 cis''8 |
  d''4.~ d''8 e'' f'' |
  g''8 a'' bes'' a''4 cis''8 |
  d''4. c''8 bes' a' |
  g''8 f'' e'' cis''4. |
  <d' fis' d''>2.\fff \bar "|."
}

% =======================================================================
% 3. B♭ TRUMPET (Heroic Nautical Fanfare)
% =======================================================================
trumpetConcert = \fixed c' {
  \global
  \clef treble

  % mm. 1-4: Tacet during intro
  R2. * 4 |

  % mm. 5-12: Swashbuckling Fanfare Punches
  R2. * 4 |
  d'8\f f' g' a'4. |
  d''4 c''8 bes'4 a'8 |
  g'8 a' bes' a'4 cis'8 |
  d'4.~ d'4 r8 |

  % mm. 13-20: Tropical Horn Counterpart
  R2. * 4 |
  f'8\mf a' c'' d''4. |
  c''4 bes'8 a'4 g'8 |
  f'8 g' a' g'4 e'8 |
  f'4.~ f'4 r8 |

  % mm. 21-28: High Seas Victory Tutti
  d''8\ff f'' g'' a''4. |
  bes'4 a'8 g'4 e'8 |
  f'8 g' f' e'4 cis'8 |
  d'4.~ d'8 e' f' |
  g'8 a' bes' a'4 cis'8 |
  d''4. c''8 bes' a' |
  g'8 f' e' cis'4. |
  <d' fis' a'>2.\fff \bar "|."
}

% =======================================================================
% 4. FRENCH HORN IN F (Maritime Resonances & Rich Harmonic Swell)
% =======================================================================
hornConcert = \fixed c' {
  \global
  \clef treble

  % mm. 1-4: Tacet
  R2. * 4 |

  % mm. 5-12: Warm Mid-Range Brass Harmony
  f'4.\f e'4. |
  d'4. cis'4. |
  d'4. cis'4. |
  d'4.~ d'4 r8 |
  f'4. e'4. |
  f'4. d'4. |
  ees'4. e'4. |
  d'4.~ d'4 r8 |

  % mm. 13-20: Warm Calypso Chords
  c'4.\mf d'4. |
  d'4. bes4. |
  c'4. bes4. |
  a4.~ a4 r8 |
  f'4. g'4. |
  e'4. c'4. |
  d'4. bes4. |
  a4.~ a4 r8 |

  % mm. 21-28: Power Brass Horizon
  d'8\ff f' g' a'4. |
  bes4 a8 g4 e8 |
  f4 g8 f4 e8 |
  d4.~ d8 e f |
  g8 a bes a4 cis8 |
  d'4. c'8 bes a |
  g8 f e cis4. |
  <d' fis' a'>2.\fff \bar "|."
}

% =======================================================================
% 5. TROMBONE (Sea-Dog Stomp Bass & Driving Nautical Power)
% =======================================================================
tromboneConcert = \fixed c {
  \global
  \clef bass

  % mm. 1-4: Nautical Drone Pulse
  d4.\p a, |
  d4. a, |
  g,4. d |
  a,4. a,, |

  % mm. 5-12: The Heavy Stomp
  d4.\f a, |
  g,4. a, |
  bes,4. a, |
  d4.~ d4 r8 |
  d4. a, |
  bes4. fis |
  g4. a |
  d4.~ d4 r8 |

  % mm. 13-20: Caribbean Bass Bounce
  f4.\mf c |
  bes4. g |
  c'4. c |
  f4.~ f4 r8 |
  f4. bes, |
  c'4. e |
  bes4. c |
  f4.~ f4 r8 |

  % mm. 21-28: Galloping Sea Shanty Tutti
  d4.\ff a, |
  g4. a |
  bes4. a |
  d4.~ d8 e f |
  g4. a, |
  d4. c8 bes, a, |
  a4. a, |
  d2.\fff \bar "|."
}

% =======================================================================
% 6. MARIMBA / CARIBBEAN STEEL MALLETS (Island Rhythm & Syncopation)
% =======================================================================
marimbaConcert = \fixed c' {
  \global
  \clef treble

  % mm. 1-4: Atmospheric Tropical Droplets
  r8 <d' f'>-.\p <d' f'>-. r <d' f'>-. <d' f'>-. |
  r8 <d' f'>-. <d' f'>-. r <d' f'>-. <d' f'>-. |
  r8 <g bes d'>-. <g bes d'>-. r <g bes d'>-. <g bes d'>-. |
  r8 <a cis' e'>-. <a cis' e'>-. <a cis' e'>4. |

  % mm. 5-12: Calypso Reel Ostinato
  <d' f'>8-.\f a <d' f'>-. <d' f'>8-. a <d' f'>-. |
  <bes d'>8-. g <bes d'>-. <cis' e'>8-. a <cis' e'>-. |
  <d' f'>8-. a <d' f'>-. <a cis' e'>4. |
  <d' f' a'>4.~ <d' f' a'>4 r8 |
  <d' f'>8-. a <d' f'>-. <d' f'>8-. a <d' f'>-. |
  <bes d'>8-. g <bes d'>-. <d' fis'>8-. a <d' fis'>-. |
  <g bes d'>8-. g <g bes d'>-. <a cis' e'>4. |
  <d' f' a'>4.~ <d' f' a'>4 r8 |

  % mm. 13-20: Sunny Caribbean Calypso Bounce (F Major)
  <f' a' c''>8-.\mf c' <f' a' c''>-. <f' a' c''>8-. c' <f' a' c''>-. |
  <d' f' bes'>8-. bes <d' f' bes'>-. <bes d' g'>8-. g <bes d' g'>-. |
  <c' e' g'>8-. c' <c' e' g'>-. <d' f'>8-. d' <d' f'>-. |
  <c' e' g'>4.~ <c' e' g'>4 r8 |
  <f' a' c''>8-. c' <f' a' c''>-. <f' bes' d''>8-. d' <f' bes' d''>-. |
  <e' g' c''>8-. c' <e' g' c''>-. <c' e' a'>8-. a <c' e' a'>-. |
  <d' f' bes'>8-. bes <d' f' bes'>-. <c' e' g'>4. |
  <c' f' a'>4.~ <c' f' a'>4 r8 |

  % mm. 21-28: Tutti Rhythmic Climax
  <d' f' a'>8-.\ff <d' f' a'>-. <d' f' a'>-. <d' f' a'>4. |
  <bes d' g'>4. <cis' e' a'> |
  <d' f' a'>4. <cis' e' a'> |
  <d' f' a'>4.~ <d' f' a'>4. |
  <g bes d'>4. <a cis' e'> |
  <d' f' d''>4. <c' e' c''>8 <bes d' bes'> <a cis' a'> |
  <g' bes' d''>4. <a' cis'' e''> |
  <d' fis' a' d''>2.\fff \bar "|."
}

% =======================================================================
% 7. DRUM SET & PERCUSSION (Bodhrán Stomp, Hi-Hat Shaker & Calypso Beats)
% =======================================================================
drumKit = \drummode {
  % mm. 1-4: Subtle Nautical Shaker Pulse
  hh8\p hh hh hh hh hh |
  hh8 hh hh hh hh hh |
  bd4.\p sn4. |
  bd4. sn8. sn16 sn8 |

  % mm. 5-12: Driving Swashbuckler 6/8 Beat
  cymc4.\f sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn8. sn16 sn8 |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn8. sn16 sn8 |

  % mm. 13-20: Caribbean Calypso Cross-Stick & Shaker Groove
  hh8\mf hh hh hh hh hh |
  bd4.\mf sn4. |
  bd4. sn4. |
  bd4. sn8. sn16 sn8 |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn8. sn16 sn8 |

  % mm. 21-28: Thunderous High-Seas Gallop Tutti
  cymc4.\ff sn4. |
  bd4. sn4. |
  bd4. sn4. |
  bd4. sn8. sn16 sn8 |
  bd4. sn4. |
  bd4. sn4. |
  sn8 sn sn sn8. sn16 sn8 |
  cymc2.\fff \bar "|."
}

% =======================================================================
% 8. VISUAL ENGRAVED SCORE
% =======================================================================
\score {
  <<
    \new StaffGroup = "Woodwinds" <<
      \new Staff \with { instrumentName = #"Flute" shortInstrumentName = #"Fl." } {
        \fluteConcert
      }
      \new Staff \with { instrumentName = #"B♭ Clarinet" shortInstrumentName = #"Cl." } {
        \transpose bes c' \clarinetConcert
      }
    >>

    \new StaffGroup = "Brass" <<
      \new Staff \with { instrumentName = #"B♭ Trumpet" shortInstrumentName = #"Tpt." } {
        \transpose bes c' \trumpetConcert
      }
      \new Staff \with { instrumentName = #"Horn in F" shortInstrumentName = #"Hn." } {
        \transpose f c' \hornConcert
      }
      \new Staff \with { instrumentName = #"Trombone" shortInstrumentName = #"Tbn." } {
        \tromboneConcert
      }
    >>

    \new StaffGroup = "Percussion" <<
      \new Staff \with { instrumentName = #"Marimba" shortInstrumentName = #"Mba." } {
        \marimbaConcert
      }
      \new DrumStaff \with { instrumentName = #"Drum Set" shortInstrumentName = #"Drums" } {
        \drumKit
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

% =======================================================================
% 9. AUDIO SYNTHESIS SCORE (Expressive Concert Band & Percussion Playback)
% =======================================================================
\score {
  \unfoldRepeats \articulate <<
    \new Staff \with { midiInstrument = #"flute" } {
      \fluteConcert
    }
    \new Staff \with { midiInstrument = #"clarinet" } {
      \clarinetConcert
    }
    \new Staff \with { midiInstrument = #"trumpet" } {
      \trumpetConcert
    }
    \new Staff \with { midiInstrument = #"french horn" } {
      \hornConcert
    }
    \new Staff \with { midiInstrument = #"trombone" } {
      \tromboneConcert
    }
    \new Staff \with { midiInstrument = #"marimba" } {
      \marimbaConcert
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      \drumKit
    }
  >>
  \midi { }
}
