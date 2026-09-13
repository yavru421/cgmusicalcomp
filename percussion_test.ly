\version "2.24.0"

\header {
  title = "Wisconsin Rapids City Band Test Score"
  subtitle = "Full Ensemble & Advanced Percussion Verification"
  composer = "Local System Test"
}

% Global settings shared across all parts (from LilyPond source patterns)
global = {
  \key bes \major
  \time 4/4
  \tempo "Con Brio" 4 = 120
}

% 1. B♭ Trumpet (Transposing Part)
trumpetNotes = \relative c'' {
  \global
  \clef treble
  f4.\f d8 f4 bes | d2 bes4 r |
  c4. bes8 a4 g | f2. r4 |
  d'4.\f c8 bes4 c | d4. ees8 f2 |
  g4 f ees d | bes1 \p \bar "|."
}

% 2. French Horn in F (Transposing Part)
hornNotes = \relative c'' {
  \global
  \clef treble
  d4.\f bes8 d4 f | bes2 f4 r |
  g4. f8 ees4 d | c2. r4 |
  f4.\f ees8 d4 ees | f4. g8 a2 |
  bes4 a g f | d1 \p \bar "|."
}

% 3. Timpani (Pitched Percussion - Standard Bass Clef)
timpaniNotes = \relative c {
  \global
  \clef bass
  bes4\f r f r | bes2 bes4 r |
  f4 r c' r | f,2. r4 |
  bes4\f r d r | f2 f4 r |
  ees4 f f, f | bes1 \p \bar "|."
}

% 4. Unpitched Percussion (Snare & Bass Drum in \drummode)
snareLine = \drummode {
  % Rolls (:32), Stickings (^"R" ^"L"), and Ghost Notes (\parenthesize)
  sn8\f^"R" sn^"L" sn^"R" sn^"L" sn4:32 sn |
  sn8^"R" \parenthesize sn^"L" sn8^"R" sn^"L" sn4 r |
  sn8^"R" sn16^"L" sn^"R" sn8^"L" sn^"R" sn4:32 sn8^"L" sn^"R" |
  sn2:32 ~ sn2 |
  sn8\f^"R" sn16^"L" sn^"R" sn8^"L" sn^"R" sn4 sn |
  sn8^"R" sn16^"L" sn^"R" sn8^"L" sn^"R" sn2:32 |
  sn8^"R" sn^"L" sn^"R" sn^"L" sn^"R" sn^"L" sn^"R" sn^"L" |
  sn1\p \bar "|."
}

bassDrumLine = \drummode {
  bd4 r bd r | bd2 bd4 r |
  bd4 r bd r | bd2. r4 |
  bd4 r bd r | bd2 bd4 r |
  bd4 bd bd bd | bd1 \bar "|."
}

\score {
  <<
    \new StaffGroup = "Brass" <<
      \new Staff \with { instrumentName = #"Trumpet in B♭" } {
        \transpose bes c' \trumpetNotes
      }
      \new Staff \with { instrumentName = #"Horn in F" } {
        \transpose f c' \hornNotes
      }
    >>
    
    \new StaffGroup = "Percussion" <<
      \new Staff \with { instrumentName = #"Timpani" } {
        \timpaniNotes
      }
      \new DrumStaff \with { instrumentName = #"Percussion" } <<
        \new DrumVoice { \voiceOne \snareLine }
        \new DrumVoice { \voiceTwo \bassDrumLine }
      >>
    >>
  >>
  
  \layout { }
  \midi { }
}
