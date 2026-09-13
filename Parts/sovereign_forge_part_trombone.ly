\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/sovereign_forge_global.ily"
\include "../Notes/sovereign_forge_trombone.ily"

#(set-global-staff-size 18)

\header {
  title = "The Sovereign Forge"
  subtitle = "An Autobiographical Tone Poem for Concert Band"
  composer = "John Daniel Dondlinger"
  instrument = "Trombone"
  tagline = "The Sovereign Forge — Trombone — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"Trombone"
    shortInstrumentName = #"Tbn."
  } {
    \compressMMRests <<
      \sovereignForgeGlobal
      \tromboneNotes
    >>
  }
  \layout { }
}
