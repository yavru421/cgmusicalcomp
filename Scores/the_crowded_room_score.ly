\version "2.24.0"
\include "articulate.ly"

\header {
  title = "The Crowded Room (Breathe as One)"
  subtitle = "A Symphonic Concert Band Study in Unison and Shared Breath"
  composer = "John Daniel Dondlinger"
  arranger = "Wisconsin Rapids City Band"
  tagline = "The Crowded Room — Dedicated to the Wisconsin Rapids City Band (2026)"
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

chordTrack = \chordmode {

  % --- I. The Anxious Crowded Room ---
  \time 4/4
  s1 |
  s1 |
  s1 |
  s1 |
  s1 |
  s1 |
  s1 |
  s1 |
  s1 |
  s1 |
  s1 |
  s1 |
  g:m1 |
  ees1 |
  c:m1 |
  f1 |
  g:m1 |
  bes1 |
  ees1 |
  d:71 |
  g:m1 |
  ees1 |
  c:m1 |
  f1 |
  g:m1 |
  ees1 |
  bes1 |
  d:71 |

  % --- II. Convergence ---
  ees1 |
  bes1 |
  ees1 |
  bes1 |
  ees1 |
  bes1 |
  ees1 |
  bes1 |
  ees1 |
  bes1 |
  ees1 |
  bes1 |
  ees1 |
  bes1 |
  ees1 |
  bes1 |
  ees1 |
  bes1 |
  ees1 |
  bes1 |
  ees1 |
  bes1 |
  ees1 |
  bes1 |

  % --- III. Strange Unison ---
  bes1 |
  f1:sus4 |
  bes1 |
  f1:sus4 |
  bes1 |
  f1:sus4 |
  bes1 |
  f1:sus4 |
  bes1 |
  f1:sus4 |
  bes1 |
  f1:sus4 |
  bes1 |
  f1:sus4 |
  bes1 |
  f1:sus4 |
  bes1 |
  f1:sus4 |
  bes1 |
  f1:sus4 |
  s1 |
  s1 |
  bes1 |
  bes1 |
}

snarePart = \drummode {

  % --- I. The Anxious Crowded Room (mm. 1-28) ---
  \time 4/4 \tempo "Inquieto e Ansioso" 4 = 132
  r8 sn16\p sn r8 sn8-> r16 sn sn8 r8 sn8-> |
  cymr4:32\p\<^\markup { \italic roll w/ marimba mallets on susp. ride } cymr4\! r8 sn16\p sn r8 sn8-> |
  r8 sn16\p sn r8 sn8-> r16 sn sn8 r8 sn8-> |
  cymr4:32\p\<^\markup { \italic roll w/ marimba mallets on susp. ride } cymr4\! r8 sn16\p sn r8 sn8-> |
  r8 sn16\p sn r8 sn8-> r16 sn sn8 r8 sn8-> |
  cymr4:32\p\<^\markup { \italic roll w/ marimba mallets on susp. ride } cymr4\! r8 sn16\p sn r8 sn8-> |
  r8 sn16\p sn r8 sn8-> r16 sn sn8 r8 sn8-> |
  cymr4:32\p\<^\markup { \italic roll w/ marimba mallets on susp. ride } cymr4\! r8 sn16\p sn r8 sn8-> |
  r8 sn16\p sn r8 sn8-> r16 sn sn8 r8 sn8-> |
  cymr4:32\p\<^\markup { \italic roll w/ marimba mallets on susp. ride } cymr4\! r8 sn16\p sn r8 sn8-> |
  r8 sn16\p sn r8 sn8-> r16 sn sn8 r8 sn8-> |
  cymr4:32\p\<^\markup { \italic roll w/ marimba mallets on susp. ride } cymr4\! r8 sn16\p sn r8 sn8-> |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |
  sn8->\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |

  % --- II. Convergence (mm. 29-52) ---
  \tempo "Lirico e Convergente" 4 = 92
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |
  r4 sn8\mp sn r4 sn |

  % --- III. Strange Unison (Breathe as One) (mm. 53-76) ---
  \tempo "Maestoso e Solenne — Come Unico Respiro" 4 = 68
  cymr1:32\p\<^\markup { \italic roll w/ marimba mallets } \! |
  r2 sn4\p r |
  r2 sn4\p r |
  r2 sn4\p r |
  cymr1:32\p\<^\markup { \italic roll w/ marimba mallets } \! |
  r2 sn4\p r |
  r2 sn4\p r |
  r2 sn4\p r |
  cymr1:32\p\<^\markup { \italic roll w/ marimba mallets } \! |
  r2 sn4\p r |
  r2 sn4\p r |
  r2 sn4\p r |
  cymr1:32\p\<^\markup { \italic roll w/ marimba mallets } \! |
  r2 sn4\p r |
  r2 sn4\p r |
  r2 sn4\p r |
  cymr1:32\p\<^\markup { \italic roll w/ marimba mallets } \! |
  r2 sn4\p r |
  r2 sn4\p r |
  r2 sn4\p r |
  R1\fermata |
  R1\fermata |
  cymr1:32\f\<^\markup { \italic roll w/ marimba mallets on susp. ride } ~ |
  cymr1\fermata\ff |
  \bar "|."
}

bassDrumPart = \drummode {

  % --- I. The Anxious Crowded Room ---
  \time 4/4
  r8 bd4\p r8 bd4\p r4 |
  bd4\f r8 bd8 r4 bd8 r8 |
  r8 bd4\p r8 bd4\p r4 |
  bd4\f r8 bd8 r4 bd8 r8 |
  r8 bd4\p r8 bd4\p r4 |
  bd4\f r8 bd8 r4 bd8 r8 |
  r8 bd4\p r8 bd4\p r4 |
  bd4\f r8 bd8 r4 bd8 r8 |
  r8 bd4\p r8 bd4\p r4 |
  bd4\f r8 bd8 r4 bd8 r8 |
  r8 bd4\p r8 bd4\p r4 |
  bd4\f r8 bd8 r4 bd8 r8 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |
  bd4 r8 bd8 bd4 r4 |

  % --- II. Convergence ---
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |
  bd4\mp r r bd |

  % --- III. Strange Unison ---
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  bd2\pp bd |
  R1\fermata |
  R1\fermata |
  bd1\ff ~ |
  bd1\fermata |
  \bar "|."
}

timpaniPart = \fixed c, {

  % --- I. The Anxious Crowded Room ---
  \time 4/4 \clef bass
  f,4\p r8 f,8 r4 r8 f,8 |
  bes,,4\p r8 bes,,8 r2 |
  f,4\p r8 f,8 r4 r8 f,8 |
  bes,,4\p r8 bes,,8 r2 |
  f,4\p r8 f,8 r4 r8 f,8 |
  bes,,4\p r8 bes,,8 r2 |
  f,4\p r8 f,8 r4 r8 f,8 |
  bes,,4\p r8 bes,,8 r2 |
  f,4\p r8 f,8 r4 r8 f,8 |
  bes,,4\p r8 bes,,8 r2 |
  f,4\p r8 f,8 r4 r8 f,8 |
  bes,,4\p r8 bes,,8 r2 |
  bes,,4\f r8 bes,,8 bes,,4 r4 |
  bes,,4\f r8 bes,,8 bes,,4 r4 |
  f,4\f r8 f,8 f,4 r4 |
  f,4\f r8 f,8 f,4 r4 |
  bes,,4\f r8 bes,,8 bes,,4 r4 |
  bes,,4\f r8 bes,,8 bes,,4 r4 |
  f,4\f r8 f,8 f,4 r4 |
  f,4\f r8 f,8 f,4 r4 |
  bes,,4\f r8 bes,,8 bes,,4 r4 |
  bes,,4\f r8 bes,,8 bes,,4 r4 |
  f,4\f r8 f,8 f,4 r4 |
  f,4\f r8 f,8 f,4 r4 |
  bes,,4\f r8 bes,,8 bes,,4 r4 |
  bes,,4\f r8 bes,,8 bes,,4 r4 |
  f,4\f r8 f,8 f,4 r4 |
  f,4\f r8 f,8 f,4 r4 |

  % --- II. Convergence ---
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |
  bes,,2\mp f, |

  % --- III. Strange Unison ---
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  bes,,1\p |
  R1\fermata |
  R1\fermata |
  bes,,1\ff ~ |
  bes,,1\fermata |
  \bar "|."
}

bellsPart = \fixed c''' {

  % --- I. The Anxious Crowded Room ---
  \time 4/4 \key g \minor \clef treble
  R1 |
  R1 |
  R1 |
  R1 |
  r8 d'''16\p ees''' r8 d'''16 ees''' d'''8 r r4 |
  r8 d'''16\p ees''' r8 d'''16 ees''' d'''8 r r4 |
  r8 d'''16\p ees''' r8 d'''16 ees''' d'''8 r r4 |
  r8 d'''16\p ees''' r8 d'''16 ees''' d'''8 r r4 |
  r8 d'''16\p ees''' r8 d'''16 ees''' d'''8 r r4 |
  r8 d'''16\p ees''' r8 d'''16 ees''' d'''8 r r4 |
  r8 d'''16\p ees''' r8 d'''16 ees''' d'''8 r r4 |
  r8 d'''16\p ees''' r8 d'''16 ees''' d'''8 r r4 |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |
  bes''8\f r d'''16 ees''' d'''8 c'''4 bes''8 r |

  % --- II. Convergence --- \key bes \major
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |
  d'''2\mp c''' |

  % --- III. Strange Unison ---
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  bes''1\f |
  R1\fermata |
  R1\fermata |
  bes''1\ff ~ |
  bes''1\fermata |
  \bar "|."
}

marimbaPart = \fixed c' {

  % --- I. The Anxious Crowded Room ---
  \time 4/4 \key g \minor \clef treble
  R1 |
  R1 |
  R1 |
  R1 |
  g8\p r d'16 ees' d'8 r g d'4 |
  g8\p r d'16 ees' d'8 r g d'4 |
  g8\p r d'16 ees' d'8 r g d'4 |
  g8\p r d'16 ees' d'8 r g d'4 |
  g8\p r d'16 ees' d'8 r g d'4 |
  g8\p r d'16 ees' d'8 r g d'4 |
  g8\p r d'16 ees' d'8 r g d'4 |
  g8\p r d'16 ees' d'8 r g d'4 |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |
  g8 r bes16 c' bes8 a4 g8 r |

  % --- II. Convergence --- \key bes \major
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |
  f'2\mp d' |

  % --- III. Strange Unison ---
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  bes1\f |
  R1\fermata |
  R1\fermata |
  bes1\ff ~ |
  bes1\fermata |
  \bar "|."
}

leadPart = \fixed c' {

  % --- I. The Anxious Crowded Room ---
  \time 4/4 \key g \minor \clef treble
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
  bes'4.\f c''8 bes'4 g' |
  bes'4.\f c''8 bes'4 g' |
  bes'4.\f c''8 bes'4 g' |
  bes'4.\f c''8 bes'4 g' |
  bes'4.\f c''8 bes'4 g' |
  bes'4.\f c''8 bes'4 g' |
  bes'4.\f c''8 bes'4 g' |
  bes'4.\f c''8 bes'4 g' |
  bes'4.\f c''8 bes'4 g' |
  bes'4.\f c''8 bes'4 g' |
  bes'4.\f c''8 bes'4 g' |
  bes'4.\f c''8 bes'4 g' |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- II. Convergence --- \key bes \major
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  f'4.\mf g'8 f'4 d' |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- III. Strange Unison ---
  bes'2.\f( c''4) |
  d''2( bes'2) |
  bes'2.\f( c''4) |
  d''2( bes'2) |
  bes'2.\f( c''4) |
  d''2( bes'2) |
  bes'2.\f( c''4) |
  d''2( bes'2) |
  bes'2.\f( c''4) |
  d''2( bes'2) |
  bes'2.\f( c''4) |
  d''2( bes'2) |
  bes'2.\f( c''4) |
  d''2( bes'2) |
  bes'2.\f( c''4) |
  d''2( bes'2) |
  R1 |
  R1 |
  R1 |
  R1 |
  R1\fermata |
  R1\fermata |
  bes'1\fff-^ ~ |
  bes'1\fermata |
  \bar "|."
}

bassPart = \fixed c, {

  % --- I. The Anxious Crowded Room ---
  \time 4/4 \key g \minor \clef bass
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
  g,2\mf ees, |
  g,2\mf ees, |
  g,2\mf ees, |
  g,2\mf ees, |
  g,2\mf ees, |
  g,2\mf ees, |
  g,2\mf ees, |
  g,2\mf ees, |
  g,2\mf ees, |
  g,2\mf ees, |
  g,2\mf ees, |
  g,2\mf ees, |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- II. Convergence --- \key bes \major
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  bes,,2\mf d, |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |
  R1 |

  % --- III. Strange Unison ---
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  bes,,1\f |
  R1 |
  R1 |
  R1 |
  R1 |
  R1\fermata |
  R1\fermata |
  bes,,1\fff-^ ~ |
  bes,,1\fermata |
  \bar "|."
}

\score {
  <<
    \new ChordNames { \chordTrack }
    \new StaffGroup = "CoreMedley" \with { instrumentName = #"Core Medley" } <<
      \new Staff \with {
        instrumentName = #"Oboe (B♭ Medley Lead)"
        shortInstrumentName = #"Ob."
        midiInstrument = #"oboe"
      } { \leadPart }
      \new Staff \with {
        instrumentName = #"Tuba (Bass Foundation)"
        shortInstrumentName = #"Tuba"
        midiInstrument = #"tuba"
      } { \bassPart }
    >>
    \new StaffGroup = "TunedPercussion" <<
      \new Staff \with {
        instrumentName = #"Bells"
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
      \new DrumStaff \with { instrumentName = #"Snare / Susp. Cymbal" shortInstrumentName = #"Sn./Susp." } { \snarePart }
      \new DrumStaff \with { instrumentName = #"Bass Drum" shortInstrumentName = #"B.D." } { \bassDrumPart }
    >>
  >>
  \layout { }
}