
import argparse
import json
import re
import hashlib
from pathlib import Path
from collections import defaultdict


def escape_pua(text):
    """Escape actual PUA characters as \\uXXXX."""
    return "".join(
        f"\\u{ord(char):04X}"
        if 0xE000 <= ord(char) <= 0xF8FF
        else char
        for char in text
    )


def serialize_json(pairs, preserve_pua=True):
    """Serialize key-value pairs without losing duplicate keys."""
    lines = []

    for key, value in pairs:
        encoded_key = json.dumps(key, ensure_ascii=False)
        encoded_value = json.dumps(value, ensure_ascii=False)

        if preserve_pua:
            encoded_key = escape_pua(encoded_key)
            encoded_value = escape_pua(encoded_value)

        lines.append(f"    {encoded_key}: {encoded_value}")

    if not lines:
        return "{}\n"

    return "{\n" + ",\n".join(lines) + "\n}\n"


def load_json(path):
    """Read top-level JSON object as ordered pairs."""
    with open(path, "r", encoding="utf-8-sig") as file:
        data = json.load(
            file,
            object_pairs_hook=lambda pairs: pairs
        )

    if not isinstance(data, list):
        raise ValueError("Input must be a JSON object.")

    for item in data:
        if not isinstance(item, tuple) or len(item) != 2:
            raise ValueError("Input must be a JSON object.")

        key, value = item

        if not isinstance(value, str):
            raise ValueError(
                f"Value must be a string: {key}"
            )

    return data


def safe_filename(value):
    """Convert a value into a Windows-compatible filename."""
    name = re.sub(
        r'[<>:"/\\|?*\x00-\x1f]',
        "_",
        value
    ).strip(" .")

    if not name:
        name = "_empty"

    if len(name) > 80:
        digest = hashlib.sha256(
            name.encode("utf-8")
        ).hexdigest()[:10]

        name = name[:65].rstrip(" .") + "_" + digest

    reserved = {"CON", "PRN", "AUX", "NUL"}
    reserved.update(f"COM{i}" for i in range(1, 10))
    reserved.update(f"LPT{i}" for i in range(1, 10))

    if name.upper() in reserved:
        name = "_" + name

    return name


def gather_by_value(pairs, minimum):
    """Group entries by identical value."""
    groups = defaultdict(list)

    for key, value in pairs:
        groups[value].append((key, value))

    return {
        value: items
        for value, items in groups.items()
        if len(items) >= minimum
    }


def save_json(path, pairs, preserve_pua):
    path.parent.mkdir(parents=True, exist_ok=True)

    content = serialize_json(
        pairs,
        preserve_pua=preserve_pua
    )

    with open(path, "w", encoding="utf-8") as file:
        file.write(content)


def main():
    parser = argparse.ArgumentParser(
        description="Gather JSON entries sharing identical values."
    )

    parser.add_argument("input", type=Path)
    parser.add_argument("output", nargs="?", type=Path)

    parser.add_argument(
        "-n",
        type=int,
        required=True,
        help="Minimum number of keys sharing the same value"
    )

    parser.add_argument(
        "-s",
        action="store_true",
        help="Sort merged JSON keys (default: off)"
    )

    parser.add_argument(
        "-p",
        action="store_true",
        help="Do NOT preserve PUA characters (default: preserve ON)"
    )

    parser.add_argument(
        "-i",
        action="store_true",
        help="Split results into output_[value].json files"
    )

    args = parser.parse_args()

    if args.n < 1:
        parser.error("-n must be at least 1")

    if not args.input.is_file():
        parser.error(f"Input file not found: {args.input}")

    output = args.output or args.input.with_name(
        f"{args.input.stem}_gathered.json"
    )

    if output.suffix.lower() != ".json":
        parser.error("Output filename must end with .json")

    try:
        pairs = load_json(args.input)
        groups = gather_by_value(pairs, args.n)

        if args.i:
            used_names = set()
            file_count = 0

            for value, items in groups.items():
                filename = safe_filename(value)
                candidate = filename
                index = 2

                while candidate.casefold() in used_names:
                    candidate = f"{filename}_{index}"
                    index += 1

                used_names.add(candidate.casefold())

                destination = output.with_name(
                    f"{output.stem}_{candidate}.json"
                )

                if destination.resolve() == args.input.resolve():
                    raise ValueError(
                        "Output would overwrite the input file."
                    )

                if args.s:
                    items = sorted(items, key=lambda x: x[0])

                save_json(destination, items, not args.p)
                file_count += 1

                print(
                    f"Saved: {destination} ({len(items)} entries)"
                )

            print(f"Completed: {file_count} files")

        else:
            # Preserve original entry order.
            selected = [
                (key, value)
                for key, value in pairs
                if value in groups
            ]

            if args.s:
                selected.sort(key=lambda x: x[0])

            if output.resolve() == args.input.resolve():
                raise ValueError(
                    "Output must differ from the input file."
                )

            save_json(output, selected, not args.p)

            print(f"Saved: {output}")
            print(f"Matched values: {len(groups)}")
            print(f"Matched entries: {len(selected)}")

    except (OSError, ValueError) as error:
        parser.exit(1, f"Error: {error}\n")


if __name__ == "__main__":
    main()
