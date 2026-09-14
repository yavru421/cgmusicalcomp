import os
import re
import mido
from validate_playability import VOICE_RANGES, audit_midi_file

# Let's read build_clean_city_of_evil.py and examine the exact text of flutePart, oboePart, clarinetPart, hornPart
with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
    text = f.read()

# Let's find Movement VI in flutePart:
flute_m6 = re.search(r'(flutePart\s*=\s*\\fixed\s+[a-z\']+\s*\{.*?Movement VI.*?\n\})(?=\n\n|\n%|\n[a-zA-Z]+Part)', text, re.DOTALL)
if flute_m6:
    print("Found flute Movement VI in build_clean_city_of_evil.py!")
else:
    print("Could not match flute Movement VI with regex, searching text...")
    idx = text.find('flutePart')
    idx2 = text.find('oboePart')
    print("Flute part length:", idx2 - idx)
    flute_text = text[idx:idx2]
    print("Flute M.I.A. section snippet:")
    m6_idx = flute_text.find('Movement VI')
    print(flute_text[m6_idx:m6_idx+300])
