#!/usr/bin/env python3
"""Extract repeated JSON values for translation and apply translated replacements."""
import argparse
import json
import sys
from collections import Counter
from pathlib import Path


def load_pairs(path):
    with path.open('r', encoding='utf-8-sig') as f:
        data = json.load(f, object_pairs_hook=lambda pairs: pairs)
    if not isinstance(data, list) or any(not isinstance(p, tuple) for p in data):
        raise ValueError(f'{path}: expected a top-level JSON object')
    for k, v in data:
        if not isinstance(v, str):
            raise ValueError(f'{path}: value for {k!r} is not a string')
    return data


def as_unique_map(pairs, label):
    result = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f'{label}: duplicate key {key!r}; cannot safely build a translation map')
        result[key] = value
    return result


def dump_pairs(pairs, preserve_pua=True):
    lines = []
    for k, v in pairs:
        key = json.dumps(k, ensure_ascii=False)
        val = json.dumps(v, ensure_ascii=False)
        if preserve_pua:
            for cp in range(0xE000, 0xF900):
                c = chr(cp)
                if c in key:
                    key = key.replace(c, f'\\u{cp:04X}')
                if c in val:
                    val = val.replace(c, f'\\u{cp:04X}')
        lines.append(f'    {key}: {val}')
    return '{\n' + ',\n'.join(lines) + '\n}\n' if lines else '{}\n'


def save(path, pairs, preserve_pua=True):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(dump_pairs(pairs, preserve_pua), encoding='utf-8')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest='command', required=True)
    extract = sub.add_parser('extract', help='Create a value-to-value translation JSON')
    extract.add_argument('input', type=Path)
    extract.add_argument('output', nargs='?', type=Path)
    extract.add_argument('-n', type=int, default=2, help='Minimum number of occurrences (default: 2)')
    extract.add_argument('-s', action='store_true', help='Sort values alphabetically')
    extract.add_argument('-p', action='store_true', help='Do not escape PUA characters')
    apply = sub.add_parser('apply', help='Apply a translated value-to-value JSON')
    apply.add_argument('input', type=Path, help='Original key-to-value JSON')
    apply.add_argument('translations', type=Path, help='Translated value-to-value JSON')
    apply.add_argument('output', nargs='?', type=Path)
    apply.add_argument('-s', action='store_true', help='Sort output keys alphabetically')
    apply.add_argument('-p', action='store_true', help='Do not escape PUA characters')
    args = parser.parse_args()
    try:
        if args.command == 'extract':
            if args.n < 1:
                parser.error('-n must be at least 1')
            source = load_pairs(args.input)
            counts = Counter(v for _, v in source)
            values = dict.fromkeys(v for _, v in source if counts[v] >= args.n)
            result = [(v, v) for v in values]
            if args.s:
                result.sort(key=lambda x: x[0])
            dest = args.output or args.input.with_name(args.input.stem + '_multivalue.json')
            if dest.resolve() == args.input.resolve():
                raise ValueError('Output must differ from input')
            save(dest, result, not args.p)
            print(f'Extracted {len(result)} distinct values to {dest}')
        else:
            source = load_pairs(args.input)
            translations = as_unique_map(load_pairs(args.translations), 'Translations')
            existing_values = {v for _, v in source}
            missing = set(translations) - existing_values
            if missing:
                print(f'Warning: {len(missing)} translation keys not found in source', file=sys.stderr)
            result = [(k, translations.get(v, v)) for k, v in source]
            changed = sum(old != new for (_, old), (_, new) in zip(source, result))
            if args.s:
                result.sort(key=lambda x: x[0])
            dest = args.output or args.input.with_name(args.input.stem + '_updated.json')
            if dest.resolve() in {args.input.resolve(), args.translations.resolve()}:
                raise ValueError('Output must differ from both input and translations')
            save(dest, result, not args.p)
            print(f'Updated {changed} entries in {dest}')
    except (OSError, ValueError, json.JSONDecodeError) as exc:
        parser.exit(1, f'Error: {exc}\n')


if __name__ == '__main__':
    main()
