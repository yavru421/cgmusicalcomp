import re
import subprocess
import os

with open('clean_base.py', 'r', encoding='utf-8') as f:
    text = f.read()

# 1. Update \fixed
for v in ['flutePart', 'clarinetPart', 'altoSaxPart', 'trumpetPart', 'hornPart', 'trombonePart', 'tubaPart', 'electricBassPart', 'celloPart', 'marimbaPart']:
    text = text.replace(f"{v} = \\fixed c'", f"{v} = \\fixed c")

# oboePart stays \fixed c'

# 2. Breathing rests:
# Flute mm. 161-164: replace 4 bars
flute_m161_old = """  % mm. 161-168: Final March Stabs
  f#''4.\ff e''8 d''4 cis'' |
  b'2. a'4 |
  b'4. cis''8 d''4 e'' |
  fis''2. r4 |"""
flute_m161_new = """  % mm. 161-168: Final March Stabs (Rest recovery mm. 161-164)
  R1*4 |"""
text = text.replace(flute_m161_old, flute_m161_new)

# Oboe mm. 53-56: replace 4 bars
oboe_m53_old = """  a''4. g''8 f''4 e'' |
  f''4. g''8 a''2 |
  a''4. g''8 f''4 e'' |
  d''1 |"""
oboe_m53_new = """  % mm. 53-56: Rest (Breath recovery)
  R1*4 |"""
text = text.replace(oboe_m53_old, oboe_m53_new)

# Clarinet mm. 153-160: replace 8 bars
clarinet_m153_old = """  % mm. 153-160: Lyrical Solo Interlude
  f''4.\p g''8 a''4 bes'' |
  c'''2. bes''4 |
  a''4. bes''8 c'''4 d''' |
  c'''2. r4 |
  d''4. e''8 f''4 g'' |
  a''2. g''4 |
  f''4. g''8 a''4 bes'' |
  a''2. r4 |"""
clarinet_m153_new = """  % mm. 153-160: Rest during Flute Solo (Breath recovery)
  R1*8 |"""
text = text.replace(clarinet_m153_old, clarinet_m153_new)

# Alto Sax mm. 101-104: replace 4 bars
sax_m101_old = """  % mm. 101-112: Orchestral March Stabs
  g'8-.\ff g'-. r4 bes'8-. bes'-. r4 |
  d''8-. d''-. r d'' c''4-^ r |
  ees''4.(\f d''8 c''4. bes'8 |
  a'2 d'2) |"""
sax_m101_new = """  % mm. 101-104: Rest (Breath recovery)
  R1*4 |"""
text = text.replace(sax_m101_old, sax_m101_new)

# Trumpet mm. 101-104: replace 4 bars
tpt_m101_old = """  % mm. 101-112: Orchestral March Lead
  g'8-.\ff g'-. r4 bes'8-. bes'-. r4 |
  d''8-. d''-. r d'' c''4-^ r |
  ees''4.(\f d''8 c''4. bes'8 |
  a'2 d'2) |"""
tpt_m101_new = """  % mm. 101-104: Rest (Breath recovery)
  R1*4 |"""
text = text.replace(tpt_m101_old, tpt_m101_new)

# French Horn:
# mm. 53-56:
horn_m53_old = """  a'4. g'8 f'4 e' |
  f'4. g'8 a'2 |
  a'4. g'8 f'4 e' |
  d'1 |"""
horn_m53_new = """  % mm. 53-56: Rest (Breath recovery)
  R1*4 |"""
text = text.replace(horn_m53_old, horn_m53_new)

# mm. 81-84:
horn_m81_old = """  d'4.\p e'8 f'4 g' |
  a'2. g'4 |
  f'8( e' d' c' bes a g e) |
  f1\fermata |"""
horn_m81_new = """  % mm. 81-84: Rest (Breath recovery)
  R1*4 |"""
text = text.replace(horn_m81_old, horn_m81_new)

# mm. 105-108:
horn_m105_old = """  g'8-. g'-. r4 bes'8-. bes'-. r4 |
  c''8-. c''-. r c'' d''4-^ r |
  ees''4. d''8 c''4 a' |
  g'2. r4 |"""
horn_m105_new = """  % mm. 105-108: Rest (Breath recovery)
  R1*4 |"""
text = text.replace(horn_m105_old, horn_m105_new)

# Now write patched score
with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
    f.write(text)

print("Score patched and written to city_of_evil_medley.ly.")
