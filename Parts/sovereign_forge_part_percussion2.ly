\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/sovereign_forge_global.ily"
\include "../Notes/sovereign_forge_percussion2.ily"

#(set-global-staff-size 18)

\header {
  title = "The Sovereign Forge"
  subtitle = "An Autobiographical Tone Poem for Concert Band"
  composer = "John Daniel Dondlinger"
  instrument = "Percussion 2 (Crash & Suspended Cymbals)"
  tagline = "The Sovereign Forge — Percussion 2 — Wisconsin Rapids City Band"
}

\score {
  \new DrumStaff \with {
    instrumentName = #"Percussion 2"
    shortInstrumentName = #"Perc. 2"
  } {
    \compressMMRests <<
      \sovereignForgeGlobal
      \percussionTwoNotes
    >>
  }
  \layout { }
}
