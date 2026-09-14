import re
import subprocess
from validate_playability import audit_midi_file

with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    ly = f.read()

# 1. Fix Oboe low notes
idx_ob = ly.find('oboePart')
idx_cl = ly.find('clarinetPart')
ob = ly[idx_ob:idx_cl]
# Specifically:
# r8 a( d' f' a'4) -> r8 a'( d' f' a'4)
# r8 g( c' e' g'4) -> r8 g'( c' e' g'4)
# r8 a( d' f' a'4) -> r8 a'( d' f' a'4)
ob = ob.replace('r8 a(', "r8 a'(")
ob = ob.replace('r8 g(', "r8 g'(")
# m.83-84
ob = ob.replace('bes c', "bes' c'")
ob = ob.replace('a1\\fermata', "a'1\\fermata")
# m.161
ob = ob.replace('b a g fis', "b' a' g' fis'")
ob = ob.replace('b4.', "b'4.")
ob = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "a'", ob)
ob = re.sub(r'\bg(?=[0-9\s\.\-\^\(\)]|$)', "g'", ob)
ob = re.sub(r'\bfis(?=[0-9\s\.\-\^\(\)]|$)', "fis'", ob)
ob = re.sub(r'\bb(?=[0-9\s\.\-\^\(\)]|$)', "b'", ob)
ly = ly[:idx_ob] + ob + ly[idx_cl:]

# 2. Fix Alto Sax low notes (m.75, 83, 112)
idx_sx = ly.find('altoSaxPart')
idx_tp = ly.find('trumpetPart')
sx = ly[idx_sx:idx_tp]
sx = re.sub(r'\bg(?=[0-9\s\.\-\^\(\)]|$)', "g'", sx)
sx = re.sub(r'\be(?=[0-9\s\.\-\^\(\)]|$)', "e'", sx)
ly = ly[:idx_sx] + sx + ly[idx_tp:]

# 3. Fix Trumpet low notes (m.75, 83, 112)
idx_tp = ly.find('trumpetPart')
idx_hn = ly.find('hornPart')
tp = ly[idx_tp:idx_hn]
tp = re.sub(r'\bg(?=[0-9\s\.\-\^\(\)]|$)', "g'", tp)
tp = re.sub(r'\be(?=[0-9\s\.\-\^\(\)]|$)', "e'", tp)
ly = ly[:idx_tp] + tp + ly[idx_hn:]

# 4. Fix French Horn low note (m.29 A3)
idx_hn = ly.find('hornPart')
idx_tb = ly.find('trombonePart')
hn = ly[idx_hn:idx_tb]
hn = hn.replace('r8 a(', "r8 a'(")
hn = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "a'", hn)
ly = ly[:idx_hn] + hn + ly[idx_tb:]

# 5. Fix Glockenspiel
# Glockenspiel in \fixed c':
# In original build_clean_city_of_evil.py, glockPart was \fixed c' with notes like d''' (86), c''' (84), bes'' (82), e''' (88), f''' (89)
# In \fixed c', all notes with ''' are in [84, 94]. All notes with '''' like c'''' (96), d'''' (98) are in [96, 98].
# And notes with '' like bes'' are 82 (Bb5).
# So in \fixed c', simply changing glockPart to \fixed c' and raising all single-quote notes by 2 octaves (e.g. note' -> note''')!
idx_gl = ly.find('glockPart')
idx_ma = ly.find('marimbaPart')
gl = ly[idx_gl:idx_ma]
gl = gl.replace('glockPart = \\fixed c', 'glockPart = \\fixed c\'')
# Replace single quote with triple quote in glockPart
def glock_raise(m):
    note = m.group(1)
    acc = m.group(2) or ""
    dur = m.group(3) or ""
    return f"{note}{acc}'''{dur}"
gl = re.sub(r'\b([a-g])(is|es)?\'([0-9\.\-\^\(\)\>\<\!]*)', glock_raise, gl)
# Clamp any notes > d'''' (like e'''' -> e''', f'''' -> f''', fis'''' -> fis''')
gl = re.sub(r'\be\'\'\'\'', "e'''", gl)
gl = re.sub(r'\bf\'\'\'\'', "f'''", gl)
gl = re.sub(r'\bfis\'\'\'\'', "fis'''", gl)
gl = re.sub(r'\bf#\'\'\'\'', "fis'''", gl)
# Any a'' (81) -> bes'' (82)
gl = re.sub(r'\ba\'\'(?=[0-9\s\.\-\^\(\)]|$)', "bes''", gl)
gl = re.sub(r'\bg\'\'(?=[0-9\s\.\-\^\(\)]|$)', "bes''", gl)
ly = ly[:idx_gl] + gl + ly[idx_ma:]

with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
    f.write(ly)

print("city_of_evil_medley.ly written with fix_final_clean.")
