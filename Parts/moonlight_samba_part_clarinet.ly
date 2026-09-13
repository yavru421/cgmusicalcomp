\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/moonlight_samba_global.ily"
\include "../Notes/moonlight_samba_clarinet.ily"

#(set-global-staff-size 18)

\header {
  title = "Moonlight Samba"
  subtitle = "Arranged for Concert Band & Latin Percussion"
  composer = "Ludwig van Beethoven"
  instrument = "B♭ Clarinet"
  tagline = "Moonlight Samba — B♭ Clarinet — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"B♭ Clarinet"
    shortInstrumentName = #"Cl."
  } {
    \compressMMRests <<
      \transpose bes c' \moonlightSambaGlobal
      \transpose bes c' \clarinetNotes
    >>
  }
  \layout { }
}
