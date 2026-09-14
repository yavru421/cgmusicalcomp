import os
import re
import subprocess

# Read clean_base.py
with open('clean_base.py', 'r', encoding='utf-8') as f:
    code = f.read()

# 1. Update \fixed definitions
for v in ['flutePart', 'clarinetPart', 'altoSaxPart', 'trumpetPart', 'hornPart', 'trombonePart', 'tubaPart', 'electricBassPart', 'celloPart', 'marimbaPart']:
    code = code.replace(f"{v} = \\fixed c'", f"{v} = \\fixed c")

# oboePart stays \fixed c' (or we can use \fixed c with transposition, but let's see)
# In oboePart (\fixed c'):
# We need to ensure oboe notes stay in [62, 75], which is d' to ees''.
# Let's inspect oboePart in clean_base.py.

with open('build_generator_v2.py', 'w', encoding='utf-8') as f:
    f.write(code)

print("build_generator_v2.py written.")
