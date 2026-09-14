import re
import subprocess
import os

def calibrate():
    with open("city_of_evil_medley.ly", "r", encoding="utf-8") as f:
        text = f.read()

    # In timpaniPart:
    # replace all f, with f,, | bes, with bes,, | c with c, | ees with ees,
    # Let's locate timpaniPart
    m_timp = re.search(r'(timpaniPart\s*=\s*\\fixed c\'\s*\{)([\s\S]*?)(\n\}\n)', text)
    if m_timp:
        timp_body = m_timp.group(2)
        # In timp_body:
        # replace f, -> f,, ; bes, -> bes,, ; c -> c, ; ees -> ees,
        # Be careful: ees, c, f,, bes,,
        # Tokens separated by spaces/bars
        def repl_timp(match):
            pitch = match.group(1)
            dur_acc = match.group(2)
            if pitch == 'f,': return 'f,,' + dur_acc
            elif pitch == 'bes,': return 'bes,,' + dur_acc
            elif pitch == 'c': return 'c,' + dur_acc
            elif pitch == 'ees': return 'ees,' + dur_acc
            return match.group(0)
        
        new_timp_body = re.sub(r'\b(f,|bes,|c|ees)([\d.:~^\\<>\-]*)\b', repl_timp, timp_body)
        text = text[:m_timp.start(2)] + new_timp_body + text[m_timp.end(2):]

    with open("city_of_evil_medley.ly", "w", encoding="utf-8") as f:
        f.write(text)
    print("Timpani calibrated!")

if __name__ == "__main__":
    calibrate()
