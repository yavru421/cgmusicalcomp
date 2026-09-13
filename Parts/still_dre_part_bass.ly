\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/still_dre_global.ily"
\include "../Notes/still_dre_bass.ily"

#(set-global-staff-size 18)

\header {
  title = "Still D.R.E."
  subtitle = "Concert Band Edition"
  composer = "Dr. Dre, Mel-Man & Scott Storch"
  arranger = "Arr. John Daniel Dondlinger"
  instrument = "Electric Bass"
  tagline = "Still D.R.E. — Electric Bass — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"Electric Bass"
    shortInstrumentName = #"E.Bs."
  } {
    \compressMMRests <<
      \stillDreGlobal
      \bassNotes
    >>
  }
  \layout { }
}
