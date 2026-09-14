\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/moonlight_sonata_global.ily"
\include "../Notes/moonlight_sonata_tuba.ily"

#(set-global-staff-size 18)

\header {
  title = "Moonlight Sonata"
  subtitle = "Sonata quasi una Fantasia, Op. 27, No. 2 — I. Adagio sostenuto"
  composer = "Ludwig van Beethoven"
  arranger = "Arr. John Daniel Dondlinger"
  instrument = "Tuba"
  tagline = "Moonlight Sonata — Tuba — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"Tuba"
    shortInstrumentName = #"Tba."
  } {
    \compressMMRests <<
      \moonlightSonataGlobal
      \tubaNotes
    >>
  }
  \layout { }
}
