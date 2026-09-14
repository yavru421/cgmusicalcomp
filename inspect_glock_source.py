with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
    text = f.read()

idx = text.find('glockPart')
if idx != -1:
    print(text[idx:idx+800])
else:
    print("glockPart not found in build_clean_city_of_evil.py")
    # let's search for glockenspiel
    idx2 = text.find('glock')
    print("idx glock:", idx2)
