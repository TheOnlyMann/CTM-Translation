import json
import re
import sys

'''
If there is a same key in the given json file A(input), it will write it in the output file B as a unique key, with the same value.
key name changes will follow this format: [original_key]_[index]. it will also check if the new key name is unique, if not, it will increase the index until it finds a unique key name.
'''


# --- JSON serialization with ONLY PUA character escaping ---
def encode_real_pua_in_json_text(data):
    # Use normal JSON dump to preserve emojis and other characters
    json_text = json.dumps(data, indent=4, ensure_ascii=False)

    # Replace actual Unicode PUA characters in string values with \uXXXX
    def escape_pua_characters(match):
        return ''.join(
            f'\\u{ord(c):04X}' if 0xE000 <= ord(c) <= 0xF8FF else c
            for c in match.group(0)
        )

    # Apply only to string contents (leave quotes and keys untouched)
    fixed_text = re.sub(r'(?<=")([^"\\]+)(?=")', escape_pua_characters, json_text)

    return fixed_text

def uniquefy_pairs(pairs):
    """
    JSON 객체의 중복 키에 _1, _2, ... 접미사를 붙인다.
    기존 키와 충돌하는 경우에도 중복되지 않도록 처리한다.
    """
    result = {}
    seen = set()

    # 원본에 이미 존재하는 키를 확인
    original_keys = {key for key, value in pairs}

    for key, value in pairs:
        new_key = key
        index = 1

        while new_key in seen:
            new_key = f"{key}_{index}"
            index += 1

            # 다른 원본 키와 충돌하지 않도록 확인
            while new_key in original_keys and new_key != key:
                new_key = f"{key}_{index}"
                index += 1

        seen.add(new_key)
        result[new_key] = value

    return result



# Uniquefy keys in JSON dicts

def uniquefy_json_keys(input_file):
    with open(input_file, "r", encoding="utf-8-sig") as file:
        data = json.load(
            file,
            object_pairs_hook=uniquefy_pairs
        )

    return data

# JSON dump with safe UTF-8 characters (preserves emojis, Korean, etc.)
def save_json(data, output_file):
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(data)

# CLI usage
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python uniquefykey.py input.json [output.json] [-p]")
        print("  -p : Do NOT preserve PUA characters (default: preserve ON)")
        sys.exit(1)

    # Parse arguments
    json_files = []
    preserve_pua = True

    for arg in sys.argv[1:]:
        if arg.endswith(".json"):
            json_files.append(arg)
        elif arg == "-p":
            preserve_pua = False
        else:
            print(f"Unknown argument: {arg}")
            sys.exit(1)

    if len(json_files) < 1:
        print("❗ You must specify at least input.json.")
        sys.exit(1)

    input_file = json_files[0]
    output_file = json_files[1] if len(json_files) >= 2 else input_file

    # Load and process
    uniquefied = uniquefy_json_keys(input_file)
    if preserve_pua:
        merged = encode_real_pua_in_json_text(uniquefied)
    else:
        merged = json.dumps(uniquefied, indent=4, ensure_ascii=False)
    save_json(merged, output_file)
    print(f"✅ Uniquefied JSON saved as '{output_file}' (PUA preserved={'ON' if preserve_pua else 'OFF'})")
