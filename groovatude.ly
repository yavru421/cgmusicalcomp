\version "2.24.0"

\header {
  title = "Groovatude"
  subtitle = "Concert Band Funk/Rock Feature"
  composer = "Robert W. Smith"
  arranger = "John Daniel Dondlinger"
  tagline = "Arranged for Wisconsin Rapids City Band by John Daniel Dondlinger"
}

#(set-global-staff-size 13)

\paper {
  #(set-paper-size "letter")
  top-margin = 0.4\in
  bottom-margin = 0.4\in
  left-margin = 0.5\in
  right-margin = 0.4\in
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  system-system-spacing.basic-distance = #11
  score-system-spacing.basic-distance = #11
}

global = {
  \key f \minor
  \time 4/4
  \tempo "Heavy Funk Groove" 4 = 126
}

% =======================================================================
% 1. LEAD FLUTE (Concert Pitch)
% =======================================================================
fluteConcert = \relative c'' {
  \global
  \clef treble
  % Intro (mm. 1-8)
  R1 * 4 |
  r8 f16\f f r8 f aes16 bes r8 c4 |
  r8 f,16 f r8 f ees'16 c r8 bes4 |
  r8 f16 f r8 f aes16 bes r8 c4 |
  ees8\ff ees r ees f4\bendAfter #-4 r |
  
  % Section A: Main Groovatude Theme (mm. 9-16)
  f4.\f c8 ees16 f r8 c4 |
  bes8 aes bes c f,2 |
  f'4. c8 ees16 f r8 c4 |
  aes'8 g f ees f2 |
  f4. c8 ees16 f r8 c4 |
  bes8 aes bes c f,2 |
  aes8\ff aes r aes bes4 c |
  f1\ff ~ |
  
  % Section B: Funk Counterpoint & Variation (mm. 17-24)
  f4 r8 c'8 ees16 c r8 bes4 |
  aes8 f r f aes16 bes r8 c4 |
  r8 c16 c r8 c ees16 c r8 bes4 |
  c8 ees f aes bes4\bendAfter #-4 r |
  f4.\f c8 ees16 f r8 c4 |
  bes8 aes bes c f,4 r |
  r8 c'16 c r8 c ees16 c r8 bes4 |
  c8 ees f aes c4\ff r |
  
  % Section C: Tutti Climax & Outro (mm. 25-32)
  f,8\fff f r f aes16 bes r8 c4 |
  r8 c16 c r8 c ees16 c r8 bes4 |
  f8 f r f aes16 bes r8 c4 |
  ees8 ees r ees f4\bendAfter #-4 r |
  f4.\fff c8 ees16 f r8 c4 |
  bes8 aes bes c f,4 r |
  aes8\fff aes r aes bes bes r c |
  f,1\fff \bar "|."
}

% =======================================================================
% 2. B♭ TRUMPET (Concert Pitch Definition)
% =======================================================================
trumpetConcert = \relative c' {
  \global
  \clef treble
  % Intro (mm. 1-8) - Trumpet enters in m. 5
  R1 * 4 |
  r8 f'16\f f r8 f aes16 bes r8 c4 |
  r8 f,16 f r8 f ees'16 c r8 bes4 |
  r8 f16 f r8 f aes16 bes r8 c4 |
  c8\ff c r c c4\bendAfter #-4 r |
  
  % Section A: Brass Riffs & Harmonized Melody (mm. 9-16)
  c4.\f aes8 bes16 c r8 aes4 |
  f8 ees f aes c,2 |
  c'4. aes8 bes16 c r8 aes4 |
  c8 bes aes bes c2 |
  c4. aes8 bes16 c r8 aes4 |
  f8 ees f aes c,2 |
  f'8\ff f r f ees4 ees |
  c1\ff ~ |
  
  % Section B: Searing Brass Calls (mm. 17-24)
  c4 r8 aes'8 c16 aes r8 f4 |
  ees8 c r c f16 g r8 aes4 |
  r8 aes16 aes r8 aes c16 aes r8 f4 |
  aes8 c d f g4\bendAfter #-4 r |
  c,4.\f aes8 bes16 c r8 aes4 |
  f8 ees f aes c,4 r |
  r8 aes'16 aes r8 aes c16 aes r8 f4 |
  aes8 c d f aes4\ff r |
  
  % Section C: Tutti Climax & Outro (mm. 25-32)
  c,8\fff c r c f16 g r8 aes4 |
  r8 aes16 aes r8 aes c16 aes r8 f4 |
  c8 c r c f16 g r8 aes4 |
  c8 c r c c4\bendAfter #-4 r |
  c4.\fff aes8 bes16 c r8 aes4 |
  f8 ees f aes c,4 r |
  f'8\fff f r f ees ees r ees |
  c1\fff \bar "|."
}

% =======================================================================
% 3. FRENCH HORN IN F (Concert Pitch Definition)
% =======================================================================
hornConcert = \relative c' {
  \global
  \clef treble
  % Intro (mm. 1-8) - Horn enters in m. 3
  R1 * 2 |
  r4 c'\mf ees4. c8 |
  bes2 c |
  r8 c16\f c r8 c f16 g r8 aes4 |
  r8 c,16 c r8 c aes'16 f r8 ees4 |
  r8 c16 c r8 c f16 g r8 aes4 |
  aes8\ff aes r aes aes4\bendAfter #-4 r |
  
  % Section A: Countermelody & Swells (mm. 9-16)
  aes4.\f f8 g16 aes r8 f4 |
  ees8 c ees f c2 |
  aes'4. f8 g16 aes r8 f4 |
  f8 g aes g aes2 |
  aes4. f8 g16 aes r8 f4 |
  ees8 c ees f c2 |
  c'8\ff c r c bes4 bes |
  aes1\ff ~ |
  
  % Section B: Horn Stabs & Support (mm. 17-24)
  aes4 r8 f'8 aes16 f r8 d4 |
  c8 aes r aes c16 d r8 f4 |
  r8 f16 f r8 f aes16 f r8 d4 |
  f8 aes bes c d4\bendAfter #-4 r |
  aes,4.\f f8 g16 aes r8 f4 |
  ees8 c ees f c4 r |
  r8 f'16 f r8 f aes16 f r8 d4 |
  f8 aes bes c f4\ff r |
  
  % Section C: Climax (mm. 25-32)
  aes,8\fff aes r aes c16 d r8 f4 |
  r8 f16 f r8 f aes16 f r8 d4 |
  aes8 aes r aes c16 d r8 f4 |
  aes8 aes r aes aes4\bendAfter #-4 r |
  aes4.\fff f8 g16 aes r8 f4 |
  ees8 c ees f c4 r |
  c'8\fff c r c bes bes r bes |
  aes1\fff \bar "|."
}

% =======================================================================
% 4. TROMBONE (Concert Pitch with Slides & Fall-offs)
% =======================================================================
tromboneConcert = \relative c {
  \global
  \clef bass
  % Intro (mm. 1-8) - Trombone lays down low funk riffs with slides
  R1 * 2 |
  r4 f8\f f r4 f |
  r4 ees8\f\glissando f r2 |
  f4.\f f8 ~ f16 f8. aes8 bes |
  c4.\glissando bes8 ~ bes16 aes8. f4 |
  f4. f8 ~ f16 f8. aes8 bes |
  c8\ff c r c f4\bendAfter #-4 r |
  
  % Section A: Low Brass Funk Groove (mm. 9-16)
  f,4.\f f8 ~ f16 f8. aes8 bes |
  c4.\glissando bes8 ~ bes16 aes8. f4 |
  f4. f8 ~ f16 f8. aes8 bes |
  c8 bes aes bes c4\glissando f |
  f,4. f8 ~ f16 f8. aes8 bes |
  c4.\glissando bes8 ~ bes16 aes8. f4 |
  c'8\ff c r c bes4 bes |
  f1\ff ~ |
  
  % Section B: Trombone Solo Riffs with Glissandi (mm. 17-24)
  f4 r8 c'8\f ees16 c r8 bes4\glissando |
  c8 f, r f aes16 bes r8 c4 |
  r8 c16 c r8 c ees16 c r8 bes4\glissando |
  c8 ees f aes c4\bendAfter #-4 r |
  f,,4.\f f8 ~ f16 f8. aes8 bes |
  c4.\glissando bes8 ~ bes16 aes8. f4 |
  r8 c'16 c r8 c ees16 c r8 bes4\glissando |
  c8 ees f aes c4\ff r |
  
  % Section C: Climax (mm. 25-32)
  f,,4.\fff f8 ~ f16 f8. aes8 bes |
  c4.\glissando bes8 ~ bes16 aes8. f4 |
  f4. f8 ~ f16 f8. aes8 bes |
  c8 c r c f4\bendAfter #-4 r |
  f,4.\fff f8 ~ f16 f8. aes8 bes |
  c4.\glissando bes8 ~ bes16 aes8. f4 |
  aes8\fff aes r aes bes bes r c |
  f,1\fff \bar "|."
}

% =======================================================================
% 5. B♭ CLARINET (Concert Pitch Definition)
% =======================================================================
clarinetConcert = \relative c' {
  \global
  \clef treble
  % Intro (mm. 1-8) - Clarinet enters with funky arpeggios
  R1 * 2 |
  r8 f16\p aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 f16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 f16\f aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 f16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 f16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  aes'8\ff aes r aes c4\bendAfter #-4 r |
  
  % Section A (mm. 9-16)
  r8 f,16\f aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 f16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 f16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 f16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 f16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 f16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  c'8\ff c r c ees4 ees |
  c1\ff ~ |
  
  % Section B (mm. 17-24)
  c4 r8 aes'8 c16 aes r8 f4 |
  ees8 c r c f16 g r8 aes4 |
  r8 aes16 aes r8 aes c16 aes r8 f4 |
  aes8 c d f g4\bendAfter #-4 r |
  r8 f,16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 f16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 aes16 aes r8 aes c16 aes r8 f4 |
  aes8 c d f aes4\ff r |
  
  % Section C (mm. 25-32)
  r8 f,16\fff aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 f16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 f16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  aes'8 aes r aes c4\bendAfter #-4 r |
  r8 f,16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  r8 f16 aes c8 f,16 aes c8 f,16 aes c8 f, |
  c'8\fff c r c ees ees r ees |
  c1\fff \bar "|."
}

% =======================================================================
% 6. BASS (Electric Bass / Slap Bass)
% =======================================================================
bassConcert = \relative c, {
  \global
  \clef bass
  % Intro (mm. 1-8) - Bass starts the groove in m. 1
  f4.\f f8 ~ f16 f8. aes8 bes |
  c4. bes8 ~ bes16 aes8. f4 |
  f4. f8 ~ f16 f8. aes8 bes |
  c4. bes8 ~ bes16 aes8. f4 |
  f4. f8 ~ f16 f8. aes8 bes |
  c4. bes8 ~ bes16 aes8. f4 |
  f4. f8 ~ f16 f8. aes8 bes |
  c8\ff c r c f4 r |
  
  % Section A (mm. 9-16)
  f,4.\f f8 ~ f16 f8. aes8 bes |
  c4. bes8 ~ bes16 aes8. f4 |
  f4. f8 ~ f16 f8. aes8 bes |
  c4. bes8 ~ bes16 aes8. f4 |
  f4. f8 ~ f16 f8. aes8 bes |
  c4. bes8 ~ bes16 aes8. f4 |
  c'8\ff c r c bes4 bes |
  f1\ff ~ |
  
  % Section B (mm. 17-24)
  f4 r8 f8 aes16 f r8 bes4 |
  c8 f, r f aes16 bes r8 c4 |
  f,4 r8 f8 aes16 f r8 bes4 |
  c8 ees f aes c4 r |
  f,,4.\f f8 ~ f16 f8. aes8 bes |
  c4. bes8 ~ bes16 aes8. f4 |
  f4 r8 f8 aes16 f r8 bes4 |
  c8 ees f aes c4\ff r |
  
  % Section C (mm. 25-32)
  f,,4.\fff f8 ~ f16 f8. aes8 bes |
  c4. bes8 ~ bes16 aes8. f4 |
  f4. f8 ~ f16 f8. aes8 bes |
  c8 c r c f4 r |
  f,4.\fff f8 ~ f16 f8. aes8 bes |
  c4. bes8 ~ bes16 aes8. f4 |
  aes8\fff aes r aes bes bes r c |
  f,1\fff \bar "|."
}

% =======================================================================
% 7. FULL DRUM SET PERCUSSION (Heavy Funk / Rock Groove)
% =======================================================================
drumKit = \drummode {
  <<
    {
      % Cymbals / Hi-Hat Layer
      \repeat unfold 7 {
        hh16 hh hho hh  hh hh hho hh  hh hh hho hh  hh hh hho hh |
      }
      cymc8\f cymc toml16 toml tommh tommh toml toml tommh tommh cymc4\bendAfter #-4 |
      
      \repeat unfold 7 {
        hh16 hh hho hh  hh hh hho hh  hh hh hho hh  hh hh hho hh |
      }
      cymc8\ff cymc cymc cymc toml16 toml tommh tommh toml toml tommh tommh |
      
      % Section B: Ride & Cowbell Funk
      \repeat unfold 7 {
        cymr8 cymr16 cymr cymr8 cymr16 cymr cymr8 cymr16 cymr cymr8 cymr |
      }
      cymc8\ff cymc toml16 toml tommh tommh toml toml tommh tommh cymc4\bendAfter #-4 |
      
      % Section C: Tutti Climax
      \repeat unfold 7 {
        hh16\fff hh hho hh  hh hh hho hh  hh hh hho hh  hh hh hho hh |
      }
      cymc1\fff \bar "|."
    }
    \\
    {
      % Snare Backbeat & Ghost Notes Layer
      \repeat unfold 7 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      sn4 sn8 sn sn2:32 |
      
      \repeat unfold 7 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      sn8\ff sn16 sn sn8 sn sn2:32 |
      
      % Section B
      \repeat unfold 7 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      sn4 sn8 sn sn2:32 |
      
      % Section C
      \repeat unfold 7 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      sn1\fff \bar "|."
    }
    \\
    {
      % Bass Drum (Funk Kick)
      \repeat unfold 7 {
        bd4 bd8. bd16 bd4 bd8 bd |
      }
      bd4 r bd r |
      
      \repeat unfold 7 {
        bd4 bd8. bd16 bd4 bd8 bd |
      }
      bd4 bd bd r |
      
      % Section B
      \repeat unfold 7 {
        bd4 bd8. bd16 bd4 bd8 bd |
      }
      bd4 r bd r |
      
      % Section C
      \repeat unfold 7 {
        bd4 bd8. bd16 bd4 bd8 bd |
      }
      bd1\fff \bar "|."
    }
  >>
}

% =======================================================================
% 1. VISUAL ENGRAVED SCORE (With musician transpositions & clean staff size)
% =======================================================================
\score {
  <<
    \new StaffGroup = "Winds" <<
      \new Staff \with { instrumentName = #"Flute" } {
        \fluteConcert
      }
      \new Staff \with { instrumentName = #"B♭ Clarinet" } {
        \transpose bes c' \clarinetConcert
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
    >>

    \new StaffGroup = "RhythmSection" <<
      \new Staff \with { instrumentName = #"Bass" } {
        \bassConcert
      }
      \new DrumStaff \with { instrumentName = #"Drums" } {
        \drumKit
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
    \new Staff \with { midiInstrument = #"trumpet" } {
      \trumpetConcert
    }
    \new Staff \with { midiInstrument = #"french horn" } {
      \hornConcert
    }
    \new Staff \with { midiInstrument = #"trombone" } {
      \tromboneConcert
    }
    \new Staff \with { midiInstrument = #"electric bass (finger)" } {
      \bassConcert
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      \drumKit
    }
  >>
  \midi { }
}
