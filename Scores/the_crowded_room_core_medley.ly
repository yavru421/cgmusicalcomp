\version "2.24.0"
\include "articulate.ly"

\header {
  title = "The Crowded Room"
  subtitle = "A Symphonic Study in Unison and Shared Breath [Core Medley Lead]"
  composer = "J. D. Dondlinger"
  arranger = "Arranged for Wisconsin Rapids City Band"
  tagline = "The Crowded Room — Core Medley Lead (Deterministic Band DSL Compiler)"
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

  % --- I. The Crowded Room (Restless Voices) (mm. 1-28) ---
  \time 4/4
  g1:m |
  ees1 |
  c1:m |
  f1 |
  g1:m |
  bes1 |
  ees1 |
  d1:7 |
  g1:m |
  ees1 |
  f1 |
  g1:m |
  g1:m |
  ees1 |
  c1:m |
  f1 |
  g1:m |
  bes1 |
  ees1 |
  d1:7 |
  g1:m |
  ees1 |
  f1 |
  g1:m |
  g1:m |
  ees1 |
  c1:m |
  f1 |

  % --- II. Convergence (Drawing Near) (mm. 29-52) ---
  \time 4/4
  ees1 |
  f1 |
  d1:m |
  g1:m |
  c1:m |
  f1:7 |
  bes1 |
  f1 |
  ees1 |
  f1 |
  g1:m |
  f1:7 |
  ees1 |
  f1 |
  d1:m |
  g1:m |
  c1:m |
  f1:7 |
  bes1 |
  f1 |
  ees1 |
  f1 |
  g1:m |
  f1:7 |

  % --- III. Strange Unison (Breathe as One) (mm. 53-84) ---
  \time 4/4
  bes1 |
  bes1 |
  f1 |
  g1:m |
  ees1 |
  bes1 |
  c1:m |
  f1:7 |
  bes1 |
  ees1 |
  f1 |
  bes1 |
  bes1 |
  bes1 |
  f1 |
  g1:m |
  ees1 |
  bes1 |
  c1:m |
  f1:7 |
  bes1 |
  ees1 |
  f1 |
  bes1 |
  bes1 |
  bes1 |
  f1 |
  g1:m |
  ees1 |
  bes1 |
  c1:m |
  f1:7 |
}

% ======================================================================
% Core Lead (Melody)
% ======================================================================
coreLeadPart = \fixed c' {
  \clef treble

  % --- I. The Crowded Room (Restless Voices) (mm. 1-28) ---
  \time 4/4
  \key g \minor
  \tempo "I. The Crowded Room (Restless Voices)" 4 = 128
  g4\f bes8 d' g2 |
  ees'4\f g8 bes ees'2 |
  c'4\f ees'8 g c'2 |
  f4\f a8 c' f2 |
  g4\f bes8 d' g2 |
  bes4\f d'8 f' bes2 |
  ees'4\f g8 bes ees'2 |
  d'4\f fis8 a d'2 |
  g4\f bes8 d' g2 |
  ees'4\f g8 bes ees'2 |
  f4\f a8 c' f2 |
  g4\f bes8 d' g2 |
  g4\f bes8 d' g2 |
  ees'4\f g8 bes ees'2 |
  c'4\f ees'8 g c'2 |
  f4\f a8 c' f2 |
  g4\f bes8 d' g2 |
  bes4\f d'8 f' bes2 |
  ees'4\f g8 bes ees'2 |
  d'4\f fis8 a d'2 |
  g4\f bes8 d' g2 |
  ees'4\f g8 bes ees'2 |
  f4\f a8 c' f2 |
  g4\f bes8 d' g2 |
  g4\f bes8 d' g2 |
  ees'4\f g8 bes ees'2 |
  c'4\f ees'8 g c'2 |
  f4\f a8 c' f2 |

  % --- II. Convergence (Drawing Near) (mm. 29-52) ---
  \time 4/4
  \key bes \major
  \tempo "II. Convergence (Drawing Near)" 4 = 92
  ees'4\f g8 bes ees'2 |
  f4\f a8 c' f2 |
  d'4\f f'8 a d'2 |
  g4\f bes8 d' g2 |
  c'4\f ees'8 g c'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  ees'4\f g8 bes ees'2 |
  f4\f a8 c' f2 |
  g4\f bes8 d' g2 |
  f'4\f a8 c' f'2 |
  ees'4\f g8 bes ees'2 |
  f4\f a8 c' f2 |
  d'4\f f'8 a d'2 |
  g4\f bes8 d' g2 |
  c'4\f ees'8 g c'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  ees'4\f g8 bes ees'2 |
  f4\f a8 c' f2 |
  g4\f bes8 d' g2 |
  f'4\f a8 c' f'2 |

  % --- III. Strange Unison (Breathe as One) (mm. 53-84) ---
  \time 4/4
  \key bes \major
  \tempo "III. Strange Unison (Breathe as One)" 4 = 72
  bes4\f d'8 f' bes2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  g4\f bes8 d' g2 |
  ees'4\f g8 bes ees'2 |
  bes4\f d'8 f' bes2 |
  c'4\f ees'8 g c'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  ees'4\f g8 bes ees'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  bes4\f d'8 f' bes2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  g4\f bes8 d' g2 |
  ees'4\f g8 bes ees'2 |
  bes4\f d'8 f' bes2 |
  c'4\f ees'8 g c'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  ees'4\f g8 bes ees'2 |
  f4\f a8 c' f2 |
  bes4\f d'8 f' bes2 |
  bes4\f d'8 f' bes2 |
  bes4\f d'8 f' bes2 |
  f'4\f a8 c' f'2 |
  g4\f bes8 d' g2 |
  ees'4\f g8 bes ees'2 |
  bes4\f d'8 f' bes2 |
  c'4\f ees'8 g c'2 |
  f4\f a8 c' f2 |
  \bar "|."
}

% ======================================================================
% Core Bass / Accompaniment
% ======================================================================
coreBassPart = \fixed c {
  \clef bass

  % --- I. The Crowded Room (Restless Voices) (mm. 1-28) ---
  \time 4/4
  \key g \minor
  g,2\mf g,2 |
  ees,2\mf ees,2 |
  c,2\mf c,2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  bes,2\mf bes,2 |
  ees2\mf ees2 |
  d2\mf d2 |
  g,2\mf g,2 |
  ees,2\mf ees,2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  g,2\mf g,2 |
  ees,2\mf ees,2 |
  c,2\mf c,2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  bes,2\mf bes,2 |
  ees2\mf ees2 |
  d2\mf d2 |
  g,2\mf g,2 |
  ees,2\mf ees,2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  g,2\mf g,2 |
  ees,2\mf ees,2 |
  c,2\mf c,2 |
  f,2\mf f,2 |

  % --- II. Convergence (Drawing Near) (mm. 29-52) ---
  \time 4/4
  \key bes \major
  ees,2\mf ees,2 |
  f,2\mf f,2 |
  d,2\mf d,2 |
  g,2\mf g,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  ees,2\mf ees,2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  f,2\mf f,2 |
  ees,2\mf ees,2 |
  f,2\mf f,2 |
  d,2\mf d,2 |
  g,2\mf g,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  ees,2\mf ees,2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  f,2\mf f,2 |

  % --- III. Strange Unison (Breathe as One) (mm. 53-84) ---
  \time 4/4
  \key bes \major
  bes,2\mf bes,2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  ees,2\mf ees,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  ees2\mf ees2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  bes,2\mf bes,2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  ees,2\mf ees,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  ees2\mf ees2 |
  f,2\mf f,2 |
  bes,2\mf bes,2 |
  bes,2\mf bes,2 |
  bes,2\mf bes,2 |
  f,2\mf f,2 |
  g,2\mf g,2 |
  ees,2\mf ees,2 |
  bes,2\mf bes,2 |
  c2\mf c2 |
  f,2\mf f,2 |
  \bar "|."
}

% ======================================================================
% Core Drums
% ======================================================================
coreDrumsPart = \drummode {

  % --- I. The Crowded Room (Restless Voices) (mm. 1-28) ---
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

  % --- II. Convergence (Drawing Near) (mm. 29-52) ---
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

  % --- III. Strange Unison (Breathe as One) (mm. 53-84) ---
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