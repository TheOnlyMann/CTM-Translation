import json
import re
import sys
import os

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

    json_text = encode_real_pua_in_json_text(data)

    with open(output_path, "w", encoding="utf-8") as f:
        f.write(json_text)

    print(f"✅ Finished: {output_path}")

# --- CLI interface ---
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python jsonreadify.py <input> [-r]")
        print("This tool re-serializes JSON to ensure only actual PUA characters are escaped, while preserving emojis and other Unicode characters.")
        print("if given a input path without .json extension, it will process all .json files in that directory.")
        print("  -r : Process all .json files within the given directory, recursively. only applicable if input is a directory.")
        sys.exit(1)

    input_file = sys.argv[1]
    recursive = "-r" in sys.argv

    check_path = input_file
    if check_path.endswith(".json"):
        try:
            process_json_file(input_file, input_file)
        except Exception as e:
            print(f"⚠️ Error: {e}")
    else:
        if not os.path.isdir(check_path):
            print(f"❌ Error: {check_path} is not a valid directory.")
            sys.exit(1)
        if recursive:
            json_files = []
            for root, dirs, files in os.walk(check_path):
                for file in files:
                    if file.endswith(".json"):
                        json_files.append(os.path.join(root, file))
        else:
            json_files = [os.path.join(check_path, f) for f in os.listdir(check_path) if f.endswith(".json")]
        if not json_files:
            print(f"❌ No .json files found in directory: {check_path}")
            sys.exit(1)
        print(f"🔍 Found {len(json_files)} .json files to process in {check_path} (recursive={recursive})")

        for json_file in json_files:
            input_path = json_file
            try:
                process_json_file(input_path, input_path)
            except Exception as e:
                print(f"⚠️ Error processing {input_path}: {e}")


