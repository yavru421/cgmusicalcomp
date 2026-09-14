with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    text = f.read()

idx = text.lower().find('glockenspiel')
print("idx:", idx)
print(text[idx-100:idx+600])
