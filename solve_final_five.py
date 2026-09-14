import re

def main():
    with open('city_of_evil_medley.ly', 'r', encoding='utf-8') as f:
        ly = f.read()

    # 1. OBOE: Breathing rest at mm. 53-56 and low notes
    idx_ob = ly.find('oboePart =')
    idx_cl = ly.find('clarinetPart =')
    ob_part = ly[idx_ob:idx_cl]

    # In oboePart, add 4 bars rest in Bat Country Chorus mm. 53-56
    # Currently Bat Country has:
    # d'4.\fff c'8 a'4 f' |
    # g'4. a'8 bes'2 |
    # f'4. e'8 d'4 f' |
    # g'2. r4 |
    # a'4. g'8 f'4 d' |
    # e'4. f'8 g'2 |
    # a'4. g'8 f'4 e' |
    # d'1\> |
    old_ob_chorus = """  a'4. g'8 f'4 d' |
  e'4. f'8 g'2 |
  a'4. g'8 f'4 e' |
  d'1\\> |"""
    new_ob_chorus = """  % mm. 53-56: Rest (Breath recovery)
  R1*4 |"""
    if old_ob_chorus in ob_part:
        ob_part = ob_part.replace(old_ob_chorus, new_ob_chorus, 1)
        print("  Oboe breath rest mm. 53-56 applied.")
    else:
        print("  Warning: old_ob_chorus not found directly.")

    # Fix low notes in oboePart: any note < D4 (62)
    # bes (58) -> bes' (70), a (57) -> a' (69), fis (54) -> fis' (66)
    ob_part = re.sub(r'\bbes(?=[0-9\s\.\-\^\(\)]|$)', "bes'", ob_part)
    ob_part = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "a'", ob_part)
    ob_part = re.sub(r'\bfis(?=[0-9\s\.\-\^\(\)]|$)', "fis'", ob_part)
    ob_part = re.sub(r'\bg(?=[0-9\s\.\-\^\(\)]|$)', "g'", ob_part)
    ob_part = re.sub(r'\bf(?=[0-9\s\.\-\^\(\)]|$)', "f'", ob_part)
    ob_part = re.sub(r'\be(?=[0-9\s\.\-\^\(\)]|$)', "e'", ob_part)

    ly = ly[:idx_ob] + ob_part + ly[idx_cl:]

    # 2. HORN: Breathing rest at mm. 53-56
    idx_hn = ly.find('hornPart =')
    idx_tb = ly.find('trombonePart =')
    hn_part = ly[idx_hn:idx_tb]

    # In Bat Country, Horn has 24 consecutive bars mm. 45-68
    old_hn_chorus = """  a'4. g'8 f'4 d' |
  e'4. f'8 g'2 |
  a'4. g'8 f'4 e' |
  d'1\\> |"""
    if old_hn_chorus in hn_part:
        hn_part = hn_part.replace(old_hn_chorus, new_ob_chorus, 1)
        print("  Horn breath rest mm. 53-56 applied.")
    else:
        # Search for Bat Country chorus in hornPart
        print("  Looking for alternative horn chorus pattern...")
        hn_part = re.sub(
            r'(% mm\. 49-56:[^\n]*\n(?:[^\n]*\n){4})(?:[^\n]*\n){4}',
            r'\1  % mm. 53-56: Rest (Breath recovery)\n  R1*4 |\n',
            hn_part
        )

    ly = ly[:idx_hn] + hn_part + ly[idx_tb:]

    # 3. ALTO SAX: low notes at mm. 83, 110, 112 (bes -> bes')
    idx_sx = ly.find('altoSaxPart =')
    idx_tp = ly.find('trumpetPart =')
    sx_part = ly[idx_sx:idx_tp]

    # Replace any low unadorned note < C4 (60): bes (58), a (57), g, f
    sx_part = re.sub(r'\bbes(?=[0-9\s\.\-\^\(\)]|$)', "bes'", sx_part)
    sx_part = re.sub(r'\ba(?=[0-9\s\.\-\^\(\)]|$)', "a'", sx_part)
    sx_part = re.sub(r'\bg(?=[0-9\s\.\-\^\(\)]|$)', "g'", sx_part)

    ly = ly[:idx_sx] + sx_part + ly[idx_tp:]

    with open('city_of_evil_medley.ly', 'w', encoding='utf-8') as f:
        f.write(ly)

    print("Applied final playability fixes to city_of_evil_medley.ly.")

if __name__ == '__main__':
    main()
