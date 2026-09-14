import os
import re
import subprocess
from validate_playability import audit_midi_file

def main():
    # Read build_clean_city_of_evil.py to extract score_content
    with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
        py_text = f.read()

    # Find where score_content starts and ends
    start_tag = 'score_content = r"""'
    start_idx = py_text.find(start_tag)
    if start_idx == -1:
        start_tag = 'score_content = """'
        start_idx = py_text.find(start_tag)
    start_idx += len(start_tag)
    end_idx = py_text.rfind('"""')
    score = py_text[start_idx:end_idx].strip()

    print(f"Extracted score length: {len(score)} chars. First 50 chars: {score[:50]}")

    # 1. Clean the 2 known syntax bugs
    score = score.replace(r'bes,4.~\ bes,4 r8 |', r'bes,4.~ bes,4 r8 |')
    score = score.replace(r'tomh8-> tommh16 toml tommh8-> tomh toml-> tommh |', r'tomh8-> tommh16 toml tommh8-> tomh toml8-> tommh tomfl8-> toml |')

    # 2. Set \fixed octaves:
    # flute, clarinet, altoSax, trumpet, horn, trombone, tuba, electricBass, cello, marimba -> \fixed c
    # oboe -> \fixed c
    # glock -> \fixed c
    parts = [
        'flutePart', 'oboePart', 'clarinetPart', 'altoSaxPart', 'trumpetPart',
        'hornPart', 'trombonePart', 'tubaPart', 'electricBassPart', 'celloPart',
        'glockPart', 'marimbaPart'
    ]
    for p in parts:
        score = re.sub(rf'{p}\s*=\s*\\fixed\s+[a-z\']+', f"{p} = \\fixed c", score)

    # 3. Flute:
    # Clamp notes <= f'''
    score = re.sub(r'\bg\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', "f'''", score)
    score = re.sub(r'\bfis\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e'''", score)
    score = re.sub(r'\bf#\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e'''", score)
    # Flute mm. 169-172 rest (4 bars)
    flute_169_old = """  fis''4. e''8 d''4 cis'' |
  b'4. cis''8 d''2 |
  e''4. fis''8 g''4 a'' |
  d''2. r4 |"""
    flute_169_new = """  % mm. 169-172: Rest (Breath recovery)
  R1*4 |"""
    score = score.replace(flute_169_old, flute_169_new, 1)

    # 4. Oboe (\fixed c):
    idx_ob = score.find('oboePart =')
    idx_cl = score.find('clarinetPart =')
    ob = score[idx_ob:idx_cl]
    ob = ob.replace(r'r8 a\f(', r"r8 a'\f(")
    ob = ob.replace("r8 a\\f(", "r8 a'\\f(")
    # Oboe rest mm. 53-56
    oboe_53_old = """  a''4. g''8 f''4 e'' |
  f''4. g''8 a''2 |
  a''4. g''8 f''4 e'' |
  d''1 |"""
    oboe_53_new = """  % mm. 53-56: Rest (Breath recovery)
  R1*4 |"""
    ob = ob.replace(oboe_53_old, oboe_53_new, 1)
    # In \fixed c:
    # d' is 62, ees'' is 75.
    # Raise any note below d' (like c', cis', and unadorned notes):
    ob = re.sub(r'\bc\'(?=[0-9\s\.\-\^\(\)]|$)', "c''", ob)
    ob = re.sub(r'\bcis\'(?=[0-9\s\.\-\^\(\)]|$)', "cis''", ob)
    ob = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", ob)
    ob = re.sub(r'\b([efgab])(?=[0-9\s\.\-\^\(\)]|$)', r"\1'", ob)
    # Clamp any note > ees'' to d'':
    ob = re.sub(r'\b([efgabc])(is|es)?\'\'(?=[0-9\s\.\-\^\(\)]|$)', r"d''", ob)
    ob = re.sub(r'\b([a-g])(is|es)?\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', r"d''", ob)
    score = score[:idx_ob] + ob + score[idx_cl:]

    # 5. Clarinet (\fixed c):
    score = re.sub(r'\ba\'\'(?=[0-9\s\.\-\^\(\)]|$)', "g''", score)
    # Clarinet mm. 161-164 and 169-172 rests
    clar_161_old = """  f'8-.\\fff g'-. a'-. bes'-. c''4-^ d''-^ |
  e''4. d''8 c''4 bes' |
  a'8-. bes'-. c''-. d''-. e''-. f''-. g''4-^ |
  a'1-^ |"""
    clar_161_new = """  % mm. 161-164: Rest (Breath recovery)
  R1*4 |"""
    score = score.replace(clar_161_old, clar_161_new, 1)
    clar_169_old = """  fis'4. e'8 d'4 cis' |
  b4. cis'8 d'2 |
  e'4. fis'8 g'4 a' |
  d'2. r4 |"""
    clar_169_new = """  % mm. 169-172: Rest (Breath recovery)
  R1*4 |"""
    score = score.replace(clar_169_old, clar_169_new, 1)

    # 6. Alto Sax (\fixed c):
    idx_sx = score.find('altoSaxPart =')
    idx_tp = score.find('trumpetPart =')
    sx = score[idx_sx:idx_tp]
    sx = re.sub(r'\bfis\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", sx)
    sx = re.sub(r'\bf#\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", sx)
    sx = re.sub(r'\bg\'\'(?=[0-9\s\.\-\^\(\)]|$)', "f''", sx)
    sx = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", sx)
    sx = re.sub(r'\b([efgab])(?=[0-9\s\.\-\^\(\)]|$)', r"\1'", sx)
    score = score[:idx_sx] + sx + score[idx_tp:]

    # 7. Trumpet (\fixed c):
    idx_tp = score.find('trumpetPart =')
    idx_hn = score.find('hornPart =')
    tp = score[idx_tp:idx_hn]
    tp = re.sub(r'\bfis\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", tp)
    tp = re.sub(r'\bf#\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", tp)
    tp = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", tp)
    tp = re.sub(r'\b([efgab])(?=[0-9\s\.\-\^\(\)]|$)', r"\1'", tp)
    score = score[:idx_tp] + tp + score[idx_hn:]

    # 8. French Horn (\fixed c):
    idx_hn = score.find('hornPart =')
    idx_tb = score.find('trombonePart =')
    hn = score[idx_hn:idx_tb]
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
    score = score[:idx_hn] + hn + score[idx_tb:]

    # 9. Trombone (\fixed c):
    idx_tb = score.find('trombonePart =')
    idx_tu = score.find('tubaPart =')
    tb = score[idx_tb:idx_tu]
    tb = re.sub(r'\ba\'(?=[0-9\s\.\-\^\(\)]|$)', "g'", tb)
    score = score[:idx_tb] + tb + score[idx_tu:]

    # 10. Tuba (\fixed c):
    idx_tu = score.find('tubaPart =')
    idx_eb = score.find('electricBassPart =')
    tu = score[idx_tu:idx_eb]
    tu = re.sub(r'\b([cdefga])(is|es)?,,', r'\1\2,', tu)
    tu = re.sub(r'\b([cdefga])#,,', r'\1#,', tu)
    tu = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "f", tu)
    tu = re.sub(r'\bg(?=[0-9\s\.\-\^\(\)]|$)', "f", tu)
    tu = re.sub(r'\bfis(?=[0-9\s\.\-\^\(\)]|$)', "f", tu)
    tu = re.sub(r'\bf#(?=[0-9\s\.\-\^\(\)]|$)', "f", tu)
    score = score[:idx_tu] + tu + score[idx_eb:]

    # 11. Electric Bass (\fixed c):
    idx_eb = score.find('electricBassPart =')
    idx_vc = score.find('celloPart =')
    eb = score[idx_eb:idx_vc]
    eb = re.sub(r'\b([cd])(is|es)?,,', r'\1\2,', eb)
    eb = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "g", eb)
    score = score[:idx_eb] + eb + score[idx_vc:]

    # 12. Cello (\fixed c):
    idx_vc = score.find('celloPart =')
    idx_gl = score.find('glockPart =')
    vc = score[idx_vc:idx_gl]
    vc = re.sub(r'\bbes,,', "bes,", vc)
    vc = re.sub(r'\bfis\'(?=[0-9\s\.\-\^\(\)]|$)', "e'", vc)
    vc = re.sub(r'\bf#\'(?=[0-9\s\.\-\^\(\)]|$)', "e'", vc)
    vc = re.sub(r'\bf\'(?=[0-9\s\.\-\^\(\)]|$)', "e'", vc)
    score = score[:idx_vc] + vc + score[idx_gl:]

    # 13. Glockenspiel (\fixed c):
    # Allowed: [Bb5 - D7], 82 - 98.
    # In \fixed c:
    # note' is C4-B4 (60-71) + 24 = 84-95.
    # bes is Bb3 (58) + 24 = 82.
    # note'' is C5-D5 (72-74) + 24 = 96-98.
    idx_gl = score.find('glockPart =')
    idx_ma = score.find('marimbaPart =')
    gl = score[idx_gl:idx_ma]
    gl = gl.replace("''''", "''")
    gl = gl.replace("'''", "'")
    gl = gl.replace("''", "")
    # Lower all notes by 1 octave so written notes are mostly note' and note:
    gl = gl.replace("'", ",")
    gl = re.sub(r'\ba,(?=[0-9\s\.\-\^\(\)]|$)', "bes,", gl)
    score = score[:idx_gl] + gl + score[idx_ma:]

    # 14. Marimba (\fixed c):
    idx_ma = score.find('marimbaPart =')
    idx_ti = score.find('timpaniPart =')
    ma = score[idx_ma:idx_ti]
    ma = re.sub(r'\b([ab])(is|es)?,', r'\1\2', ma)
    score = score[:idx_ma] + ma + score[idx_ti:]

    # Write pure LilyPond code to city_of_evil_medley.ly
    with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
        f.write(score)

    print("city_of_evil_medley.ly successfully generated from pristine score_content!")

if __name__ == '__main__':
    main()
