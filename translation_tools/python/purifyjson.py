
import argparse
from pathlib import Path


def remove_comments(text: str) -> str:
    result = []
    i = 0
    in_string = False
    escaped = False

    while i < len(text):
        char = text[i]
        next_char = text[i + 1] if i + 1 < len(text) else ""

        if in_string:
            result.append(char)

            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                in_string = False

            i += 1
            continue

        if char == '"':
            in_string = True
            result.append(char)
            i += 1
            continue

        # Single-line comment
        if char == "/" and next_char == "/":
            i += 2

            while i < len(text) and text[i] not in "\r\n":
                i += 1

            continue

        # Multi-line comment
        if char == "/" and next_char == "*":
            i += 2
            closed = False

            while i < len(text):
                if text[i:i + 2] == "*/":
                    i += 2
                    closed = True
                    break

                if text[i] in "\r\n":
                    result.append(text[i])

                i += 1

            if not closed:
                raise ValueError("Unclosed block comment")

            continue

        result.append(char)
        i += 1

    return "".join(result)


def remove_trailing_commas(text: str) -> str:
    result = []
    i = 0
    in_string = False
    escaped = False

    while i < len(text):
        char = text[i]

        if in_string:
            result.append(char)

            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                in_string = False

            i += 1
            continue

        if char == '"':
            in_string = True
            result.append(char)
            i += 1
            continue

        if char == ",":
            j = i + 1

            while j < len(text) and text[j].isspace():
                j += 1

            if j < len(text) and text[j] in "}]":
                i += 1
                continue

        result.append(char)
        i += 1

    return "".join(result)


def remove_empty_lines(text: str) -> str:
    lines = text.split("\n")

    return "\n".join(
        line for line in lines if line.strip()
    )


def process_file(input_path: Path, output_path: Path):
    with input_path.open("r", encoding="utf-8-sig") as f:
        original = f.read()

    # Remove comments without parsing JSON values.
    cleaned = remove_comments(original)

    # Remove trailing commas outside strings.
    cleaned = remove_trailing_commas(cleaned)

    # Remove empty lines.
    cleaned = remove_empty_lines(cleaned)

    with output_path.open("w", encoding="utf-8") as f:
        f.write(cleaned)

    print(f"Input:  {input_path}")
    print(f"Output: {output_path}")
    print("Comments removed. String contents preserved.")


def main():
    parser = argparse.ArgumentParser(
        description="Remove comments from JSON-like translation files."
    )

    parser.add_argument("input", help="Input JSON file")
    parser.add_argument(
        "output",
        nargs="?",
        help="Output JSON file (default: overwrite input)"
    )

    args = parser.parse_args()

    input_path = Path(args.input)
    output_path = (
        Path(args.output) if args.output else input_path
    )

    if not input_path.is_file():
        parser.error(f"File not found: {input_path}")

    try:
        process_file(input_path, output_path)
    except (OSError, ValueError) as error:
        parser.exit(1, f"Error: {error}\n")


if __name__ == "__main__":
    main()
