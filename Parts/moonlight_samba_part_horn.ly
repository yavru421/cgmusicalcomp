\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/moonlight_samba_global.ily"
\include "../Notes/moonlight_samba_horn.ily"

#(set-global-staff-size 18)

\header {
  title = "Moonlight Samba"
  subtitle = "Arranged for Concert Band & Latin Percussion"
  composer = "Ludwig van Beethoven"
  instrument = "French Horn in F"
  tagline = "Moonlight Samba — French Horn in F — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"Horn in F"
    shortInstrumentName = #"Hn."
  } {
    \compressMMRests <<
      \transpose f c' \moonlightSambaGlobal
      \transpose f c' \hornNotes
    >>
  }
  \layout { }
}
