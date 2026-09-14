with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    text = f.read()

def get_m29(part_name):
    idx = text.find(f"{part_name} =")
    idx_end = text.find("=", idx + len(part_name) + 5)
    part = text[idx:idx_end] if idx_end != -1 else text[idx:]
    idx_m2 = part.find("Movement II: Bat Country")
    if idx_m2 != -1:
        print(f"=== {part_name} Movement II ===")
        print(part[idx_m2:idx_m2+300])

get_m29('oboePart')
get_m29('hornPart')
