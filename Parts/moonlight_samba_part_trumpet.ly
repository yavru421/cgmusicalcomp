\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/moonlight_samba_global.ily"
\include "../Notes/moonlight_samba_trumpet.ily"

#(set-global-staff-size 18)

\header {
  title = "Moonlight Samba"
  subtitle = "Arranged for Concert Band & Latin Percussion"
  composer = "Ludwig van Beethoven"
  instrument = "B♭ Trumpet"
  tagline = "Moonlight Samba — B♭ Trumpet — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"B♭ Trumpet"
    shortInstrumentName = #"Tpt."
  } {
    \compressMMRests <<
      \transpose bes c' \moonlightSambaGlobal
      \transpose bes c' \trumpetNotes
    >>
  }
  \layout { }
}
