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
# Remove keys from JSON dicts
def remove_json_keys(a, b):
    return {k: v for k, v in a.items() if k not in b}  # Remove B's keys from A

# JSON dump with safe UTF-8 characters (preserves emojis, Korean, etc.)
def save_json(data, output_file):
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(data)

# CLI usage
if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python removejson.py A.json B.json [output.json] [-s] [-p]")
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

    if len(json_files) < 2:
        print("❗ You must specify at least A.json and B.json.")
        sys.exit(1)

    a_file, b_file = json_files[0], json_files[1]
    output_file = json_files[2] if len(json_files) >= 3 else a_file

    # Load, merge, process
    with open(a_file, "r", encoding="utf-8") as f:
        data_a = json.load(f)
    with open(b_file, "r", encoding="utf-8") as f:
        data_b = json.load(f)

    if not isinstance(data_a, dict) or not isinstance(data_b, dict):
        raise ValueError("❌ Both JSON files must contain top-level objects/dictionaries.")
    merged = remove_json_keys(data_a, data_b)
    if sort_output:
        merged = natural_sort_dict(merged)
    if preserve_pua:
        merged = encode_real_pua_in_json_text(merged)
    else:
        merged = json.dumps(merged, indent=4, ensure_ascii=False)
    save_json(merged, output_file)
    print(f"✅ Merged JSON saved as '{output_file}' (sorted={'ON' if sort_output else 'OFF'}, PUA preserved={'ON' if preserve_pua else 'OFF'})")
