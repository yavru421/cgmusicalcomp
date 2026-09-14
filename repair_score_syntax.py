def main():
    with open('city_of_evil_medley.ly', 'rb') as f:
        data = f.read()

    print(f"Original length: {len(data)} bytes")
    # Replace \x0c (form feed) with \x5c\x66 (backslash f)
    count_ff = data.count(b'\x0c')
    print(f"Form feed count (\\x0c): {count_ff}")

    data = data.replace(b'\x0c', b'\\f')

    with open('city_of_evil_medley.ly', 'wb') as f:
        f.write(data)

    print("Replaced all form feeds with backslash-f.")

if __name__ == '__main__':
    main()
