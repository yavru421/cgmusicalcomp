with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
    text = f.read()

def show_section(part_name, start_kw, num_lines=30):
    idx = text.find(part_name)
    if idx == -1: return
    idx2 = text.find(start_kw, idx)
    if idx2 == -1: return
    lines = text[idx2:idx2+2000].splitlines()
    print(f"\n=== {part_name} : {start_kw} ===")
    for i, l in enumerate(lines[:num_lines]):
        print(f"  {i+1}: {l}")

show_section('flutePart', 'Movement VI', 35)
show_section('oboePart', 'Movement II', 35)
show_section('clarinetPart', 'Movement VI', 35)
show_section('hornPart', 'Movement II', 35)
show_section('hornPart', 'Movement III', 35)
