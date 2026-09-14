import re

def fix():
    with open("city_of_evil_medley.ly", "r", encoding="utf-8") as f:
        text = f.read()

    # 1. Percussion fixes
    text = text.replace(
        "tomh8-> tommh16 toml tommh8-> tomh toml-> tommh |",
        "tomh8-> tommh16 toml tommh8-> tomh toml-> tommh toml4-^ |"
    )
    text = text.replace(
        "tomfl8-> toml tomh tommh toml tomfl |",
        "tomfl8-> toml tomh tommh toml tomfl toml4-^ |"
    )

    # 2. Oboe fix in Mov V
    # In oboePart, replace R2.*4 | with R2.*6 |
    oboe_old = """  % mm. 113-124: Rest
  R1*8 |
  \\time 6/8
  R2.*4 |
  % mm. 125-136: Sidewinder Counter-Flamenco"""
    oboe_new = """  % mm. 113-120: Rest
  R1*8 |
  \\time 6/8
  % mm. 121-126: Rest in 6/8
  R2.*6 |
  % mm. 127-136: Sidewinder Counter-Flamenco"""
    assert oboe_old in text, "Could not find oboe block"
    text = text.replace(oboe_old, oboe_new)

    # 3. Trombone fix in Mov III & IV
    tbn_old = """  % mm. 81-88: Rest (Breath recovery)
  R1*8 |

  % --- Movement IV: The Wicked End (mm. 89-112) ---
  \\key g \\minor
  \\time 3/4
  % mm. 89-100: Classical Choral Counterpoint (in 3/4)"""
    tbn_new = """  % mm. 81-84: Rest (Breath recovery)
  R1*4 |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \\key g \\minor
  \\time 3/4
  % mm. 85-88: Rest in 3/4
  R2.*4 |
  % mm. 89-100: Classical Choral Counterpoint (in 3/4)"""
    assert tbn_old in text, "Could not find trombone block"
    text = text.replace(tbn_old, tbn_new)

    # 4. Tuba fix in Mov III & IV
    tuba_old = """  % mm. 81-88: Rest (Breath recovery)
  R1*8 |

  % --- Movement IV: The Wicked End (mm. 89-112) ---
  \\key g \\minor
  \\time 3/4
  % mm. 89-100: Classical Low Choral Base (in 3/4)"""
    tuba_new = """  % mm. 81-84: Rest (Breath recovery)
  R1*4 |

  % --- Movement IV: The Wicked End (mm. 85-112) ---
  \\key g \\minor
  \\time 3/4
  % mm. 85-88: Rest in 3/4
  R2.*4 |
  % mm. 89-100: Classical Low Choral Base (in 3/4)"""
    assert tuba_old in text, "Could not find tuba block"
    text = text.replace(tuba_old, tuba_new)

    # 5. Alto Sax fix in Mov V & VI
    sax_old = """  % mm. 141-152: Rest (Deep breath recovery before Finale)
  R1*12 |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 153-184) ---
  % mm. 153-168: Driving Gallop Lead"""
    sax_new = """  % mm. 141-144: Rest
  R1*4 |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Rest (Deep breath recovery)
  R1*8 |
  % mm. 153-168: Driving Gallop Lead"""
    assert sax_old in text, "Could not find alto sax block"
    text = text.replace(sax_old, sax_new)

    # 6. Trumpet fix in Mov V & VI
    tpt_old = """  % mm. 137-152: Rest (Deep breath recovery before Finale)
  \\time 4/4
  R1*16 |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 153-184) ---
  % mm. 153-168: Driving Gallop Fanfares"""
    tpt_new = """  % mm. 137-144: Rest
  \\time 4/4
  R1*8 |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Rest (Deep breath recovery)
  R1*8 |
  % mm. 153-168: Driving Gallop Fanfares"""
    assert tpt_old in text, "Could not find trumpet block"
    text = text.replace(tpt_old, tpt_new)

    # 7. Clarinet fix in Mov V & VI
    cl_old = """  d''1-^ |
  % mm. 149-156: Rest during military march
  R1*8 |
  % mm. 157-168: Driving Gallop Tutti"""
    cl_new = """  d''1-^ |

  % --- Movement VI: M.I.A. (Grand Finale) (mm. 145-184) ---
  % mm. 145-152: Rest during military march
  R1*8 |
  % mm. 153-164: Driving Gallop Tutti"""
    assert cl_old in text, "Could not find clarinet block"
    text = text.replace(cl_old, cl_new)

    cl_chorus_old = """  a''1-^ |
  % mm. 169-172: Rest (Breath recovery)
  \\key d \\major
  R1*4 |
  % mm. 173-184: Triumphant Anthem Chorus & Grand Coda
  d''4.\\ffff cis''8 b'4 a' |
  b'4. cis''8 d''2 |
  e''4. fis''8 g''4 a'' |
  fis''1 |"""
    cl_chorus_new = """  a''1-^ |
  % mm. 165-176: Triumphant Anthem Chorus in D Major
  \\key d \\major
  d''4.\\ffff cis''8 b'4 a' |
  b'4. cis''8 d''2 |
  e''4. d''8 cis''4 b' |
  a'2. r4 |
  fis'4. e'8 d'4 cis' |
  b4. cis'8 d'2 |
  e'4. fis'8 g'4 a' |
  d'2. r4 |
  d''4. cis''8 b'4 a' |
  b'4. cis''8 d''2 |
  e''4. fis''8 g''4 a'' |
  fis''1 |"""
    assert cl_chorus_old in text, "Could not find clarinet chorus block"
    text = text.replace(cl_chorus_old, cl_chorus_new)

    # 8. Cello fix in Mov VI
    cello_old = """  a'1-^ |
  d4.\\ffff e8 f4 a |
  bes4. c'8 d'2 |
  c'4. bes8 a4 g |
  f1 |
  % mm. 165-176: Triumphant Anthem Chorus in D Major"""
    cello_new = """  a'1-^ |
  % mm. 165-176: Triumphant Anthem Chorus in D Major"""
    assert cello_old in text, "Could not find cello block"
    text = text.replace(cello_old, cello_new)

    with open("city_of_evil_medley.ly", "w", encoding="utf-8") as f:
        f.write(text)
    print("All fixes applied successfully!")

if __name__ == "__main__":
    fix()
