
import argparse
import json
from pathlib import Path


def read_json_string(text, start):
    """
    Read a quoted JSON-style string without decoding or modifying it.
    Returns (raw_string, next_position).
    """
    if start >= len(text) or text[start] != '"':
        raise ValueError(f"Expected a string at position {start}")

    i = start + 1

    while i < len(text):
        if text[i] == "\\":
            i += 2
            continue

        if text[i] == '"':
            return text[start:i + 1], i + 1

        i += 1

    raise ValueError("Unterminated string")


def decode_key(raw):
    """
    Decode a key for comparison.
    Allows non-standard escapes such as \\'.
    """
    try:
        return json.loads(raw)
    except json.JSONDecodeError:
        result = []
        i = 1

        while i < len(raw) - 1:
            c = raw[i]

            if c == "\\" and i + 1 < len(raw) - 1:
                nxt = raw[i + 1]

                if nxt == "'":
                    result.append("'")
                    i += 2
                    continue

                if nxt == "u" and i + 5 < len(raw):
                    hexpart = raw[i + 2:i + 6]
                    try:
                        result.append(chr(int(hexpart, 16)))
                        i += 6
                        continue
                    except ValueError:
                        pass

                mapping = {
                    '"': '"',
                    "\\": "\\",
                    "/": "/",
                    "n": "\n",
                    "r": "\r",
                    "t": "\t",
                    "b": "\b",
                    "f": "\f",
                }

                if nxt in mapping:
                    result.append(mapping[nxt])
                    i += 2
                    continue

            result.append(c)
            i += 1

        return "".join(result)


def skip_whitespace_and_comments(text, pos):
    """Skip whitespace and JSONC-style comments."""
    n = len(text)

    while pos < n:
        if text[pos].isspace():
            pos += 1
            continue

        if text.startswith("//", pos):
            pos += 2
            while pos < n and text[pos] not in "\r\n":
                pos += 1
            continue

        if text.startswith("/*", pos):
            end = text.find("*/", pos + 2)
            if end == -1:
                raise ValueError("Unterminated block comment")
            pos = end + 2
            continue

        break

    return pos


def collect_keys(text):
    """
    Collect key locations from every JSON-style object.
    Does not parse or modify string values.
    """
    keys = []
    stack = []
    i = 0
    n = len(text)

    while i < n:
        if text[i] == '"':
            raw, end = read_json_string(text, i)
            after = skip_whitespace_and_comments(text, end)

            if (
                stack
                and stack[-1]["type"] == "object"
                and stack[-1]["expect_key"]
                and after < n
                and text[after] == ":"
            ):
                keys.append({
                    "start": i,
                    "end": end,
                    "raw": raw,
                    "key": decode_key(raw),
                    "object_id": stack[-1]["id"],
                })
                stack[-1]["expect_key"] = False

            i = end
            continue

        if text.startswith("//", i) or text.startswith("/*", i):
            i = skip_whitespace_and_comments(text, i)
            continue

        if text[i] == "{":
            stack.append({
                "type": "object",
                "expect_key": True,
                "id": i,
            })

        elif text[i] == "[":
            stack.append({
                "type": "array",
                "expect_key": False,
                "id": i,
            })

        elif text[i] in "}]":
            if not stack:
                raise ValueError("Unexpected closing bracket")

            expected = "object" if text[i] == "}" else "array"
            if stack[-1]["type"] != expected:
                raise ValueError("Mismatched closing bracket")

            stack.pop()

        elif text[i] == ",":
            if stack and stack[-1]["type"] == "object":
                stack[-1]["expect_key"] = True

        i += 1

    if stack:
        raise ValueError("Unclosed object or array")

    return keys


def uniquefy_text(text):
    """
    Rename duplicate keys while preserving the original text.
    Duplicate detection is scoped to each JSON object.
    """
    keys = collect_keys(text)

    original_keys = {}
    used_keys = {}
    replacements = []
    renamed_count = 0

    for item in keys:
        obj_id = item["object_id"]
        original_keys.setdefault(obj_id, set()).add(item["key"])

    for item in keys:
        obj_id = item["object_id"]
        key = item["key"]
        used = used_keys.setdefault(obj_id, set())
        reserved = original_keys[obj_id]

        if key not in used:
            used.add(key)
            continue

        index = 1

        while True:
            candidate = f"{key}_{index}"

            if candidate not in used and candidate not in reserved:
                break

            index += 1

        used.add(candidate)

        # Encode only the newly generated key.
        # Keep all other source text unchanged.
        new_raw = json.dumps(candidate, ensure_ascii=False)

        replacements.append((
            item["start"],
            item["end"],
            new_raw,
        ))

        renamed_count += 1

    # Apply replacements backwards so positions remain valid.
    result = text

    for start, end, replacement in reversed(replacements):
        result = result[:start] + replacement + result[end:]

    return result, renamed_count


def uniquefy_json_keys(input_file):
    """
    Read a file and return the modified JSON-style text.
    """
    with open(input_file, "r", encoding="utf-8-sig", newline="") as f:
        original = f.read()

    result, _ = uniquefy_text(original)
    return result


def save_json(data, output_file):
    """
    Save text without JSON reserialization.
    """
    with open(output_file, "w", encoding="utf-8", newline="") as f:
        f.write(data)


def main():
    parser = argparse.ArgumentParser(
        description="Make duplicate JSON keys unique without changing values."
    )

    parser.add_argument("input", help="Input JSON file")
    parser.add_argument(
        "output",
        nargs="?",
        help="Output JSON file (default: overwrite input)"
    )
    parser.add_argument(
        "-p",
        action="store_true",
        help="Compatibility option; original Unicode/PUA text is always preserved"
    )

    args = parser.parse_args()

    input_path = Path(args.input)
    output_path = Path(args.output) if args.output else input_path

    if not input_path.is_file():
        parser.error(f"File not found: {input_path}")

    try:
        with input_path.open(
            "r", encoding="utf-8-sig", newline=""
        ) as f:
            original = f.read()

        result, count = uniquefy_text(original)
        save_json(result, output_path)

        print(f"Input: {input_path}")
        print(f"Output: {output_path}")
        print(f"Renamed duplicate keys: {count}")
        print("Original values and escape sequences preserved.")

    except (OSError, ValueError) as error:
        parser.exit(1, f"Error: {error}\n")


if __name__ == "__main__":
    main()
