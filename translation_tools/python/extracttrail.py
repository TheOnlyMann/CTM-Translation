#!/usr/bin/env python3
import json
import re
import sys
from collections import OrderedDict

# --- optional: natural sort like 1,2,10 (by '.' segments, numbers as numbers) ---
def parse_key(k: str):
    return [(0, int(p)) if p.isdigit() else (1, p) for p in k.split(".")]

def natural_sort_dict(d: dict):
    return OrderedDict(sorted(d.items(), key=lambda kv: parse_key(kv[0])))

KEY_RE = re.compile(r"^(.*)\.(\d+)$")

def keep_only_max_trailing_keys(data: dict) -> dict:
    """
    같은 base(마지막 '.' 앞부분)에 대해 .숫자 키가 여러 개 있으면,
    가장 큰 숫자를 가진 키만 남기고 나머지는 제거.
    (예: A.1, A.2, A.10 -> A.10만 남김)
    """
    # base -> (max_n, max_key)
    max_for_base = {}
    members = {}

    for k in data.keys():
        m = KEY_RE.match(k)
        if not m:
            continue
        base, n_str = m.groups()
        n = int(n_str)
        if base not in max_for_base or n > max_for_base[base][0]:
            max_for_base[base] = (n, k)
        members.setdefault(base, []).append(k)

    # 어떤 base는 단 하나만 있으면 그대로 남고,
    # 여러 개인 경우엔 max_key만 남기고 나머지는 제거 대상
    keep_keys = set(data.keys())
    for base, ks in members.items():
        if len(ks) <= 1:
            continue
        _, max_key = max_for_base[base]
        for k in ks:
            if k != max_key:
                keep_keys.discard(k)

    # 원래 순서를 최대한 보존: 입력 순서대로 필터링
    return {k: v for k, v in data.items() if k in keep_keys}

def main():
    if len(sys.argv) < 2:
        print("Usage: python trailing_keys_keep_max.py <input.json> [output.json] [-s] [--dry-run]")
        print("  -s        : 자연 정렬해서 저장")
        print("  --dry-run : 실제 저장 없이 변경 요약만 출력")
        sys.exit(1)

    args = sys.argv[1:]
    json_files = [a for a in args if a.endswith(".json")]
    sort_flag = "-s" in args
    dry_run = "--dry-run" in args

    if not json_files:
        print("❗ input.json 이 필요합니다.")
        sys.exit(1)

    input_path = json_files[0]
    output_path = json_files[1] if len(json_files) >= 2 else input_path

    with open(input_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    if not isinstance(data, dict):
        print("❗ 최상위 JSON은 객체(dict)여야 합니다.")
        sys.exit(1)

    original_keys = set(data.keys())
    pruned = keep_only_max_trailing_keys(data)
    if sort_flag:
        pruned = natural_sort_dict(pruned)

    removed = [k for k in original_keys if k not in pruned]

    if dry_run:
        print(f"[DRY-RUN] 제거 {len(removed)}개 / 유지 {len(pruned)}개")
        print("제거 예시:", removed[:10])
        return

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(pruned, f, indent=4, ensure_ascii=False)

    print(f"✅ 완료: '{output_path}'  (제거 {len(removed)} / 총 {len(original_keys)})")

if __name__ == "__main__":
    main()
