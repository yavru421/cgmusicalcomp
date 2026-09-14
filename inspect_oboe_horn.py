import re

with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    text = f.read()

# Inspect oboePart around Movement II (m.29) and Movement III (m.83)
idx_ob = text.find('oboePart')
idx_cl = text.find('clarinetPart')
ob_part = text[idx_ob:idx_cl]

print("--- OBOE PART Bat Country m.29 ---")
for line in ob_part.splitlines():
    if "Bat Country" in line or "Harmonic Rhythm" in line or "r8 a" in line:
        print(line)

print("\n--- OBOE PART m.80-84 ---")
for line in ob_part.splitlines():
    if "a1\\fermata" in line or "a'1\\fermata" in line or "The Wicked End" in line:
        print(line)

# Inspect hornPart around m.29
idx_hn = text.find('hornPart')
idx_tb = text.find('trombonePart')
hn_part = text[idx_hn:idx_tb]

print("\n--- HORN PART Bat Country m.29 ---")
for line in hn_part.splitlines()[:50]:
    if "Bat Country" in line or "r8" in line or "m. 29" in line:
        print(line)
