import re

with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
    text = f.read()

idx_gl = text.find('glockPart =')
idx_ma = text.find('marimbaPart =')
glock_text = text[idx_gl:idx_ma]

notes = re.findall(r'\b([a-g](?:is|es)?[\',]*)', glock_text)
print(f"Total glock note tokens: {len(notes)}")
print("Unique note tokens in glockPart:", sorted(set(notes)))
