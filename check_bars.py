import sys
import re

def check_file(fname):
    with open(fname, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    print(f"Total lines: {len(lines)}")

if __name__ == "__main__":
    check_file("city_of_evil_medley.ly")
