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
            while i < len(tokens) and tokens[i].startswith("§") and len(tokens[i]) == 2:
                run.append(tokens[i])
                i += 1
            if i < len(tokens):
                run.append(tokens[i])
                i += 1
            out.append("".join(run))
        else:
            out.append(tokens[i])
            i += 1
    return out

# ---------- Hangul progressive stages (-k) ----------
L_COMP = ['ㄱ','ㄲ','ㄴ','ㄷ','ㄸ','ㄹ','ㅁ','ㅂ','ㅃ','ㅅ','ㅆ','ㅇ','ㅈ','ㅉ','ㅊ','ㅋ','ㅌ','ㅍ','ㅎ']
V_COMP = ['ㅏ','ㅐ','ㅑ','ㅒ','ㅓ','ㅔ','ㅕ','ㅖ','ㅗ','ㅘ','ㅙ','ㅚ','ㅛ','ㅜ','ㅝ','ㅞ','ㅟ','ㅠ','ㅡ','ㅢ','ㅣ']
T_COMP = ['', 'ㄱ','ㄲ','ㄳ','ㄴ','ㄵ','ㄶ','ㄷ','ㄹ','ㄺ','ㄻ','ㄼ','ㄽ','ㄾ','ㄿ','ㅀ','ㅁ','ㅂ','ㅄ','ㅅ','ㅆ','ㅇ','ㅈ','ㅊ','ㅋ','ㅌ','ㅍ','ㅎ']
T_BASE = {
    'ㄳ':'ㄱ', 'ㄵ':'ㄴ', 'ㄶ':'ㄴ',
    'ㄺ':'ㄹ', 'ㄻ':'ㄹ', 'ㄼ':'ㄹ', 'ㄽ':'ㄹ', 'ㄾ':'ㄹ', 'ㄿ':'ㄹ', 'ㅀ':'ㄹ',
    'ㅄ':'ㅂ'
}
S_BASE = 0xAC00
L_COUNT, V_COUNT, T_COUNT = 19, 21, 28

def is_hangul_syllable(ch: str) -> bool:
    cp = ord(ch)
    return 0xAC00 <= cp <= 0xD7A3

def decompose_hangul(ch: str):
    S = ord(ch) - S_BASE
    L = S // (V_COUNT * T_COUNT)
    V = (S % (V_COUNT * T_COUNT)) // T_COUNT
    T = S % T_COUNT
    return L, V, T

def compose_hangul(L_idx: int, V_idx: int, T_idx: int) -> str:
    return chr(S_BASE + (L_idx * V_COUNT + V_idx) * T_COUNT + T_idx)

def t_index_from_char(t_char: str) -> int:
    try:
        return T_COMP.index(t_char)
    except ValueError:
        return 0

def korean_progressive_stages(ch: str):
    """
    한글 음절을 단계적으로: [초성], [초+중], [초+중+기본종성], [완성]
    종성이 없으면 [초성, (초+중)] 만 반환.
    합성 종성(예: ㄼ)은 중간 단계로 'ㄹ'을 사용.
    """
    if not is_hangul_syllable(ch):
        return [ch]

    L_idx, V_idx, T_idx = decompose_hangul(ch)
    stages = []
    # 1) 초성(호환자모)
    stages.append(L_COMP[L_idx])
    # 2) 초+중
    stages.append(compose_hangul(L_idx, V_idx, 0))
    # 3) (있다면) 초+중+기본종성
    if T_idx != 0:
        t_char = T_COMP[T_idx]
        base = T_BASE.get(t_char, None)
        if base:
            base_idx = t_index_from_char(base)
            stages.append(compose_hangul(L_idx, V_idx, base_idx))
        # 4) 완성
        stages.append(compose_hangul(L_idx, V_idx, T_idx))
    return stages

def expand_korean_stages_in_tokens(tokens, enable_kstage: bool):
    """
    enable_kstage=True 인 경우, 각 한글 음절(또는 '§... + 한글')을
    여러 단계 토큰으로 확장하고, 같은 음절 묶음에는 동일한 group id를 부여한다.
    반환: (tokens, groups)  (groups[i]는 tokens[i]의 그룹 id, 없으면 None)
    """
    if not enable_kstage:
        return tokens, [None] * len(tokens)

    out_tokens = []
    out_groups  = []
    next_group_id = 1

    for tok in tokens:
        # § 접두 + payload(한 글자) ?
        m = re.match(r'((?:§.)+)(.+)$', tok, re.DOTALL)
        if m:
            prefix, payload = m.group(1), m.group(2)
            if len(payload) == 1 and is_hangul_syllable(payload):
                stages = korean_progressive_stages(payload)
                gid = next_group_id; next_group_id += 1
                for s in stages:
                    out_tokens.append(prefix + s)
                    out_groups.append(gid)
            else:
                out_tokens.append(tok)
                out_groups.append(None)
            continue

        # 단일 한글 음절이면 단계 확장
        if len(tok) == 1 and is_hangul_syllable(tok):
            stages = korean_progressive_stages(tok)
            gid = next_group_id; next_group_id += 1
            for s in stages:
                out_tokens.append(s)
                out_groups.append(gid)
        else:
            out_tokens.append(tok)
            out_groups.append(None)

    return out_tokens, out_groups

# ---------- prefix selection with group-collapse ----------
def proportional_prefix_with_groups(tokens, groups, i, n):
    """
    1..n 단계 중 i단계까지 토큰을 취하되,
    같은 group 내에서는 '마지막 토큰만' 남기고 앞단계 토큰을 제거한다.
    """
    L = len(tokens)
    take = math.ceil(L * i / n) if n > 0 else 0
    slice_tokens = tokens[:take]
    slice_groups = groups[:take]

    # 같은 group은 마지막 것만 남기기
    last_index_for_group = {}
    for idx, g in enumerate(slice_groups):
        if g is not None:
            last_index_for_group[g] = idx

    out = []
    for idx, (t, g) in enumerate(zip(slice_tokens, slice_groups)):
        if g is None:
            out.append(t)
        else:
            # 이 group에서 마지막 등장 위치만 통과
            if last_index_for_group.get(g) == idx:
                out.append(t)
            else:
                # 이전 단계(같은 group의 더 이른 토큰)는 건너뜀
                pass
    return out

# ---------- Expansion logic ----------
KEY_RE = re.compile(r'^(.*)\.(\d+)$')

def expand_keys(data: dict, sort_output: bool = False, kstage: bool = False) -> dict:
    """
    For any key ending with .N (N >= 1), generate keys base.1 ... base.N.
    Each value is a proportional prefix of the original key's value.
    (입력 전체 복사 없이 생성본만 출력)
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
        tokens = glue_section_codes(tokens)                 # §x-run + 뒤 1토큰 묶기
        tokens, groups = expand_korean_stages_in_tokens(tokens, kstage)  # (-k) 확장(+그룹)

        for i in range(1, N + 1):
            gen_key = f"{base}.{i}"
            if gen_key in out:
                continue
            if kstage:
                new_tokens = proportional_prefix_with_groups(tokens, groups, i, N)
            else:
                take = math.ceil(len(tokens) * i / N) if N > 0 else 0
                new_tokens = tokens[:take]
            out[gen_key] = detokenize_value(new_tokens)

    if sort_output:
        return natural_sort_dict(out)
    return out

# ---------- CLI ----------
def main():
    if len(sys.argv) < 2:
        print("Usage: python expand_trailing_number_keys.py <input.json> [output.json] [-s] [-k]")
        print("  -s : natural-sort keys on save (optional)")
        print("  -k : 한글 조합 단계(초성→초+중→초+중+기본종성→완성) 확장 + 이전 단계 자동 제거")
        sys.exit(1)

    json_files = [a for a in sys.argv[1:] if a.endswith(".json")]
    sort_flag = "-s" in sys.argv
    kstage_flag = "-k" in sys.argv

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

    expanded = expand_keys(data, sort_output=sort_flag, kstage=kstage_flag)

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(expanded, f, indent=4, ensure_ascii=False)

    print(f"✅ Expanded and saved: {output_path}  (kstage={'ON' if kstage_flag else 'OFF'})")

if __name__ == "__main__":
    main()
