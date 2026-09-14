import re
import subprocess
from validate_playability import audit_midi_file

with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    ly = f.read()

# 1. Fix Oboe m.29: r8 a\f( -> r8 a'\f(
idx_ob = ly.find('oboePart')
idx_cl = ly.find('clarinetPart')
ob = ly[idx_ob:idx_cl]
ob = ob.replace(r'r8 a\f(', r"r8 a'\f(")
# Fix Oboe m.83: any remaining c'' -> c'
ob = re.sub(r'\bc\'\'(?=[0-9\s\.\-\^\(\)]|$)', "c'", ob)
ly = ly[:idx_ob] + ob + ly[idx_cl:]

# 2. Fix French Horn m.29: r8 a\ff( -> r8 a'\ff(
idx_hn = ly.find('hornPart')
idx_tb = ly.find('trombonePart')
hn = ly[idx_hn:idx_tb]
hn = hn.replace(r'r8 a\ff(', r"r8 a'\ff(")
ly = ly[:idx_hn] + hn + ly[idx_tb:]

# 3. Glockenspiel: lower all notes by 3 octaves (remove ''')
idx_gl = ly.find('glockPart')
idx_ma = ly.find('marimbaPart')
gl = ly[idx_gl:idx_ma]
# gl has notes like d'''4.\ff, c'''8, etc.
# Remove ''' from all notes!
gl = gl.replace("'''", "")
ly = ly[:idx_gl] + gl + ly[idx_ma:]

with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
    f.write(ly)

print("city_of_evil_medley.ly written with solve_perfect_zero_errors.")
