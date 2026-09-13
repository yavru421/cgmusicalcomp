\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/still_dre_global.ily"
\include "../Notes/still_dre_oboe.ily"

#(set-global-staff-size 18)

\header {
  title = "Still D.R.E."
  subtitle = "Concert Band Edition"
  composer = "Dr. Dre, Mel-Man & Scott Storch"
  arranger = "Arr. John Daniel Dondlinger"
  instrument = "Oboe"
  tagline = "Still D.R.E. — Oboe — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"Oboe"
    shortInstrumentName = #"Ob."
  } {
    \compressMMRests <<
      \stillDreGlobal
      \oboeNotes
    >>
  }
  \layout { }
}
