with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
    text = f.read()

import re
parts = re.findall(r'(\w+Part)\s*=\s*\\fixed\s+([^\s\{]+)', text)
print("Parts and their original \\fixed keys:")
for p, k in parts:
    print(f"  {p}: \\fixed {k}")

drum = re.findall(r'(\w+Part)\s*=\s*\\drummode', text)
print("Drum parts:", drum)
