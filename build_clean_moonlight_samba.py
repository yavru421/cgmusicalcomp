#!/usr/bin/env python3
import os

ROOT = r"C:\dev\CGMusicalComposition"
NOTES_DIR = os.path.join(ROOT, "Notes")
SCORES_DIR = os.path.join(ROOT, "Scores")

# 1. Global Temporal & Architecture
GLOBAL_CONTENT = """\\version "2.24.0"

moonlightSambaGlobal = {
  \\key cis \\minor
  \\time 4/4

  % Unbroken, hypnotic groove: Adagio con Samba e Bossa (♩ = 88)
  \\tempo "Adagio con Samba e Bossa" 4 = 88

  % Phase 1: Solitary Acoustic Intimacy (mm. 1-16) - Percussion 100% TACET
  s1 * 4
  \\mark \\default % Mark A (m. 5): Lyrical Horn Lead enters
  s1 * 4 \\break

  \\mark \\default % Mark B (m. 9): Modulation through E Major
  s1 * 6
  s1 * 2 \\break

  % Phase 2: THE DROP — Heavy Brazilian Samba Battery (mm. 17-36)
  \\mark \\default % Mark C (m. 17): Samba Battery Drops In
  s1 * 4
  \\mark \\default % Mark D (m. 21): Dominant G# groove
  s1 * 7 \\break

  \\mark \\default % Mark E (m. 28): Dynamic Climax Swell
  s1 * 9 \\break

  % Phase 3: Climax & Gradual Fade-Out (mm. 37-48)
  \\mark \\default % Mark F (m. 37): Peak tutti, decrescendo
  s1 * 5
  \\mark \\default % Mark G (m. 42): Recapitulation, battery thins out
  s1 * 7 \\break

  % Phase 4: Transcendent Acoustic Resolution (mm. 49-60) - Percussion TACET
  \\mark \\default % Mark H (m. 49): Pure acoustic resolution, fading to ppp
  s1 * 11
  s2 s2\\fermata \\bar "|."
}

moonlightSambaHeader = \\header {
  title = "Moonlight Samba"
  subtitle = "Adagio con Samba e Bossa — For Concert Band & Latin Percussion"
  composer = "Ludwig van Beethoven (Op. 27, No. 2)"
  arranger = "Arranged by John Daniel Dondlinger"
  tagline = "Dedicated to the Wisconsin Rapids City Band by John Daniel Dondlinger"
}
"""

with open(os.path.join(ROOT, "Global", "moonlight_samba_global.ily"), "w", encoding="utf-8") as f:
    f.write(GLOBAL_CONTENT)

# 2. Clarinet (Concert Pitch, Fixed middle register: G#3 to F#4)
CLARINET_CONTENT = """\\version "2.24.0"

clarinetNotes = \\fixed c' {
  \\clef treble
  \\tuplet 3/2 4 {
    % Phase 1: Solitary Acoustic Intimacy (mm. 1-16)
    gis8\\pp( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    gis8( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    a8( cis' e')  a( cis' e')  a( d' fis')  a( d' fis') |
    gis8( bis dis')  gis( bis dis')  gis( bis dis')  gis( bis dis') |

    % Mark A (m. 5): Main Lyrical Theme in Horn
    gis8\\p( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    gis8( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    a8( cis' e')  a( cis' e')  a( d' fis')  a( d' fis') |
    gis8( bis dis')  gis( bis dis')  gis( cis' e')  gis( bis dis') |

    % Mark B (m. 9): Modulation through E Major
    gis8\\p( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    gis8( b e')  gis( b e')  gis( b e')  gis( b e') |
    gis8( b e')  gis( b e')  a( b dis')  a( b dis') |
    gis8( b e')  gis( b e')  gis( b e')  gis( b e') |
    g8\\mp( b e')  g( b e')  g( b e')  g( b e') |
    g8( ais e')  g( ais e')  g( ais e')  g( ais e') |
    fis8\\p( b d')  fis( b d')  fis( b d')  fis( b d') |
    fis8( ais cis')  fis( ais cis')  fis( b d')  fis( bis dis') |

    % Phase 2: THE DROP — Heavy Brazilian Samba Battery (mm. 17-36)
    fis8\\mf( a d')  fis( a d')  fis( a d')  fis( a d') |
    eis8( b d')  eis( b d')  fis( a cis')  fis( a cis') |
    fis8\\f( a c')  fis( a c')  fis( a c')  fis( a c') |
    fis8( gis bis)  fis( gis bis)  fis( gis bis)  fis( gis bis) |

    % Mark D (m. 21): Dominant G# groove
    e8\\f( gis cis')  e( gis cis')  e( gis cis')  e( gis cis') |
    dis8( fis bis)  dis( fis bis)  dis( fis bis)  dis( fis bis) |
    e8( gis cis')  e( gis cis')  e( gis cis')  e( gis cis') |
    dis8( fis bis)  dis( fis bis)  dis( fis bis)  dis( fis bis) |
    dis8\\<( fis bis)  dis( fis bis)  e( gis cis')  e( gis cis')\\! |
    dis8\\>( fis bis)  dis( fis bis)  e( gis cis')  e( gis cis')\\! |
    fis8\\f( gis bis)  fis( gis bis)  e( gis cis')  e( gis cis') |

    % Mark E (m. 28): Dynamic Climax
    dis8\\ff( fis bis)  dis( fis bis)  dis( fis a)  dis( fis a) |
    gis8\\fff( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    a8( cis' fis')  a( cis' fis')  a( cis' fis')  a( cis' fis') |
    b8\\fff( dis' fis')  b( dis' fis')  b( dis' fis')  b( dis' fis') |
    bis8\\fff( dis' fis')  bis( dis' fis')  cis'8( e' gis')  cis'8( e' gis') |
    d'8\\fff( fis' a')  d'8( fis' a')  d'8( fis' a')  d'8( fis' a') |
    cis'8\\ff( e' gis')  cis'8( e' gis')  cis'8( e' gis')  cis'8( e' gis') |
    bis8\\f( dis' fis')  bis( dis' fis')  bis( dis' fis')  bis( dis' fis') |
    cis'8\\mp( e' gis')  cis'8( e' gis')  cis'8( e' gis')  cis'8( e' gis') |

    % Phase 3: Climax & Gradual Fade-Out (mm. 37-48)
    fis8\\p( a d')  fis( a d')  fis( a d')  fis( a d') |
    gis8( bis dis')  gis( bis dis')  gis( bis dis')  gis( bis dis') |
    gis8( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    gis8\\pp( bis dis')  gis( bis dis')  gis( bis dis')  gis( bis dis') |
    gis8( bis dis')  gis( bis dis')  gis( bis dis')  gis( bis dis') |

    % Mark G (m. 42): Recapitulation
    gis8\\p( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    gis8( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    a8\\mp( cis' e')  a( cis' e')  a( d' fis')  a( d' fis') |
    gis8( bis dis')  gis( bis dis')  gis( bis dis')  gis( bis dis') |
    gis8\\p( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    gis8( cis' e')  gis( cis' e')  a( cis' e')  a( d' fis') |
    gis8( cis' e')  gis( bis dis')  gis( cis' e')  gis( bis dis') |

    % Phase 4: Transcendent Acoustic Resolution (mm. 49-60)
    gis8\\pp( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    a8\\p( cis' e')  a( cis' e')  a( cis' e')  a( cis' e') |
    fis8( a d')  fis( a d')  fis( a d')  fis( a d') |
    gis8\\pp( bis dis')  gis( bis dis')  gis( bis dis')  gis( bis dis') |
    gis8( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    gis8\\ppp( bis dis')  gis( bis dis')  gis( bis dis')  gis( bis dis') |
    gis8( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    gis8( cis' e')  gis( cis' e')  gis( bis dis')  gis( bis dis') |
    gis8( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    gis8( cis' e')  gis( cis' e')  gis( bis dis')  gis( bis dis') |
    gis8( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
  }
  <e' gis' cis''>2\\ppp <e' gis' cis''>2\\fermata |
}
"""

with open(os.path.join(NOTES_DIR, "moonlight_samba_clarinet.ily"), "w", encoding="utf-8") as f:
    f.write(CLARINET_CONTENT)

# 3. French Horn (Concert Pitch, G#3 to C#5)
HORN_CONTENT = """\\version "2.24.0"

hornNotes = \\fixed c' {
  \\clef treble

  % Phase 1: Solitary Acoustic Intimacy (mm. 1-16)
  R1 * 4 |
  gis4.\\p gis8 gis4. gis8 |
  gis2. r4 |
  r8 a4\\mp( gis8) fis4.( a8) |
  gis2( bis) |

  % Mark B (m. 9)
  gis4.\\p gis8 gis4. gis8 |
  b2. r4 |
  r8 c'4\\mp( b8) a4.( c'8) |
  b2. r4 |
  r8 b4\\mp( ais8) g4.( b8) |
  ais2. r4 |
  fis4.\\p fis8 fis4. fis8 |
  ais2. r4 |

  % Phase 2: THE DROP (mm. 17-36)
  r8 b4\\mf( a8) fis4.( a8) |
  gis2( fis) |
  r8 a4\\f( gis8) fis4.( a8) |
  gis2( bis) |

  % Mark D (m. 21)
  e2\\f( gis) |
  dis2( bis) |
  e2( gis) |
  dis2( bis) |
  dis4\\<( dis e e\\!) |
  dis4\\>( dis e e\\!) |
  fis4\\f( gis bis e') |

  % Mark E (m. 28)
  dis2\\ff( a) |
  gis1\\fff |
  gis2 a |
  b1\\fff |
  b2 cis' |
  d'1\\fff |
  d'2( cis') |
  bis1\\ff |
  cis'1\\f |

  % Phase 3: Climax & Gradual Fade-Out (mm. 37-48)
  r8 a4\\p( gis8) fis4.( a8) |
  gis1 |
  gis1 |
  gis1\\pp |
  gis1 |

  % Mark G (m. 42)
  gis4.\\p gis8 gis4. gis8 |
  gis2. r4 |
  r8 a4\\mp( gis8) fis4.( a8) |
  gis2( bis) |
  gis4.\\p gis8 gis4. gis8 |
  gis2( a) |
  gis4( bis gis bis) |

  % Phase 4: Transcendent Acoustic Resolution (mm. 49-60)
  gis1\\pp |
  a1\\p |
  fis1 |
  gis1\\pp |
  cis'1 |
  bis1\\ppp |
  cis'1 |
  bis1 |
  cis'1 |
  bis1 |
  cis'1 |
  cis'2\\fermata r2 |
}
"""

with open(os.path.join(NOTES_DIR, "moonlight_samba_horn.ily"), "w", encoding="utf-8") as f:
    f.write(HORN_CONTENT)

# 4. Flute (Concert Pitch, F#4 to D6)
FLUTE_CONTENT = """\\version "2.24.0"

fluteNotes = \\fixed c'' {
  \\clef treble

  % Phase 1: Solitary Acoustic Intimacy (mm. 1-16)
  R1 * 8 |

  % Mark B (m. 9)
  r2 r4. gis8\\p |
  b4.( gis8) e'4.( b8) |
  gis'2.( fis'8 e') |
  dis'2. r4 |
  r8 e'4\\mp( d'8) b4.( d'8) |
  cis'2. r4 |
  fis4.\\p fis8 fis4. fis8 |
  cis'2. r4 |

  % Phase 2: THE DROP (mm. 17-36)
  r8 d'4\\mf( cis'8) a4.( c'8) |
  b2( a) |
  r8 a'4\\f( gis'8) fis'4.( a'8) |
  gis'2( bis') |

  % Mark D (m. 21)
  R1 * 4 |
  dis'4\\<( dis' e' e'\\!) |
  dis'4\\>( dis' e' e'\\!) |
  fis'4\\f( gis' bis' e') |

  % Mark E (m. 28)
  dis'2\\ff( a') |
  gis'1\\fff |
  gis'2 a' |
  b'1\\fff |
  b'2 cis'' |
  d''1\\fff |
  d''2( cis'') |
  bis'1\\ff |
  cis''1\\f |

  % Phase 3: Climax & Gradual Fade-Out (mm. 37-48)
  r8 a'4\\p( gis'8) fis'4.( a'8) |
  gis'1 |
  gis'1 |
  gis'1\\pp |
  gis'1 |

  % Mark G (m. 42)
  R1 * 4 |
  gis'4.\\p gis'8 gis'4. gis'8 |
  gis'2( a') |
  gis'4( bis' gis' bis') |

  % Phase 4: Transcendent Acoustic Resolution (mm. 49-60)
  gis'1\\pp |
  e'1\\p |
  d'1 |
  bis1\\pp |
  cis'1 |
  bis1\\ppp |
  cis'1 |
  bis1 |
  cis'1 |
  bis1 |
  cis'1 |
  cis'2\\fermata r2 |
}
"""

with open(os.path.join(NOTES_DIR, "moonlight_samba_flute.ily"), "w", encoding="utf-8") as f:
    f.write(FLUTE_CONTENT)

# 5. Trumpet (Concert Pitch, C4 to A4)
TRUMPET_CONTENT = """\\version "2.24.0"

trumpetNotes = \\fixed c' {
  \\clef treble

  % Phase 1: Solitary Acoustic Intimacy (mm. 1-16) - Silent
  R1 * 16 |

  % Phase 2: THE DROP (mm. 17-36)
  r8 fis'4\\f( e'8) d'4.( fis'8) |
  eis'2( fis') |
  r8 a'4\\f( gis'8) fis'4.( a'8) |
  gis'2( bis') |

  % Mark D (m. 21)
  gis'2\\f( bis') |
  gis'2( bis') |
  gis'2( bis') |
  gis'2( bis') |
  gis'4\\<( bis' gis' cis''\\!) |
  gis'4\\>( bis' gis' cis''\\!) |
  bis'4\\f( dis'' gis' bis') |

  % Mark E (m. 28): Dynamic Climax (in safe, powerful register C4-A4)
  bis2\\ff( dis') |
  e'1\\fff |
  e'2 fis' |
  fis'1\\fff |
  fis'2 gis' |
  a'1\\fff |
  a'2( gis') |
  fis'1\\ff |
  e'1\\f |

  % Phase 3: Climax & Gradual Fade-Out (mm. 37-48)
  R1 * 5 |

  % Mark G (m. 42)
  R1 * 4 |
  gis4.\\p gis8 gis4. gis8 |
  gis2( a) |
  gis4( bis gis bis) |

  % Phase 4: Transcendent Acoustic Resolution (mm. 49-60)
  gis1\\pp |
  R1 * 2 |
  gis1\\pp |
  gis1 |
  gis1\\ppp |
  gis1 |
  gis1 |
  gis1 |
  gis1 |
  gis1 |
  gis2\\fermata r2 |
}
"""

with open(os.path.join(NOTES_DIR, "moonlight_samba_trumpet.ily"), "w", encoding="utf-8") as f:
    f.write(TRUMPET_CONTENT)

# 6. Trombone (Concert Pitch, G#2 to C#4)
TROMBONE_CONTENT = """\\version "2.24.0"

tromboneNotes = \\fixed c {
  \\clef bass

  % Phase 1: Solitary Acoustic Intimacy (mm. 1-16)
  R1 * 4 |
  gis2\\p( bis) |
  gis2. r4 |
  a2\\mp( c') |
  gis2( bis) |

  % Mark B (m. 9)
  gis2\\p( bis) |
  gis2( b) |
  b2( a) |
  gis2. r4 |
  g2\\mp( b) |
  g2( ais) |
  fis2\\p( b) |
  fis2( ais) |

  % Phase 2: THE DROP (mm. 17-36)
  fis8\\f fis r a fis4 a |
  eis8 eis r a eis4 a |
  fis8\\f fis r a fis4 a |
  fis8 fis r gis fis4 bis |

  % Mark D (m. 21)
  e8\\f e r gis e4 gis |
  dis8 dis r gis dis4 gis |
  e8 e r gis e4 gis |
  dis8 dis r gis dis4 gis |
  gis4\\<( dis e gis\\!) |
  gis4\\>( dis e gis\\!) |
  dis4\\f( dis dis e) |

  % Mark E (m. 28)
  dis2\\ff( fis) |
  e1\\fff |
  e2 fis |
  fis1\\fff |
  fis2 gis |
  a1\\fff |
  a2( gis) |
  fis1\\ff |
  e1\\f |

  % Phase 3: Climax & Gradual Fade-Out (mm. 37-48)
  fis2\\p( a) |
  gis1 |
  gis1 |
  gis1\\pp |
  gis1 |

  % Mark G (m. 42)
  gis2\\p( bis) |
  gis2. r4 |
  a2\\mp( c') |
  gis2( bis) |
  gis2\\p( bis) |
  gis2( a) |
  gis4( bis gis bis) |

  % Phase 4: Transcendent Acoustic Resolution (mm. 49-60)
  gis1\\pp |
  cis'1\\p |
  d1 |
  bis1\\pp |
  cis'1 |
  bis1\\ppp |
  cis'1 |
  bis1 |
  cis'1 |
  bis1 |
  cis'1 |
  cis'2\\fermata r2 |
}
"""

with open(os.path.join(NOTES_DIR, "moonlight_samba_trombone.ily"), "w", encoding="utf-8") as f:
    f.write(TROMBONE_CONTENT)

# 7. Tuba (Concert Pitch, G#1 to Bb2)
TUBA_CONTENT = """\\version "2.24.0"

tubaNotes = \\fixed c, {
  \\clef bass

  % Phase 1: Solitary Acoustic Intimacy (mm. 1-16)
  cis1\\pp |
  b,1 |
  a,1 |
  gis,1 |
  cis1\\p |
  b,1 |
  a,1 |
  gis,1 |
  cis1\\p |
  e,1 |
  b,1 |
  e,1 |
  e,1\\mp |
  e,1 |
  d,1\\p |
  cis1 |

  % Phase 2: THE DROP (mm. 17-36)
  d,4\\f r8 d, a,,4 d, |
  cis,4 r8 cis, gis,,4 cis, |
  c,4\\f r8 c, g,,4 c, |
  gis,,4 r8 gis,, dis,,4 gis,, |

  % Mark D (m. 21)
  cis,4\\f r8 cis, gis,,4 cis, |
  gis,,4 r8 gis,, dis,,4 gis,, |
  cis,4 r8 cis, gis,,4 cis, |
  gis,,4 r8 gis,, dis,,4 gis,, |
  gis,,4\\<( gis,, cis, cis,\\!) |
  gis,,4\\>( gis,, cis, cis,\\!) |
  gis,,1\\f |

  % Mark E (m. 28)
  gis,,1\\ff |
  cis,1\\fff |
  cis,2 d, |
  dis,1\\fff |
  dis,2 e, |
  fis,1\\fff |
  fis,2( e,) |
  dis,1\\ff |
  cis,1\\f |

  % Phase 3: Climax & Gradual Fade-Out (mm. 37-48)
  d,1\\p |
  gis,,1 |
  gis,,1 |
  gis,,1\\pp |
  gis,,1 |

  % Mark G (m. 42)
  cis,1\\p |
  b,,1 |
  a,,1\\mp |
  gis,,1 |
  cis,1\\p |
  fis,,1 |
  gis,,1 |

  % Phase 4: Transcendent Acoustic Resolution (mm. 49-60)
  cis,1\\pp |
  a,,1\\p |
  d,1 |
  gis,,1\\pp |
  cis,1 |
  gis,,1\\ppp |
  cis,1 |
  gis,,1 |
  cis,1 |
  gis,,1 |
  cis,1 |
  cis,2\\fermata r2 |
}
"""

with open(os.path.join(NOTES_DIR, "moonlight_samba_tuba.ily"), "w", encoding="utf-8") as f:
    f.write(TUBA_CONTENT)

# 8. Electric Bass
with open(os.path.join(NOTES_DIR, "moonlight_samba_bass.ily"), "w", encoding="utf-8") as f:
    f.write(TUBA_CONTENT.replace("tubaNotes", "bassNotes"))

# 9. Glockenspiel (Concert Pitch, G#5 to D6)
GLOCK_CONTENT = """\\version "2.24.0"

glockenspielNotes = \\fixed c'' {
  \\clef treble

  % Phase 1: Solitary Acoustic Intimacy (mm. 1-16)
  R1 * 16 |

  % Phase 2: THE DROP (mm. 17-36)
  gis'2\\f( bis') |
  R1 * 3 |
  R1 * 7 |

  % Mark E (m. 28)
  R1 * 4 |
  bis'2\\ff( cis'') |
  d''1\\fff |
  d''2( cis'') |
  bis'1\\ff |
  cis''1\\f |

  % Phase 3: Climax & Gradual Fade-Out (mm. 37-48)
  R1 * 5 |
  R1 * 6 |
  gis'2\\p( bis') |

  % Phase 4: Transcendent Acoustic Resolution (mm. 49-60)
  R1 * 11 |
  cis''1\\ppp\\fermata |
}
"""

with open(os.path.join(NOTES_DIR, "moonlight_samba_glockenspiel.ily"), "w", encoding="utf-8") as f:
    f.write(GLOCK_CONTENT)

# 10. Alto Sax (Concert Pitch, C4 to F5)
ALTOSAX_CONTENT = """\\version "2.24.0"

altoSaxNotes = \\fixed c' {
  \\clef treble

  % Phase 1: Solitary Acoustic Intimacy (mm. 1-16)
  R1 * 4 |
  e2\\p( gis) |
  e2. r4 |
  fis2\\mp( a) |
  dis2( fis) |

  % Mark B (m. 9)
  e2\\p( gis) |
  e2( gis) |
  gis2( fis) |
  e2. r4 |
  e2\\mp( g) |
  e2( cis) |
  d2\\p( fis) |
  cis2. r4 |

  % Phase 2: THE DROP (mm. 17-36)
  d8\\f d r fis d4 fis |
  cis8 cis r fis cis4 fis |
  c8\\f c r dis c4 dis |
  bis,8 bis, r dis bis,4 dis |

  % Mark D (m. 21)
  cis8\\f cis r e cis4 e |
  bis,8 bis, r dis bis,4 dis |
  cis8 cis r e cis4 e |
  bis,8 bis, r dis bis,4 dis |
  dis4\\<( bis, cis e\\!) |
  dis4\\>( bis, cis e\\!) |
  dis4\\f( dis dis cis) |

  % Mark E (m. 28)
  bis,2\\ff( dis) |
  cis1\\fff |
  cis2 dis |
  dis1\\fff |
  dis2 e |
  fis1\\fff |
  fis2( e) |
  dis1\\ff |
  cis1\\f |

  % Phase 3: Climax & Gradual Fade-Out (mm. 37-48)
  d2\\p( fis) |
  dis1 |
  dis1 |
  dis1\\pp |
  dis1 |

  % Mark G (m. 42)
  e2\\p( gis) |
  e2. r4 |
  fis2\\mp( a) |
  dis2( fis) |
  e2\\p( gis) |
  e2( fis) |
  e4( dis e dis) |

  % Phase 4: Transcendent Acoustic Resolution (mm. 49-60)
  e1\\pp |
  e1\\p |
  d1 |
  dis1\\pp |
  e1 |
  dis1\\ppp |
  e1 |
  dis1 |
  e1 |
  dis1 |
  e1 |
  e2\\fermata r2 |
}
"""

with open(os.path.join(NOTES_DIR, "moonlight_samba_altosax.ily"), "w", encoding="utf-8") as f:
    f.write(ALTOSAX_CONTENT)

# 11. Tenor Sax (Concert Pitch, B2 to E4)
TENORSAX_CONTENT = """\\version "2.24.0"

tenorSaxNotes = \\fixed c {
  \\clef treble

  % Phase 1: Solitary Acoustic Intimacy (mm. 1-16)
  R1 * 4 |
  cis'2\\p( e') |
  cis'2. r4 |
  d'2\\mp( fis') |
  bis2( dis') |

  % Mark B (m. 9)
  cis'2\\p( e') |
  b2( e') |
  e'2( b) |
  b2. r4 |
  b2\\mp( e') |
  ais2( cis') |
  b2\\p( d') |
  ais2. r4 |

  % Phase 2: THE DROP (mm. 17-36)
  b8\\f b r d' b4 d' |
  gis8 gis r cis' gis4 cis' |
  a8\\f a r c' a4 c' |
  gis8 gis r bis gis4 bis |

  % Mark D (m. 21)
  gis8\\f gis r cis' gis4 cis' |
  gis8 gis r bis gis4 bis |
  gis8 gis r cis' gis4 cis' |
  gis8 gis r bis gis4 bis |
  gis4\\<( bis gis cis'\\!) |
  gis4\\>( bis gis cis'\\!) |
  bis4\\f( dis' gis cis') |

  % Mark E (m. 28)
  gis2\\ff( bis) |
  cis'1\\fff |
  cis'2 d' |
  dis'1\\fff |
  dis'2 e' |
  fis'1\\fff |
  fis'2( e') |
  dis'1\\ff |
  cis'1\\f |

  % Phase 3: Climax & Gradual Fade-Out (mm. 37-48)
  b2\\p( d') |
  bis1 |
  bis1 |
  bis1\\pp |
  bis1 |

  % Mark G (m. 42)
  cis'2\\p( e') |
  cis'2. r4 |
  d'2\\mp( fis') |
  bis2( dis') |
  cis'2\\p( e') |
  cis'2( d') |
  cis'4( bis cis' bis) |

  % Phase 4: Transcendent Acoustic Resolution (mm. 49-60)
  cis'1\\pp |
  cis'1\\p |
  d'1 |
  bis1\\pp |
  cis'1 |
  bis1\\ppp |
  cis'1 |
  bis1 |
  cis'1 |
  bis1 |
  cis'1 |
  cis'2\\fermata r2 |
}
"""

with open(os.path.join(NOTES_DIR, "moonlight_samba_tenorsax.ily"), "w", encoding="utf-8") as f:
    f.write(TENORSAX_CONTENT)

# 12. Euphonium (Concert Pitch, C2 to F4)
with open(os.path.join(NOTES_DIR, "moonlight_samba_euphonium.ily"), "w", encoding="utf-8") as f:
    f.write(TROMBONE_CONTENT.replace("tromboneNotes", "euphoniumNotes"))

# 13. Oboe (Concert Pitch, D4 to Eb5)
OBOE_CONTENT = """\\version "2.24.0"

oboeNotes = \\fixed c' {
  \\clef treble

  % Phase 1: Solitary Acoustic Intimacy (mm. 1-16)
  R1 * 8 |

  % Mark B (m. 9)
  R1 * 4 |
  r8 g'4\\mp( fis'8) e'4.( g'8) |
  fis'2. r4 |
  fis'4.\\p fis'8 fis'4. fis'8 |
  fis'2. r4 |

  % Phase 2: THE DROP (mm. 17-36)
  r8 fis'4\\mf( e'8) d'4.( fis'8) |
  eis'2( fis') |
  r8 fis'4\\f( e'8) d'4.( fis'8) |
  dis'2( dis') |

  % Mark D (m. 21)
  cis'2\\f( e') |
  bis2( dis') |
  cis'2( e') |
  bis2( dis') |
  bis4\\<( bis cis' cis'\\!) |
  bis4\\>( bis cis' cis'\\!) |
  dis'4\\f( dis' dis' e') |

  % Mark E (m. 28)
  dis'2\\ff( fis') |
  e'1\\fff |
  e'2 fis' |
  fis'1\\fff |
  fis'2 gis' |
  a'1\\fff |
  a'2( gis') |
  fis'1\\ff |
  e'1\\f |

  % Phase 3: Climax & Gradual Fade-Out (mm. 37-48)
  r8 fis'4\\p( e'8) d'4.( fis'8) |
  dis'1 |
  dis'1 |
  dis'1\\pp |
  dis'1 |

  % Mark G (m. 42)
  R1 * 4 |
  e'4.\\p e'8 e'4. e'8 |
  e'2( fis') |
  e'4( dis' e' dis') |

  % Phase 4: Transcendent Acoustic Resolution (mm. 49-60)
  e'1\\pp |
  cis'1\\p |
  a1 |
  gis1\\pp |
  gis1 |
  gis1\\ppp |
  gis1 |
  gis1 |
  gis1 |
  gis1 |
  gis1 |
  gis2\\fermata r2 |
}
"""

with open(os.path.join(NOTES_DIR, "moonlight_samba_oboe.ily"), "w", encoding="utf-8") as f:
    f.write(OBOE_CONTENT)

# 14. Marimba (Concert Pitch, C3 to G5)
MARIMBA_CONTENT = """\\version "2.24.0"

marimbaNotes = \\fixed c' {
  \\clef treble

  % Phase 1: Solitary Acoustic Intimacy (mm. 1-16) - Silent
  R1 * 16 |

  % Phase 2: THE DROP (mm. 17-36)
  \\tuplet 3/2 4 {
    fis8\\mf( a d')  fis( a d')  fis( a d')  fis( a d') |
    eis8( b d')  eis( b d')  fis( a cis')  fis( a cis') |
    fis8\\f( a c')  fis( a c')  fis( a c')  fis( a c') |
    fis8( gis bis)  fis( gis bis)  fis( gis bis)  fis( gis bis) |

    % Mark D (m. 21)
    e8\\f( gis cis')  e( gis cis')  e( gis cis')  e( gis cis') |
    dis8( fis bis)  dis( fis bis)  dis( fis bis)  dis( fis bis) |
    e8( gis cis')  e( gis cis')  e( gis cis')  e( gis cis') |
    dis8( fis bis)  dis( fis bis)  dis( fis bis)  dis( fis bis) |
    dis8\\<( fis bis)  dis( fis bis)  e( gis cis')  e( gis cis')\\! |
    dis8\\>( fis bis)  dis( fis bis)  e( gis cis')  e( gis cis')\\! |
    fis8\\f( gis bis)  fis( gis bis)  e( gis cis')  e( gis cis') |

    % Mark E (m. 28)
    dis8\\ff( fis bis)  dis( fis bis)  dis( fis a)  dis( fis a) |
    gis8\\fff( cis' e')  gis( cis' e')  gis( cis' e')  gis( cis' e') |
    a8( cis' fis')  a( cis' fis')  a( cis' fis')  a( cis' fis') |
    b8\\fff( dis' fis')  b( dis' fis')  b( dis' fis')  b( dis' fis') |
    bis8\\fff( dis' fis')  bis( dis' fis')  cis'8( e' gis')  cis'8( e' gis') |
    d'8\\fff( fis' a')  d'8( fis' a')  d'8( fis' a')  d'8( fis' a') |
    cis'8\\ff( e' gis')  cis'8( e' gis')  cis'8( e' gis')  cis'8( e' gis') |
    bis8\\f( dis' fis')  bis( dis' fis')  bis( dis' fis')  bis( dis' fis') |
    cis'8\\mp( e' gis')  cis'8( e' gis')  cis'8( e' gis')  cis'8( e' gis') |
  }

  % Phase 3 & 4: TACET
  R1 * 5 |
  R1 * 7 |
  R1 * 11 |
  R1\\fermata |
}
"""

with open(os.path.join(NOTES_DIR, "moonlight_samba_marimba.ily"), "w", encoding="utf-8") as f:
    f.write(MARIMBA_CONTENT)

# 15. Conductor Score: CONCERT PITCH (C SCORE)
# A professional conductor score displays the sounding concert pitch for all instruments,
# eliminating octave transpositions and accidental explosions on the podium score.
SCORE_CONTENT = """\\version "2.24.0"

\\include "../Global/conductor_geometry.ily"
\\include "../Global/moonlight_samba_global.ily"

% Woodwinds
\\include "../Notes/moonlight_samba_flute.ily"
\\include "../Notes/moonlight_samba_oboe.ily"
\\include "../Notes/moonlight_samba_clarinet.ily"
\\include "../Notes/moonlight_samba_altosax.ily"
\\include "../Notes/moonlight_samba_tenorsax.ily"

% Brass
\\include "../Notes/moonlight_samba_trumpet.ily"
\\include "../Notes/moonlight_samba_horn.ily"
\\include "../Notes/moonlight_samba_trombone.ily"
\\include "../Notes/moonlight_samba_euphonium.ily"
\\include "../Notes/moonlight_samba_tuba.ily"

% Rhythm & Bass
\\include "../Notes/moonlight_samba_bass.ily"

% Pitched Percussion
\\include "../Notes/moonlight_samba_glockenspiel.ily"
\\include "../Notes/moonlight_samba_marimba.ily"

% Battery & Latin Percussion
\\include "../Notes/moonlight_samba_percussion1.ily"
\\include "../Notes/moonlight_samba_percussion2.ily"
\\include "../Notes/moonlight_samba_percussion3.ily"
\\include "../Notes/moonlight_samba_timpani.ily"

\\moonlightSambaHeader

% ============================================================================
% VISUAL ENGRAVED CONDUCTOR SCORE — CONCERT PITCH (C SCORE)
% Professional Podium Readability (No Transposition Overlap on Score)
% ============================================================================
\\score {
  <<
    \\new StaffGroup = "Woodwinds" <<
      \\new Staff \\with { instrumentName = #"Flute" shortInstrumentName = #"Fl." } {
        << \\moonlightSambaGlobal \\fluteNotes >>
      }
      \\new Staff \\with { instrumentName = #"Oboe" shortInstrumentName = #"Ob." } {
        << \\moonlightSambaGlobal \\oboeNotes >>
      }
      \\new Staff \\with { instrumentName = #"B♭ Clarinet" shortInstrumentName = #"Cl." } {
        << \\moonlightSambaGlobal \\clarinetNotes >>
      }
      \\new Staff \\with { instrumentName = #"Alto Saxophone" shortInstrumentName = #"A.Sax" } {
        << \\moonlightSambaGlobal \\altoSaxNotes >>
      }
      \\new Staff \\with { instrumentName = #"Tenor Saxophone" shortInstrumentName = #"T.Sax" } {
        << \\moonlightSambaGlobal \\tenorSaxNotes >>
      }
    >>

    \\new StaffGroup = "Brass" <<
      \\new Staff \\with { instrumentName = #"B♭ Trumpet" shortInstrumentName = #"Tpt." } {
        << \\moonlightSambaGlobal \\trumpetNotes >>
      }
      \\new Staff \\with { instrumentName = #"Horn in F" shortInstrumentName = #"Hn." } {
        << \\moonlightSambaGlobal \\hornNotes >>
      }
      \\new Staff \\with { instrumentName = #"Trombone" shortInstrumentName = #"Tbn." } {
        << \\moonlightSambaGlobal \\tromboneNotes >>
      }
      \\new Staff \\with { instrumentName = #"Euphonium" shortInstrumentName = #"Euph." } {
        << \\moonlightSambaGlobal \\euphoniumNotes >>
      }
      \\new Staff \\with { instrumentName = #"Tuba" shortInstrumentName = #"Tba." } {
        << \\moonlightSambaGlobal \\tubaNotes >>
      }
    >>

    \\new StaffGroup = "Rhythm" <<
      \\new Staff \\with { instrumentName = #"Electric Bass" shortInstrumentName = #"E.Bs." } {
        << \\moonlightSambaGlobal \\bassNotes >>
      }
    >>

    \\new StaffGroup = "PitchedPercussion" <<
      \\new Staff \\with { instrumentName = #"Glockenspiel" shortInstrumentName = #"Glock." } {
        << \\moonlightSambaGlobal \\glockenspielNotes >>
      }
      \\new Staff \\with { instrumentName = #"Marimba" shortInstrumentName = #"Mba." } {
        << \\moonlightSambaGlobal \\marimbaNotes >>
      }
    >>

    \\new StaffGroup = "BatteryPercussion" <<
      \\new DrumStaff \\with { instrumentName = #"Percussion 1 (Surdo/Caixa)" shortInstrumentName = #"Perc. 1" } {
        << \\moonlightSambaGlobal \\percussionOneNotes >>
      }
      \\new DrumStaff \\with { instrumentName = #"Percussion 2 (Cowbell/Shaker)" shortInstrumentName = #"Perc. 2" } {
        << \\moonlightSambaGlobal \\percussionTwoNotes >>
      }
      \\new DrumStaff \\with { instrumentName = #"Percussion 3 (Aux Latin)" shortInstrumentName = #"Perc. 3" } {
        << \\moonlightSambaGlobal \\percussionThreeNotes >>
      }
      \\new Staff \\with { instrumentName = #"Timpani" shortInstrumentName = #"Timp." } {
        << \\moonlightSambaGlobal \\timpaniNotes >>
      }
    >>
  >>

  \\layout {
    indent = 2.0\\cm
    short-indent = 1.0\\cm
    \\context {
      \\Score
      \\override BarNumber.break-visibility = ##(#f #t #t)
      \\override RehearsalMark.font-size = #2
    }
  }
}

% ============================================================================
% MULTI-TRACK ACOUSTIC SIMULATION MIDI OUTPUT
% ============================================================================
\\score {
  <<
    \\new Staff = "Flute" \\with { midiInstrument = #"flute" } {
      << \\moonlightSambaGlobal \\fluteNotes >>
    }
    \\new Staff = "Oboe" \\with { midiInstrument = #"oboe" } {
      << \\moonlightSambaGlobal \\oboeNotes >>
    }
    \\new Staff = "Clarinet" \\with { midiInstrument = #"clarinet" } {
      << \\moonlightSambaGlobal \\clarinetNotes >>
    }
    \\new Staff = "AltoSax" \\with { midiInstrument = #"alto sax" } {
      << \\moonlightSambaGlobal \\altoSaxNotes >>
    }
    \\new Staff = "TenorSax" \\with { midiInstrument = #"tenor sax" } {
      << \\moonlightSambaGlobal \\tenorSaxNotes >>
    }
    \\new Staff = "Trumpet" \\with { midiInstrument = #"trumpet" } {
      << \\moonlightSambaGlobal \\trumpetNotes >>
    }
    \\new Staff = "Horn" \\with { midiInstrument = #"french horn" } {
      << \\moonlightSambaGlobal \\hornNotes >>
    }
    \\new Staff = "Trombone" \\with { midiInstrument = #"trombone" } {
      << \\moonlightSambaGlobal \\tromboneNotes >>
    }
    \\new Staff = "Euphonium" \\with { midiInstrument = #"baritone sax" } {
      << \\moonlightSambaGlobal \\euphoniumNotes >>
    }
    \\new Staff = "Tuba" \\with { midiInstrument = #"tuba" } {
      << \\moonlightSambaGlobal \\tubaNotes >>
    }
    \\new Staff = "Bass" \\with { midiInstrument = #"electric bass (finger)" } {
      << \\moonlightSambaGlobal \\bassNotes >>
    }
    \\new Staff = "Glockenspiel" \\with { midiInstrument = #"glockenspiel" } {
      << \\moonlightSambaGlobal \\glockenspielNotes >>
    }
    \\new Staff = "Marimba" \\with { midiInstrument = #"marimba" } {
      << \\moonlightSambaGlobal \\marimbaNotes >>
    }
    \\new DrumStaff = "Percussion1" \\with { midiInstrument = #"standard kit" } {
      << \\moonlightSambaGlobal \\percussionOneNotes >>
    }
    \\new DrumStaff = "Percussion2" \\with { midiInstrument = #"standard kit" } {
      << \\moonlightSambaGlobal \\percussionTwoNotes >>
    }
    \\new DrumStaff = "Percussion3" \\with { midiInstrument = #"standard kit" } {
      << \\moonlightSambaGlobal \\percussionThreeNotes >>
    }
    \\new Staff = "Timpani" \\with { midiInstrument = #"timpani" } {
      << \\moonlightSambaGlobal \\timpaniNotes >>
    }
  >>

  \\midi {
    \\tempo 4 = 88
  }
}
"""

with open(os.path.join(SCORES_DIR, "moonlight_samba_score.ly"), "w", encoding="utf-8") as f:
    f.write(SCORE_CONTENT)

print("All Moonlight Samba notes and score successfully regenerated with fixed C-Score geometry!")
