import re

with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    ly = f.read()

# Replace any "\fixed c {" with "\fixed c' {"
fixed_pattern = re.compile(r'\\fixed\s+c\s*\{')
matches = fixed_pattern.findall(ly)
print(f"Found {len(matches)} occurrences of '\\fixed c {{'")

ly = fixed_pattern.sub(r"\\fixed c' {", ly)

with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
    f.write(ly)

print("Updated all \\fixed statements to '\\fixed c' {'")
