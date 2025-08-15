import json
import re
import sys
import math
from collections import OrderedDict

# ---------- Natural sort helpers ----------
def parse_key(k: str):
    return [(0, int(p)) if p.isdigit() else (1, p) for p in k.split(".")]

def natural_sort_dict(d: dict):
    return OrderedDict(sorted(d.items(), key=lambda kv: parse_key(kv[0])))

# ---------- Value slicing that respects \\uXXXX "literals" ----------
# Treat each of these as ONE token:
#  - literal backslash-u hex:   \uFFFF
#  - any backslash escape:      \X   (quotes, n, r, t, backslash itself, etc.)
#  - Minecraft color code:      §X
#  - otherwise:                 any single character
TOKEN_RE = re.compile(r'(?:\\u[0-9A-Fa-f]{4}|\\.|§.|.)', re.DOTALL)

def tokenize_value(s: str):
    return TOKEN_RE.findall(s)

def detokenize_value(tokens):
    return "".join(tokens)

def proportional_prefix(tokens, i, n):
    """
    Return the first ceil(len(tokens) * i / n) tokens.
    Ensures non-decreasing length from 1..n; for i=n returns the full original.
    """
    L = len(tokens)
    take = math.ceil(L * i / n) if n > 0 else 0
    return tokens[:take]

# ---------- Expansion logic ----------
KEY_RE = re.compile(r'^(.*)\.(\d+)$')

def expand_keys(data: dict, sort_output: bool = False) -> dict:
    """
    For any key ending with .N (N >= 1), generate keys base.1 ... base.N.
    Each value is a proportional prefix of the original key's value.
    Existing keys are left as-is (we only fill missing ones).
    """
    # Work on a copy we can update as we go
    out = dict()

    # Group candidates by base, keeping the max N & the original value for that N
    bases = {}  # base -> (N, value)
    for key, val in data.items():
        m = KEY_RE.match(key)
        if not m:
            continue
        base, num_str = m.groups()
        N = int(num_str)
        # Only consider the exact ".N" as the source; keep the largest N's value if multiple exist
        prev = bases.get(base)
        if prev is None or N > prev[0]:
            bases[base] = (N, val)

    # For each base, generate 1..N if missing
    for base, (N, full_val) in bases.items():
        if N <= 0:
            continue
        tokens = tokenize_value(full_val)
        for i in range(1, N + 1):
            gen_key = f"{base}.{i}"
            if gen_key in out:
                continue  # don't overwrite existing keys
            new_tokens = proportional_prefix(tokens, i, N)
            out[gen_key] = detokenize_value(new_tokens)

    # Optionally natural-sort
    if sort_output:
        return natural_sort_dict(out)
    return out

# ---------- CLI ----------
def main():
    if len(sys.argv) < 2:
        print("Usage: python expand_trailing_number_keys.py <input.json> [output.json] [-s]")
        print("  -s : natural-sort keys on save (optional)")
        sys.exit(1)

    json_files = [a for a in sys.argv[1:] if a.endswith(".json")]
    sort_flag = "-s" in sys.argv

    if not json_files:
        print("❗ Please provide at least an input JSON file.")
        sys.exit(1)

    input_path = json_files[0]
    output_path = json_files[1] if len(json_files) >= 2 else input_path

    with open(input_path, "r", encoding="utf-8") as f:
        data = json.load(f)

    if not isinstance(data, dict):
        print("❗ Top-level JSON must be an object.")
        sys.exit(1)

    expanded = expand_keys(data, sort_output=sort_flag)

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(expanded, f, indent=4, ensure_ascii=False)

    print(f"✅ Expanded and saved: {output_path}")

if __name__ == "__main__":
    main()
