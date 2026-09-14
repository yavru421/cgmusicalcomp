import os
import re
import subprocess
from validate_playability import audit_midi_file

def solve():
    with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
        code = f.read()

    # 1. First, let's extract the part strings by splitting on part names
    parts = [
        'flutePart', 'oboePart', 'clarinetPart', 'altoSaxPart', 'trumpetPart',
        'hornPart', 'trombonePart', 'tubaPart', 'electricBassPart', 'celloPart',
        'glockPart', 'marimbaPart', 'timpaniPart', 'percussionPart'
    ]

    # Let's inspect where each part starts
    part_indices = []
    for p in parts:
        pattern = rf'({p}\s*=\s*\\fixed\s+[a-z\']+\s*\{{)'
        m = re.search(pattern, code)
        if not m:
            pattern2 = rf'({p}\s*=\s*\\drummode\s*\{{)'
            m = re.search(pattern2, code)
        part_indices.append((p, m.start()))

    # Sort by start index
    part_indices.sort(key=lambda x: x[1])

    # Extract dictionary of parts
    part_texts = {}
    for i in range(len(part_indices)):
        p_name, start = part_indices[i]
        end = part_indices[i+1][1] if i+1 < len(part_indices) else code.find(r'\score {')
        part_texts[p_name] = code[start:end]

    print("Successfully extracted all 14 parts!")

    # Now let's transform each part specifically:

    # 1. FLUTE (allowed: [Eb4 - F6], 63-89, max consecutive bars <= 16)
    fl = part_texts['flutePart']
    fl = re.sub(r'flutePart\s*=\s*\\fixed\s+c\'', 'flutePart = \\fixed c', fl)
    # Flute mm. 161-164 rest (4 bars)
    # Look for mm. 161 in fl:
    fl_m161_match = re.search(r'(f#\'\'\'?4\.\\ff.*?fis\'\'\'?2\.\s*r4\s*\|)', fl, re.DOTALL)
    if fl_m161_match:
        fl = fl[:fl_m161_match.start()] + "R1*4 |" + fl[fl_m161_match.end():]
        print("  Flute mm. 161-164 rest inserted.")
    else:
        # search for 4 bars around m161
        print("  Looking for flute mm. 161-164...")
    # Fix flute high notes: g''' -> f''', fis''' -> f''' or e'''
    fl = re.sub(r'\bg\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', "f'''", fl)
    fl = re.sub(r'\bfis\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e'''", fl)
    fl = re.sub(r'\bf#\'\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e'''", fl)
    part_texts['flutePart'] = fl

    # 2. OBOE (allowed: [D4 - Eb5], 62-75, max consecutive bars <= 16)
    # oboePart stays \fixed c'.
    # In \fixed c', notes between d' (62) and ees'' (75) are valid.
    # Lower any notes >= e'' down an octave: e'' -> e', f'' -> f', etc.
    ob = part_texts['oboePart']
    # Oboe mm. 53-56 rest (4 bars)
    # In Bat Country chorus: mm. 49-56. Let's make mm. 53-56 a rest
    ob_m53_match = re.search(r'(a\'\'4\.\s*g\'\'8\s*f\'\'4\s*e\'\'\s*\|\s*f\'\'4\.\s*g\'\'8\s*a\'\'2\s*\|\s*a\'\'4\.\s*g\'\'8\s*f\'\'4\s*e\'\'\s*\|\s*d\'\'1\s*\|)', ob)
    if ob_m53_match:
        ob = ob[:ob_m53_match.start()] + "R1*4 |" + ob[ob_m53_match.end():]
        print("  Oboe mm. 53-56 rest inserted.")
    else:
        print("  Searching for oboe mm. 53-56...")

    # Now lower notes in oboe that are >= e'' down an octave
    # Replace notes like e'' -> e', f'' -> f', fis'' -> fis', g'' -> g', gis'' -> gis', a'' -> a', bes'' -> bes', b'' -> b', c''' -> c'', cis''' -> cis'', d''' -> d'', ees''' -> ees'', e''' -> e''
    def lower_oboe(m):
        note = m.group(1)
        acc = m.group(2) or ""
        octave = m.group(3)
        rest = m.group(4) or ""
        if len(octave) == 2: # '' -> '
            return f"{note}{acc}'{rest}"
        elif len(octave) == 3: # ''' -> ''
            return f"{note}{acc}''{rest}"
        return m.group(0)

    # regex for oboe note tokens
    ob = re.sub(r'\b([a-g])(is|es|s)?(\'\'|\'\'\')([0-9\.\-\^\(\)\>\<\!]*)', lower_oboe, ob)
    part_texts['oboePart'] = ob

    # 3. CLARINET (allowed: [D3 - G5], 50-79, max consecutive bars <= 16)
    cl = part_texts['clarinetPart']
    cl = re.sub(r'clarinetPart\s*=\s*\\fixed\s+c\'', 'clarinetPart = \\fixed c', cl)
    # Clarinet mm. 153-160 rest (8 bars)
    cl_m153_match = re.search(r'(f\'\'4\.\s*\\?p\s*g\'\'8.*?a\'\'2\.\s*r4\s*\|)', cl, re.DOTALL)
    if cl_m153_match:
        cl = cl[:cl_m153_match.start()] + "R1*8 |" + cl[cl_m153_match.end():]
        print("  Clarinet mm. 153-160 rest inserted.")
    # Clarinet high notes: a'' -> g''
    cl = re.sub(r'\ba\'\'(?=[0-9\s\.\-\^\(\)]|$)', "g''", cl)
    part_texts['clarinetPart'] = cl

    # 4. ALTO SAX (allowed: [C4 - F5], 60-77, max consecutive bars <= 16)
    sx = part_texts['altoSaxPart']
    sx = re.sub(r'altoSaxPart\s*=\s*\\fixed\s+c\'', 'altoSaxPart = \\fixed c', sx)
    # Alto sax mm. 101-104 rest (4 bars)
    sx_m101_match = re.search(r'(g\'8-\.\s*\\?ff\s*g\'-..*?a\'2\s*d\'2\s*\))', sx, re.DOTALL)
    if sx_m101_match:
        sx = sx[:sx_m101_match.start()] + "R1*4 |" + sx[sx_m101_match.end():]
        print("  Alto Sax mm. 101-104 rest inserted.")
    # Raise any note below c' in Alto Sax: notes without apostrophe (a, bes, b, g, f, e, d) -> with apostrophe
    def raise_low_sax(m):
        note = m.group(1)
        acc = m.group(2) or ""
        rest = m.group(3) or ""
        return f"{note}{acc}'{rest}"
    # Replace notes in mm. 73-84 (where low notes were)
    # Let's just raise low notes a, b, g, f, e without apostrophe or comma:
    # Notice: c' is min allowed. Any d, e, f, g, a, b without apostrophe is in octave 3 (< C4)!
    # So all unadorned notes in \fixed c are octave 3! They should become note' (octave 4)!
    # Wait, in altoSaxPart: replace \b([a-g])(is|es)?(?=[0-9\.\-\^\(\)\>\<\!\s\|]|$)(?!') with \1\2'
    # Let's do this safely:
    def sax_fix(m):
        note = m.group(1)
        acc = m.group(2) or ""
        dur = m.group(3) or ""
        return f"{note}{acc}'{dur}"
    sx = re.sub(r'\b([a-g])(is|es)?([0-9]+[0-9\.\-\^\(\)\>\<\!]*)', sax_fix, sx)
    # And clamp g'' -> f''
    sx = re.sub(r'\bg\'\'(?=[0-9\s\.\-\^\(\)]|$)', "f''", sx)
    part_texts['altoSaxPart'] = sx

    # 5. TRUMPET (allowed: [Bb3 - F5], 58-77, max consecutive bars <= 16)
    tp = part_texts['trumpetPart']
    tp = re.sub(r'trumpetPart\s*=\s*\\fixed\s+c\'', 'trumpetPart = \\fixed c', tp)
    # Trumpet mm. 101-104 rest (4 bars)
    tp_m101_match = re.search(r'(g\'8-\.\s*\\?ff\s*g\'-..*?a\'2\s*d\'2\s*\))', tp, re.DOTALL)
    if tp_m101_match:
        tp = tp[:tp_m101_match.start()] + "R1*4 |" + tp[tp_m101_match.end():]
        print("  Trumpet mm. 101-104 rest inserted.")
    # Trumpet low notes in mm. 73-84: raise unadorned notes to note'
    tp = re.sub(r'\b([a-g])(is|es)?([0-9]+[0-9\.\-\^\(\)\>\<\!]*)', sax_fix, tp)
    # Trumpet high notes: fis'' -> e'', f#'' -> e''
    tp = re.sub(r'\bfis\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", tp)
    tp = re.sub(r'\bf#\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", tp)
    part_texts['trumpetPart'] = tp

    # 6. FRENCH HORN (allowed: [Bb3 - F5], 58-77, max consecutive bars <= 16)
    hn = part_texts['hornPart']
    hn = re.sub(r'hornPart\s*=\s*\\fixed\s+c\'', 'hornPart = \\fixed c', hn)
    # French horn rests:
    # mm. 53-56:
    hn_m53_match = re.search(r'(a\'4\.\s*g\'8\s*f\'4\s*e\'\s*\|\s*f\'4\.\s*g\'8\s*a\'2\s*\|\s*a\'4\.\s*g\'8\s*f\'4\s*e\'\s*\|\s*d\'1\s*\|)', hn)
    if hn_m53_match:
        hn = hn[:hn_m53_match.start()] + "R1*4 |" + hn[hn_m53_match.end():]
        print("  Horn mm. 53-56 rest inserted.")
    # mm. 81-84:
    hn_m81_match = re.search(r'(d\'4\.\s*\\?p\s*e\'8\s*f\'4\s*g\'.*?f1\\fermata\s*\|)', hn, re.DOTALL)
    if hn_m81_match:
        hn = hn[:hn_m81_match.start()] + "R1*4 |" + hn[hn_m81_match.end():]
        print("  Horn mm. 81-84 rest inserted.")
    # mm. 105-108:
    hn_m105_match = re.search(r'(g\'8-\.\s*g\'-..*?g\'2\.\s*r4\s*\|)', hn, re.DOTALL)
    if hn_m105_match:
        hn = hn[:hn_m105_match.start()] + "R1*4 |" + hn[hn_m105_match.end():]
        print("  Horn mm. 105-108 rest inserted.")
    # Raise unadorned notes in horn to note':
    hn = re.sub(r'\b([a-g])(is|es)?([0-9]+[0-9\.\-\^\(\)\>\<\!]*)', sax_fix, hn)
    hn = re.sub(r'\bfis\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", hn)
    hn = re.sub(r'\bf#\'\'(?=[0-9\s\.\-\^\(\)]|$)', "e''", hn)
    part_texts['hornPart'] = hn

    # 7. TROMBONE (allowed: [Eb2 - G4], 39-67)
    tb = part_texts['trombonePart']
    tb = re.sub(r'trombonePart\s*=\s*\\fixed\s+c\'', 'trombonePart = \\fixed c', tb)
    # Fix m.167 a' -> g'
    tb = re.sub(r'\ba\'(?=[0-9\s\.\-\^\(\)]|$)', "g'", tb)
    part_texts['trombonePart'] = tb

    # 8. TUBA (allowed: [Bb1 - F3], 34-53)
    tu = part_texts['tubaPart']
    tu = re.sub(r'tubaPart\s*=\s*\\fixed\s+c\'', 'tubaPart = \\fixed c', tu)
    # In \fixed c:
    # notes with ,, are octave 1. (e.g. bes,, is Bb1 = 34).
    # notes below bes,, (like a,,, g,,, f,,, or a,,, etc.)
    # Let's replace any a,,, g,,, f,,, or a,, -> a, ; g,, -> g, ; f,, -> f,
    # Any note with ,, that is f, g, a (f,, 29, g,, 31, a,, 33) should be f,, -> f, ; g,, -> g, ; a,, -> a,
    tu = re.sub(r'\b([fga])(is|es)?,,', r'\1\2,', tu)
    # Notes above F3 (e.g. g, a) -> lower to f, e
    tu = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "f", tu)
    tu = re.sub(r'\bg(?=[0-9\s\.\-\^\(\)]|$)', "f", tu)
    part_texts['tubaPart'] = tu

    # 9. ELECTRIC BASS (allowed: [E1 - G3], 28-55)
    eb = part_texts['electricBassPart']
    eb = re.sub(r'electricBassPart\s*=\s*\\fixed\s+c\'', 'electricBassPart = \\fixed c', eb)
    # Notes below E1: c,,, cis,,, d,,, -> c,, cis,, d,
    eb = re.sub(r'\b([cd])(is|es)?,,', r'\1\2,', eb)
    # Notes above G3: a -> g, a' -> g
    eb = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "g", eb)
    part_texts['electricBassPart'] = eb

    # 10. CELLO (allowed: [C2 - E4], 36-64)
    vc = part_texts['celloPart']
    vc = re.sub(r'celloPart\s*=\s*\\fixed\s+c\'', 'celloPart = \\fixed c', vc)
    # m.11 bes,, -> bes,
    vc = re.sub(r'\bbes,,', "bes,", vc)
    # mm. 155, 159, 163, 167, 172: f' and fis' -> e' or d'
    vc = re.sub(r'\bfis\'(?=[0-9\s\.\-\^\(\)]|$)', "e'", vc)
    vc = re.sub(r'\bf#\'(?=[0-9\s\.\-\^\(\)]|$)', "e'", vc)
    vc = re.sub(r'\bf\'(?=[0-9\s\.\-\^\(\)]|$)', "e'", vc)
    part_texts['celloPart'] = vc

    # 11. GLOCKENSPIEL (allowed: [Bb5 - D7], 82-98)
    gl = part_texts['glockPart']
    # glockPart is \fixed c'
    # In \fixed c', notes with '''' are >= C7 (96). E7 (100) and F7 (101) are e'''' and f''''!
    # Lower all notes with '''' to '''
    gl = re.sub(r'\'\'\'\'', "'''", gl)
    # m.80 a'' (81) -> bes'' (82)
    gl = re.sub(r'\ba\'\'(?=[0-9\s\.\-\^\(\)]|$)', "bes''", gl)
    part_texts['glockPart'] = gl

    # 12. MARIMBA (allowed: [C3 - G5], 48-79)
    ma = part_texts['marimbaPart']
    ma = re.sub(r'marimbaPart\s*=\s*\\fixed\s+c\'', 'marimbaPart = \\fixed c', ma)
    # In \fixed c, notes below C3 have comma: bes, (46), a, (45) -> raise to bes, a (without comma)
    ma = re.sub(r'\b([ab])(is|es)?,', r'\1\2', ma)
    part_texts['marimbaPart'] = ma

    # Reconstruct the score file:
    header_end = part_indices[0][1]
    header = code[:header_end]
    score_block_start = code.find(r'\score {')
    score_block = code[score_block_start:]

    new_code = header
    for p in parts:
        new_code += part_texts[p] + "\n\n"
    new_code += score_block

    with open('build_clean_city_of_evil.py', 'w', encoding='utf-8') as f:
        f.write(new_code)
    print("build_clean_city_of_evil.py successfully reconstructed!")

if __name__ == '__main__':
    solve()
