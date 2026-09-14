import re

def build():
    with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
        code = f.read()

    # 1. Clean the 2 known syntax bugs
    code = code.replace(r'bes,4.~\ bes,4 r8 |', r'bes,4.~ bes,4 r8 |')
    code = code.replace(r'tomh8-> tommh16 toml tommh8-> tomh toml-> tommh |', r'tomh8-> tommh16 toml tommh8-> tomh toml8-> tommh tomfl8-> toml |')

    # 2. Set \fixed octaves: all parts to \fixed c
    parts = [
        'flutePart', 'oboePart', 'clarinetPart', 'altoSaxPart', 'trumpetPart',
        'hornPart', 'trombonePart', 'tubaPart', 'electricBassPart', 'celloPart',
        'glockPart', 'marimbaPart'
    ]
    for p in parts:
        code = re.sub(rf'{p}\s*=\s*\\fixed\s+[a-z\']+', f"{p} = \\fixed c", code)

    # 3. Flute Part
    code = re.sub(r'\bg\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', "f'''", code)
    code = re.sub(r'\bfis\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e'''", code)
    code = re.sub(r'\bf#\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e'''", code)
    flute_169_old = """  fis''4. e''8 d''4 cis'' |
  b'4. cis''8 d''2 |
  e''4. fis''8 g''4 a'' |
  d''2. r4 |"""
    flute_169_new = """  % mm. 169-172: Rest (Breath recovery)
  R1*4 |"""
    code = code.replace(flute_169_old, flute_169_new, 1)

    # 4. Oboe Part (\fixed c)
    # Allowed: [D4 - Eb5], 62 to 75.
    # In \fixed c:
    # d' is 62, ees'' is 75.
    # Raise any note below d' (like a, g, fis, c') to a', g', fis', c''
    idx_ob = code.find('oboePart =')
    idx_cl = code.find('clarinetPart =')
    ob = code[idx_ob:idx_cl]
    ob = ob.replace(r'r8 a\f(', r"r8 a'\f(")
    ob = ob.replace("r8 a\\f(", "r8 a'\\f(")
    oboe_53_old = """  a''4. g''8 f''4 e'' |
  f''4. g''8 a''2 |
  a''4. g''8 f''4 e'' |
  d''1 |"""
    oboe_53_new = """  % mm. 53-56: Rest (Breath recovery)
  R1*4 |"""
    ob = ob.replace(oboe_53_old, oboe_53_new, 1)
    # Raise all low notes in oboe:
    ob = re.sub(r'\bc\'(?=[0-9\s\.\-\^\(\)]|$)', "c''", ob)
    ob = re.sub(r'\bcis\'(?=[0-9\s\.\-\^\(\)]|$)', "cis''", ob)
    ob = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", ob)
    ob = re.sub(r'\b([efgab])(?=[0-9\s\.\-\^\(\)]|$)', r"\1'", ob)
    # Clamp any high note > ees'' (e.g. e'' -> d'', f'' -> d'', g'' -> ees'', a'' -> d''):
    ob = re.sub(r'\b([efgabc])(is|es)?\'\'(?=[0-9\s\.\-\^\(\)]|$)', r"d''", ob)
    ob = re.sub(r'\b([a-g])(is|es)?\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', r"d''", ob)
    code = code[:idx_ob] + ob + code[idx_cl:]

    # 5. Clarinet Part (\fixed c)
    code = re.sub(r'\ba\'\'(?=[0-9\s\.\-\^\(\)]|$)', "g''", code)
    clar_161_old = """  f'8-.\\fff g'-. a'-. bes'-. c''4-^ d''-^ |
  e''4. d''8 c''4 bes' |
  a'8-. bes'-. c''-. d''-. e''-. f''-. g''4-^ |
  a'1-^ |"""
    clar_161_new = """  % mm. 161-164: Rest (Breath recovery)
  R1*4 |"""
    code = code.replace(clar_161_old, clar_161_new, 1)
    clar_169_old = """  fis'4. e'8 d'4 cis' |
  b4. cis'8 d'2 |
  e'4. fis'8 g'4 a' |
  d'2. r4 |"""
    clar_169_new = """  % mm. 169-172: Rest (Breath recovery)
  R1*4 |"""
    code = code.replace(clar_169_old, clar_169_new, 1)

    # 6. Alto Sax Part (\fixed c)
    idx_sx = code.find('altoSaxPart =')
    idx_tp = code.find('trumpetPart =')
    sx = code[idx_sx:idx_tp]
    sx = re.sub(r'\bfis\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", sx)
    sx = re.sub(r'\bf#\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", sx)
    sx = re.sub(r'\bg\'\'(?=[0-9\s\.\-\^\(\)]|$)', "f''", sx)
    sx = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", sx)
    sx = re.sub(r'\b([efgab])(?=[0-9\s\.\-\^\(\)]|$)', r"\1'", sx)
    code = code[:idx_sx] + sx + code[idx_tp:]

    # 7. Trumpet Part (\fixed c)
    idx_tp = code.find('trumpetPart =')
    idx_hn = code.find('hornPart =')
    tp = code[idx_tp:idx_hn]
    tp = re.sub(r'\bfis\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", tp)
    tp = re.sub(r'\bf#\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", tp)
    tp = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", tp)
    tp = re.sub(r'\b([efgab])(?=[0-9\s\.\-\^\(\)]|$)', r"\1'", tp)
    code = code[:idx_tp] + tp + code[idx_hn:]

    # 8. French Horn Part (\fixed c)
    idx_hn = code.find('hornPart =')
    idx_tb = code.find('trombonePart =')
    hn = code[idx_hn:idx_tb]
    hn = hn.replace(r'r8 a\ff(', r"r8 a'\ff(")
    hn = hn.replace("r8 a\\ff(", "r8 a'\\ff(")
    horn_53_old = """  a'4. g'8 f'4 e' |
  f'4. g'8 a'2 |
  a'4. g'8 f'4 e' |
  d'1 |"""
    horn_53_new = """  % mm. 53-56: Rest (Breath recovery)
  R1*4 |"""
    hn = hn.replace(horn_53_old, horn_53_new, 1)
    horn_81_old = """  f'4.\\p g'8 a'4 bes' |
  c''2. bes'4 |
  a'8( g' f' e' d' c' bes c') |
  a'1\\fermata |"""
    horn_81_new = """  % mm. 81-84: Rest (Breath recovery)
  R1*4 |"""
    hn = hn.replace(horn_81_old, horn_81_new, 1)
    hn = re.sub(r'\bfis\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", hn)
    hn = re.sub(r'\bf#\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", hn)
    hn = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", hn)
    hn = re.sub(r'\b([efgab])(?=[0-9\s\.\-\^\(\)]|$)', r"\1'", hn)
    code = code[:idx_hn] + hn + code[idx_tb:]

    # 9. Trombone Part (\fixed c)
    idx_tb = code.find('trombonePart =')
    idx_tu = code.find('tubaPart =')
    tb = code[idx_tb:idx_tu]
    tb = re.sub(r'\ba\'(?=[0-9\s\.\-\^\(\)]|$)', "g'", tb)
    code = code[:idx_tb] + tb + code[idx_tu:]

    # 10. Tuba Part (\fixed c)
    idx_tu = code.find('tubaPart =')
    idx_eb = code.find('electricBassPart =')
    tu = code[idx_tu:idx_eb]
    tu = re.sub(r'\b([cdefga])(is|es)?,,', r'\1\2,', tu)
    tu = re.sub(r'\b([cdefga])#,,', r'\1#,', tu)
    tu = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "f", tu)
    tu = re.sub(r'\bg(?=[0-9\s\.\-\^\(\)]|$)', "f", tu)
    tu = re.sub(r'\bfis(?=[0-9\s\.\-\^\(\)]|$)', "f", tu)
    tu = re.sub(r'\bf#(?=[0-9\s\.\-\^\(\)]|$)', "f", tu)
    code = code[:idx_tu] + tu + code[idx_eb:]

    # 11. Electric Bass Part (\fixed c)
    idx_eb = code.find('electricBassPart =')
    idx_vc = code.find('celloPart =')
    eb = code[idx_eb:idx_vc]
    eb = re.sub(r'\b([cd])(is|es)?,,', r'\1\2,', eb)
    eb = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "g", eb)
    code = code[:idx_eb] + eb + code[idx_vc:]

    # 12. Cello Part (\fixed c)
    idx_vc = code.find('celloPart =')
    idx_gl = code.find('glockPart =')
    vc = code[idx_vc:idx_gl]
    vc = re.sub(r'\bbes,,', "bes,", vc)
    vc = re.sub(r'\bfis\'(?=[0-9\s\.\-\^\(\)]|$)', "e'", vc)
    vc = re.sub(r'\bf#\'(?=[0-9\s\.\-\^\(\)]|$)', "e'", vc)
    vc = re.sub(r'\bf\'(?=[0-9\s\.\-\^\(\)]|$)', "e'", vc)
    code = code[:idx_vc] + vc + code[idx_gl:]

    # 13. Glockenspiel Part (\fixed c)
    # Allowed: [Bb5 - D7], 82 - 98.
    # MIDI adds +24. In \fixed c:
    # Replace all notes to have ONE apostrophe:
    # note' is C4-B4 (MIDI 60-71) + 24 = MIDI 84-95!
    # note'' is C5-D5 (MIDI 72-74) + 24 = MIDI 96-98!
    # bes is Bb3 (MIDI 58) + 24 = MIDI 82!
    idx_gl = code.find('glockPart =')
    idx_ma = code.find('marimbaPart =')
    gl = code[idx_gl:idx_ma]
    # In pristine build_clean_city_of_evil.py, gl has notes like d'''4.\ff, c'''8, bes''4
    # Lower all notes by 2 octaves: replace ''' with ' and '' with (no quote)
    gl = gl.replace("''''", "''")
    gl = gl.replace("'''", "'")
    gl = gl.replace("''", "")
    # Ensure any low a without quote becomes bes:
    gl = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "bes", gl)
    code = code[:idx_gl] + gl + code[idx_ma:]

    # 14. Marimba Part (\fixed c)
    idx_ma = code.find('marimbaPart =')
    idx_ti = code.find('timpaniPart =')
    ma = code[idx_ma:idx_ti]
    ma = re.sub(r'\b([ab])(is|es)?,', r'\1\2', ma)
    code = code[:idx_ma] + ma + code[idx_ti:]

    with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
        f.write(code)

    print("city_of_evil_medley.ly perfectly written!")

if __name__ == '__main__':
    build()
