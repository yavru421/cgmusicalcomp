\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/sovereign_forge_global.ily"
\include "../Notes/sovereign_forge_flute.ily"

#(set-global-staff-size 18)

\header {
  title = "The Sovereign Forge"
  subtitle = "An Autobiographical Tone Poem for Concert Band"
  composer = "John Daniel Dondlinger"
  instrument = "Flute"
  tagline = "The Sovereign Forge — Flute — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"Flute"
    shortInstrumentName = #"Fl."
  } {
    \compressMMRests <<
      \sovereignForgeGlobal
      \fluteNotes
    >>
  }
  \layout { }
}
