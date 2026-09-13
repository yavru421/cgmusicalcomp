\version "2.24.0"

\include "../Global/global_settings.ily"
\include "../Global/moonlight_samba_global.ily"
\include "../Notes/moonlight_samba_percussion3.ily"

#(set-global-staff-size 18)

\header {
  title = "Moonlight Samba"
  subtitle = "Arranged for Concert Band & Latin Percussion"
  composer = "Ludwig van Beethoven"
  instrument = "Percussion 3 (Auxiliary Latin: Cowbell & Shaker)"
  tagline = "Moonlight Samba — Percussion 3 — Wisconsin Rapids City Band"
}

\score {
  \new DrumStaff \with {
    instrumentName = #"Percussion 3"
    shortInstrumentName = #"Perc. 3"
  } {
    \compressMMRests <<
      \moonlightSambaGlobal
      \percussionThreeNotes
    >>
  }
  \layout { }
}
