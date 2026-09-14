with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    text = f.read()

idx = text.find('glockPart')
print("idx of glockPart:", idx)
if idx != -1:
    print(text[idx:idx+500])
else:
    # search case-insensitively
    idx = text.lower().find('glock')
    print("case-insensitive idx:", idx)
    if idx != -1:
        print(text[idx:idx+500])
