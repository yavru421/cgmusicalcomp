\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/still_dre_global.ily"
\include "../Notes/still_dre_marimba.ily"

#(set-global-staff-size 18)

\header {
  title = "Still D.R.E."
  subtitle = "Concert Band Edition"
  composer = "Dr. Dre, Mel-Man & Scott Storch"
  arranger = "Arr. John Daniel Dondlinger"
  instrument = "Marimba"
  tagline = "Still D.R.E. — Marimba — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"Marimba"
    shortInstrumentName = #"Mba."
  } {
    \compressMMRests <<
      \stillDreGlobal
      \marimbaNotes
    >>
  }
  \layout { }
}
