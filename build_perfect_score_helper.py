import re
import subprocess
import os

# We will read build_clean_city_of_evil.py and transform it or write the updated version directly
with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
    code = f.read()

# 1. Change \fixed c' to \fixed c for the instruments that were 1 octave too high
# flutePart = \fixed c
code = re.sub(r'flutePart = \\fixed c\'', r'flutePart = \\fixed c', code)
code = re.sub(r'oboePart = \\fixed c\'', r'oboePart = \\fixed c', code)
code = re.sub(r'clarinetPart = \\fixed c\'', r'clarinetPart = \\fixed c', code)
code = re.sub(r'altoSaxPart = \\fixed c\'', r'altoSaxPart = \\fixed c', code)
code = re.sub(r'trumpetPart = \\fixed c\'', r'trumpetPart = \\fixed c', code)
code = re.sub(r'hornPart = \\fixed c\'', r'hornPart = \\fixed c', code)
code = re.sub(r'trombonePart = \\fixed c\'', r'trombonePart = \\fixed c', code)
code = re.sub(r'tubaPart = \\fixed c\'', r'tubaPart = \\fixed c', code)
code = re.sub(r'electricBassPart = \\fixed c\'', r'electricBassPart = \\fixed c', code)
code = re.sub(r'celloPart = \\fixed c\'', r'celloPart = \\fixed c', code)
code = re.sub(r'marimbaPart = \\fixed c\'', r'marimbaPart = \\fixed c', code)

# Note: glockPart was also \fixed c', but glockenspiel sounds 2 octaves higher than written.
# Let's check glockPart range: min=A5 (81), max=F#7 (102). Allowed: [Bb5 - D7] (82 - 98).
# In glockPart, replacing a5 with bes5 or similar, and high e''' / fis''' with e'' / fis''

with open('generate_perfect_score.py', 'w', encoding='utf-8') as f:
    f.write(code)

print("generate_perfect_score.py written.")
