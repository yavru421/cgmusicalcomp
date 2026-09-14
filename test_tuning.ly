\version "2.24.0"
\score {
  \new Staff \with { midiInstrument = #"glockenspiel" } {
    \transpose c c,, {
      \fixed c' {
        d'''4 c''' bes'' g''
      }
    }
  }
  \midi {}
}
