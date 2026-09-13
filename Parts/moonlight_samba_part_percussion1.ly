\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/moonlight_samba_global.ily"
\include "../Notes/moonlight_samba_percussion1.ily"

#(set-global-staff-size 18)

\header {
  title = "Moonlight Samba"
  subtitle = "Arranged for Concert Band & Latin Percussion"
  composer = "Ludwig van Beethoven"
  instrument = "Percussion 1 (Concert Snare & Bass Drum)"
  tagline = "Moonlight Samba — Percussion 1 — Wisconsin Rapids City Band"
}

\score {
  \new DrumStaff \with {
    instrumentName = #"Percussion 1"
    shortInstrumentName = #"Perc. 1"
  } {
    \compressMMRests <<
      \moonlightSambaGlobal
      \percussionOneNotes
    >>
  }
  \layout { }
}
