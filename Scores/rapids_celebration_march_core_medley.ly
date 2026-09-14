\version "2.24.0"
\include "articulate.ly"

\header {
  title = "Rapids Celebration March"
  subtitle = "Core Medley Lead & Concert Rhythm [Core Medley Lead]"
  composer = "J. D. Dondlinger"
  arranger = "Arranged for Wisconsin Rapids City Band by J. D. Dondlinger"
  tagline = "Rapids Celebration March — Core Medley Lead (Deterministic Band DSL Compiler)"
}

#(set-global-staff-size 15)

\paper {
  #(set-paper-size "letter")
  top-margin = 0.5\in
  bottom-margin = 0.5\in
  left-margin = 0.55\in
  right-margin = 0.5\in
  ragged-last-bottom = ##f
}

% ======================================================================
% Harmony Chords
% ======================================================================
chordTrack = \chordmode {

  % --- Theme I — Rapids Celebration March (mm. 1-32) ---
  \time 4/4
  bes1 |
  ees1 |
  f1 |
  bes1 |
  g1:m |
  c1:m |
  f1:7 |
  bes1 |
  bes1 |
  ees1 |
  f1 |
  bes1 |
  g1:m |
  c1:m |
  f1:7 |
  bes1 |
  bes1 |
  ees1 |
  f1 |
  bes1 |
  g1:m |
  c1:m |
  f1:7 |
  bes1 |
  bes1 |
  ees1 |
  f1 |
  bes1 |
  g1:m |
  c1:m |
  f1:7 |
  bes1 |
}

% ======================================================================
% Core Lead (Melody)
% ======================================================================
coreLeadPart = \fixed c' {
  \clef treble

  % --- Theme I — Rapids Celebration March (mm. 1-32) ---
  \time 4/4
  \key bes \major
  \tempo "Theme I — Rapids Celebration March" 4 = 120
  bes4\f d'8 f' bes2 |
  ees'4\f g8 bes ees'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  g4\f bes8 d' g2 |
  c'4\f ees'8 g c'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  bes4\f d'8 f' bes2 |
  ees'4\f g8 bes ees'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  g4\f bes8 d' g2 |
  c'4\f ees'8 g c'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  bes4\f d'8 f' bes2 |
  ees'4\f g8 bes ees'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  g4\f bes8 d' g2 |
  c'4\f ees'8 g c'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  bes4\f d'8 f' bes2 |
  ees'4\f g8 bes ees'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  g4\f bes8 d' g2 |
  c'4\f ees'8 g c'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  \bar "|."
}

% ======================================================================
% Core Bass / Accompaniment
% ======================================================================
coreBassPart = \fixed c {
  \clef bass

  % --- Theme I — Rapids Celebration March (mm. 1-32) ---
  \time 4/4
  \key bes \major
  bes,2\mf bes,2 |
  ees2\mf ees2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  g,2\mf g,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  bes,2\mf bes,2 |
  ees2\mf ees2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  g,2\mf g,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  bes,2\mf bes,2 |
  ees2\mf ees2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  g,2\mf g,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  bes,2\mf bes,2 |
  ees2\mf ees2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  g,2\mf g,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  \bar "|."
}

% ======================================================================
% Core Drums
% ======================================================================
coreDrumsPart = \drummode {

  % --- Theme I — Rapids Celebration March (mm. 1-32) ---
  \time 4/4
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  bd4 sn8 bd bd4 sn |
  \bar "|."
}

\score {
  <<
    \new ChordNames { \chordTrack }
    \new StaffGroup = "CoreMedley" \with { instrumentName = #"Core Medley" shortInstrumentName = #"Core" } <<
      \new Staff = "upper" \with { instrumentName = #"Concert Lead" shortInstrumentName = #"Lead" } { \coreLeadPart }
      \new Staff = "lower" \with { instrumentName = #"Tuba / Bass" shortInstrumentName = #"Bass" } { \coreBassPart }
    >>
    \new DrumStaff \with { instrumentName = #"Drums" shortInstrumentName = #"Dr." } { \coreDrumsPart }
  >>
  \layout { }
  \midi { }
}