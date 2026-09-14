import re

with open('build_clean_and_perfect_score.py', 'r', encoding='utf-8') as f:
    text = f.read()

# 1. In Oboe Part:
# Fix m.29: r8 a\f( -> r8 a'\f(
# And m.83: replace c''' with c'
text = text.replace(r'r8 a\f(', r"r8 a'\f(")
text = text.replace("r8 a\\f(", "r8 a'\\f(")

# 2. In Horn Part:
text = text.replace(r'r8 a\ff(', r"r8 a'\ff(")
text = text.replace("r8 a\\ff(", "r8 a'\\ff(")

# 3. In Glockenspiel Part:
# Lower all notes in glockPart by 2 octaves:
# Replace ''' with ' and '' with (no quote)
# In build_clean_and_perfect_score.py, let's find glockPart processing:
old_glock_block = """    # 13. Glockenspiel Part (\\fixed c')
    # Allowed: [Bb5 - D7], 82 - 98.
    idx_gl = code.find('glockPart =')
    idx_ma = code.find('marimbaPart =')
    gl = code[idx_gl:idx_ma]
    # Replace e'''', f'''', fis'''' -> e''', f''', fis'''
    gl = re.sub(r'\\be\'\'\'\'', "e'''", gl)
    gl = re.sub(r'\\bf\'\'\'\'', "f'''", gl)
    gl = re.sub(r'\\bfis\'\'\'\'', "fis'''", gl)
    gl = re.sub(r'\\bf#\'\'\'\'', "fis'''", gl)
    # Replace a'' (81) -> bes'' (82)
    gl = re.sub(r'\\ba\'\'(?=[0-9\\s\\.\\-\\^\\(\\)]|$)', "bes''", gl)
    code = code[:idx_gl] + gl + code[idx_ma:]"""

new_glock_block = """    # 13. Glockenspiel Part (\\fixed c')
    # Allowed: [Bb5 - D7], 82 - 98.
    # Because midiInstrument = #"glockenspiel" transposes up +24 semitones in MIDI,
    # written notes must be 2 octaves lower:
    # note'''' -> note''
    # note''' -> note'
    # note'' -> note
    idx_gl = code.find('glockPart =')
    idx_ma = code.find('marimbaPart =')
    gl = code[idx_gl:idx_ma]
    gl = gl.replace("''''", "''")
    gl = gl.replace("'''", "'")
    gl = gl.replace("''", "")
    # If any note is low a (which is A3 + 24 = A5 81 < 82), replace with bes:
    gl = re.sub(r'\\ba(?=[0-9\\s\\.\\-\\^\\(\\)]|$)', "bes", gl)
    code = code[:idx_gl] + gl + code[idx_ma:]"""

if old_glock_block in text:
    text = text.replace(old_glock_block, new_glock_block)
    print("Glockenspiel block successfully updated in builder script!")
else:
    print("Warning: old_glock_block not found directly.")

# Also let's ensure Oboe m.83 c''' is replaced in oboePart
old_ob_block = """    # Ensure no c' stays below D4:
    ob = re.sub(r'\\bc\'(?=[0-9\\s\\.\\-\\^\\(\\)]|$)', "c''", ob)
    code = code[:idx_ob] + ob + code[idx_cl:]"""

new_ob_block = """    # Ensure no c' stays below D4:
    ob = re.sub(r'\\bc\'(?=[0-9\\s\\.\\-\\^\\(\\)]|$)', "c''", ob)
    # Fix m.29 and m.83:
    ob = ob.replace(r'r8 a\\f(', r"r8 a'\\f(")
    ob = ob.replace(r'r8 a\f(', r"r8 a'\f(")
    ob = re.sub(r'\\bc\'\'\'(?=[0-9\\s\\.\\-\\^\\(\\)]|$)', "c''", ob)
    code = code[:idx_ob] + ob + code[idx_cl:]"""

if old_ob_block in text:
    text = text.replace(old_ob_block, new_ob_block)
    print("Oboe block successfully updated in builder script!")
else:
    print("Warning: old_ob_block not found directly.")

with open('build_clean_and_perfect_score.py', 'w', encoding='utf-8') as f:
    f.write(text)

print("build_clean_and_perfect_score.py successfully updated!")
