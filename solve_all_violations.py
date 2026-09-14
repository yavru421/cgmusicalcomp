import subprocess
import os

score_template = r"""\version "2.24.0"

\header {
  title = "Moonlight Samba"
  subtitle = "Adagio Maestoso con Samba — For Concert Band"
  composer = "Ludwig van Beethoven"
  arranger = "John Daniel Dondlinger"
  tagline = "Dedicated to the Wisconsin Rapids City Band by John Daniel Dondlinger"
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
  \key cis \minor
  \time 4/4
}

% =======================================================================
% 1. LEAD FLUTE (Concert Pitch) — Range: Eb4 - F6 (MIDI 63 - 89)
% =======================================================================
fluteConcert = \relative c'' {
  \global
  \clef treble
  \tempo "Samba Energico" 4 = 140
  % Intro (mm. 1-8)
  R1 * 8 |
  
  % Section A: First Theme (mm. 9-16) - Authentic Beethoven Theme
  r4. gis8\f ~ gis8 gis16 gis gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4\f gis8 fis4. a8 |
  gis1 ~ |
  gis4 r8 gis8 ~ gis8 gis16 gis gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4 gis8 fis4. a8 |
  gis2 ~ gis8 fis e dis |
  
  % Section B: Driving Counterpoint & Lead (mm. 17-24)
  cis'8\ff dis e fis gis a b cis |
  d4. cis8 b4 a |
  gis4. fis8 e4 dis |
  cis2. r4 |
  e4.(\ff dis8 cis4. dis8 |
  e4. fis8 gis2) |
  fis4.( e8 dis4. fis8 |
  e1\ff) |
  
  % Section C: Middle Break & Slowdown (mm. 25-32)
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  R1\p |
  r2. gis4\pp |
  gis4. gis8 gis2 |
  a4. gis8 fis4. a8 |
  gis1 ~ |
  gis4. gis8 a4. b8 |
  cis4. b8 a4. gis8 |
  fis4. e8 dis2\fermata |
  
  % Section D: Reprise & Climax (mm. 33-44)
  \tempo "A Tempo - Samba Feroce" 4 = 144
  R1 |
  r4. gis8\ff ~ gis8 gis16 gis gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4 gis8 fis4. a8 |
  gis2 ~ gis8 gis fis e |
  dis4. e8 dis4. e8 |
  cis'8 dis e fis gis a b cis |
  d4. cis8 b4 a |
  gis8\fff r gis r gis4 gis8 gis |
  a8 r a r a4 a8 a |
  b8 r b r bis4 bis8 bis |
  cis1\fff \bar "|."
}

% =======================================================================
% 2. OBOE (Concert Pitch) — Range: D4 - Eb5 (MIDI 62 - 75)
% =======================================================================
oboeConcert = \relative c' {
  \global
  \clef treble
  \tempo "Samba Energico" 4 = 140
  R1 * 8 |
  r4. gis'8\mf ~ gis8 gis16 gis gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4 gis8 fis4. a8 |
  gis1 ~ |
  gis4 r8 gis8 ~ gis8 gis16 gis gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4 gis8 fis4. a8 |
  gis2 ~ gis8 fis e dis |
  e4\ff e e e |
  fis4. e8 fis4 e |
  gis4. fis8 e4 dis |
  e2. r4 |
  e4(\mf dis8. e16 fis4 e8 dis |
  e4. e8 e2) |
  dis8( e fis gis a4. fis8 |
  gis1\ff) |
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  R1 * 2 |
  e4.\pp e8 fis4. gis8 |
  a4. gis8 fis4. e8 |
  dis4. dis8 dis2 |
  e4. e8 fis4. gis8 |
  a4. gis8 fis4. e8 |
  dis2\fermata r2 |
  \tempo "A Tempo - Samba Feroce" 4 = 144
  R1 |
  r4. gis8\ff ~ gis8 gis16 gis gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4 gis8 fis4. a8 |
  gis2 ~ gis8 gis fis e |
  dis4. e8 dis4. e8 |
  e4\ff e e e |
  fis4. e8 fis4 e |
  gis8\fff r gis r gis4 gis8 gis |
  a8 r a r a4 a8 a |
  gis8 r gis r gis4 gis8 gis |
  gis1\fff \bar "|."
}

% =======================================================================
% 3. B♭ CLARINET (Concert Pitch) — Range: D3 - G5 (MIDI 50 - 79)
% =======================================================================
clarinetConcert = \relative c' {
  \global
  \clef treble
  \tempo "Samba Energico" 4 = 140
  % Intro (mm. 1-8)
  r8 gis16\p cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 a16 cis e8 a,16 cis e8 a,16 cis e8 a, |
  r8 gis16 bis dis8 gis,16 bis dis8 gis,16 bis dis8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 a16 cis e8 a,16 cis e8 a,16 cis e8 a, |
  r8 gis16 bis dis8 gis,16 bis dis8 gis,16 bis dis8 gis, |
  
  % Section A (mm. 9-16)
  r8 gis16\f cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 a16 cis fis8 a,16 cis fis8 a,16 cis fis8 a, |
  r8 gis16 bis dis8 gis,16 bis dis8 gis,16 bis dis8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 a16 cis fis8 a,16 cis fis8 a,16 cis fis8 a, |
  r8 gis16 bis dis8 gis,16 bis dis8 gis,16 bis dis8 gis, |
  
  % Section B (mm. 17-24)
  cis16\ff dis e fis gis8 cis, cis16 dis e fis gis8 cis, |
  d16 e fis g a8 d, d16 e fis g a8 d, |
  gis16 bis dis fis dis8 bis fis'16 dis bis gis dis'8 gis, |
  cis2. r4 |
  r8 cis16 e gis8 cis,16 e gis8 cis,16 e gis8 cis, |
  r8 d16 fis a8 d,16 fis a8 d,16 fis a8 d, |
  r8 bis16 dis fis8 bis,16 dis fis8 bis,16 dis fis8 bis, |
  cis1\ff |
  
  % Section C: Middle Break & Slowdown (mm. 25-32)
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  \tuplet 3/2 4 {
    gis8\pp cis e gis, cis e gis, cis e gis, cis e |
    gis, cis e gis, cis e gis, cis e gis, cis e |
    a, cis e a, cis e a, cis e a, cis e |
    gis, bis dis gis, cis e gis, bis dis gis, cis e |
    gis, cis e gis, cis e gis, cis e gis, cis e |
    gis, cis e gis, cis e gis, cis e gis, cis e |
    a, cis e a, cis e a, cis e a, cis e |
    gis, bis dis gis, cis e
  }
  gis,2\fermata |
  
  % Section D: Reprise (mm. 33-44)
  \tempo "A Tempo - Samba Feroce" 4 = 144
  R1 |
  r8 gis16\ff cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 a16 cis fis8 a,16 cis fis8 a,16 cis fis8 a, |
  r8 gis16 bis dis8 gis,16 bis dis8 gis,16 bis dis8 gis, |
  r8 gis16 bis dis8 gis,16 bis dis8 gis,16 bis dis8 gis, |
  cis16 dis e fis gis8 cis, cis16 dis e fis gis8 cis, |
  d16 e fis g a8 d, d16 e fis g a8 d, |
  cis8\fff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  bis8 r bis r bis4 bis8 bis |
  cis1\fff \bar "|."
}

% =======================================================================
% 4. ALTO SAXOPHONE (Concert Pitch) — Range: E3 - F5 (MIDI 52 - 77)
% =======================================================================
altoSaxConcert = \relative c' {
  \global
  \clef treble
  \tempo "Samba Energico" 4 = 140
  R1 * 2 |
  r4 cis\mf e4. cis8 |
  bis2 cis |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 e4. ~ e4 e8 e |
  r8 e4. e4 e8 e |
  dis2\f r4 dis8 dis |
  e4.\f dis8 cis4. e8 |
  gis4. fis8 e2 |
  a4. fis8 a4. fis8 |
  gis2 r4 gis8 gis |
  e4. dis8 cis4. e8 |
  gis4. a8 b2 |
  a4. fis8 a4. fis8 |
  gis2. r4 |
  cis8\ff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  bis8 r bis r bis4 bis8 bis |
  cis2. r4 |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 d4. ~ d4 d8 d |
  r8 bis4. bis4 bis8 bis |
  cis1\ff |
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  cis1\pp ~ |
  cis1 |
  cis2 e |
  bis2 cis |
  cis1 ~ |
  cis1 |
  cis2 e |
  bis2\fermata r2 |
  \tempo "A Tempo - Samba Feroce" 4 = 144
  R1 |
  r8 cis4.\ff ~ cis4 cis8 cis |
  r8 e4. ~ e4 e8 e |
  r8 e4. e4 e8 e |
  r8 bis4. cis4 cis8 cis |
  r8 bis4. cis4 cis8 cis |
  cis8 r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  cis8\fff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  bis8 r bis r bis4 bis8 bis |
  cis1\fff \bar "|."
}

% =======================================================================
% 5. TENOR SAXOPHONE (Concert Pitch) — Range: B2 - C5 (MIDI 47 - 72)
% =======================================================================
tenorSaxConcert = \relative c {
  \global
  \clef treble
  \tempo "Samba Energico" 4 = 140
  R1 * 4 |
  r4 cis'8\f cis r4 cis |
  r4 b8\f cis r2 |
  r4 a8\f a r4 cis |
  gis2\f cis |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 b4. cis2 |
  r8 a4.\f cis4 cis8 cis |
  gis2 cis4 r |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 b4. cis2 |
  r8 a4.\f cis4 cis8 cis |
  gis1\f |
  cis8\ff dis e fis gis a b cis |
  d4. cis8 b4 a |
  gis4. fis8 e4 dis |
  cis2. r4 |
  cis8\f cis r cis cis4 cis |
  d8 d r d d4 d |
  bis8 bis r bis bis4 bis |
  cis1\ff |
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  cis1\pp |
  b1 |
  a2 cis |
  gis1 |
  cis1 |
  b1 |
  a2 cis |
  cis2\fermata r2 |
  \tempo "A Tempo - Samba Feroce" 4 = 144
  r2.. gis'8\ff |
  cis4.\ff b8 a4. b8 |
  cis4. d8 e2 |
  d4. cis8 b4. d8 |
  cis2 dis8 e fis dis |
  e4. fis8 e4. fis8 |
  cis8 dis e fis gis a b cis |
  d4. cis8 b4 a |
  cis8\fff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  gis8 r gis r gis4 gis8 gis |
  cis,1\fff \bar "|."
}

% =======================================================================
% 6. B♭ TRUMPET (Concert Pitch) — Range: Bb3 - F5 (MIDI 58 - 77)
% =======================================================================
trumpetConcert = \relative c' {
  \global
  \clef treble
  \tempo "Samba Energico" 4 = 140
  % Intro (mm. 1-8) - Trumpet enters in m. 5
  R1 * 4 |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 e4.\f ~ e4 e8 e |
  r8 e4. cis4. cis8 |
  bis2\f r8 dis\f e fis |
  
  % Section A: Call & Response (mm. 9-16)
  gis4.\f gis8 ~ gis4 gis8 gis |
  b4. a8 gis2 |
  fis4. e8 dis4. fis8 |
  e2 r8 bis\f cis dis |
  e4.\f dis8 cis4. dis8 |
  e4. fis8 gis2 |
  fis4. e8 dis4. fis8 |
  e2. r4 |
  
  % Section B: High Brass Lead (mm. 17-24)
  e8\ff fis gis a gis a b cis |
  d4. cis8 b4 a |
  gis4. fis8 e4 dis |
  cis2. r4 |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 d4. ~ d4 d8 d |
  r8 bis4. bis4 bis8 bis |
  cis1\ff |
  
  % Section C: Middle Break & Slowdown (mm. 25-32)
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  R1 * 3 |
  r2 r8 dis\p e fis |
  e1 ~ |
  e4. e8 fis4. gis8 |
  a4. gis8 fis4. e8 |
  dis4. cis8 bis2\fermata |
  
  % Section D: Reprise & Lead (mm. 33-44)
  \tempo "A Tempo - Samba Feroce" 4 = 144
  r2.. gis8\ff |
  cis4.\ff b8 a4. b8 |
  cis4. d8 e2 |
  d4. cis8 b4. d8 |
  cis2 dis8 e fis dis |
  e4. fis8 e4. fis8 |
  e8 fis gis a gis a b cis |
  d4. cis8 b4 a |
  cis8\fff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  bis8 r bis r bis4 bis8 bis |
  cis1\fff \bar "|."
}

% =======================================================================
% 7. FRENCH HORN IN F (Concert Pitch) — Range: Bb3 - F5 (MIDI 58 - 77)
% =======================================================================
hornConcert = \relative c'' {
  \global
  \clef treble
  \tempo "Samba Energico" 4 = 140
  R1 * 2 |
  r4 cis\mf e4. cis8 |
  bis2 cis |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 e4. ~ e4 e8 e |
  r8 e4. e4 e8 e |
  dis2\f r4 dis8 dis |
  e4.\f dis8 cis4. e8 |
  gis4. fis8 e2 |
  a4. fis8 a4. fis8 |
  gis2 r4 gis8 gis |
  e4. dis8 cis4. e8 |
  gis4. a8 b2 |
  a4. fis8 a4. fis8 |
  gis2. r4 |
  cis8\ff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  bis8 r bis r bis4 bis8 bis |
  cis2. r4 |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 d4. ~ d4 d8 d |
  r8 bis4. bis4 bis8 bis |
  cis1\ff |
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  cis1\pp ~ |
  cis1 |
  cis2 e |
  bis2 cis |
  cis1 ~ |
  cis1 |
  cis2 e |
  bis2\fermata r2 |
  \tempo "A Tempo - Samba Feroce" 4 = 144
  R1 |
  r8 cis4.\ff ~ cis4 cis8 cis |
  r8 e4. ~ e4 e8 e |
  r8 e4. e4 e8 e |
  r8 bis4. cis4 cis8 cis |
  r8 bis4. cis4 cis8 cis |
  cis8 r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  cis8\fff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  bis8 r bis r bis4 bis8 bis |
  cis1\fff \bar "|."
}

% =======================================================================
% 8. TROMBONE (Concert Pitch) — Range: Eb2 - G4 (MIDI 39 - 67)
% =======================================================================
tromboneConcert = \relative c {
  \global
  \clef bass
  \tempo "Samba Energico" 4 = 140
  R1 * 4 |
  r4 cis8\f cis r4 cis |
  r4 b8\f cis r2 |
  r4 a8\f a r4 cis |
  gis2\f cis |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 b4. cis2 |
  r8 a4.\f cis4 cis8 cis |
  gis2 cis4 r |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 b4. cis2 |
  r8 a4.\f cis4 cis8 cis |
  gis1\f |
  cis8\ff dis e fis gis a b c |
  d4. c8 b4 a |
  gis4. fis8 e4 dis |
  cis2. r4 |
  cis8\f cis r cis cis4 cis |
  d8 d r d d4 d |
  bis8 bis r bis bis4 bis |
  cis2\ff gis\fff |
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  cis1\pp |
  b1 |
  a2 cis |
  gis1 |
  cis1 |
  b1 |
  a2 cis |
  cis2 gis\fermata |
  \tempo "A Tempo - Samba Feroce" 4 = 144
  r2.. gis8\ff |
  c4.\ff b8 a4. b8 |
  c4. d8 e2 |
  d4. c8 b4. d8 |
  c2 dis8 e fis dis |
  e4. fis8 e4. fis8 |
  cis8 dis e fis gis a b c |
  d4. c8 b4 a |
  c8\fff r c r c4 c8 c |
  d8 r d r d4 d8 d |
  gis,8 r gis, r gis4 gis8 gis |
  cis1\fff \bar "|."
}

% =======================================================================
% 9. EUPHONIUM (Concert Pitch) — Range: Eb2 - G4 (MIDI 39 - 67)
% =======================================================================
euphoniumConcert = \relative c {
  \global
  \clef bass
  \tempo "Samba Energico" 4 = 140
  R1 * 4 |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 e4. ~ e4 e8 e |
  r8 e4. cis4. cis8 |
  bis2\f r4 cis8 dis |
  e4.\f dis8 cis4. e8 |
  gis4. fis8 e2 |
  a4. fis8 a4. fis8 |
  gis2 r4 gis8 gis |
  e4. dis8 cis4. e8 |
  gis4. a8 b2 |
  a4. fis8 a4. fis8 |
  gis2. r4 |
  cis8\ff dis e fis gis a b c |
  d4. c8 b4 a |
  gis4. fis8 e4 dis |
  cis2. r4 |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 d4. ~ d4 d8 d |
  r8 bis4. bis4 bis8 bis |
  cis1\ff |
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  cis1\pp ~ |
  cis1 |
  cis2 e |
  bis2 cis |
  cis1 ~ |
  cis1 |
  cis2 e |
  bis2\fermata r2 |
  \tempo "A Tempo - Samba Feroce" 4 = 144
  R1 |
  r8 cis4.\ff ~ cis4 cis8 cis |
  r8 e4. ~ e4 e8 e |
  r8 e4. e4 e8 e |
  r8 bis4. cis4 cis8 cis |
  r8 bis4. cis4 cis8 cis |
  cis8 r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  cis8\fff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  bis8 r bis r bis4 bis8 bis |
  cis1\fff \bar "|."
}

% =======================================================================
% 10. TUBA (Concert Pitch) — Range: Bb1 - F3 (MIDI 34 - 53)
% =======================================================================
tubaConcert = \relative c {
  \global
  \clef bass
  \tempo "Samba Energico" 4 = 140
  % Intro (mm. 1-8) - Grounded in C2-C3 register (MIDI 36-49)
  cis4.\f cis8 ~ cis4 cis |
  b4. b8 ~ b4 b |
  a4. a8 ~ a4 cis |
  gis4. gis8 ~ gis4 gis |
  cis4. cis8 ~ cis4 cis |
  b4. b8 ~ b4 b |
  a4. a8 ~ a4 cis |
  gis2\f\> cis4\p r |
  
  % Section A (mm. 9-16)
  cis4.\f cis8 ~ cis4 cis |
  b4. b8 ~ b4 b |
  a4. a8 ~ a4 cis |
  gis4. gis8 ~ gis4 gis |
  cis4. cis8 ~ cis4 cis |
  b4. b8 ~ b4 b |
  a4. a8 ~ a4 cis |
  gis1\f |
  
  % Section B (mm. 17-24)
  cis4.\ff cis8 ~ cis4 cis |
  d4. d8 ~ d4 d |
  bis4. bis8 bis4 bis |
  cis2. r4 |
  cis4.\f cis8 ~ cis4 cis |
  d4. d8 ~ d4 d |
  bis4. bis8 bis4 bis |
  cis1\ff |
  
  % Section C: Middle Break & Slowdown (mm. 25-32)
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  cis1\pp |
  b1 |
  a2 cis |
  gis1 |
  cis1 |
  b1 |
  a2 cis |
  gis1\fermata |
  
  % Section D: Reprise (mm. 33-44)
  \tempo "A Tempo - Samba Feroce" 4 = 144
  R1 |
  cis4.\ff cis8 ~ cis4 cis |
  b4. b8 ~ b4 b |
  a4. a8 ~ a4 cis |
  gis4. gis8 ~ gis4 gis |
  gis4. gis8 ~ gis4 gis |
  cis8 cis r cis cis4 cis |
  d8 d r d d4 d |
  cis8\fff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  gis8 r gis r gis4 gis8 gis |
  cis,1\fff \bar "|."
}

% =======================================================================
% 11. GLOCKENSPIEL (Concert Pitch) — Range: Bb5 - D7 (MIDI 70 - 98)
% =======================================================================
glockenspielConcert = \relative c'''' {
  \global
  \clef treble
  \tempo "Samba Energico" 4 = 140
  R1 * 8 |
  r4. gis8\f ~ gis8 gis16 gis gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4 gis8 fis4. a8 |
  gis1 ~ |
  gis4 r8 gis8 ~ gis8 gis16 gis gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4 gis8 fis4. a8 |
  gis2 ~ gis8 fis e dis |
  cis8\ff dis e fis gis a b cis |
  d4. cis8 b4 a |
  gis4. fis8 e4 dis |
  cis2. r4 |
  R1 * 3 |
  cis1\ff |
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  R1 * 8 |
  \tempo "A Tempo - Samba Feroce" 4 = 144
  R1 |
  r4. gis8\ff ~ gis8 gis16 gis gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4 gis8 fis4. a8 |
  gis2 ~ gis8 gis fis e |
  dis4. e8 dis4. e8 |
  cis8 dis e fis gis a b cis |
  d4. cis8 b4 a |
  gis8\fff r gis r gis4 gis8 gis |
  a8 r a r a4 a8 a |
  b8 r b r bis4 bis8 bis |
  cis1\fff \bar "|."
}

% =======================================================================
% 12. PERCUSSION 1: CONCERT SNARE DRUM & BASS DRUM
% =======================================================================
percussionOne = \drummode {
  <<
    {
      \repeat unfold 7 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      sn4 sn8 sn sn2:32 |
      \repeat unfold 15 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      sn8\ff sn16 sn sn8 sn sn2:32\fermata |
      sn4\pp r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn2:32\fermata\pp r2 |
      sn16\fff sn sn sn toml toml tommh tommh toml toml tommh tommh sn8 sn |
      \repeat unfold 7 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      sn8\fff sn16 sn sn8 sn sn4 sn |
      sn8 sn16 sn sn8 sn sn4 sn |
      sn8 sn sn sn sn2:32 |
      sn1\fff \bar "|."
    }
    \\
    {
      \repeat unfold 7 {
        bd4\f r8 bd bd4 r8 bd |
      }
      bd4 bd bd2 |
      \repeat unfold 15 {
        bd4\f r8 bd bd4 r8 bd |
      }
      bd4 bd bd2\fermata |
      bd4\pp r bd r |
      bd4 r bd r |
      bd4 r bd r |
      bd4 r bd r |
      bd4 r bd r |
      bd4 r bd r |
      bd4 r bd r |
      bd1\fermata\pp |
      bd4\fff r r2 |
      \repeat unfold 7 {
        bd4\f r8 bd bd4 r8 bd |
      }
      bd4\fff r8 bd bd4 r8 bd |
      bd4 r8 bd bd4 r8 bd |
      bd4 bd bd bd |
      bd1\fff \bar "|."
    }
  >>
}

% =======================================================================
% 13. PERCUSSION 2: CYMBALS (CRASH & SUSPENDED)
% =======================================================================
percussionTwo = \drummode {
  \repeat unfold 7 {
    cymc4\mf r r2 |
  }
  cymc4 cymc cymc2:32 |
  \repeat unfold 15 {
    cymc4\f r r2 |
  }
  cymc1:32\fermata\ff |
  R1 * 7 |
  cyms1:32\fermata\pp |
  cymc4\fff r r2 |
  \repeat unfold 7 {
    cymc4\f r r2 |
  }
  cymc4\fff r cymc r |
  cymc4 r cymc r |
  cymc2:32 cymc2:32 |
  cymc1:32\fff \bar "|."
}

% =======================================================================
% 14. PERCUSSION 3: AUXILIARY LATIN (AGOGO & CABASA)
% =======================================================================
percussionThree = \drummode {
  <<
    {
      \repeat unfold 8 {
        cb4\f cb8 cb r cb cb4 |
      }
      \repeat unfold 16 {
        cb4\f cb8 cb r cb cb4 |
      }
      \repeat unfold 7 {
        cb4\pp r cb r |
      }
      cb1\fermata\pp |
      r1 |
      \repeat unfold 7 {
        cb4 cb8 cb r cb cb4 |
      }
      cb8\fff cb r cb cb4 cb8 cb |
      cb8 r cb r cb4 cb8 cb |
      cb8 cb cb cb cb4 cb |
      cb1\fff \bar "|."
    }
    \\
    {
      \repeat unfold 8 {
        cab16 cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      }
      \repeat unfold 16 {
        cab16 cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      }
      \repeat unfold 7 {
        cab4\pp r cab r |
      }
      cab1\fermata\pp |
      r1 |
      \repeat unfold 7 {
        cab16 cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      }
      cab4\fff cab cab cab |
      cab4 cab cab cab |
      cab4 cab cab cab |
      cab1\fff \bar "|."
    }
  >>
}

% =======================================================================
% 15. PERCUSSION 4: TIMPANI (Tuned to C# and G#) — Range: F2 - Eb3 (MIDI 41 - 63)
% =======================================================================
timpaniConcert = \relative c {
  \global
  \clef bass
  \tempo "Samba Energico" 4 = 140
  R1 * 4 |
  cis4.\f cis8 ~ cis4 cis |
  gis4. gis8 ~ gis4 gis |
  cis4. cis8 ~ cis4 cis |
  gis2\f\> cis4\p r |
  cis4.\f cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  gis4. gis8 ~ gis4 gis |
  cis4.\f cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  gis1\f |
  cis4\ff r cis r |
  cis4 r cis r |
  gis4 r gis r |
  cis2. r4 |
  cis4.\f cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  gis4. gis8 ~ gis4 gis |
  cis2:32\ff cis4:32\fermata r |
  R1 * 8 |
  \tempo "A Tempo - Samba Feroce" 4 = 144
  r2.. gis8\ff |
  cis4.\ff cis8 cis4. cis8 |
  cis4. cis8 cis2 |
  cis4. cis8 cis4. cis8 |
  cis2 ~ cis8 cis cis cis |
  gis4. gis8 gis4. gis8 |
  cis4. cis8 cis4 cis |
  cis8 r cis r cis4 cis8 cis |
  cis8\fff r cis r cis4 cis8 cis |
  cis8 r cis r cis4 cis8 cis |
  gis8 r gis r gis4 gis8 gis |
  cis1:32\fff \bar "|."
}

% =======================================================================
% VISUAL ENGRAVED SCORE
% =======================================================================
\score {
  <<
    \new StaffGroup = "Woodwinds" <<
      \new Staff \with { instrumentName = #"Flute" shortInstrumentName = #"Fl." } { \fluteConcert }
      \new Staff \with { instrumentName = #"Oboe" shortInstrumentName = #"Ob." } { \oboeConcert }
      \new Staff \with { instrumentName = #"B♭ Clarinet" shortInstrumentName = #"Cl." } { \transpose bes c' \clarinetConcert }
      \new Staff \with { instrumentName = #"Alto Saxophone" shortInstrumentName = #"A.Sax" } { \transpose ees c' \altoSaxConcert }
      \new Staff \with { instrumentName = #"Tenor Saxophone" shortInstrumentName = #"T.Sax" } { \transpose bes c \tenorSaxConcert }
    >>
    \new StaffGroup = "Brass" <<
      \new Staff \with { instrumentName = #"B♭ Trumpet" shortInstrumentName = #"Tpt." } { \transpose bes c' \trumpetConcert }
      \new Staff \with { instrumentName = #"Horn in F" shortInstrumentName = #"Hn." } { \transpose f c' \hornConcert }
      \new Staff \with { instrumentName = #"Trombone" shortInstrumentName = #"Tbn." } { \tromboneConcert }
      \new Staff \with { instrumentName = #"Euphonium" shortInstrumentName = #"Euph." } { \euphoniumConcert }
      \new Staff \with { instrumentName = #"Tuba" shortInstrumentName = #"Tba." } { \tubaConcert }
    >>
    \new StaffGroup = "PitchedPercussion" <<
      \new Staff \with { instrumentName = #"Glockenspiel" shortInstrumentName = #"Glock." } { \glockenspielConcert }
    >>
    \new StaffGroup = "BatteryPercussion" <<
      \new DrumStaff \with { instrumentName = #"Percussion 1 (SD/BD)" shortInstrumentName = #"Perc. 1" } { \percussionOne }
      \new DrumStaff \with { instrumentName = #"Percussion 2 (Cymbals)" shortInstrumentName = #"Perc. 2" } { \percussionTwo }
      \new DrumStaff \with { instrumentName = #"Percussion 3 (Aux Latin)" shortInstrumentName = #"Perc. 3" } { \percussionThree }
      \new Staff \with { instrumentName = #"Timpani" shortInstrumentName = #"Timp." } { \timpaniConcert }
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
% AUDIO SYNTHESIS SCORE
% =======================================================================
\score {
  \unfoldRepeats <<
    \new Staff \with { midiInstrument = #"flute" } { \fluteConcert }
    \new Staff \with { midiInstrument = #"oboe" } { \oboeConcert }
    \new Staff \with { midiInstrument = #"clarinet" } { \clarinetConcert }
    \new Staff \with { midiInstrument = #"alto sax" } { \altoSaxConcert }
    \new Staff \with { midiInstrument = #"tenor sax" } { \tenorSaxConcert }
    \new Staff \with { midiInstrument = #"trumpet" } { \trumpetConcert }
    \new Staff \with { midiInstrument = #"french horn" } { \hornConcert }
    \new Staff \with { midiInstrument = #"trombone" } { \tromboneConcert }
    \new Staff \with { midiInstrument = #"french horn" } { \euphoniumConcert }
    \new Staff \with { midiInstrument = #"tuba" } { \tubaConcert }
    \new Staff \with { midiInstrument = #"glockenspiel" } { \glockenspielConcert }
    \new DrumStaff \with { midiInstrument = #"standard kit" } { \percussionOne }
    \new DrumStaff \with { midiInstrument = #"standard kit" } { \percussionTwo }
    \new DrumStaff \with { midiInstrument = #"standard kit" } { \percussionThree }
    \new Staff \with { midiInstrument = #"timpani" } { \timpaniConcert }
  >>
  \midi { }
}
"""

with open("Scores/moonlight_samba_score.ly", "w", encoding="utf-8") as f:
    f.write(score_template)
print("Updated Scores/moonlight_samba_score.ly")
