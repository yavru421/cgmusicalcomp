import re
import subprocess
from validate_playability import audit_midi_file

def main():
    with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
        ly = f.read()

    # 1. CLARINET BREATHING REST in mm. 169-172
    # In clarinetPart:
    idx_cl = ly.find('clarinetPart')
    idx_sx = ly.find('altoSaxPart')
    cl_part = ly[idx_cl:idx_sx]
    
    clar_m169_old = """  fis'4. e'8 d'4 cis' |
  b4. cis'8 d'2 |
  e'4. fis'8 g'4 a' |
  d'2. r4 |"""
    clar_m169_new = """  % mm. 169-172: Rest (Breath recovery)
  R1*4 |"""
    if clar_m169_old in cl_part:
        cl_part = cl_part.replace(clar_m169_old, clar_m169_new, 1)
        print("  Clarinet rest mm. 169-172 applied.")
    else:
        print("  Warning: clar_m169_old not found directly.")
    ly = ly[:idx_cl] + cl_part + ly[idx_sx:]

    # 2. OBOE: raise all low notes (< D4) in oboePart
    idx_ob = ly.find('oboePart')
    idx_cl = ly.find('clarinetPart')
    ob_part = ly[idx_ob:idx_cl]
    # Add apostrophe to unadorned notes (e.g. fis8, g8, a4, b4, c' -> c'' if c' was 60)
    # Note: in \fixed c, c' is 60 (C4). D4 is 62. So c' is 60 (< 62)!
    # If we raise c' to c'' (72), it's in range (72 <= 75)!
    # And unadorned notes like fis, g, a, b, bes (54-59) become fis', g', a', b', bes' (66-71), which are all >= 62 and <= 75!
    ob_part = re.sub(r'\bc\'(?=[0-9\s\.\-\^\(\)]|$)', "c''", ob_part)
    ob_part = re.sub(r'\bcis\'(?=[0-9\s\.\-\^\(\)]|$)', "cis''", ob_part)
    ob_part = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", ob_part)
    ly = ly[:idx_ob] + ob_part + ly[idx_cl:]

    # 3. ALTO SAX: raise low notes in altoSaxPart
    idx_sx = ly.find('altoSaxPart')
    idx_tp = ly.find('trumpetPart')
    sx_part = ly[idx_sx:idx_tp]
    # Replace any unadorned note or c (e.g. e, f, g, a, bes) with apostrophe
    sx_part = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", sx_part)
    # Also replace any remaining low note like bes or a
    sx_part = re.sub(r'\bbes(?=[0-9\s\.\-\^\(\)]|$)', "bes'", sx_part)
    sx_part = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "a'", sx_part)
    ly = ly[:idx_sx] + sx_part + ly[idx_tp:]

    # 4. TRUMPET: raise low notes in trumpetPart
    idx_tp = ly.find('trumpetPart')
    idx_hn = ly.find('hornPart')
    tp_part = ly[idx_tp:idx_hn]
    tp_part = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", tp_part)
    tp_part = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "a'", tp_part)
    ly = ly[:idx_tp] + tp_part + ly[idx_hn:]

    # 5. FRENCH HORN: raise low notes in hornPart
    idx_hn = ly.find('hornPart')
    idx_tb = ly.find('trombonePart')
    hn_part = ly[idx_hn:idx_tb]
    hn_part = re.sub(r'\b([a-g])(is|es)?(?=[0-9]+[\.\-\^\(\)\>\<\!\s\|]|$)(?!\')', r"\1\2'", hn_part)
    hn_part = re.sub(r'\bg(?=[0-9\s\.\-\^\(\)]|$)', "g'", hn_part)
    hn_part = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "a'", hn_part)
    ly = ly[:idx_hn] + hn_part + ly[idx_tb:]

    # 6. TUBA: raise d,, and e,, in tubaPart
    idx_tu = ly.find('tubaPart')
    idx_eb = ly.find('electricBassPart')
    tu_part = ly[idx_tu:idx_eb]
    tu_part = re.sub(r'\bd,,', 'd,', tu_part)
    tu_part = re.sub(r'\be,,', 'e,', tu_part)
    tu_part = re.sub(r'\bees,,', 'ees,', tu_part)
    ly = ly[:idx_tu] + tu_part + ly[idx_eb:]

    # 7. GLOCKENSPIEL: change to \fixed c and lower notes by 2 octaves so MIDI transposition (+24) lands in [82, 98]
    idx_gl = ly.find('glockPart')
    idx_ma = ly.find('marimbaPart')
    gl_part = ly[idx_gl:idx_ma]
    gl_part = gl_part.replace('glockPart = \\fixed c\'', 'glockPart = \\fixed c')
    # Change ''' to ' and '' to (no apostrophe) or '
    # In \fixed c:
    # bes is 58 (+24 = 82, min allowed!)
    # c' is 60 (+24 = 84)
    # d' is 62 (+24 = 86)
    # e' is 64 (+24 = 88)
    # f' is 65 (+24 = 89)
    # g' is 67 (+24 = 91)
    # a' is 69 (+24 = 93)
    # bes' is 70 (+24 = 94)
    # c'' is 72 (+24 = 96)
    # d'' is 74 (+24 = 98, max allowed!)
    # So every note in glockPart should have ONE apostrophe (or bes without apostrophe for Bb5)!
    # Replace '''' -> ' and ''' -> ' and '' -> '
    gl_part = re.sub(r'\'\'\'\'', "'", gl_part)
    gl_part = re.sub(r'\'\'\'', "'", gl_part)
    gl_part = re.sub(r'\'\'', "'", gl_part)
    # If any note is a or a' (which is 69 -> 93), that's fine.
    # What about low notes like a (without quote)? a + 24 = 81 (1 semitone below 82).
    # Replace a without quote with a' or bes:
    gl_part = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "a'", gl_part)
    ly = ly[:idx_gl] + gl_part + ly[idx_ma:]

    with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
        f.write(ly)

    print("city_of_evil_medley.ly updated with solve_100_percent.")

if __name__ == '__main__':
    main()
