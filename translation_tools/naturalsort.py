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

# --- Main execution ---
def process_json_file(input_path, output_path):
    with open(input_path, "r", encoding="utf-8") as f:
        data = json.load(f)

    if not isinstance(data, dict):
        raise ValueError("❌ JSON top-level structure must be an object/dictionary.")

    sorted_data = natural_sort_dict(data)
    json_text = encode_real_pua_in_json_text(sorted_data)

    with open(output_path, "w", encoding="utf-8") as f:
        f.write(json_text)

    print(f"✅ Finished: {output_path}")

# --- CLI interface ---
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python natural_sort_and_escape_pua.py <input.json> [output.json]")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) >= 3 else input_file

    try:
        process_json_file(input_file, output_file)
    except Exception as e:
        print(f"⚠️ Error: {e}")
