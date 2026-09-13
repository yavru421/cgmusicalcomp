\version "2.24.0"

% ============================================================================
% Professional Conductor Score Geometry — Tabloid 11x17 (Landscape / Portrait)
% Designed for Podium Readability (Wisconsin Rapids City Band / Standard Wind Band)
% ============================================================================

#(set-global-staff-size 13)

\paper {
  #(set-paper-size "tabloid" 'landscape)
  top-margin = 0.5\in
  bottom-margin = 0.5\in
  left-margin = 0.6\in
  right-margin = 0.6\in
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  system-system-spacing.basic-distance = #14
  score-system-spacing.basic-distance = #14
}

\layout {
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#f #t #t)
    \override BarNumber.font-size = #1.5
    \override RehearsalMark.font-size = #3
    \override MultiMeasureRest.expand-limit = #1
  }
}
