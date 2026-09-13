\version "2.24.0"

% ============================================================================
% Moonlight Samba — Global Temporal, Tonal & Formal Architecture
% Dedicated to the Wisconsin Rapids City Band (John Daniel Dondlinger)
% Authentic Key: C# minor (\key cis \minor)
% 56 Measures Total: Multiple Stops, Percussion Starts, Sectional Medley & Build
% ============================================================================

moonlightSambaGlobal = {
  \key cis \minor
  \time 4/4

  % Part I: Percussion Start & Groove Build (mm. 1-8) -> STOP 1 at m. 8
  \tempo "Samba Moderato - Percussion Start" 4 = 116
  s1 * 7
  s2. s4\fermata \break

  % Part II: Section A — Muted Trumpet & Marimba Medley (mm. 9-16) -> STOP 2 at m. 16
  \tempo "A Tempo - Intimate Bossa" 4 = 116
  s1 * 7
  s2. s4\fermata \break

  % Part III: Section B — Woodwinds & Saxophone Medley (mm. 17-24) -> STOP 3 at m. 24
  \tempo "A Tempo - Woodwind Medley" 4 = 116
  s1 * 7
  s2. s4\fermata \break

  % Part IV: Section C — Low Brass Montuno Drive (mm. 25-32) -> STOP 4 at m. 32
  \tempo "A Tempo - Brass Montuno" 4 = 116
  s1 * 7
  s2. s4\fermata \break

  % Part V: Section D — Intimate Adagio Bossa Break (mm. 33-40) -> STOP 5 at m. 40
  \tempo "Adagio - Bossa Sostenuto" 4 = 58
  s1 * 7
  s2. s4\fermata \break

  % Part VI: Section E — Latin Percussion Soli Breakout (mm. 41-44)
  \tempo "A Tempo - Percussion Soli" 4 = 120
  s1 * 4 \break

  % Part VII: Section F — Building Back to Grand Tutti Climax (mm. 45-56)
  \tempo "Samba Feroce - Tutti Climax" 4 = 120
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
