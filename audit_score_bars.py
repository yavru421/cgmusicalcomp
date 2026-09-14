import re
from fractions import Fraction

def analyze_part(part_name, content):
    print(f"\n--- Analyzing {part_name} ---")
    # Clean comments
    lines = content.split('\n')
    cleaned_lines = []
    for l in lines:
        c = re.sub(r'%.*$', '', l).strip()
        if c:
            cleaned_lines.append(c)
    full_text = ' '.join(cleaned_lines)
    
    # We want to inspect the measure lengths between '|'
    bars = full_text.split('|')
    print(f"Total bar segments: {len(bars)}")
    
if __name__ == "__main__":
    with open("city_of_evil_medley.ly", "r", encoding="utf-8") as f:
        text = f.read()
    
    # Just run lilypond and capture the exact lines that warn!
