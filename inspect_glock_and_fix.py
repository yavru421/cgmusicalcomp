import re
import subprocess

with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    ly = f.read()

# Inspect glockPart
idx_gl = ly.find('glockPart')
idx_ma = ly.find('marimbaPart')
gl = ly[idx_gl:idx_ma]
print("GlockPart first 300 chars:")
print(gl[:300])

# Find high notes in glockPart
high_notes = re.findall(r'\b[a-g](?:is|es)?\'\'\'[^\s\|]*', gl)
print("Glock high notes sample:", high_notes[:10])
