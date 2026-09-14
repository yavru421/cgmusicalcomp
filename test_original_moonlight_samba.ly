\version "2.24.0"
\include "articulate.ly"

\header {
  title = "Moonlight Samba (Original Working Version)"
  subtitle = "Arranged for Concert Band & Percussion Ensemble"
  composer = "Ludwig van Beethoven"
  arranger = "John Daniel Dondlinger"
  tagline = "Composed & Arranged for Wisconsin Rapids City Band by John Daniel Dondlinger"
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
% 1. LEAD FLUTE (Concert Pitch)
% =======================================================================
fluteConcert = \relative c'' {
  \global
  \clef treble
  \tempo "Samba Energico" 4 = 140
  % Intro (mm. 1-8)
  R1 * 8 |
  
  % Section A: First Theme (mm. 9-16)
  r4. gis8\f ~ gis8 gis16 gis gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4\f gis8 fis4. a8 |
  gis1 ~ |
  gis4 r8 gis8 ~ gis8 gis16 gis gis8. gis16 |
  gis4. gis8 gis2 |
  r8 a4 gis8 fis4. a8 |
  gis2 ~ gis8 fis e dis |
  
  % Section B: Driving Counterpoint (mm. 17-24)
  cis8\ff dis e fis gis a b cis |
  d4. cis8 b4 a |
  gis4. fis8 e4 dis |
  cis2. r4 |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 a16 cis e8 a,16 cis e8 a,16 d fis8 a, |
  r8 gis16 bis fis'8 gis,16 bis e8 gis,16 bis dis8 gis, |
  cis1\ff |
  
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
  cis8 dis e fis gis a b cis |
  d4. cis8 b4 a |
  gis8\fff r gis r gis4 gis8 gis |
  a8 r a r a4 a8 a |
  b8 r b r bis4 bis8 bis |
  cis1\fff \bar "|."
}

% =======================================================================
% 2. B♭ TRUMPET (Concert Pitch Definition)
% =======================================================================
trumpetConcert = \relative c' {
  \global
  \clef treble
  \tempo "Samba Energico" 4 = 140
  % Intro (mm. 1-8) - Trumpet enters in m. 5
  R1 * 4 |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 dis4. ~ dis4 dis8 dis |
  r8 e4. d4. cis8 |
  bis2\f r8 dis\f e fis |
  
  % Section A: Call & Response (mm. 9-16)
  gis4.\f gis8 ~ gis4 gis8 a |
  b4. a8 gis2 |
  fis4. e8 dis4. fis8 |
  e2 r8 bis\f cis dis |
  e4.\f dis8 cis4. dis8 |
  e4. fis8 gis2 |
  fis4. e8 dis4. fis8 |
  e2. r4 |
  
  % Section B: High Brass Lead (mm. 17-24)
  e8\ff fis gis a b cis d e |
  fis4. e8 d4 cis |
  bis4. a8 gis4 fis |
  e2. r4 |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 d4. ~ d4 d8 d |
  r8 bis4. ~ bis4 bis8 bis |
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
  cis2 ~ cis8 dis e fis |
  gis4. a8 gis4. a8 |
  e8 fis gis a b cis d e |
  fis4. e8 d4 cis |
  cis8\fff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  bis8 r bis r bis4 bis8 bis |
  cis1\fff \bar "|."
}

% =======================================================================
% 3. FRENCH HORN IN F (Concert Pitch Definition)
% =======================================================================
hornConcert = \relative c' {
  \global
  \clef treble
  \tempo "Samba Energico" 4 = 140
  % Intro (mm. 1-8) - Horn enters in m. 3
  R1 * 2 |
  r4 cis\mf d4. cis8 |
  bis2 cis |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 cis4. ~ cis4 cis8 cis |
  r8 cis4. d4 d8 d |
  bis2\f r4 cis8 dis |
  
  % Section A: Countermelody & Swells (mm. 9-16)
  e4.\f dis8 cis4. e8 |
  gis4. fis8 e2 |
  d4. cis8 bis4. dis8 |
  cis2 r4 cis8 dis |
  e4. dis8 cis4. e8 |
  gis4. a8 b2 |
  a4. gis8 fis4. a8 |
  gis2. r4 |
  
  % Section B: Horn Fanfares (mm. 17-24)
  cis8\ff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  bis8 r bis r bis4 bis8 bis |
  cis2. r4 |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 d4. ~ d4 d8 d |
  r8 bis4. ~ bis4 bis8 bis |
  cis1\ff |
  
  % Section C: Middle Break & Slowdown (mm. 25-32)
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  cis1\pp ~ |
  cis1 |
  cis2 d |
  bis2 cis |
  cis1 ~ |
  cis1 |
  cis2 d |
  bis2\fermata r2 |
  
  % Section D: Reprise (mm. 33-44)
  \tempo "A Tempo - Samba Feroce" 4 = 144
  R1 |
  r8 cis4.\ff ~ cis4 cis8 cis |
  r8 cis4. ~ cis4 cis8 cis |
  r8 cis4. d4 d8 d |
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
% 4. TROMBONE (Concert Pitch, Authentic Tenor Trombone Range C2-G4)
% =======================================================================
tromboneConcert = \relative c {
  \global
  \clef bass
  \tempo "Samba Energico" 4 = 140
  % Intro (mm. 1-8) - Trombone enters in m. 5
  R1 * 4 |
  r4 cis8\f cis r4 cis |
  r4 b,8\f\glissando cis r2 |
  r4 a,8\f a, r4 d |
  gis,2\f\glissando cis |
  
  % Section A: Low Brass Punches & Slides (mm. 9-16)
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 b,4.\glissando cis2 |
  r8 a,4.\f d4 d8 d |
  gis,2\glissando cis4 r |
  r8 cis4.\f ~ cis4 cis8 cis |
  r8 b,4.\glissando cis2 |
  r8 a,4.\f d4 d8 d |
  gis,1\f |
  
  % Section B: Big Brass Rips (mm. 17-24)
  cis8\ff dis e fis gis a b cis' |
  d'4.\glissando cis'8 b4 a |
  gis4.\glissando fis8 e4 dis |
  cis2. r4 |
  cis8\f cis r cis cis4 cis |
  d8 d r d d4 d |
  bis,8 bis, r bis, bis,4 bis, |
  cis2\ff\bendAfter #3 gis2\fff\bendAfter #-4 |
  
  % Section C: Middle Break & Slowdown (mm. 25-32) - Clean Tenor Range
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  cis1\pp |
  b,1 |
  a,2 d |
  gis,1 |
  cis1 |
  b,1 |
  a,2 d |
  cis2 gis,\fermata |
  
  % Section D: Reprise (mm. 33-44)
  \tempo "A Tempo - Samba Feroce" 4 = 144
  r2.. gis8\ff |
  cis'4.\ff b8 a4. b8 |
  cis'4. d'8 e'2 |
  d'4. cis'8 b4. d'8 |
  cis'2 ~ cis'8 dis' e' fis' |
  gis'4. a'8 gis'4. a'8 |
  cis8 dis e fis gis a b cis' |
  d'4. cis'8 b4 a |
  cis'8\fff r cis' r cis'4 cis'8 cis' |
  d'8 r d' r d'4 d'8 d' |
  gis8 r gis r gis4 gis8 gis |
  cis1\fff \bar "|."
}

% =======================================================================
% 5. B♭ CLARINET (Concert Pitch Definition)
% =======================================================================
clarinetConcert = \relative c' {
  \global
  \clef treble
  \tempo "Samba Energico" 4 = 140
  % Intro (mm. 1-8)
  r8 gis16\p cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 a16 cis e8 a,16 cis e8 a,16 d fis8 a, |
  r8 gis16 bis fis'8 gis,16 bis e8 gis,16 bis dis8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 a16 cis e8 a,16 cis e8 a,16 d fis8 a, |
  r8 gis16 bis fis'8 gis,16 bis e8 gis,16 bis dis8 gis, |
  
  % Section A (mm. 9-16)
  r8 gis16\f cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 a16 cis e8 a,16 cis e8 a,16 d fis8 a, |
  r8 gis16 bis fis'8 gis,16 bis e8 gis,16 bis dis8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 a16 cis e8 a,16 cis e8 a,16 d fis8 a, |
  r8 gis16 bis fis'8 gis,16 bis e8 gis,16 bis dis8 gis, |
  
  % Section B (mm. 17-24)
  cis16\ff dis e fis gis8 cis, cis16 dis e fis gis8 cis, |
  d16 e fis g a8 d, d16 e fis g a8 d, |
  gis,16 bis dis fis gis8 bis, fis'16 dis bis gis dis'8 gis, |
  cis2. r4 |
  r8 cis16 e gis8 cis,16 e gis8 cis,16 e gis8 cis, |
  r8 d16 fis a8 d,16 fis a8 d,16 fis a8 d, |
  r8 bis,16 dis fis8 bis,16 dis fis8 bis,16 dis fis8 bis, |
  cis1\ff |
  
  % Section C: Middle Break & Slowdown (mm. 25-32)
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  \tuplet 3/2 4 {
    gis8\pp cis e gis, cis e gis, cis e gis, cis e |
    gis, cis e gis, cis e gis, cis e gis, cis e |
    a, cis e a, cis e a, d fis a, d fis |
    gis, bis fis' gis, cis e gis, bis dis gis, cis e |
    gis, cis e gis, cis e gis, cis e gis, cis e |
    gis, cis e gis, cis e gis, cis e gis, cis e |
    a, cis e a, cis e a, d fis a, d fis |
    gis, bis dis gis, cis e
  }
  gis,2\fermata |
  
  % Section D: Reprise (mm. 33-44)
  \tempo "A Tempo - Samba Feroce" 4 = 144
  R1 |
  r8 gis16\ff cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 gis16 cis e8 gis,16 cis e8 gis,16 cis e8 gis, |
  r8 a16 cis e8 a,16 cis e8 a,16 d fis8 a, |
  r8 gis16 bis fis'8 gis,16 bis e8 gis,16 bis dis8 gis, |
  r8 gis16 bis fis'8 gis,16 bis e8 gis,16 bis dis8 gis, |
  cis16 dis e fis gis8 cis, cis16 dis e fis gis8 cis, |
  d16 e fis g a8 d, d16 e fis g a8 d, |
  cis8\fff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  bis,8 r bis, r bis,4 bis,8 bis, |
  cis1\fff \bar "|."
}

% =======================================================================
% 6. BASS (Electric / Upright Bass / Tuba foundation)
% =======================================================================
bassConcert = \relative c, {
  \global
  \clef bass
  \tempo "Samba Energico" 4 = 140
  % Intro (mm. 1-8)
  cis4.\f cis8 ~ cis4 cis |
  b4. b8 ~ b4 b |
  a4. a8 ~ a4 d |
  gis,4. gis8 ~ gis4 gis |
  cis4. cis8 ~ cis4 cis |
  b4. b8 ~ b4 b |
  a4. a8 ~ a4 d |
  gis,2\f\> cis4\p r |
  
  % Section A (mm. 9-16)
  cis4.\f cis8 ~ cis4 cis |
  b4. b8 ~ b4 b |
  a4. a8 ~ a4 d |
  gis,4. gis8 ~ gis4 gis |
  cis4. cis8 ~ cis4 cis |
  b4. b8 ~ b4 b |
  a4. a8 ~ a4 d |
  gis,1\f |
  
  % Section B (mm. 17-24)
  cis8\ff dis e fis gis a b cis |
  d4. cis8 b4 a |
  gis4. fis8 e4 dis |
  cis2. r4 |
  cis4.\f cis8 ~ cis4 cis |
  d4. d8 ~ d4 d |
  bis,4. bis,8 ~ bis,4 bis, |
  cis1\ff |
  
  % Section C: Middle Break & Slowdown (mm. 25-32)
  \tempo "Adagio - Bossa Sostenuto" 4 = 68
  cis,1\pp |
  b,,1 |
  a,,2 d, |
  gis,,1 |
  cis,1 |
  b,,1 |
  a,,2 d, |
  gis,,1\fermata |
  
  % Section D: Reprise (mm. 33-44)
  \tempo "A Tempo - Samba Feroce" 4 = 144
  R1 |
  cis4.\ff cis8 ~ cis4 cis |
  b4. b8 ~ b4 b |
  a4. a8 ~ a4 d |
  gis,4. gis8 ~ gis4 gis |
  gis,4. gis8 ~ gis4 gis |
  cis8 cis r cis cis4 cis |
  d8 d r d d4 d |
  cis8\fff r cis r cis4 cis8 cis |
  d8 r d r d4 d8 d |
  gis,8 r gis, r gis4 gis8 gis |
  cis1\fff \bar "|."
}

% =======================================================================
% 7. PERCUSSION 1: CONCERT SNARE DRUM & BASS DRUM
% =======================================================================
percussionOne = \drummode {
  <<
    {
      % Snare Drum Samba Clave & Accents
      \repeat unfold 7 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      % m. 8 Roll into Section A
      sn4 sn8 sn sn2:32 |
      
      \repeat unfold 15 {
        sn8. sn16 ~ sn8 sn sn8. sn16 ~ sn8 sn |
      }
      % m. 24 Fermata Roll
      sn8\ff sn16 sn sn8 sn sn2:32\fermata |
      
      % Section C: Middle Break (Soft Rim Clicks)
      sn4\pp r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn4 r sn r |
      sn2:32\fermata\pp r2 |
      
      % Section D: Reprise (m. 33 Solo Snare Breakout)
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
      % Concert Bass Drum (Surdo Heartbeat)
      \repeat unfold 7 {
        bd4 bd8 bd ~ bd4 bd |
      }
      % m. 8
      bd4 r bd r |
      
      \repeat unfold 15 {
        bd4 bd8 bd ~ bd4 bd |
      }
      % m. 24
      bd4 bd bd r\fermata |
      
      % Middle Break
      bd4\pp r bd r |
      bd4 r bd r |
      bd4 r bd r |
      bd4 r bd r |
      bd4 r bd r |
      bd4 r bd r |
      bd4 r bd r |
      bd1\fermata\pp |
      
      % Reprise
      r1 |
      \repeat unfold 7 {
        bd4 bd8 bd ~ bd4 bd |
      }
      bd4 bd bd bd |
      bd4 bd bd bd |
      bd4 bd bd bd |
      bd1\fff \bar "|."
    }
  >>
}

% =======================================================================
% 8. PERCUSSION 2: CRASH CYMBALS & SUSPENDED CYMBAL
% =======================================================================
percussionTwo = \drummode {
  % Intro (mm. 1-8): Suspended Cymbal Swell & Crash Choke
  cyms1:32\p\< ~ |
  cyms1\f\> |
  cyms1:32\p\< ~ |
  cyms1\f\> |
  cyms1:32\p\< ~ |
  cyms1\f |
  cyms2:32\< cyms8\f cyms cyms4 |
  cymc4\ff r r2 |

  % Section A (mm. 9-16)
  \repeat unfold 7 {
    r1 |
  }
  cymc4\f r r2 |

  % Section B (mm. 17-24)
  cymc4\ff r cymc r |
  cymc4 r cymc r |
  cymc4 r cymc r |
  cymc4 r cymc r |
  r1 |
  r1 |
  cyms2:32\f\< cyms8\ff cyms cyms4 |
  cymc1:32\fermata\ff |

  % Section C: Middle Break (Soft Brushed/Yarn Mallet Cymbal)
  cyms1:32\pp ~ |
  cyms1 |
  cyms1:32 ~ |
  cyms1 |
  cyms1:32 ~ |
  cyms1 |
  cyms1:32\< ~ |
  cyms1\fermata\p |

  % Section D: Reprise (mm. 33-44)
  r1 |
  cymc4\ff r r2 |
  r1 |
  r1 |
  cymc4\ff r cymc r |
  cymc4 r cymc r |
  r1 |
  cymc4\ff r r2 |
  cymc8\fff r cymc r cymc4 cymc8 cymc |
  cymc8 r cymc r cymc4 cymc8 cymc |
  cymc8 r cymc r cymc4 cymc8 cymc |
  cymc1:32\fff \bar "|."
}

% =======================================================================
% 9. PERCUSSION 3: AUXILIARY LATIN (Agogo / Cowbell & Shaker)
% =======================================================================
percussionThree = \drummode {
  <<
    {
      % Cowbell Clave
      \repeat unfold 7 {
        cb4 cb8 cb r cb cb4 |
      }
      cb4 cb8 cb cb2 |
      
      \repeat unfold 15 {
        cb4 cb8 cb r cb cb4 |
      }
      cb8\ff cb16 cb cb8 cb cb2:32\fermata |
      
      % Middle Break
      R1 * 7 |
      r1\fermata |
      
      % Reprise
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
      % Shaker / Maracas (Continuous 16th Samba Engine)
      \repeat unfold 8 {
        cab16 cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      }
      \repeat unfold 16 {
        cab16 cab cab cab cab cab cab cab cab cab cab cab cab cab cab cab |
      }
      % Middle Break
      \repeat unfold 7 {
        cab4\pp r cab r |
      }
      cab1\fermata\pp |
      
      % Reprise
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
% 10. PERCUSSION 4: TIMPANI (Tuned to C# and G#)
% =======================================================================
timpaniConcert = \relative c {
  \global
  \clef bass
  \tempo "Samba Energico" 4 = 140
  % Intro (mm. 1-8)
  R1 * 4 |
  cis4.\f cis8 ~ cis4 cis |
  gis,4. gis8 ~ gis4 gis |
  cis4. cis8 ~ cis4 cis |
  gis,2\f\> cis4\p r |

  % Section A (mm. 9-16)
  cis4.\f cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  gis,4. gis8 ~ gis4 gis |
  cis4.\f cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  gis,1\f |

  % Section B (mm. 17-24)
  cis4\ff r cis r |
  cis4 r cis r |
  gis,4 r gis, r |
  cis2. r4 |
  cis4.\f cis8 ~ cis4 cis |
  cis4. cis8 ~ cis4 cis |
  gis,4. gis8 ~ gis4 gis |
  cis2:32\ff cis4:32\fermata r |

  % Section C: Middle Break (Tacet)
  R1 * 8 |

  % Section D: Reprise & Thunderous Drive (mm. 33-44)
  \tempo "A Tempo - Samba Feroce" 4 = 144
  r2.. gis,8\ff |
  cis4.\ff cis8 cis4. cis8 |
  cis4. cis8 cis2 |
  cis4. cis8 cis4. cis8 |
  cis2 ~ cis8 cis cis cis |
  gis,4. gis,8 gis,4. gis,8 |
  cis4. cis8 cis4 cis |
  cis8 r cis r cis4 cis8 cis |
  cis8\fff r cis r cis4 cis8 cis |
  cis8 r cis r cis4 cis8 cis |
  gis,8 r gis, r gis4 gis8 gis |
  cis1:32\fff \bar "|."
}

% =======================================================================
% 11. AUDIO SYNTHESIS SCORE
% =======================================================================
\score {
  \unfoldRepeats \articulate <<
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
    \new Staff \with { midiInstrument = #"tuba" } {
      \bassConcert
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      \percussionOne
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      \percussionTwo
    }
    \new DrumStaff \with { midiInstrument = #"standard kit" } {
      \percussionThree
    }
    \new Staff \with { midiInstrument = #"timpani" } {
      \timpaniConcert
    }
  >>
  \midi { }
}
