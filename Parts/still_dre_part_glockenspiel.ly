\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/still_dre_global.ily"
\include "../Notes/still_dre_glockenspiel.ily"

#(set-global-staff-size 18)

\header {
  title = "Still D.R.E."
  subtitle = "Concert Band Edition"
  composer = "Dr. Dre, Mel-Man & Scott Storch"
  arranger = "Arr. John Daniel Dondlinger"
  instrument = "Glockenspiel"
  tagline = "Still D.R.E. — Glockenspiel — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"Glockenspiel"
    shortInstrumentName = #"Glock."
  } {
    \compressMMRests <<
      \stillDreGlobal
      \glockenspielNotes
    >>
  }
  \layout { }
}
