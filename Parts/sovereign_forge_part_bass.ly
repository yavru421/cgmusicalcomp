\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/sovereign_forge_global.ily"
\include "../Notes/sovereign_forge_bass.ily"

#(set-global-staff-size 18)

\header {
  title = "The Sovereign Forge"
  subtitle = "An Autobiographical Tone Poem for Concert Band"
  composer = "John Daniel Dondlinger"
  instrument = "Tuba / Bass"
  tagline = "The Sovereign Forge — Tuba / Bass — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"Tuba / Bass"
    shortInstrumentName = #"Bs."
  } {
    \compressMMRests <<
      \sovereignForgeGlobal
      \bassNotes
    >>
  }
  \layout { }
}
