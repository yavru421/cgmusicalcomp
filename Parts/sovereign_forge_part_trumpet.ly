\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/sovereign_forge_global.ily"
\include "../Notes/sovereign_forge_trumpet.ily"

#(set-global-staff-size 18)

\header {
  title = "The Sovereign Forge"
  subtitle = "An Autobiographical Tone Poem for Concert Band"
  composer = "John Daniel Dondlinger"
  instrument = "B♭ Trumpet"
  tagline = "The Sovereign Forge — B♭ Trumpet — Wisconsin Rapids City Band"
}

\score {
  \new Staff \with {
    instrumentName = #"B♭ Trumpet"
    shortInstrumentName = #"Tpt."
  } {
    \compressMMRests <<
      \transpose bes c' \sovereignForgeGlobal
      \transpose bes c' \trumpetNotes
    >>
  }
  \layout { }
}
