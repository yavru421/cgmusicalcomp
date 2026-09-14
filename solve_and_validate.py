import os
import re
import subprocess
from validate_playability import audit_midi_file

def main():
    with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
        content = f.read()

    # Extract score_content template
    # Fix the two known syntax bugs in original
    content = content.replace(r'bes,4.~\ bes,4 r8 |', r'bes,4.~ bes,4 r8 |')
    content = content.replace(r'tomh8-> tommh16 toml tommh8-> tomh toml-> tommh |', r'tomh8-> tommh16 toml tommh8-> tomh toml8-> tommh tomfl8-> toml |')

    # Update \fixed definitions
    for v in ['flutePart', 'clarinetPart', 'altoSaxPart', 'trumpetPart', 'hornPart', 'trombonePart', 'tubaPart', 'electricBassPart', 'celloPart', 'marimbaPart']:
        content = content.replace(f"{v} = \\fixed c'", f"{v} = \\fixed c")

    # oboePart stays \fixed c'

    # Breathing rests
    # 1. Flute mm. 161-164 (4 bars)
    old_flute_161 = """  % mm. 161-168: Final March Stabs
  f#''4.\\ff e''8 d''4 cis'' |
  b'2. a'4 |
  b'4. cis''8 d''4 e'' |
  fis''2. r4 |"""
    new_flute_161 = """  % mm. 161-168: Final March Stabs
  R1*4 |"""
    if old_flute_161 in content:
        content = content.replace(old_flute_161, new_flute_161)
    else:
        # try without escaped backslash
        old_flute_161_alt = old_flute_161.replace('\\ff', r'\ff')
        content = content.replace(old_flute_161_alt, new_flute_161)

    # 2. Oboe mm. 53-56 (4 bars)
    old_oboe_53 = """  a''4. g''8 f''4 e'' |
  f''4. g''8 a''2 |
  a''4. g''8 f''4 e'' |
  d''1 |"""
    new_oboe_53 = """  % mm. 53-56: Rest (Breath recovery)
  R1*4 |"""
    content = content.replace(old_oboe_53, new_oboe_53)

    # 3. Clarinet mm. 153-160 (8 bars)
    old_clar_153 = """  % mm. 153-160: Lyrical Solo Interlude
  f''4.\\p g''8 a''4 bes'' |
  c'''2. bes''4 |
  a''4. bes''8 c'''4 d''' |
  c'''2. r4 |
  d''4. e''8 f''4 g'' |
  a''2. g''4 |
  f''4. g''8 a''4 bes'' |
  a''2. r4 |"""
    new_clar_153 = """  % mm. 153-160: Rest during Flute Solo (Breath recovery)
  R1*8 |"""
    content = content.replace(old_clar_153, new_clar_153)

    # 4. Alto Sax mm. 101-104 (4 bars)
    old_sax_101 = """  % mm. 101-112: Orchestral March Stabs
  g'8-.\\ff g'-. r4 bes'8-. bes'-. r4 |
  d''8-. d''-. r d'' c''4-^ r |
  ees''4.(\\f d''8 c''4. bes'8 |
  a'2 d'2) |"""
    new_sax_101 = """  % mm. 101-104: Rest (Breath recovery)
  R1*4 |"""
    content = content.replace(old_sax_101, new_sax_101)

    # 5. Trumpet mm. 101-104 (4 bars)
    old_tpt_101 = """  % mm. 101-112: Orchestral March Lead
  g'8-.\\ff g'-. r4 bes'8-. bes'-. r4 |
  d''8-. d''-. r d'' c''4-^ r |
  ees''4.(\\f d''8 c''4. bes'8 |
  a'2 d'2) |"""
    new_tpt_101 = """  % mm. 101-104: Rest (Breath recovery)
  R1*4 |"""
    content = content.replace(old_tpt_101, new_tpt_101)

    # 6. French Horn mm. 53-56, 81-84, 105-108
    old_horn_53 = """  a'4. g'8 f'4 e' |
  f'4. g'8 a'2 |
  a'4. g'8 f'4 e' |
  d'1 |"""
    new_horn_53 = """  % mm. 53-56: Rest (Breath recovery)
  R1*4 |"""
    content = content.replace(old_horn_53, new_horn_53)

    old_horn_81 = """  d'4.\\p e'8 f'4 g' |
  a'2. g'4 |
  f'8( e' d' c' bes a g e) |
  f1\\fermata |"""
    new_horn_81 = """  % mm. 81-84: Rest (Breath recovery)
  R1*4 |"""
    content = content.replace(old_horn_81, new_horn_81)

    old_horn_105 = """  g'8-. g'-. r4 bes'8-. bes'-. r4 |
  c''8-. c''-. r c'' d''4-^ r |
  ees''4. d''8 c''4 a' |
  g'2. r4 |"""
    new_horn_105 = """  % mm. 105-108: Rest (Breath recovery)
  R1*4 |"""
    content = content.replace(old_horn_105, new_horn_105)

    with open('build_clean_city_of_evil.py', 'w', encoding='utf-8') as f:
        f.write(content)

    print("build_clean_city_of_evil.py updated with fixed octaves and breathing rests.")

if __name__ == '__main__':
    main()
