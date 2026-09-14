import re
import subprocess
from validate_playability import audit_midi_file

def main():
    with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
        ly = f.read()

    # 1. Oboe: change \fixed c' to \fixed c
    ly = ly.replace('oboePart = \\fixed c\'', 'oboePart = \\fixed c')

    # 2. Flute rest in mm. 169-172 (replace 4 bars in D Major Chorus)
    flute_old = """  fis''4. e''8 d''4 cis'' |
  b'4. cis''8 d''2 |
  e''4. fis''8 g''4 a'' |
  d''2. r4 |"""
    flute_new = """  % mm. 169-172: Rest (Breath recovery)
  R1*4 |"""
    # Replace in flutePart
    idx_fl = ly.find('flutePart')
    idx_ob = ly.find('oboePart')
    fl_part = ly[idx_fl:idx_ob]
    if flute_old in fl_part:
        fl_part = fl_part.replace(flute_old, flute_new, 1)
        ly = ly[:idx_fl] + fl_part + ly[idx_ob:]
        print("  Flute rest mm. 169-172 applied.")
    else:
        print("  Warning: flute_old not found in flutePart")

    # 3. Oboe rest in mm. 53-56 (replace 4 bars in Bat Country Chorus)
    oboe_old = """  a'4. g'8 f'4 d' |
  e'4. f'8 g'2 |
  a'4. g'8 f'4 e' |
  d'1\\> |"""
    oboe_new = """  % mm. 53-56: Rest (Breath recovery)
  R1*4 |"""
    idx_ob = ly.find('oboePart')
    idx_cl = ly.find('clarinetPart')
    ob_part = ly[idx_ob:idx_cl]
    if oboe_old in ob_part:
        ob_part = ob_part.replace(oboe_old, oboe_new, 1)
        ly = ly[:idx_ob] + ob_part + ly[idx_cl:]
        print("  Oboe rest mm. 53-56 applied.")
    else:
        print("  Warning: oboe_old not found in oboePart")

    # 4. Clarinet rest in mm. 161-164 (replace 4 bars in Movement VI)
    clar_old = """  f'8-.\\fff g'-. a'-. bes'-. c''4-^ d''-^ |
  e''4. d''8 c''4 bes' |
  a'8-. bes'-. c''-. d''-. e''-. f''-. g''4-^ |
  a'1-^ |"""
    clar_new = """  % mm. 161-164: Rest (Breath recovery)
  R1*4 |"""
    idx_cl = ly.find('clarinetPart')
    idx_sx = ly.find('altoSaxPart')
    cl_part = ly[idx_cl:idx_sx]
    if clar_old in cl_part:
        cl_part = cl_part.replace(clar_old, clar_new, 1)
        ly = ly[:idx_cl] + cl_part + ly[idx_sx:]
        print("  Clarinet rest mm. 161-164 applied.")
    else:
        print("  Warning: clar_old not found in clarinetPart")

    # 5. French Horn rests: mm. 53-56 and mm. 81-84
    horn_old_53 = """  a'4. g'8 f'4 d' |
  e'4. f'8 g'2 |
  a'4. g'8 f'4 e' |
  d'1\\> |"""
    horn_new_53 = """  % mm. 53-56: Rest (Breath recovery)
  R1*4 |"""
    horn_old_81 = """  f'4.\\p g'8 a'4 bes' |
  c''2. bes'4 |
  a'8( g' f' e' d' c' bes c') |
  a'1\\fermata |"""
    horn_new_81 = """  % mm. 81-84: Rest (Breath recovery)
  R1*4 |"""
    idx_hn = ly.find('hornPart')
    idx_tb = ly.find('trombonePart')
    hn_part = ly[idx_hn:idx_tb]
    if horn_old_53 in hn_part:
        hn_part = hn_part.replace(horn_old_53, horn_new_53, 1)
        print("  Horn rest mm. 53-56 applied.")
    if horn_old_81 in hn_part:
        hn_part = hn_part.replace(horn_old_81, horn_new_81, 1)
        print("  Horn rest mm. 81-84 applied.")
    ly = ly[:idx_hn] + hn_part + ly[idx_tb:]

    # 6. Note Range Fixes:
    # Alto Sax: in altoSaxPart, replace low notes and high fis''
    idx_sx = ly.find('altoSaxPart')
    idx_tp = ly.find('trumpetPart')
    sx_part = ly[idx_sx:idx_tp]
    sx_part = re.sub(r'\bfis\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", sx_part)
    sx_part = re.sub(r'\bf#\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", sx_part)
    # Raise any note in mm. 73-84:
    # Replace single-letter low notes (a, b, g, f, e) with a', b', g', f', e'
    sx_part = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", sx_part)
    ly = ly[:idx_sx] + sx_part + ly[idx_tp:]

    # Trumpet: in trumpetPart, replace low notes and high fis''
    idx_tp = ly.find('trumpetPart')
    idx_hn = ly.find('hornPart')
    tp_part = ly[idx_tp:idx_hn]
    tp_part = re.sub(r'\bfis\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", tp_part)
    tp_part = re.sub(r'\bf#\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", tp_part)
    tp_part = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", tp_part)
    ly = ly[:idx_tp] + tp_part + ly[idx_hn:]

    # French Horn: in hornPart, replace low notes and high fis''
    idx_hn = ly.find('hornPart')
    idx_tb = ly.find('trombonePart')
    hn_part = ly[idx_hn:idx_tb]
    hn_part = re.sub(r'\bfis\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", hn_part)
    hn_part = re.sub(r'\bf#\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", hn_part)
    hn_part = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", hn_part)
    ly = ly[:idx_hn] + hn_part + ly[idx_tb:]

    # Tuba: in tubaPart, replace cis,, -> cis, and fis -> f
    idx_tu = ly.find('tubaPart')
    idx_eb = ly.find('electricBassPart')
    tu_part = ly[idx_tu:idx_eb]
    tu_part = re.sub(r'\bcis,,', 'cis,', tu_part)
    tu_part = re.sub(r'\bc#,,', 'c#,', tu_part)
    tu_part = re.sub(r'\bfis(?=[0-9\s\.\-\^\(\)]|$)', 'f', tu_part)
    tu_part = re.sub(r'\bf#(?=[0-9\s\.\-\^\(\)]|$)', 'f', tu_part)
    ly = ly[:idx_tu] + tu_part + ly[idx_eb:]

    # Glockenspiel: in glockPart, change '''' to ''' and a'' -> bes''
    idx_gl = ly.find('glockPart')
    idx_ma = ly.find('marimbaPart')
    gl_part = ly[idx_gl:idx_ma]
    gl_part = gl_part.replace("''''", "'''")
    gl_part = re.sub(r'\ba\'\'(?=[0-9\s\.\-\^\(\)]|$)', "bes''", gl_part)
    ly = ly[:idx_gl] + gl_part + ly[idx_ma:]

    # Write back
    with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
        f.write(ly)
    print("city_of_evil_medley.ly successfully updated with master fixes!")

if __name__ == '__main__':
    main()
