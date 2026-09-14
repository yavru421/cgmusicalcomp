\version "2.24.0"

% ============================================================================
% Moonlight Sonata (Op. 27, No. 2 - I. Adagio sostenuto)
% Global Temporal, Tonal & Formal Architecture for Full Concert Band
% Dedicated to the Wisconsin Rapids City Band (John Daniel Dondlinger)
% Authentic Key: C# minor (\key cis \minor)
% Meter: 4/4 (Triplets flowing throughout)
% ============================================================================

moonlightSonataGlobal = {
  \key cis \minor
  \time 4/4

  % Movement I: Adagio sostenuto (♩ = 54)
  \tempo "Adagio sostenuto" 4 = 54

  % Section I: Intimate Solitary Exposition (mm. 1-8)
  % mm. 1-4: Atmospheric Introduction (Triplets & Deep Bass)
  s1 * 4
  \mark \default % Mark A (m. 5): Main Lyrical Theme enters
  s1 * 4 \break

  % Section II: Harmonic Modulation & Neapolitan Shift (mm. 9-20)
  \mark \default % Mark B (m. 9): Transition through E Major
  s1 * 6
  \mark \default % Mark C (m. 15): Neapolitan D Major Drama
  s1 * 6 \break

  % Section III: Dominant Sostenuto & Climax Swell (mm. 21-27)
  \mark \default % Mark D (m. 21): Dominant G# pedal preparation
  s1 * 7 \break

  % Section IV: Development & Cascading Arpeggios (mm. 28-41)
  \mark \default % Mark E (m. 28): Agitato ma sempre legato
  s1 * 9
  \mark \default % Mark F (m. 37): Dominant Pedal & Floating Descending Lines
  s1 * 5 \break

  % Section V: Recapitulation — Noble Full Ensemble Hymn (mm. 42-49)
  \mark \default % Mark G (m. 42): Recapitulation in C# minor
  s1 * 8 \break

  % Section VI: Coda & Transcendent Resolution (mm. 50-60)
  \mark \default % Mark H (m. 50): Solemn Coda
  s1 * 9
  s2 s2\fermata \bar "|."
}

moonlightSonataHeader = \header {
  title = "Moonlight Sonata"
  subtitle = "Sonata quasi una Fantasia, Op. 27, No. 2 — I. Adagio sostenuto"
  composer = "Ludwig van Beethoven"
  arranger = "Arranged for Concert Band by John Daniel Dondlinger"
  tagline = "Wisconsin Rapids City Band Edition — Engraved & Mastered by John Daniel Dondlinger"
}
