\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/sovereign_forge_global.ily"
\include "../Notes/sovereign_forge_horn.ily"

#(set-global-staff-size 18)

\header {
  title = "The Sovereign Forge"
  subtitle = "An Autobiographical Tone Poem for Concert Band"
  composer = "John Daniel Dondlinger"
  instrument = "French Horn in F"
  tagline = "The Sovereign Forge — French Horn in F — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"Horn in F"
    shortInstrumentName = #"Hn."
  } {
    \compressMMRests <<
      \transpose f c' \sovereignForgeGlobal
      \transpose f c' \hornNotes
    >>
  }
  \layout { }
}
