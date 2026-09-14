with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    text = f.read()

idx_gl = text.find('glockPart =')
idx_ma = text.find('marimbaPart =')
print("GlockPart in city_of_evil_medley.ly:")
print(text[idx_gl:idx_gl+500])
