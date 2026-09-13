\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/moonlight_samba_global.ily"
\include "../Notes/moonlight_samba_percussion2.ily"

#(set-global-staff-size 18)

\header {
  title = "Moonlight Samba"
  subtitle = "Arranged for Concert Band & Latin Percussion"
  composer = "Ludwig van Beethoven"
  instrument = "Percussion 2 (Crash & Suspended Cymbals)"
  tagline = "Moonlight Samba — Percussion 2 — Wisconsin Rapids City Band"
}

\score {
  \new DrumStaff \with {
    instrumentName = #"Percussion 2"
    shortInstrumentName = #"Perc. 2"
  } {
    \compressMMRests <<
      \moonlightSambaGlobal
      \percussionTwoNotes
    >>
  }
  \layout { }
}
