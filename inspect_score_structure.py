import re

with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    text = f.read()

parts = re.findall(r'^[a-zA-Z0-9]+Part\s*=', text, re.MULTILINE)
print("Parts found in city_of_evil_medley.ly:", parts)

# Find \score block at bottom
idx_score = text.rfind('\\score')
if idx_score != -1:
    print("\n--- \\score block ---")
    print(text[idx_score:])
