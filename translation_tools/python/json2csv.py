import json
import csv
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
# Merge two JSON dicts with optional override control
def merge_json(a, b, override=True, sort_new_keys=False, discard_b_keys=False):
    merged = OrderedDict()
    # Merge keys from A, overriding with B if specified
    for key in a:
        if override and key in b:
            merged[key] = b[key]  # Override A’s value
        else:
            merged[key] = a[key]  # Keep A’s value

    if not discard_b_keys:
        # Add new keys from B not in A
        b_only_keys = [k for k in b if k not in a]
        if sort_new_keys:
            b_only_keys.sort(key=lambda k: parse_key(k))
        for key in b_only_keys:
            merged[key] = b[key]

    return merged

# JSON dump with safe UTF-8 characters (preserves emojis, Korean, etc.)
def save_json(data, output_file):
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(data)

# CLI usage
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python json2csv.py intput [output] [-p]")
        print(" if the input file is a .csv, it will be converted to .json")
        print(" if the input file is a .json, it will be converted to .csv")
        print(" if there is no output file, the output file will have the same name as the input file with the appropriate extension")
        print(" if there already exists an output file with the same name, it will be overwritten")
        print("  -p : Do NOT preserve PUA characters (default: preserve ON)")
        sys.exit(1)

    # Parse arguments
    input_file = None
    output_file = None
    preserve_pua = True
    
    input_file = sys.argv[1]
    for arg in sys.argv[2:]:
        if arg == "-p":
            preserve_pua = False
        elif not output_file:
            output_file = arg
        else:
            break

    if not input_file:
        print("❗ You must specify the input file.")
        sys.exit(1)
    if output_file:
        output_file = output_file.rsplit('.', 1)[0] 
    if output_file is None:
        output_file = input_file.rsplit('.', 1)[0]
        
    if input_file.endswith(".json"):
        with open(input_file, "r", encoding="utf-8") as f:
            data = json.load(f, object_pairs_hook=OrderedDict)
        if not preserve_pua:
            output_data = encode_real_pua_in_json_text(data)
        else:
            output_data = json.dumps(data, indent=4, ensure_ascii=False)
        output_file += ".csv"
        with open(output_file, "w", encoding="utf-8", newline='') as f:
            writer = csv.writer(f)
            for key, value in data.items():
                writer.writerow([key, value])
        
    elif input_file.endswith(".csv"):
        with open(input_file, "r", encoding="utf-8") as f:
            reader = csv.reader(f)
            output_data = {rows[0]: rows[1] for rows in reader if len(rows) >= 2}
        output_file += ".json"
        save_json(json.dumps(output_data, indent=4, ensure_ascii=False), output_file)
    else:
        print("❗ Unsupported input file format. Please use .json or .csv.")
        sys.exit(1)
    