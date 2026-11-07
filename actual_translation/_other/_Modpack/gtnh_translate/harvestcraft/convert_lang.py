#!/usr/bin/env python3
"""Minecraft .lang <-> flat JSON converter (standard library only)."""
import argparse
import json
from pathlib import Path


def read_text(path):
    return Path(path).read_text(encoding='utf-8-sig')


def entries(text):
    for number, line in enumerate(text.splitlines(), 1):
        stripped = line.lstrip()
        if not stripped or stripped.startswith(('#', '!')):
            continue
        if '=' not in line:
            raise ValueError(f'Line {number}: missing = separator: {line[:100]!r}')
        key, value = line.split('=', 1)
        if not key:
            raise ValueError(f'Line {number}: empty key')
        yield number, key, value


def load_flat(path):
    def no_duplicates(pairs):
        obj = {}
        for key, value in pairs:
            if key in obj:
                raise ValueError(f'Duplicate JSON key: {key!r}')
            obj[key] = value
        return obj
    data = json.loads(read_text(path), object_pairs_hook=no_duplicates)
    if not isinstance(data, dict) or not all(isinstance(k, str) and isinstance(v, str) for k, v in data.items()):
        raise ValueError('JSON must be a flat object of string keys and string values.')
    return data


def flatten(source, destination, duplicates="last"):
    result = {}
    duplicate_count = 0
    for number, key, value in entries(read_text(source)):
        if key in result:
            duplicate_count += 1
            if duplicates == "error":
                raise ValueError(f'Line {number}: duplicate .lang key {key!r}')
            if duplicates == "first":
                continue
        result[key] = value
    if duplicate_count:
        print(f"Warning: {duplicate_count} duplicate key occurrence(s); policy={duplicates}. Flat JSON cannot represent duplicate keys.")
    Path(destination).write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    print(f'Converted {len(result)} entries -> {destination}')


def restore(source, destination, template=None, allow_missing=False, allow_extra=False):
    values = load_flat(source)
    if template is None:
        lines = [f'{key}={value}' for key, value in values.items()]
        output = '\n'.join(lines) + ('\n' if lines else '')
        count = len(lines)
    else:
        original = read_text(template)
        lines = original.splitlines(keepends=True)
        used = set()
        out = []
        count = 0
        for number, line in enumerate(lines, 1):
            content = line.rstrip('\r\n')
            ending = line[len(content):]
            if not content.strip() or content.lstrip().startswith(('#', '!')):
                out.append(line)
                continue
            if '=' not in content:
                raise ValueError(f'Template line {number}: missing = separator')
            key, old_value = content.split('=', 1)
            used.add(key)
            if key in values:
                out.append(f'{key}={values[key]}{ending}')
                count += 1
            elif allow_missing:
                out.append(line)
            else:
                raise ValueError(f'Template line {number}: key missing in JSON: {key!r}. Use --allow-missing to keep original.')
        extras = values.keys() - used
        if extras and not allow_extra:
            preview = ', '.join(repr(k) for k in sorted(extras)[:5])
            raise ValueError(f'{len(extras)} JSON keys absent from template: {preview}. Use --allow-extra to append.')
        if extras:
            if out and not out[-1].endswith(('\r', '\n')):
                out.append('\n')
            for key in values:
                if key in extras:
                    out.append(f'{key}={values[key]}\n')
                    count += 1
        output = ''.join(out)
    Path(destination).write_text(output, encoding='utf-8', newline='')
    print(f'Converted {count} entries -> {destination}')


def main():
    parser = argparse.ArgumentParser(description='Convert Minecraft .lang files to/from flat JSON.')
    sub = parser.add_subparsers(dest='command', required=True)
    p_flat = sub.add_parser('flatten', help='.lang -> flat JSON')
    p_flat.add_argument('input')
    p_flat.add_argument('output')
    p_flat.add_argument('--duplicates', choices=['last', 'first', 'error'], default='last', help='How to handle repeated keys (default: last)')
    p_restore = sub.add_parser('restore', help='flat JSON -> .lang')
    p_restore.add_argument('input')
    p_restore.add_argument('output')
    p_restore.add_argument('--template', help='Original .lang to preserve formatting and comments')
    p_restore.add_argument('--allow-missing', action='store_true', help='Keep template values for missing JSON keys')
    p_restore.add_argument('--allow-extra', action='store_true', help='Append JSON keys not found in template')
    args = parser.parse_args()
    try:
        if args.command == 'flatten':
            flatten(args.input, args.output, args.duplicates)
        else:
            restore(args.input, args.output, args.template, args.allow_missing, args.allow_extra)
    except (OSError, ValueError, json.JSONDecodeError) as error:
        parser.exit(1, f'Error: {error}\n')


if __name__ == '__main__':
    main()
