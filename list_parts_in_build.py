import re

with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
    text = f.read()

matches = re.findall(r'(\w+Part)\s*=', text)
print("Parts in build_clean_city_of_evil.py:", matches)
