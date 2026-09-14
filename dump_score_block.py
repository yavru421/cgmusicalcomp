with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
    text = f.read()

idx_score = text.rfind('\\score')
score_text = text[idx_score:]
with open('score_block_dump.txt', 'w', encoding='utf-8') as f:
    f.write(score_text)
print("Score block dumped to score_block_dump.txt, len:", len(score_text))
