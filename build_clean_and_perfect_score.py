import os
import re
import subprocess
from validate_playability import audit_midi_file

def main():
    # Read the original pristine build_clean_city_of_evil.py
    with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
        code = f.read()

    # 1. Clean the 2 known syntax bugs
    code = code.replace(r'bes,4.~\ bes,4 r8 |', r'bes,4.~ bes,4 r8 |')
    code = code.replace(r'tomh8-> tommh16 toml tommh8-> tomh toml-> tommh |', r'tomh8-> tommh16 toml tommh8-> tomh toml8-> tommh tomfl8-> toml |')

    # 2. Set \fixed octaves
    for v in ['flutePart', 'clarinetPart', 'altoSaxPart', 'trumpetPart', 'hornPart', 'trombonePart', 'tubaPart', 'electricBassPart', 'celloPart', 'marimbaPart']:
        code = re.sub(rf'{v}\s*=\s*\\fixed\s+[a-z\']+', f"{v} = \\fixed c", code)
    code = re.sub(r'oboePart\s*=\s*\\fixed\s+[a-z\']+', "oboePart = \\fixed c'", code)
    code = re.sub(r'glockPart\s*=\s*\\fixed\s+[a-z\']+', "glockPart = \\fixed c'", code)

    # 3. Flute Part
    # Range: max note <= f'''
    code = re.sub(r'\bg\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', "f'''", code)
    code = re.sub(r'\bfis\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e'''", code)
    code = re.sub(r'\bf#\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e'''", code)
    # Breathing rest in mm. 169-172
    flute_169_old = """  fis''4. e''8 d''4 cis'' |
  b'4. cis''8 d''2 |
  e''4. fis''8 g''4 a'' |
  d''2. r4 |"""
    flute_169_new = """  % mm. 169-172: Rest (Breath recovery)
  R1*4 |"""
    code = code.replace(flute_169_old, flute_169_new, 1)

    # 4. Oboe Part (\fixed c')
    # m.29: r8 a\f( -> r8 a'\f(
    code = code.replace("r8 a\\f(", "r8 a'\\f(")
    # Breathing rest in mm. 53-56
    oboe_53_old = """  a''4. g''8 f''4 e'' |
  f''4. g''8 a''2 |
  a''4. g''8 f''4 e'' |
  d''1 |"""
    oboe_53_new = """  % mm. 53-56: Rest (Breath recovery)
  R1*4 |"""
    code = code.replace(oboe_53_old, oboe_53_new, 1)
    # In oboePart, lower notes >= e'' down an octave (e'' -> e', f'' -> f', etc.)
    # Find oboePart boundaries
    idx_ob = code.find('oboePart =')
    idx_cl = code.find('clarinetPart =')
    ob = code[idx_ob:idx_cl]
    def lower_oboe(m):
        note = m.group(1)
        acc = m.group(2) or ""
        octs = m.group(3)
        rest = m.group(4) or ""
        if len(octs) == 2: # '' -> '
            return f"{note}{acc}'{rest}"
        elif len(octs) == 3: # ''' -> ''
            return f"{note}{acc}''{rest}"
        return m.group(0)
    ob = re.sub(r'\b([a-g])(is|es)?(\'\'|\'\'\')([0-9\.\-\^\(\)\>\<\!]*)', lower_oboe, ob)
    # Ensure no c' stays below D4:
    ob = re.sub(r'\bc\'(?=[0-9\s\.\-\^\(\)]|$)', "c''", ob)
    ob = ob.replace(r'r8 a\f(', r"r8 a'\f(")
    ob = ob.replace("r8 a\\f(", "r8 a'\\f(")
    ob = re.sub(r'\bc\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', "c''", ob)
    code = code[:idx_ob] + ob + code[idx_cl:]

    # 5. Clarinet Part (\fixed c)
    # m.105: a'' -> g''
    code = re.sub(r'\ba\'\'(?=[0-9\s\.\-\^\(\)]|$)', "g''", code)
    # Breathing rest in mm. 161-164
    clar_161_old = """  f'8-.\\fff g'-. a'-. bes'-. c''4-^ d''-^ |
  e''4. d''8 c''4 bes' |
  a'8-. bes'-. c''-. d''-. e''-. f''-. g''4-^ |
  a'1-^ |"""
    clar_161_new = """  % mm. 161-164: Rest (Breath recovery)
  R1*4 |"""
    code = code.replace(clar_161_old, clar_161_new, 1)
    # Breathing rest in mm. 169-172
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
    # Breathing rests in mm. 53-56 and mm. 81-84
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

    # 13. Glockenspiel Part (\fixed c')
    # Allowed: [Bb5 - D7], 82 - 98.
    # Because midiInstrument = #"glockenspiel" transposes up +24 semitones in MIDI,
    # written notes must be lowered by 2 octaves so MIDI lands in [82, 98]:
    idx_gl = code.find('glockPart =')
    idx_ma = code.find('marimbaPart =')
    gl = code[idx_gl:idx_ma]
    gl = gl.replace("''''", "''")
    gl = gl.replace("'''", "'")
    gl = gl.replace("''", "")
    gl = gl.replace("'", ",")
    # If any note is low a, (which is A3 + 24 = A5 81 < 82), replace with bes,:
    gl = re.sub(r'\ba,(?=[0-9\s\.\-\^\(\)]|$)', "bes,", gl)
    code = code[:idx_gl] + gl + code[idx_ma:]

    # 14. Marimba Part (\fixed c)
    idx_ma = code.find('marimbaPart =')
    idx_ti = code.find('timpaniPart =')
    ma = code[idx_ma:idx_ti]
    ma = re.sub(r'\b([ab])(is|es)?,', r'\1\2', ma)
    code = code[:idx_ma] + ma + code[idx_ti:]

    # Write to city_of_evil_medley.ly
    with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
        f.write(code)

    print("city_of_evil_medley.ly cleanly generated!")

if __name__ == '__main__':
    main()
