import re
import subprocess
import os

# Read the original build_clean_city_of_evil.py
with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
    text = f.read()

# Fix the two syntax bugs in original if present:
text = text.replace(r'bes,4.~\ bes,4 r8 |', r'bes,4.~ bes,4 r8 |')
text = text.replace(r'tomh8-> tommh16 toml tommh8-> tomh toml-> tommh |', r'tomh8-> tommh16 toml tommh8-> tomh toml8-> tommh tomfl8-> toml |')

# Now let's handle each instrument:
# We will inspect each part block: flutePart, oboePart, clarinetPart, altoSaxPart, trumpetPart, hornPart, trombonePart, tubaPart, electricBassPart, celloPart, glockPart, marimbaPart, timpaniPart, percussionPart.

with open('clean_base.py', 'w', encoding='utf-8') as f:
    f.write(text)

print("clean_base.py written.")
