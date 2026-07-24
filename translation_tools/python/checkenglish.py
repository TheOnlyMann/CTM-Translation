import json
import re
import sys
from collections import OrderedDict

# --- Natural key sort ---
def parse_key(k):
    return [(0, int(p)) if p.isdigit() else (1, p) for p in k.split('.')]

def natural_sort_dict(d):
    return OrderedDict(sorted(d.items(), key=lambda kv: parse_key(kv[0])))

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

# extract all JSON info with english text in its value, and save them as separate JSON file for easy checking
def extract_english_texts(data, search_key=r'[A-Za-z]'):
    result = {}
    for k, v in data.items():
        if isinstance(v, str) and re.search(search_key, v):
            result[k] = v
        elif isinstance(v, dict):
            nested = extract_english_texts(v, search_key)
            if nested:
                result[k] = nested
    return result
# JSON dump with safe UTF-8 characters (preserves emojis, Korean, etc.)
def save_json(data, output_file):
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(data)

# CLI usage
if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python removejson.py input.json [output.json] [-s] [-p]")
        print("  -s : Sort merged JSON keys (default: off)")
        print("  -p : Do NOT preserve PUA characters (default: preserve ON)")
        sys.exit(1)

    # Parse arguments
    json_files = []
    sort_output = False
    preserve_pua = True

    for arg in sys.argv[1:]:
        if arg.endswith(".json"):
            json_files.append(arg)
        elif arg == "-s":
            sort_output = True
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

    # Load, process
    with open(input_file, "r", encoding="utf-8") as f:
        data_input = json.load(f)

    if not isinstance(data_input, dict):
        raise ValueError("❌ JSON top-level structure must be an object/dictionary.")
    extracted = extract_english_texts(data_input)
    if sort_output:
        extracted = natural_sort_dict(extracted)
    if preserve_pua:
        extracted = encode_real_pua_in_json_text(extracted)
    else:
        extracted = json.dumps(extracted, indent=4, ensure_ascii=False)
    save_json(extracted, output_file)
    print(f"✅ Extracted English texts saved as '{output_file}' (sorted={'ON' if sort_output else 'OFF'}, PUA preserved={'ON' if preserve_pua else 'OFF'})")