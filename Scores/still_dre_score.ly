\version "2.24.0"
\include "articulate.ly"

\include "../Global/global_settings.ily"
\include "../Global/still_dre_global.ily"

% Woodwinds
\include "../Notes/still_dre_flute.ily"
\include "../Notes/still_dre_oboe.ily"
\include "../Notes/still_dre_clarinet.ily"
\include "../Notes/still_dre_altosax.ily"

% Brass
\include "../Notes/still_dre_trumpet.ily"
\include "../Notes/still_dre_horn.ily"
\include "../Notes/still_dre_trombone.ily"
\include "../Notes/still_dre_tuba.ily"

% Rhythm (Electric Bass)
\include "../Notes/still_dre_bass.ily"

% Pitched Percussion
\include "../Notes/still_dre_glockenspiel.ily"
\include "../Notes/still_dre_marimba.ily"

% Battery Percussion
\include "../Notes/still_dre_percussion1.ily"
\include "../Notes/still_dre_percussion2.ily"
\include "../Notes/still_dre_timpani.ily"

#(set-global-staff-size 11)

\stillDreHeader

% ============================================================================
% 1. VISUAL ENGRAVED CONDUCTOR SCORE (Authentic Concert Band Layout)
% ============================================================================
\score {
  <<
    \new StaffGroup = "Woodwinds" <<
      \new Staff \with { instrumentName = #"Flute" shortInstrumentName = #"Fl." } {
        << \stillDreGlobal \fluteNotes >>
      }
      \new Staff \with { instrumentName = #"Oboe" shortInstrumentName = #"Ob." } {
        << \stillDreGlobal \oboeNotes >>
      }
      \new Staff \with { instrumentName = #"B♭ Clarinet" shortInstrumentName = #"Cl." } {
        << \stillDreGlobal \transpose bes c' \clarinetNotes >>
      }
      \new Staff \with { instrumentName = #"Alto Saxophone" shortInstrumentName = #"A.Sax" } {
        << \stillDreGlobal \transpose ees c' \altoSaxNotes >>
      }
    >>

    \new StaffGroup = "Brass" <<
      \new Staff \with { instrumentName = #"B♭ Trumpet" shortInstrumentName = #"Tpt." } {
        << \stillDreGlobal \transpose bes c' \trumpetNotes >>
      }
      \new Staff \with { instrumentName = #"Horn in F" shortInstrumentName = #"Hn." } {
        << \stillDreGlobal \transpose f c' \hornNotes >>
      }
      \new Staff \with { instrumentName = #"Trombone" shortInstrumentName = #"Tbn." } {
        << \stillDreGlobal \tromboneNotes >>
      }
      \new Staff \with { instrumentName = #"Tuba" shortInstrumentName = #"Tba." } {
        << \stillDreGlobal \tubaNotes >>
      }
    >>

    \new StaffGroup = "Rhythm" <<
      \new Staff \with { instrumentName = #"Electric Bass" shortInstrumentName = #"E.Bs." } {
        << \stillDreGlobal \bassNotes >>
      }
    >>

    \new StaffGroup = "PitchedPercussion" <<
      \new Staff \with { instrumentName = #"Glockenspiel" shortInstrumentName = #"Glock." } {
        << \stillDreGlobal \glockenspielNotes >>
      }
      \new Staff \with { instrumentName = #"Marimba" shortInstrumentName = #"Mba." } {
        << \stillDreGlobal \marimbaNotes >>
      }
    >>

    \new StaffGroup = "BatteryPercussion" <<
      \new DrumStaff \with { instrumentName = #"Percussion 1 (SD/BD)" shortInstrumentName = #"Perc. 1" } {
        << \stillDreGlobal \percussionOneNotes >>
      }
      \new DrumStaff \with { instrumentName = #"Percussion 2 (HH/Cym)" shortInstrumentName = #"Perc. 2" } {
        << \stillDreGlobal \percussionTwoNotes >>
      }
      \new Staff \with { instrumentName = #"Timpani" shortInstrumentName = #"Timp." } {
        << \stillDreGlobal \timpaniNotes >>
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
% 2. AUDIO SYNTHESIS SCORE (Pure Concert Pitch & GM Mapping with Named Staves)
% ============================================================================
\score {
  \unfoldRepeats \articulate <<
    \new Staff = "Flute" \with { midiInstrument = #"flute" } {
      << \stillDreGlobal \fluteNotes >>
    }
    \new Staff = "Oboe" \with { midiInstrument = #"oboe" } {
      << \stillDreGlobal \oboeNotes >>
    }
    \new Staff = "Clarinet" \with { midiInstrument = #"clarinet" } {
      << \stillDreGlobal \clarinetNotes >>
    }
    \new Staff = "AltoSax" \with { midiInstrument = #"alto sax" } {
      << \stillDreGlobal \altoSaxNotes >>
    }
    \new Staff = "Trumpet" \with { midiInstrument = #"trumpet" } {
      << \stillDreGlobal \trumpetNotes >>
    }
    \new Staff = "FrenchHorn" \with { midiInstrument = #"french horn" } {
      << \stillDreGlobal \hornNotes >>
    }
    \new Staff = "Trombone" \with { midiInstrument = #"trombone" } {
      << \stillDreGlobal \tromboneNotes >>
    }
    \new Staff = "Tuba" \with { midiInstrument = #"tuba" } {
      << \stillDreGlobal \tubaNotes >>
    }
    \new Staff = "ElectricBass" \with { midiInstrument = #"electric bass (finger)" } {
      << \stillDreGlobal \bassNotes >>
    }
    \new Staff = "Glockenspiel" \with { midiInstrument = #"glockenspiel" } {
      << \stillDreGlobal \glockenspielNotes >>
    }
    \new Staff = "Marimba" \with { midiInstrument = #"marimba" } {
      << \stillDreGlobal \marimbaNotes >>
    }
    \new DrumStaff = "Percussion1" \with {
      midiInstrument = #"standard kit"
      midiChannel = #9
    } {
      << \stillDreGlobal \percussionOneNotes >>
    }
    \new DrumStaff = "Percussion2" \with {
      midiInstrument = #"standard kit"
      midiChannel = #10
    } {
      << \stillDreGlobal \percussionTwoNotes >>
    }
    \new Staff = "Timpani" \with {
      midiInstrument = #"timpani"
      midiChannel = #11
    } {
      << \stillDreGlobal \timpaniNotes >>
    }
  >>
  \midi { }
}
