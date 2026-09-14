import re
import subprocess

def clean_and_purge():
    with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
        ly = f.read()

    # 1. PURGE GLOCKENSPIEL DEFINITION
    idx_gl = ly.find('glockPart =')
    idx_ma = ly.find('marimbaPart =')
    if idx_gl != -1 and idx_ma != -1:
        # Check for header/comment before glockPart
        header_gl = ly.rfind('% =======================================================================', 0, idx_gl)
        if header_gl != -1 and header_gl > ly.find('celloPart'):
            ly = ly[:header_gl] + ly[idx_ma:]
        else:
            ly = ly[:idx_gl] + ly[idx_ma:]
        print("  Purged glockPart definition successfully.")
    else:
        print("  Warning: glockPart or marimbaPart not found.")

    # 2. PURGE GLOCKENSPIEL FROM \\score BLOCK
    # Regex to remove Staff with instrumentName = "Glockenspiel"
    glock_staff_pattern = re.compile(
        r'\\new\s+Staff\s*\\with\s*\{\s*instrumentName\s*=\s*"Glockenspiel"[^}]*\}\s*\{\s*\\glockPart\s*\}',
        re.DOTALL
    )
    ly = glock_staff_pattern.sub('', ly)
    print("  Purged Glockenspiel staff from \\score block.")

    # 3. FIX MALFORMED DYNAMICS (e.g. \\f' or \\ff')
    ly = re.sub(r'\\(f{1,4}|p{1,4}|mf|mp)\'+', r'\\\1', ly)
    print("  Fixed malformed dynamic markings.")

    # 4. Save updated LilyPond file
    with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
        f.write(ly)
    print("  city_of_evil_medley.ly written without glockenspiel.")

if __name__ == '__main__':
    clean_and_purge()
