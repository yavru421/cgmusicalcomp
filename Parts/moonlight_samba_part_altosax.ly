\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/moonlight_samba_global.ily"
\include "../Notes/moonlight_samba_altosax.ily"

#(set-global-staff-size 18)

\header {
  title = "Moonlight Samba"
  subtitle = "Arranged for Concert Band & Latin Percussion"
  composer = "Ludwig van Beethoven"
  instrument = "Alto Saxophone"
  tagline = "Moonlight Samba — Alto Saxophone — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"Alto Saxophone"
    shortInstrumentName = #"A.Sax"
  } {
    \compressMMRests <<
      \moonlightSambaGlobal
      \transpose ees c' \altoSaxNotes
    >>
  }
  \layout { }
}
