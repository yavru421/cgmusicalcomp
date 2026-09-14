with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
    lines = f.readlines()

print(f"Total lines: {len(lines)}")

# Find flute mm 153-176
for i, l in enumerate(lines):
    if 'Movement VI' in l and 'FLUTE' in lines[max(0, i-5)]:
        print("Flute M6 around line", i)
        for j in range(i, min(len(lines), i+45)):
            print(f"{j+1}: {lines[j]}", end="")
        break
