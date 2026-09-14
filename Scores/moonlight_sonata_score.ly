\version "2.24.0"

\include "../Global/conductor_geometry.ily"
\include "../Global/moonlight_sonata_global.ily"

% Woodwinds
\include "../Notes/moonlight_sonata_flute.ily"
\include "../Notes/moonlight_sonata_oboe.ily"
\include "../Notes/moonlight_sonata_clarinet.ily"
\include "../Notes/moonlight_sonata_altosax.ily"
\include "../Notes/moonlight_sonata_tenorsax.ily"

% Brass
\include "../Notes/moonlight_sonata_trumpet.ily"
\include "../Notes/moonlight_sonata_horn.ily"
\include "../Notes/moonlight_sonata_trombone.ily"
\include "../Notes/moonlight_sonata_euphonium.ily"
\include "../Notes/moonlight_sonata_tuba.ily"

% Rhythm & Bass
\include "../Notes/moonlight_sonata_bass.ily"

% Pitched Percussion
\include "../Notes/moonlight_sonata_glockenspiel.ily"
\include "../Notes/moonlight_sonata_marimba.ily"

% Battery & Auxiliary Percussion
\include "../Notes/moonlight_sonata_timpani.ily"
\include "../Notes/moonlight_sonata_percussion.ily"

\moonlightSonataHeader

% ============================================================================
% 1. VISUAL ENGRAVED CONDUCTOR SCORE
% 15-Voice Concert Band Instrumentation (Authentic Adagio Sostenuto)
% ============================================================================
\score {
  <<
    \new StaffGroup = "Woodwinds" <<
      \new Staff \with { instrumentName = #"Flute" shortInstrumentName = #"Fl." } {
        << \moonlightSonataGlobal \fluteNotes >>
      }
      \new Staff \with { instrumentName = #"Oboe" shortInstrumentName = #"Ob." } {
        << \moonlightSonataGlobal \oboeNotes >>
      }
      \new Staff \with { instrumentName = #"B♭ Clarinet" shortInstrumentName = #"Cl." } {
        << \moonlightSonataGlobal \transpose bes c' \clarinetNotes >>
      }
      \new Staff \with { instrumentName = #"Alto Saxophone" shortInstrumentName = #"A.Sax" } {
        << \moonlightSonataGlobal \transpose ees c' \altoSaxNotes >>
      }
      \new Staff \with { instrumentName = #"Tenor Saxophone" shortInstrumentName = #"T.Sax" } {
        << \moonlightSonataGlobal \transpose bes c \tenorSaxNotes >>
      }
    >>

    \new StaffGroup = "Brass" <<
      \new Staff \with { instrumentName = #"B♭ Trumpet" shortInstrumentName = #"Tpt." } {
        << \moonlightSonataGlobal \transpose bes c' \trumpetNotes >>
      }
      \new Staff \with { instrumentName = #"Horn in F" shortInstrumentName = #"Hn." } {
        << \moonlightSonataGlobal \transpose f c' \hornNotes >>
      }
      \new Staff \with { instrumentName = #"Trombone" shortInstrumentName = #"Tbn." } {
        << \moonlightSonataGlobal \tromboneNotes >>
      }
      \new Staff \with { instrumentName = #"Euphonium" shortInstrumentName = #"Euph." } {
        << \moonlightSonataGlobal \euphoniumNotes >>
      }
      \new Staff \with { instrumentName = #"Tuba" shortInstrumentName = #"Tba." } {
        << \moonlightSonataGlobal \tubaNotes >>
      }
    >>

    \new StaffGroup = "Rhythm" <<
      \new Staff \with { instrumentName = #"Acoustic / Electric Bass" shortInstrumentName = #"Bs." } {
        << \moonlightSonataGlobal \bassNotes >>
      }
    >>

    \new StaffGroup = "PitchedPercussion" <<
      \new Staff \with { instrumentName = #"Glockenspiel" shortInstrumentName = #"Glock." } {
        << \moonlightSonataGlobal \glockenspielNotes >>
      }
      \new Staff \with { instrumentName = #"Marimba" shortInstrumentName = #"Mba." } {
        << \moonlightSonataGlobal \marimbaNotes >>
      }
    >>

    \new StaffGroup = "BatteryPercussion" <<
      \new Staff \with { instrumentName = #"Timpani" shortInstrumentName = #"Timp." } {
        << \moonlightSonataGlobal \timpaniNotes >>
      }
      \new DrumStaff \with { instrumentName = #"Concert Percussion" shortInstrumentName = #"Perc." } {
        << \moonlightSonataGlobal \percussionNotes >>
      }
    >>
  >>

  \layout {
    indent = 2.0\cm
    short-indent = 1.0\cm
    \context {
      \Score
      \override BarNumber.break-visibility = ##(#f #t #t)
      \override RehearsalMark.font-size = #2
    }
  }
}

% ============================================================================
% 2. MULTI-TRACK ACOUSTIC SIMULATION MIDI OUTPUT
% FluidSynth SoundFont Instrument Channel Routing
% ============================================================================
\score {
  <<
    \new Staff = "Flute" \with { midiInstrument = #"flute" } {
      << \moonlightSonataGlobal \fluteNotes >>
    }
    \new Staff = "Oboe" \with { midiInstrument = #"oboe" } {
      << \moonlightSonataGlobal \oboeNotes >>
    }
    \new Staff = "Clarinet" \with { midiInstrument = #"clarinet" } {
      << \moonlightSonataGlobal \clarinetNotes >>
    }
    \new Staff = "AltoSax" \with { midiInstrument = #"alto sax" } {
      << \moonlightSonataGlobal \altoSaxNotes >>
    }
    \new Staff = "TenorSax" \with { midiInstrument = #"tenor sax" } {
      << \moonlightSonataGlobal \tenorSaxNotes >>
    }
    \new Staff = "Trumpet" \with { midiInstrument = #"trumpet" } {
      << \moonlightSonataGlobal \trumpetNotes >>
    }
    \new Staff = "Horn" \with { midiInstrument = #"french horn" } {
      << \moonlightSonataGlobal \hornNotes >>
    }
    \new Staff = "Trombone" \with { midiInstrument = #"trombone" } {
      << \moonlightSonataGlobal \tromboneNotes >>
    }
    \new Staff = "Euphonium" \with { midiInstrument = #"baritone sax" } {
      << \moonlightSonataGlobal \euphoniumNotes >>
    }
    \new Staff = "Tuba" \with { midiInstrument = #"tuba" } {
      << \moonlightSonataGlobal \tubaNotes >>
    }
    \new Staff = "Bass" \with { midiInstrument = #"acoustic bass" } {
      << \moonlightSonataGlobal \bassNotes >>
    }
    \new Staff = "Glockenspiel" \with { midiInstrument = #"glockenspiel" } {
      << \moonlightSonataGlobal \glockenspielNotes >>
    }
    \new Staff = "Marimba" \with { midiInstrument = #"marimba" } {
      << \moonlightSonataGlobal \marimbaNotes >>
    }
    \new Staff = "Timpani" \with { midiInstrument = #"timpani" } {
      << \moonlightSonataGlobal \timpaniNotes >>
    }
    \new DrumStaff = "Percussion" \with { midiInstrument = #"standard kit" } {
      << \moonlightSonataGlobal \percussionNotes >>
    }
  >>

  \midi {
    \tempo 4 = 54
  }
}
