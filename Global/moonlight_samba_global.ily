\version "2.24.0"

% ============================================================================
% Moonlight Samba — Global Temporal, Tonal & Formal Architecture
% Arranged for Concert Band & Percussion Ensemble by John Daniel Dondlinger
% Dedicated to the Wisconsin Rapids City Band
% Authentic Key: C# minor (\key cis \minor)
% ============================================================================

moonlightSambaGlobal = {
  \key cis \minor
  \time 4/4

  % Intro (mm. 1-8)
  \tempo "Samba Moderato - Bossa Pocket" 4 = 116
  s1 * 8 \break

  % Section A: First Theme & Samba Groove (mm. 9-16)
  s1 * 8 \break

  % Section B: Driving Latin Counterpoint (mm. 17-24)
  s1 * 8 \break

  % Section C: Middle Break & Slowdown (mm. 25-32)
  \tempo "Adagio - Bossa Sostenuto" 4 = 58
  s1 * 8 \break

  % Section D: Reprise, Samba Feroce & Tutti Climax (mm. 33-44)
  \tempo "A Tempo - Samba Energico" 4 = 120
  s1 * 11
  s1 \bar "|."
}

moonlightSambaHeader = \header {
  title = "Moonlight Samba"
  subtitle = "Arranged for Concert Band & Latin Percussion Ensemble"
  composer = "Ludwig van Beethoven (Op. 27, No. 2)"
  arranger = "Arranged by John Daniel Dondlinger"
  tagline = "Moonlight Samba — Composed & Arranged for Wisconsin Rapids City Band by John Daniel Dondlinger"
}
