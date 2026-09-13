\version "2.24.0"

% ============================================================================
% Still D.R.E. — MARIMBA (Concert Pitch, Absolute \fixed c')
% 4-Mallet Harmonic Pulse & Warm Rosewood Syncopation
% 64 Measures Total
% ============================================================================

marimbaNotes = \fixed c' {
  \clef treble

  % Part I: Intro (mm. 1-8)
  % mm. 1-4: Solo Scott Storch Harmonic Bed
  \repeat unfold 2 {
    <a c' e'>8-.\mp <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. |
    <b d' fis'>8-. <b d' fis'>-. <b d' fis'>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. |
  }
  % mm. 5-8: Groove Drop
  \repeat unfold 2 {
    <a c' e'>8-.\mf <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. |
    <b d' fis'>8-. <b d' fis'>-. <b d' fis'>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. |
  }

  % Part II: Section A — Verse 1 (mm. 9-24)
  \repeat unfold 8 {
    <a c' e'>8-.\mp <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. |
    <b d' fis'>8-. <b d' fis'>-. <b d' fis'>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. |
  }

  % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
  \repeat unfold 4 {
    <a c' e'>8-.\f <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. |
    <b d' fis'>8-. <b d' fis'>-. <b d' fis'>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. |
  }

  % Part IV: Section C — Chamber Interlude (mm. 33-40)
  % Marimba leads with rolled lyrical chord pads
  \repeat unfold 4 {
    <a c' e'>2\p:32 <a c' e'>2:32 |
    <b d' fis'>4.:32 <b d' fis'>8 <e g b>2:32 |
  }

  % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
  \repeat unfold 4 {
    <a c' e'>8-.\mf\< <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. |
    <b d' fis'>8-. <b d' fis'>-. <b d' fis'>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-\! |
  }

  % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
  \repeat unfold 4 {
    <a c' e'>8-.\ff <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. |
    <b d' fis'>8-. <b d' fis'>-. <b d' fis'>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. |
  }

  % Part VII: Section F — Coda & Outro (mm. 57-64)
  \repeat unfold 2 {
    <a c' e'>8-.\f <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. |
    <b d' fis'>8-. <b d' fis'>-. <b d' fis'>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. |
  }
  % mm. 61-63: Fade back to solo motif
  <a c' e'>8-.\mp <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. |
  <b d' fis'>8-. <b d' fis'>-. <b d' fis'>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. <e g b>-. |
  <a c' e'>8-.\p <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. <a c' e'>-. |
  % m. 64: Final stinger hit
  <a c' e'>4-.\ff r4 r2\fermata \bar "|."
}
