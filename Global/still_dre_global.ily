\version "2.24.0"

% ============================================================================
% Still D.R.E. — Global Temporal, Tonal & Formal Architecture
% Dedicated to the Wisconsin Rapids City Band (John Daniel Dondlinger)
% Authentic Key: A minor (\key a \minor)
% 64 Measures Total: West Coast G-Funk Pocket, Scott Storch Motif, Tutti Climax
% ============================================================================

stillDreGlobal = {
  \key a \minor
  \time 4/4

  % Part I: Intro — Solo Scott Storch Motif & Groove Drop (mm. 1-8)
  \tempo "West Coast G-Funk Pocket" 4 = 94
  s1 * 4 \mark \default % m. 5: Drums & Bass Drop
  s1 * 4 \break

  % Part II: Section A — Verse 1 (mm. 9-24)
  \mark \default % m. 9: Rehearsal A
  s1 * 8 \break
  s1 * 8 \break

  % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
  \mark \default % m. 25: Rehearsal B
  s1 * 8 \break

  % Part IV: Section C — Chamber Interlude & Groove Pocket (mm. 33-40)
  \mark \default % m. 33: Rehearsal C
  s1 * 8 \break

  % Part V: Section D — Brass Fanfare & Dynamic Build (mm. 41-48)
  \mark \default % m. 41: Rehearsal D
  s1 * 8 \break

  % Part VI: Section E — Chorus 2 Grand Tutti Climax (mm. 49-56)
  \mark \default % m. 49: Rehearsal E
  s1 * 8 \break

  % Part VII: Section F — Coda & Outro (mm. 57-64)
  \mark \default % m. 57: Rehearsal F
  s1 * 4
  s1 * 3
  s2. s4\fermata \bar "|."
}

stillDreHeader = \header {
  title = "Still D.R.E."
  subtitle = "Concert Band Edition — Arranged for 14-Voice Wind Ensemble & Battery"
  composer = "Andre Young (Dr. Dre), Melvin Bradford & Scott Storch"
  arranger = "Arranged & Orchestrated by John Daniel Dondlinger"
  tagline = "Still D.R.E. (Concert Band Edition) — Engraved with LilyPond for Wisconsin Rapids City Band"
}
