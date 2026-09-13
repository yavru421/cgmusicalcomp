\version "2.24.0"

% ============================================================================
% Moonlight Samba — 8. PERCUSSION 2 (Crash & Suspended Cymbals)
% Dramatic Swells, Accented Punches, and Tutti Climax Support (\drummode)
% ============================================================================

percussionTwoNotes = \drummode {
  % Intro (mm. 1-8): Initial crash, sus cymbal build-up into Section A
  cymc4-^\ff r r2 |
  cyms1:32\p\< ~ |
  cyms1\mf\> |
  cyms1:32\mf\< ~ |
  cyms1\f ~ |
  cyms2:32 cyms4:32 cyms8 cyms |
  cyms1:32\f\< |
  cyms2:32\< cyms8\ff cyms cyms4 |

  % Section A (mm. 9-16): Crashes on formal downbeats and sus cymbal fills
  cymc4-^\ff r r2 |
  r2 cyms4:32\mf r |
  cyms1:32\mf\< ~ |
  cyms2:32\f cyms4:32 r |
  cymc4-^\ff r r2 |
  cyms1:32\mf\< ~ |
  cyms2:32\f cyms8\ff cyms cyms4 |
  cymc4-^\ff r r2 |

  % Section B (mm. 17-24): Driving crash punches and climax roll
  cymc4-^\ff r cymc-^ r |
  cymc4-^ r cymc-^ r |
  cymc4-^ r cymc-^ r |
  cymc4-^ r cymc-^ r |
  cyms1:32\f\< ~ |
  cyms1\ff |
  cyms2:32\ff\< cyms8 cyms cyms4 |
  cymc1:32\ff\fermata |

  % Section C: Middle Break (Soft Brushed/Yarn Mallet Cymbal, mm. 25-32)
  cyms1:32\pp ~ |
  cyms1 |
  cyms1:32 ~ |
  cyms1 |
  cyms1:32 ~ |
  cyms1 |
  cyms1:32\< ~ |
  cyms1\fermata\p |

  % Section D: Reprise (mm. 33-44): High-energy brass accompaniment & climax
  r1 |
  cymc4-^\fff r r2 |
  cyms1:32\f\< ~ |
  cyms1\ff |
  cymc4-^\ff r cymc-^ r |
  cymc4-^ r cymc-^ r |
  cyms1:32\ff\< ~ |
  cyms1\fff |
  cymc4-^\fff cymc-^ cymc-^ cymc-^ |
  cymc4-^ cymc-^ cymc-^ cymc-^ |
  cymc4-^ cymc-^ cymc-^ cymc-^ |
  cymc1-^\fff \bar "|."
}
