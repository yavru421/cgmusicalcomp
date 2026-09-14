\version "2.24.0"
\include "articulate.ly"

\header {
  title = "Sovereign Fanfare"
  subtitle = "Core Medley Lead & Concert Rhythm [Core Medley Lead]"
  composer = "J. D. Dondlinger"
  arranger = "Arranged for Wisconsin Rapids City Band by J. D. Dondlinger"
  tagline = "Sovereign Fanfare — Core Medley Lead (Deterministic Band DSL Compiler)"
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

  % --- Theme I — Sovereign Fanfare (mm. 1-32) ---
  \time 4/4
  d1:m |
  bes1 |
  c1 |
  f1 |
  g1:m |
  a1:7 |
  d1:m |
  c1 |
  d1:m |
  bes1 |
  c1 |
  f1 |
  g1:m |
  a1:7 |
  d1:m |
  c1 |
  d1:m |
  bes1 |
  c1 |
  f1 |
  g1:m |
  a1:7 |
  d1:m |
  c1 |
  d1:m |
  bes1 |
  c1 |
  f1 |
  g1:m |
  a1:7 |
  d1:m |
  c1 |
}

% ======================================================================
% Core Lead (Melody)
% ======================================================================
coreLeadPart = \fixed c' {
  \clef treble

  % --- Theme I — Sovereign Fanfare (mm. 1-32) ---
  \time 4/4
  \key d \minor
  \tempo "Theme I — Sovereign Fanfare" 4 = 120
  d4\f f8 a d2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  f4\f a8 c' f2 |
  g4\f bes8 d' g2 |
  a4\f cis'8 e' a2 |
  d'4\f f'8 a d'2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  f4\f a8 c' f2 |
  g4\f bes8 d' g2 |
  a4\f cis'8 e' a2 |
  d'4\f f'8 a d'2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  f4\f a8 c' f2 |
  g4\f bes8 d' g2 |
  a4\f cis'8 e' a2 |
  d'4\f f'8 a d'2 |
  c'4\f e'8 g c'2 |
  d4\f f8 a d2 |
  bes4\f d'8 f' bes2 |
  c'4\f e'8 g c'2 |
  f4\f a8 c' f2 |
  g4\f bes8 d' g2 |
  a4\f cis'8 e' a2 |
  d'4\f f'8 a d'2 |
  c'4\f e'8 g c'2 |
  \bar "|."
}

% ======================================================================
% Core Bass / Accompaniment
% ======================================================================
coreBassPart = \fixed c {
  \clef bass

  % --- Theme I — Sovereign Fanfare (mm. 1-32) ---
  \time 4/4
  \key d \minor
  d,2\mf d,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  a,2\mf a,2 |
  d2\mf d2 |
  c2\mf c2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  a,2\mf a,2 |
  d2\mf d2 |
  c2\mf c2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  a,2\mf a,2 |
  d2\mf d2 |
  c2\mf c2 |
  d2\mf d2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  a,2\mf a,2 |
  d2\mf d2 |
  c2\mf c2 |
  \bar "|."
}

% ======================================================================
% Core Drums
% ======================================================================
coreDrumsPart = \drummode {

  % --- Theme I — Sovereign Fanfare (mm. 1-32) ---
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