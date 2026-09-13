\version "2.24.0"

\header {
  title = "Wisconsin Rapids City Band - B♭ Concert Scale"
  subtitle = "Full Concert Band Instrumentation & Correct MIDI Voicing"
  composer = "Local Pipeline Verification"
}

global = {
  \key bes \major
  \time 4/4
  \tempo "Moderato Maestoso" 4 = 108
}

% =======================================================================
% CONCERT PITCH DEFINITIONS (All instruments in pure sounding concert pitch)
% =======================================================================

% Woodwinds
fluteConcert = \relative c'' {
  \global
  bes4\f c d ees | f g a bes |
  bes a g f | ees d c bes |
  bes1\ff \bar "|."
}

clarinetConcert = \relative c' {
  \global
  bes4\f c d ees | f g a bes |
  bes a g f | ees d c bes |
  bes1\ff \bar "|."
}

altoSaxConcert = \relative c' {
  \global
  bes4\f c d ees | f g a bes |
  bes a g f | ees d c bes |
  bes1\ff \bar "|."
}

% Brass
trumpetConcert = \relative c' {
  \global
  bes4\f c d ees | f g a bes |
  bes a g f | ees d c bes |
  bes1\ff \bar "|."
}

hornConcert = \relative c' {
  \global
  bes4\f c d ees | f g a bes |
  bes a g f | ees d c bes |
  bes1\ff \bar "|."
}

tromboneConcert = \relative c {
  \global
  \clef bass
  bes4\f c d ees | f g a bes |
  bes a g f | ees d c bes |
  bes1\ff \bar "|."
}

tubaConcert = \relative c, {
  \global
  \clef bass
  bes4\f c d ees | f g a bes |
  bes a g f | ees d c bes |
  bes1\ff \bar "|."
}

% Pitched Percussion
glockConcert = \relative c''' {
  \global
  bes4\f c d ees | f g a bes |
  bes a g f | ees d c bes |
  bes1\ff \bar "|."
}

timpaniConcert = \relative c {
  \global
  \clef bass
  bes4\f r f r | bes r f r |
  bes r f r | f r f f |
  bes1:32\ff \bar "|."
}

% Unpitched Percussion
snareLine = \drummode {
  sn8\f sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn4 sn |
  sn8 sn16 sn sn8 sn sn8 sn sn sn |
  sn1:32\ff \bar "|."
}

bassDrumLine = \drummode {
  bd4\f r bd r | bd r bd r |
  bd4 r bd r | bd bd bd bd |
  bd1\ff \bar "|."
}

cymbalLine = \drummode {
  r4 cymc r cymc | r cymc r cymc |
  r4 cymc r cymc | r cymc cymc cymc |
  cymc1\ff \bar "|."
}

% =======================================================================
% 1. VISUAL ENGRAVED SCORE (Sheet Music with proper musician transpositions)
% =======================================================================
\score {
  <<
    \new StaffGroup = "Woodwinds" <<
      \new Staff \with { instrumentName = #"Flute" } {
        \fluteConcert
      }
      \new Staff \with { instrumentName = #"B♭ Clarinet" } {
        \transpose bes c' \clarinetConcert
      }
      \new Staff \with { instrumentName = #"E♭ Alto Sax" } {
        \transpose ees c' \altoSaxConcert
      }
    >>

    \new StaffGroup = "Brass" <<
      \new Staff \with { instrumentName = #"B♭ Trumpet" } {
        \transpose bes c' \trumpetConcert
      }
      \new Staff \with { instrumentName = #"Horn in F" } {
        \transpose f c' \hornConcert
      }
      \new Staff \with { instrumentName = #"Trombone" } {
        \tromboneConcert
      }
      \new Staff \with { instrumentName = #"Tuba" } {
        \tubaConcert
      }
    >>

    \new StaffGroup = "Percussion" <<
      \new Staff \with { instrumentName = #"Glockenspiel" } {
        \glockConcert
      }
      \new Staff \with { instrumentName = #"Timpani" } {
        \timpaniConcert
      }
      \new DrumStaff \with { instrumentName = #"Drums" } <<
        \new DrumVoice { \voiceOne \snareLine }
        \new DrumVoice { \voiceTwo \bassDrumLine }
      >>
      \new DrumStaff \with { instrumentName = #"Cymbals" } <<
        \cymbalLine
      >>
    >>
  >>
  \layout { }
}

% =======================================================================
% 2. AUDIO SYNTHESIS SCORE (Pure concert pitch + GM Instrument Mapping)
% =======================================================================
\score {
  <<
    \new Staff \with { midiInstrument = #"flute" } {
      \fluteConcert
    }
    \new Staff \with { midiInstrument = #"clarinet" } {
      \clarinetConcert
    }
    \new Staff \with { midiInstrument = #"alto sax" } {
      \altoSaxConcert
    }
    \new Staff \with { midiInstrument = #"trumpet" } {
      \trumpetConcert
    }
    \new Staff \with { midiInstrument = #"french horn" } {
      \hornConcert
    }
    \new Staff \with { midiInstrument = #"trombone" } {
      \tromboneConcert
    }
    \new Staff \with { midiInstrument = #"tuba" } {
      \tubaConcert
    }
    \new Staff \with { midiInstrument = #"glockenspiel" } {
      \glockConcert
    }
    \new Staff \with { midiInstrument = #"timpani" } {
      \timpaniConcert
    }
    \new DrumStaff {
      <<
        \new DrumVoice { \snareLine }
        \new DrumVoice { \bassDrumLine }
        \new DrumVoice { \cymbalLine }
      >>
    }
  >>
  \midi { }
}
