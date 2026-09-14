import re

with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    ly = f.read()

# Replace any \f' or \ff' or \fff' or \ffff' with \f, \ff, etc.
ly = re.sub(r'\\(f{1,4}|p{1,4}|mf|mp)\'+', r'\\\1', ly)

with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
    f.write(ly)

print("Fixed all dynamic markings with quotes in city_of_evil_medley.ly.")
