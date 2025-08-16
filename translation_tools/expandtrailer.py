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

# ---------- Tokenizer ----------
#  - \uFFFF         : 하나의 토큰
#  - \. (백슬래시)  : \" \n \\ \t ... 하나의 토큰
#  - §.             : §x 하나의 토큰
#  - 그 외          : 1 문자
TOKEN_RE = re.compile(r'(?:\\u[0-9A-Fa-f]{4}|\\.|§.|.)', re.DOTALL)

def tokenize_value(s: str):
    return TOKEN_RE.findall(s)

def detokenize_value(tokens):
    return "".join(tokens)

def glue_section_codes(tokens):
    """
    연속된 §x 들을 모두 모아 바로 뒤 '단일 토큰' 1개까지 붙여서
    하나의 토큰으로 합칩니다.
    예) ['§s','§0','A','B'] -> ['§s§0A','B']
        ['§a','§b','§c','글'] -> ['§a§b§c글']
        ['§f'] -> ['§f'] (뒤에 붙일 문자가 없으면 그대로)
    """
    out = []
    i = 0
    while i < len(tokens):
        if tokens[i].startswith("§") and len(tokens[i]) == 2:
            run = []
            # §x 연속 수집
            while i < len(tokens) and tokens[i].startswith("§") and len(tokens[i]) == 2:
                run.append(tokens[i])
                i += 1
            # 바로 뒤 토큰 하나를 붙일 수 있으면 붙인다
            if i < len(tokens):
                run.append(tokens[i])
                i += 1
            out.append("".join(run))
        else:
            out.append(tokens[i])
            i += 1
    return out

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
    """
    out = dict()

    # base -> (N, value)  (가장 큰 N을 기준으로 확장)
    bases = {}
    for key, val in data.items():
        m = KEY_RE.match(key)
        if not m:
            continue
        base, num_str = m.groups()
        N = int(num_str)
        prev = bases.get(base)
        if prev is None or N > prev[0]:
            bases[base] = (N, val)

    # 각 base에 대해 1..N 생성
    for base, (N, full_val) in bases.items():
        if N <= 0:
            continue
        tokens = tokenize_value(full_val)
        tokens = glue_section_codes(tokens)   # ★ §x 연속 + 뒤 1토큰까지 하나로 묶기
        for i in range(1, N + 1):
            gen_key = f"{base}.{i}"
            if gen_key in out:
                continue
            new_tokens = proportional_prefix(tokens, i, N)
            out[gen_key] = detokenize_value(new_tokens)

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
