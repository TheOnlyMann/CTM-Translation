import argparse
import json
from pathlib import Path


def load_json(path):
    with Path(path).open('r', encoding='utf-8-sig') as file:
        return json.load(file)


def save_json(path, data):
    with Path(path).open('w', encoding='utf-8', newline='\n') as file:
        json.dump(data, file, ensure_ascii=False, indent=2)
        file.write('\n')


def to_flat(source, destination, strip_prefix=False, use_original=False):
    entries = load_json(source)
    if not isinstance(entries, list):
        raise ValueError('ParaTranz input must be an array.')
    flat = {}
    for index, entry in enumerate(entries):
        if not isinstance(entry, dict) or not isinstance(entry.get('key'), str):
            raise ValueError(f'Invalid entry at index {index}: missing string key.')
        key = entry['key']
        if strip_prefix and '|' in key:
            key = key.split('|', 1)[1]
        if key in flat:
            raise ValueError(f'Duplicate key after conversion: {key!r}')
        value = entry.get('original') if use_original else entry.get('translation')
        if value is None and not use_original:
            value = entry.get('original', '')
        if not isinstance(value, str):
            raise ValueError(f'Value for {key!r} is not a string.')
        flat[key] = value
    save_json(destination, flat)
    print(f'Converted {len(flat)} entries to {destination}')


def to_paratranz(source, template, destination, strip_prefix=False, allow_missing=False):
    flat = load_json(source)
    entries = load_json(template)
    if not isinstance(flat, dict) or not isinstance(entries, list):
        raise ValueError('Expected a flat JSON object and a ParaTranz array template.')
    if any(not isinstance(k, str) or not isinstance(v, str) for k, v in flat.items()):
        raise ValueError('Flat JSON must contain string keys and string values.')
    updated = []
    matched = set()
    for index, entry in enumerate(entries):
        if not isinstance(entry, dict) or not isinstance(entry.get('key'), str):
            raise ValueError(f'Invalid template entry at index {index}.')
        item = entry.copy()
        key = item['key']
        lookup = key.split('|', 1)[1] if strip_prefix and '|' in key else key
        if lookup in flat:
            item['translation'] = flat[lookup]
            matched.add(lookup)
        elif not allow_missing:
            raise ValueError(f'Missing key in flat JSON: {lookup!r} (use --allow-missing to keep template values)')
        updated.append(item)
    extra = set(flat) - matched
    if extra:
        preview = ', '.join(repr(k) for k in sorted(extra)[:5])
        raise ValueError(f'{len(extra)} key(s) absent from template: {preview}')
    save_json(destination, updated)
    print(f'Updated {len(matched)} translations in {destination}')


def main():
    parser = argparse.ArgumentParser(description='Convert ParaTranz export JSON and flat translation JSON.')
    sub = parser.add_subparsers(dest='command', required=True)
    forward = sub.add_parser('flatten', help='ParaTranz array -> flat JSON object')
    forward.add_argument('input')
    forward.add_argument('output')
    forward.add_argument('--strip-prefix', action='store_true', help='Remove the part before the first | in keys')
    forward.add_argument('--original', action='store_true', help='Export original strings instead of translations')
    reverse = sub.add_parser('restore', help='Flat JSON -> ParaTranz array, using original export as template')
    reverse.add_argument('input')
    reverse.add_argument('template')
    reverse.add_argument('output')
    reverse.add_argument('--strip-prefix', action='store_true', help='Match keys after removing the part before the first |')
    reverse.add_argument('--allow-missing', action='store_true', help='Keep template translations for missing keys')
    args = parser.parse_args()
    try:
        if args.command == 'flatten':
            to_flat(args.input, args.output, args.strip_prefix, args.original)
        else:
            to_paratranz(args.input, args.template, args.output, args.strip_prefix, args.allow_missing)
    except (OSError, ValueError, json.JSONDecodeError) as error:
        parser.exit(1, f'Error: {error}\n')


if __name__ == '__main__':
    main()
