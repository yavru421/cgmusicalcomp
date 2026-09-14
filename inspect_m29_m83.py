with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    text = f.read()

def print_around(name, query):
    idx = text.find(name)
    idx2 = text.find(query, idx)
    print(f"=== {name} around '{query}' ===")
    print(text[idx2-50:idx2+200])

print_around('oboePart', 'Movement II')
print_around('oboePart', 'Movement III')
print_around('hornPart', 'Movement II')
