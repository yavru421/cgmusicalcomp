\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/sovereign_forge_global.ily"
\include "../Notes/sovereign_forge_clarinet.ily"

#(set-global-staff-size 18)

\header {
  title = "The Sovereign Forge"
  subtitle = "An Autobiographical Tone Poem for Concert Band"
  composer = "John Daniel Dondlinger"
  instrument = "B♭ Clarinet"
  tagline = "The Sovereign Forge — B♭ Clarinet — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"B♭ Clarinet"
    shortInstrumentName = #"Cl."
  } {
    \compressMMRests <<
      \transpose bes c' \sovereignForgeGlobal
      \transpose bes c' \clarinetNotes
    >>
  }
  \layout { }
}
