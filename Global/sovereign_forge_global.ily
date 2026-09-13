\version "2.24.0"

% ============================================================================
% The Sovereign Forge - Global Temporal & Key Architecture
% Composed by John Daniel Dondlinger (Wisconsin Rapids City Band)
% ============================================================================

sovereignForgeGlobal = {
  \time 4/4
  
  % Part I: The Burden & The Solitary Dawn (mm. 1-8)
  \key d \minor
  \tempo "Lento Pensieroso" 4 = 66
  s1 * 8
  
  % Part II: The Forge & Pressure Years (mm. 9-22)
  \tempo "Allegro Risoluto - The Forge" 4 = 112
  s1 * 14
  
  % Part III: Sovereign Dawn (mm. 23-34)
  \key d \major
  \tempo "Maestoso Nobile - Sovereign Dawn" 4 = 76
  s1 * 11
  s1 \bar "|."
}

sovereignForgeHeader = \header {
  title = "The Sovereign Forge"
  subtitle = "An Autobiographical Tone Poem for Concert Band"
  composer = "John Daniel Dondlinger"
  arranger = "Dedicated to the Memory of Jace & The Pressure Years"
  tagline = "The Sovereign Forge — Composed by John Daniel Dondlinger for Wisconsin Rapids City Band"
}
