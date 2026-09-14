with open('build_clean_city_of_evil.py', 'r', encoding='utf-8') as f:
    text = f.read()

idx = text.find('glockPart =')
idx2 = text.find('marimbaPart =')
print("Original glockPart snippet:")
print(text[idx:idx+500])
print("\n... last 300 chars:")
print(text[idx2-300:idx2])
