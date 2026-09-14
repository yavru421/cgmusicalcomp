import re

def parse_movements():
    with open("city_of_evil_medley.ly", "r", encoding="utf-8") as f:
        text = f.read()

    # Match each part
    parts = re.findall(r'(\w+Part)\s*=\s*(?:\\fixed c\'|\\drummode)\s*\{([\s\S]*?)\n\}\n', text)
    print(f"Matched {len(parts)} parts.")

    movement_tags = [
        "Movement I:",
        "Movement II:",
        "Movement III:",
        "Movement IV:",
        "Movement V:",
        "Movement VI:"
    ]

    for name, body in parts:
        print(f"\n==================== {name} ====================")
        # Split by movement comments
        cur_mov = "Pre"
        mov_counts = {m: 0 for m in movement_tags}
        
        lines = body.split("\n")
        for line in lines:
            for m in movement_tags:
                if m in line:
                    cur_mov = m
            # Count bars in line
            # Count explicit '|'
            pipe_count = line.count('|')
            # Also check for R1*N or R2.*N
            r_match = re.search(r'R(?:1|2\.)\*(\d+)', line)
            if r_match:
                n = int(r_match.group(1))
                # pipe_count already counted 1 bar check for the whole multi-rest
                if cur_mov in mov_counts:
                    mov_counts[cur_mov] += (n - 1) + pipe_count
            else:
                if cur_mov in mov_counts:
                    mov_counts[cur_mov] += pipe_count
                    
        for m in movement_tags:
            print(f"  {m:<16}: {mov_counts[m]} bars")

if __name__ == "__main__":
    parse_movements()
