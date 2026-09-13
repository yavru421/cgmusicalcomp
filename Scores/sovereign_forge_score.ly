\version "2.24.0"
\include "articulate.ly"

\include "../Global/global_settings.ily"
\include "../Global/sovereign_forge_global.ily"

\include "../Notes/sovereign_forge_flute.ily"
\include "../Notes/sovereign_forge_clarinet.ily"
\include "../Notes/sovereign_forge_trumpet.ily"
\include "../Notes/sovereign_forge_horn.ily"
\include "../Notes/sovereign_forge_trombone.ily"
\include "../Notes/sovereign_forge_bass.ily"
\include "../Notes/sovereign_forge_percussion1.ily"
\include "../Notes/sovereign_forge_percussion2.ily"
\include "../Notes/sovereign_forge_timpani.ily"

#(set-global-staff-size 13)

\sovereignForgeHeader

% ============================================================================
% 1. VISUAL ENGRAVED CONDUCTOR SCORE (C Score with Musician Transpositions)
% ============================================================================
\score {
  <<
    \new StaffGroup = "Woodwinds" <<
      \new Staff \with { instrumentName = #"Flute" shortInstrumentName = #"Fl." } {
        << \sovereignForgeGlobal \fluteNotes >>
      }
      \new Staff \with { instrumentName = #"B♭ Clarinet" shortInstrumentName = #"Cl." } {
        << \sovereignForgeGlobal \transpose bes c' \clarinetNotes >>
      }
    >>

    \new StaffGroup = "Brass" <<
      \new Staff \with { instrumentName = #"B♭ Trumpet" shortInstrumentName = #"Tpt." } {
        << \sovereignForgeGlobal \transpose bes c' \trumpetNotes >>
      }
      \new Staff \with { instrumentName = #"Horn in F" shortInstrumentName = #"Hn." } {
        << \sovereignForgeGlobal \transpose f c' \hornNotes >>
      }
      \new Staff \with { instrumentName = #"Trombone" shortInstrumentName = #"Tbn." } {
        << \sovereignForgeGlobal \tromboneNotes >>
      }
    >>

    \new StaffGroup = "StringsBass" <<
      \new Staff \with { instrumentName = #"Tuba / Bass" shortInstrumentName = #"Bs." } {
        << \sovereignForgeGlobal \bassNotes >>
      }
    >>

    \new StaffGroup = "Percussion" <<
      \new DrumStaff \with { instrumentName = #"Percussion 1 (SD/BD)" shortInstrumentName = #"Perc. 1" } {
        << \sovereignForgeGlobal \percussionOneNotes >>
      }
      \new DrumStaff \with { instrumentName = #"Percussion 2 (Cymbals)" shortInstrumentName = #"Perc. 2" } {
        << \sovereignForgeGlobal \percussionTwoNotes >>
      }
      \new Staff \with { instrumentName = #"Timpani" shortInstrumentName = #"Timp." } {
        << \sovereignForgeGlobal \timpaniNotes >>
      }
    >>
  >>
  \layout {
    \context {
      \Score
      \override BarNumber.break-visibility = ##(#f #t #t)
    }
  }
}

% ============================================================================
% 2. AUDIO SYNTHESIS SCORE (Full Articulation & General MIDI Output)
% ============================================================================
\score {
  \unfoldRepeats \articulate <<
    \new Staff \with { midiInstrument = #"flute" } {
      << \sovereignForgeGlobal \fluteNotes >>
    }
    \new Staff \with { midiInstrument = #"clarinet" } {
      << \sovereignForgeGlobal \clarinetNotes >>
    }
    \new Staff \with { midiInstrument = #"trumpet" } {
      << \sovereignForgeGlobal \trumpetNotes >>
    }
    \new Staff \with { midiInstrument = #"french horn" } {
      << \sovereignForgeGlobal \hornNotes >>
    }
    \new Staff \with { midiInstrument = #"trombone" } {
      << \sovereignForgeGlobal \tromboneNotes >>
    }
    \new Staff \with { midiInstrument = #"tuba" } {
      << \sovereignForgeGlobal \bassNotes >>
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      << \sovereignForgeGlobal \percussionOneNotes >>
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      << \sovereignForgeGlobal \percussionTwoNotes >>
    }
    \new Staff \with { midiInstrument = #"timpani" } {
      << \sovereignForgeGlobal \timpaniNotes >>
    }
  >>
  \midi { }
}
