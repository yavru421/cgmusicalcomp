\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/sovereign_forge_global.ily"
\include "../Notes/sovereign_forge_percussion1.ily"

#(set-global-staff-size 18)

\header {
  title = "The Sovereign Forge"
  subtitle = "An Autobiographical Tone Poem for Concert Band"
  composer = "John Daniel Dondlinger"
  instrument = "Percussion 1 (Snare & Bass Drum)"
  tagline = "The Sovereign Forge — Percussion 1 — Wisconsin Rapids City Band"
}

\score {
  \new DrumStaff \with {
    instrumentName = #"Percussion 1"
    shortInstrumentName = #"Perc. 1"
  } {
    \compressMMRests <<
      \sovereignForgeGlobal
      \percussionOneNotes
    >>
  }
  \layout { }
}
