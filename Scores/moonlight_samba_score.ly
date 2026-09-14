\version "2.24.0"
\include "articulate.ly"

\header {
  title = "Moonlight Samba (1-Minute Concert Band Feature)"
  subtitle = "Adagio Cantabile e Samba Energico — Op. 27, No. 2"
  composer = "Ludwig van Beethoven"
  arranger = "Arranged by John Daniel Dondlinger"
  tagline = "Dedicated to the Wisconsin Rapids City Band by John Daniel Dondlinger (2026)"
}

#(set-global-staff-size 14)

\paper {
  #(set-paper-size "letter")
  top-margin = 0.45\in
  bottom-margin = 0.45\in
  left-margin = 0.5\in
  right-margin = 0.45\in
  ragged-last-bottom = ##f
}

chordTrack = \chordmode {
  \time 4/4
  c1:m |
  c1:m |
  aes1 |
  g1:7 |
  g1:7\fermata |
  c1:m |
  aes1 |
  c1:m |
  aes1 |
  g1:7 |
  f1:m |
  c1:m |
  aes1 |
  g1:7 |
  f1:m |
  c1:m |
  c1:m |
  d1:dim |
  d1:dim |
  c1:m |
  aes1 |
  c1:m |
  c1:m |
  c1:m |
}

oboePart = \fixed c' {
  \time 4/4 \key c \minor \clef treble \tempo "Adagio Cantabile" 4 = 64
  r2 g'4.\p g'8 |
  g'4. g'8 g'2 |
  r8 aes'4\mp( g'8) fis'4.( aes'8) |
  g'4.\mf g'8 bes'4. g'8 |
  g'1\fermata\p\< \! |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  c''1\ff |
  c''1\ff |
  c''4\fff-^ r r2\fermata |
  \bar "|."
}

bassoonPart = \fixed c, {
  \time 4/4 \key c \minor \clef bass
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  R1 |
  R1 |
  c,4\ff r8 c,8 g,,4 r8 g,,8 |
  c,4\ff r8 c,8 g,,4 r8 g,,8 |
  c,4\ff r8 c,8 g,,4 r8 g,,8 |
  c,4\ff r8 c,8 g,,4 r8 g,,8 |
  c,4\ff r8 c,8 g,,4 r8 g,,8 |
  c,4\ff r8 c,8 g,,4 r8 g,,8 |
  c,4\fff-^ r r2\fermata |
  \bar "|."
}

trumpetPart = \fixed c' {
  \time 4/4 \key c \minor \clef treble
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  r8 g'8\ff g'4 r8 g'8 g'4 |
  r8 g'8 g'4 bes'8.\ff g'16 g'4 |
  aes'4.\ff g'8 fis'4. aes'8 |
  g'2. r4 |
  r8 bes'8\ff bes'4 r8 c''8 bes'4 |
  des''4.\ff c''8 b'4. c''8 |
  d''4.\ff c''8 b'4. c''8 |
  c''2. r4 |
  R1 |
  R1 |
  d''4.\fff c''8 b'4. c''8 |
  d''2.\fff g'4\fff |
  c''4.\fff c''8 d''4. c''8 |
  ees''4.\fff d''8 c''4. bes'8 |
  c''1\fff |
  c''1\fff |
  c''4\fff-^ r r2\fermata |
  \bar "|."
}

hornPart = \fixed c' {
  \time 4/4 \key c \minor \clef treble
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  r8 <c' ees'>8-^\f r <c' ees'>-^ r <c' ees'>-^ <d' f'>4-^ |
  r8 <c' ees'>8-^\f r <c' ees'>-^ r <d' f'>-^ <ees' g'>4-^ |
  r8 <c' ees'>4\mf <c' ees'>8 r <c' ees'>4 <c' ees'>8 |
  r8 <c' ees'>4\mf <c' ees'>8 r <c' ees'>4 <c' ees'>8 |
  r8 <c' ees'>4\mf <c' ees'>8 r <c' ees'>4 <c' ees'>8 |
  r8 <c' ees'>4\mf <c' ees'>8 r <c' ees'>4 <c' ees'>8 |
  r8 <c' ees'>4\mf <c' ees'>8 r <c' ees'>4 <c' ees'>8 |
  r8 <c' ees'>4\mf <c' ees'>8 r <c' ees'>4 <c' ees'>8 |
  r8 <c' ees'>4\mf <c' ees'>8 r <c' ees'>4 <c' ees'>8 |
  r8 <c' ees'>4\mf <c' ees'>8 r <c' ees'>4 <c' ees'>8 |
  R1 |
  R1 |
  r8 <c' ees'>4\ff <c' ees'>8 r <d' f'>4 <ees' g'>8 |
  r8 <c' ees'>4\ff <c' ees'>8 r <d' f'>4 <ees' g'>8 |
  r8 <c' ees'>4\ff <c' ees'>8 r <d' f'>4 <ees' g'>8 |
  r8 <c' ees'>4\ff <c' ees'>8 r <d' f'>4 <ees' g'>8 |
  r8 <c' ees'>4\ff <c' ees'>8 r <d' f'>4 <ees' g'>8 |
  r8 <c' ees'>4\ff <c' ees'>8 r <d' f'>4 <ees' g'>8 |
  <c' ees'>4\fff-^ r r2\fermata |
  \bar "|."
}

trombonePart = \fixed c {
  \time 4/4 \key c \minor \clef bass
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  r8 f4\f\glissando( g8-^) r2 |
  r8 d4\f\glissando( ees8-^) r2 |
  r8 c4\mf c8 r c4 c8 |
  r8 c4\mf c8 r c4 c8 |
  r8 c4\mf c8 r c4 c8 |
  r8 f4\f\glissando( g8-^) r2 |
  r8 c4\mf c8 r c4 c8 |
  r8 c4\mf c8 r c4 c8 |
  r8 c4\mf c8 r c4 c8 |
  r8 d4\f\glissando( ees8-^) r2 |
  R1 |
  R1 |
  r8 c4\mf c8 r c4 c8 |
  r8 c4\mf c8 r c4 c8 |
  r8 c4\mf c8 r c4 c8 |
  r8 f4\ff\glissando( g8-^) r2 |
  r8 c4\mf c8 r c4 c8 |
  r8 c4\mf c8 r c4 c8 |
  c4\fff-^ r r2\fermata |
  \bar "|."
}

tubaPart = \fixed c, {
  \time 4/4 \key c \minor \clef bass
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  c,4\f r8 c,8 g,,4 r8 g,,8 |
  R1 |
  R1 |
  c,4\ff r8 c,8 g,,4 r8 g,,8 |
  c,4\ff r8 c,8 g,,4 r8 g,,8 |
  c,4\ff r8 c,8 g,,4 r8 g,,8 |
  c,4\ff r8 c,8 g,,4 r8 g,,8 |
  c,4\ff r8 c,8 g,,4 r8 g,,8 |
  c,4\ff r8 c,8 g,,4 r8 g,,8 |
  c,4\fff-^ r r2\fermata |
  \bar "|."
}

bellsPart = \fixed c' {
  \time 4/4 \key c \minor \clef treble
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  c'''1\f |
  c'''1\f |
  c'''4\fff-^ r r2\fermata |
  \bar "|."
}

marimbaPart = \fixed c' {
  \time 4/4 \key c \minor \clef treble
  \tuplet 3/2 4 { c8\p ees g c ees g c ees g c ees g } |
  \tuplet 3/2 4 { c8\p ees g c ees g c ees g c ees g } |
  \tuplet 3/2 4 { c8\p ees g c ees g c ees g c ees g } |
  \tuplet 3/2 4 { c8\p ees g c ees g c ees g c ees g } |
  <c' ees' g'>1:32\fermata\p\< \! |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  r8 <c' ees'>8\mp r <c' ees'> r <c' ees'> <c' ees'>4 |
  <c' ees' g'>4\fff-^ r r2\fermata |
  \bar "|."
}

timpaniPart = \fixed c, {
  \time 4/4 \clef bass
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  c4\ff-^ r8 ees r2 |
  c4\f-^ r8 ees r2 |
  R1 |
  c4\f-^ r8 ees r2 |
  R1 |
  c4\f-^ r8 ees r2 |
  R1 |
  c4\f-^ r8 ees r2 |
  R1 |
  c4\f-^ r8 ees r2 |
  c4\ff-^ r8 ees c4-^ r8 ees |
  c4\ff-^ r8 ees c4-^ r8 ees |
  R1 |
  c4\f-^ r8 ees r2 |
  R1 |
  c4\f-^ r8 ees r2 |
  R1 |
  c4\f-^ r8 ees r2 |
  c4\fff-^ r r2\fermata |
  \bar "|."
}

snarePart = \drummode {
  \time 4/4
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  <sn cymc>4\fff-^ sn8\f sn sn4\f sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  sn8\f sn r sn sn8. sn16 sn8 sn |
  <sn cymc>4\fff-^ r r2\fermata |
  \bar "|."
}

bassDrumPart = \drummode {
  \time 4/4
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  bd4\ff-^ r8 bd\f bd4\f r8 bd\f |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\f r8 bd\ff bd4\f r8 bd\ff |
  bd4\fff-^ r r2\fermata |
  \bar "|."
}

\score {
  <<
    \new ChordNames { \chordTrack }
    \new StaffGroup = "Woodwinds" <<
      \new Staff \with {
        instrumentName = #"Oboe"
        shortInstrumentName = #"Ob."
        midiInstrument = #"oboe"
      } { \oboePart }
      \new Staff \with {
        instrumentName = #"Bassoon"
        shortInstrumentName = #"Bsn."
        midiInstrument = #"bassoon"
      } { \bassoonPart }
    >>
    \new StaffGroup = "Brass" <<
      \new Staff \with {
        instrumentName = #"B♭ Trumpet"
        shortInstrumentName = #"Tpt."
        midiInstrument = #"trumpet"
      } { \trumpetPart }
      \new Staff \with {
        instrumentName = #"French Horn in F"
        shortInstrumentName = #"Hn."
        midiInstrument = #"french horn"
      } { \hornPart }
      \new Staff \with {
        instrumentName = #"Trombone"
        shortInstrumentName = #"Tbn."
        midiInstrument = #"trombone"
      } { \trombonePart }
      \new Staff \with {
        instrumentName = #"Tuba"
        shortInstrumentName = #"Tuba"
        midiInstrument = #"tuba"
      } { \tubaPart }
    >>
    \new StaffGroup = "TunedPercussion" <<
      \new Staff \with {
        instrumentName = #"Glockenspiel (Bells)"
        shortInstrumentName = #"Bl."
        midiInstrument = #"glockenspiel"
      } { \bellsPart }
      \new Staff \with {
        instrumentName = #"Marimba"
        shortInstrumentName = #"Mba."
        midiInstrument = #"marimba"
      } { \marimbaPart }
      \new Staff \with {
        instrumentName = #"Timpani"
        shortInstrumentName = #"Tmp."
        midiInstrument = #"timpani"
      } { \timpaniPart }
    >>
    \new StaffGroup = "BatteryPercussion" <<
      \new DrumStaff \with {
        instrumentName = #"Concert Snare"
        shortInstrumentName = #"Sn."
      } { \snarePart }
      \new DrumStaff \with {
        instrumentName = #"Concert Bass Drum"
        shortInstrumentName = #"B.D."
      } { \bassDrumPart }
    >>
  >>
  \layout { }
}
