with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    ly = f.read()

# Inspect oboe around m.29 and m.83
idx_ob = ly.find('oboePart =')
idx_cl = ly.find('clarinetPart =')
ob = ly[idx_ob:idx_cl]
print("--- Oboe Part Header ---")
print(ob[:150])

print("--- Oboe search for 'a' around m.29 ---")
for line in ob.splitlines():
    if 'a' in line and ('29' in line or 'r8 a' in line or 'a\\f' in line):
        print("  ", line)

print("--- Oboe search around m.83 ---")
for line in ob.splitlines():
    if '83' in line or '81' in line or '82' in line or '84' in line:
        print("  ", line)

idx_hn = ly.find('hornPart =')
idx_tb = ly.find('trombonePart =')
hn = ly[idx_hn:idx_tb]
print("--- Horn search around m.29 ---")
for line in hn.splitlines():
    if 'r8 a' in line or 'a\\ff' in line:
        print("  ", line)

idx_gl = ly.find('glockPart =')
idx_ma = ly.find('marimbaPart =')
gl = ly[idx_gl:idx_ma]
print("--- Glock Part Header and mm.21-28 ---")
print(gl[:350])
