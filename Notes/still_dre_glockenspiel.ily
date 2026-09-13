\version "2.24.0"

% ============================================================================
% Still D.R.E. — GLOCKENSPIEL (Concert Pitch, Absolute \fixed c')
% Signature Scott Storch High Staccato Chord Voicing
% 64 Measures Total
% ============================================================================

glockenspielNotes = \fixed c' {
  \clef treble

  % Part I: Intro (mm. 1-8)
  % mm. 1-4: Solo Scott Storch Motif
  \repeat unfold 2 {
    <c'' e'' a''>8-.\mf <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. |
    <b' d'' fis''>8-. <b' d'' fis''>-. <b' d'' fis''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. |
  }
  % mm. 5-8: Groove Drop
  \repeat unfold 2 {
    <c'' e'' a''>8-.\f <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. |
    <b' d'' fis''>8-. <b' d'' fis''>-. <b' d'' fis''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. |
  }

  % Part II: Section A — Verse 1 (mm. 9-24)
  \repeat unfold 8 {
    <c'' e'' a''>8-.\mp <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. |
    <b' d'' fis''>8-. <b' d'' fis''>-. <b' d'' fis''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. |
  }

  % Part III: Section B — Chorus 1 Tutti Hook (mm. 25-32)
  \repeat unfold 4 {
    <c'' e'' a''>8-.\f <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. |
    <b' d'' fis''>8-. <b' d'' fis''>-. <b' d'' fis''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. |
  }

  % Part IV: Section C — Chamber Interlude (mm. 33-40)
  \repeat unfold 4 {
    <c'' e'' a''>8-.\p <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. |
    <b' d'' fis''>8-. <b' d'' fis''>-. <b' d'' fis''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. |
  }

  % Part V: Section D — Brass Fanfare & Build (mm. 41-48)
  \repeat unfold 4 {
    <c'' e'' a''>8-.\mf\< <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. |
    <b' d'' fis''>8-. <b' d'' fis''>-. <b' d'' fis''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>\! |
  }

  % Part VI: Section E — Chorus 2 Grand Climax (mm. 49-56)
  \repeat unfold 4 {
    <c'' e'' a''>8-.\ff <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. |
    <b' d'' fis''>8-. <b' d'' fis''>-. <b' d'' fis''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. |
  }

  % Part VII: Section F — Coda & Outro (mm. 57-64)
  % mm. 57-60: Coda hits
  \repeat unfold 2 {
    <c'' e'' a''>8-.\f <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. |
    <b' d'' fis''>8-. <b' d'' fis''>-. <b' d'' fis''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. |
  }
  % mm. 61-63: Sudden drop back to solo motif
  <c'' e'' a''>8-.\mp <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. |
  <b' d'' fis''>8-. <b' d'' fis''>-. <b' d'' fis''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. <b' e'' g''>-. |
  <c'' e'' a''>8-.\p <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. <c'' e'' a''>-. |
  % m. 64: Final hit with fermata
  <a' c'' e'' a''>4-.\ff r4 r2\fermata \bar "|."
}
