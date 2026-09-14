with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    ly = f.read()

print("Does 'glock' appear in city_of_evil_medley.ly?", 'glock' in ly.lower())
for line in ly.splitlines():
    if 'glock' in line.lower():
        print("  Matching line:", line)
