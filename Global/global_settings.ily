\version "2.24.0"

% ============================================================================
% Global Engraving & Paper Geometry for Concert Band (Letter Size)
% ============================================================================

#(set-global-staff-size 14)

\paper {
  #(set-paper-size "letter")
  top-margin = 0.45\in
  bottom-margin = 0.45\in
  left-margin = 0.5\in
  right-margin = 0.5\in
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  system-system-spacing.basic-distance = #11
  score-system-spacing.basic-distance = #11
}

% Standard rehearsal and bar number styling
\layout {
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#f #t #t)
    \override MultiMeasureRest.expand-limit = #1
  }
}
