\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/moonlight_samba_global.ily"
\include "../Notes/moonlight_samba_oboe.ily"

#(set-global-staff-size 18)

\header {
  title = "Moonlight Samba"
  subtitle = "Arranged for Concert Band & Latin Percussion"
  composer = "Ludwig van Beethoven"
  instrument = "Oboe"
  tagline = "Moonlight Samba — Oboe — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"Oboe"
    shortInstrumentName = #"Ob."
  } {
    \compressMMRests <<
      \moonlightSambaGlobal
      \oboeNotes
    >>
  }
  \layout { }
}
