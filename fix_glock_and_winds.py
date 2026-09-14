import re

with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    ly = f.read()

# 1. Fix Oboe m.29: A3 -> A4 (a')
# In oboePart:
idx_ob = ly.find('oboePart')
idx_cl = ly.find('clarinetPart')
ob = ly[idx_ob:idx_cl]
ob = ob.replace('r8 a(', "r8 a'(")
ob = ob.replace('r8 a\'(', "r8 a'(")
# Fix Oboe m.83: C6 -> C5 (c')
ob = ob.replace("c''4", "c'4")
ob = ob.replace("c''8", "c'8")
ob = ob.replace("c''2", "c'2")
ly = ly[:idx_ob] + ob + ly[idx_cl:]

# 2. Fix French Horn m.29: A3 -> A4 (a')
idx_hn = ly.find('hornPart')
idx_tb = ly.find('trombonePart')
hn = ly[idx_hn:idx_tb]
hn = hn.replace('r8 a(', "r8 a'(")
hn = hn.replace('r8 a\ff(', "r8 a'\\ff(")
ly = ly[:idx_hn] + hn + ly[idx_tb:]

# 3. Clean Glockenspiel
# Let's inspect glockPart:
idx_gl = ly.find('glockPart')
idx_ma = ly.find('marimbaPart')
gl = ly[idx_gl:idx_ma]

# Ensure header is \fixed c'
gl = re.sub(r'glockPart\s*=\s*\\fixed\s+[a-z\']+', "glockPart = \\fixed c'", gl)

# Normalize all note tokens in glockPart so they have ''' (octave 6, MIDI 84-95):
# Notes are a-g with optional is/es
def glock_clean(m):
    note = m.group(1)
    acc = m.group(2) or ""
    dur = m.group(3) or ""
    # If high d, can be d'''' (98) or d''' (86)
    # Let's just make all notes have ''' (three apostrophes)
    # In \fixed c': c''' is 84, d''' is 86, e''' is 88, f''' is 89, g''' is 91, a''' is 93, bes''' is 94
    # All of these are between 84 and 94 (100% inside [82, 98]!)
    return f"{note}{acc}'''{dur}"

# Match any note token in glockPart that has quotes or doesn't
gl = re.sub(r'\b([a-g])(is|es)?(?:\'+)?([0-9\.\-\^\(\)\>\<\!]*)', glock_clean, gl)

ly = ly[:idx_gl] + gl + ly[idx_ma:]

with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
    f.write(ly)

print("city_of_evil_medley.ly written with fix_glock_and_winds.")
