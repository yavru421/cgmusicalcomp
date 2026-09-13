\version "2.24.0"
\include "articulate.ly"

\include "../Global/global_settings.ily"
\include "../Global/moonlight_samba_global.ily"

\include "../Notes/moonlight_samba_flute.ily"
\include "../Notes/moonlight_samba_clarinet.ily"
\include "../Notes/moonlight_samba_trumpet.ily"
\include "../Notes/moonlight_samba_horn.ily"
\include "../Notes/moonlight_samba_trombone.ily"
\include "../Notes/moonlight_samba_bass.ily"
\include "../Notes/moonlight_samba_percussion1.ily"
\include "../Notes/moonlight_samba_percussion2.ily"
\include "../Notes/moonlight_samba_percussion3.ily"
\include "../Notes/moonlight_samba_timpani.ily"

#(set-global-staff-size 13)

\moonlightSambaHeader

% ============================================================================
% 1. VISUAL ENGRAVED CONDUCTOR SCORE (Authentic C# minor with Transpositions)
% ============================================================================
\score {
  <<
    \new StaffGroup = "Winds" <<
      \new Staff \with { instrumentName = #"Flute" shortInstrumentName = #"Fl." } {
        << \moonlightSambaGlobal \fluteNotes >>
      }
      \new Staff \with { instrumentName = #"B♭ Clarinet" shortInstrumentName = #"Cl." } {
        << \moonlightSambaGlobal \transpose bes c' \clarinetNotes >>
      }
    >>

    \new StaffGroup = "Brass" <<
      \new Staff \with { instrumentName = #"B♭ Trumpet" shortInstrumentName = #"Tpt." } {
        << \moonlightSambaGlobal \transpose bes c' \trumpetNotes >>
      }
      \new Staff \with { instrumentName = #"Horn in F" shortInstrumentName = #"Hn." } {
        << \moonlightSambaGlobal \transpose f c' \hornNotes >>
      }
      \new Staff \with { instrumentName = #"Trombone" shortInstrumentName = #"Tbn." } {
        << \moonlightSambaGlobal \tromboneNotes >>
      }
    >>

    \new StaffGroup = "Rhythm" <<
      \new Staff \with { instrumentName = #"Bass" shortInstrumentName = #"Bs." } {
        << \moonlightSambaGlobal \bassNotes >>
      }
    >>

    \new StaffGroup = "Percussion" <<
      \new DrumStaff \with { instrumentName = #"Percussion 1 (SD/BD)" shortInstrumentName = #"Perc. 1" } {
        << \moonlightSambaGlobal \percussionOneNotes >>
      }
      \new DrumStaff \with { instrumentName = #"Percussion 2 (Cymbals)" shortInstrumentName = #"Perc. 2" } {
        << \moonlightSambaGlobal \percussionTwoNotes >>
      }
      \new DrumStaff \with { instrumentName = #"Percussion 3 (Aux Latin)" shortInstrumentName = #"Perc. 3" } {
        << \moonlightSambaGlobal \percussionThreeNotes >>
      }
      \new Staff \with { instrumentName = #"Timpani" shortInstrumentName = #"Timp." } {
        << \moonlightSambaGlobal \timpaniNotes >>
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
% 2. AUDIO SYNTHESIS SCORE (Pure Concert Pitch & GM Mapping)
% ============================================================================
\score {
  \unfoldRepeats \articulate <<
    \new Staff \with { midiInstrument = #"flute" } {
      << \moonlightSambaGlobal \fluteNotes >>
    }
    \new Staff \with { midiInstrument = #"clarinet" } {
      << \moonlightSambaGlobal \clarinetNotes >>
    }
    \new Staff \with { midiInstrument = #"trumpet" } {
      << \moonlightSambaGlobal \trumpetNotes >>
    }
    \new Staff \with { midiInstrument = #"french horn" } {
      << \moonlightSambaGlobal \hornNotes >>
    }
    \new Staff \with { midiInstrument = #"trombone" } {
      << \moonlightSambaGlobal \tromboneNotes >>
    }
    \new Staff \with { midiInstrument = #"electric bass (finger)" } {
      << \moonlightSambaGlobal \bassNotes >>
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      << \moonlightSambaGlobal \percussionOneNotes >>
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      << \moonlightSambaGlobal \percussionTwoNotes >>
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      << \moonlightSambaGlobal \percussionThreeNotes >>
    }
    \new Staff \with { midiInstrument = #"timpani" } {
      << \moonlightSambaGlobal \timpaniNotes >>
    }
  >>
  \midi { }
}
