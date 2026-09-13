\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/still_dre_global.ily"
\include "../Notes/still_dre_horn.ily"

#(set-global-staff-size 18)

\header {
  title = "Still D.R.E."
  subtitle = "Concert Band Edition"
  composer = "Dr. Dre, Mel-Man & Scott Storch"
  arranger = "Arr. John Daniel Dondlinger"
  instrument = "Horn in F"
  tagline = "Still D.R.E. — Horn in F — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"Horn in F"
    shortInstrumentName = #"Hn."
  } {
    \compressMMRests <<
      \stillDreGlobal
      \transpose f c' \hornNotes
    >>
  }
  \layout { }
}
