import re

with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    ly = f.read()

# 1. Fix Oboe m.29: low a -> d' or a'
idx_ob = ly.find('oboePart')
idx_cl = ly.find('clarinetPart')
ob_part = ly[idx_ob:idx_cl]

# In oboePart, replace "r8 a(" or "r8 a\f(" or "r8 a'\f(" with "r8 d'\f("
ob_part = re.sub(r'r8\s+a(?:\'|\'\')?\\f\s*\(', r"r8 d'\\f(", ob_part)
ob_part = re.sub(r'r8\s+g(?:\'|\'\')?\\f\s*\(', r"r8 e'\\f(", ob_part)
ob_part = re.sub(r'r8\s+a(?:\'|\'\')?\(', r"r8 d'(", ob_part)

# In oboePart m.83: check for high notes > D#5 (MIDI 75)
# In \fixed c': c'' is 72, d'' is 74, ees'' is 75. Anything above ees'' (like e'', f'', g'', a'', c''') is out of range!
# Let's inspect mm. 75-84 in oboePart
print("Oboe mm. 75-84 snippet:")
idx_seize = ob_part.find('Seize the Day')
print(ob_part[idx_seize:idx_seize+1200] if idx_seize != -1 else "not found")

# Fix French Horn m.29: low a -> d' or bes
idx_hn = ly.find('hornPart')
idx_tb = ly.find('trombonePart')
hn_part = ly[idx_hn:idx_tb]

hn_part = re.sub(r'r8\s+a(?:\'|\'\')?\\ff\s*\(', r"r8 d'\\ff(", hn_part)
hn_part = re.sub(r'r8\s+g(?:\'|\'\')?\\ff\s*\(', r"r8 e'\\ff(", hn_part)
hn_part = re.sub(r'r8\s+a(?:\'|\'\')?\(', r"r8 d'(", hn_part)

ly = ly[:idx_ob] + ob_part + ly[idx_cl:idx_hn] + hn_part + ly[idx_tb:]

with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
    f.write(ly)

print("Applied fixes to oboe and horn parts in city_of_evil_medley.ly")
