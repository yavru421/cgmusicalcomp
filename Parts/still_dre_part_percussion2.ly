\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/still_dre_global.ily"
\include "../Notes/still_dre_percussion2.ily"

#(set-global-staff-size 18)

\header {
  title = "Still D.R.E."
  subtitle = "Concert Band Edition"
  composer = "Dr. Dre, Mel-Man & Scott Storch"
  arranger = "Arr. John Daniel Dondlinger"
  instrument = "Percussion 2 (HH/Cym)"
  tagline = "Still D.R.E. — Percussion 2 (HH/Cym) — Wisconsin Rapids City Band"
}

\score {
  \new DrumStaff \with {
    instrumentName = #"Percussion 2 (HH/Cym)"
    shortInstrumentName = #"Perc. 2"
  } {
    \compressMMRests <<
      \stillDreGlobal
      \percussionTwoNotes
    >>
  }
  \layout { }
}
