#!/usr/bin/env python3
import json
import re
import sys
from collections import OrderedDict
from typing import List, Callable

# ---------- (선택) 자연 정렬 ----------
def parse_key(k: str):
    # '.'로 나누고 숫자는 숫자로 비교
    return [(0, int(p)) if p.isdigit() else (1, p) for p in k.split(".")]

def natural_sort_dict(d: dict):
    return OrderedDict(sorted(d.items(), key=lambda kv: parse_key(kv[0])))

# ---------- 패턴 로딩 ----------
def load_patterns(args: List[str], file_path: str | None) -> List[str]:
    pats: List[str] = []
    for p in args:
        pats.append(p)
    if file_path:
        with open(file_path, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith("#"):
                    continue
                pats.append(line)
    return pats

# ---------- 매칭 함수 생성 ----------
def build_matcher(
    patterns: List[str],
    regex: bool = False,
    ignore_case: bool = False,
    segment_mode: bool = False,
) -> Callable[[str], bool]:
    """
    segment_mode=True: 키를 '.'로 분할해서 각 세그먼트에 대해 검사
      - regex=False : '부분 문자열 포함' 검사
      - regex=True  : 세그먼트 전체에 대해 정규식 search
    segment_mode=False: 키 전체 문자열에 대해 검사
      - regex=False : 부분 문자열 포함
      - regex=True  : 정규식 search
    """
    if not patterns:
        # 패턴 없으면 아무 것도 지우지 않음
        return lambda k: False

    flags = re.IGNORECASE if ignore_case else 0
    compiled = [re.compile(p, flags) for p in patterns] if regex else None

    if segment_mode:
        if regex:
            def match(key: str) -> bool:
                segs = key.split(".")
                for seg in segs:
                    for rx in compiled:
                        if rx.search(seg):
                            return True
                return False
        else:
            # 부분 문자열(세그먼트 기준)
            if ignore_case:
                low_pats = [p.lower() for p in patterns]
                def match(key: str) -> bool:
                    for seg in key.split("."):
                        s = seg.lower()
                        for p in low_pats:
                            if p in s:
                                return True
                    return False
            else:
                def match(key: str) -> bool:
                    for seg in key.split("."):
                        for p in patterns:
                            if p in seg:
                                return True
                    return False
    else:
        if regex:
            def match(key: str) -> bool:
                for rx in compiled:
                    if rx.search(key):
                        return True
                return False
        else:
            if ignore_case:
                low_pats = [p.lower() for p in patterns]
                def match(key: str) -> bool:
                    s = key.lower()
                    for p in low_pats:
                        if p in s:
                            return True
                    return False
            else:
                def match(key: str) -> bool:
                    for p in patterns:
                        if p in key:
                            return True
                    return False

    return match

# ---------- 필터링 ----------
def filter_object(data: dict, matcher: Callable[[str], bool], invert: bool = False) -> dict:
    """
    invert=False (기본): matcher(key)가 True인 항목을 제거
    invert=True: matcher(key)가 True인 항목만 유지 (교집합 모드처럼 동작)
    """
    if invert:
        return {k: v for k, v in data.items() if matcher(k)}
    else:
        return {k: v for k, v in data.items() if not matcher(k)}

# ---------- CLI ----------
HELP = """\
Usage: python remove_by_key.py <input.json> [output.json]
       [--key WORD ...] [--keys WORD1,WORD2,...] [--keyfile patterns.txt]
       [--regex] [--ignore-case] [--segment]
       [--invert] [--sort] [--dry-run]

Options:
  --key WORD            제거 기준 단어/패턴(여러 번 사용 가능)
  --keys CSV            콤마로 구분된 여러 단어/패턴 (예: "foo,bar,baz")
  --keyfile FILE        한 줄에 하나씩 패턴을 적은 파일(#로 시작하는 라인은 주석)

  --regex               패턴을 정규식으로 취급(search)
  --ignore-case         대소문자 무시
  --segment             키를 '.'로 분리해 세그먼트 단위로 검사

  --invert              매칭되는 키만 '유지' (기본은 매칭되는 키를 '삭제')
  --sort                결과 JSON 키를 자연 정렬
  --dry-run             실제 파일 저장 없이 제거/유지 건수와 예시만 출력
"""

def main():
    if len(sys.argv) < 2:
        print(HELP)
        sys.exit(1)

    # 인자 파싱(간단 파서)
    args = sys.argv[1:]
    json_files: List[str] = [a for a in args if a.endswith(".json")]
    if not json_files:
        print("❗ input.json 이 필요합니다.\n")
        print(HELP); sys.exit(1)

    input_path = json_files[0]
    output_path = json_files[1] if len(json_files) >= 2 else input_path

    # 플래그/옵션
    patterns_arg: List[str] = []
    patterns_csv = None
    keyfile = None
    regex = False
    ignore_case = False
    segment = False
    invert = False
    do_sort = False
    dry_run = False

    # 잔여 인자 스캔
    i = 0
    while i < len(args):
        a = args[i]
        if a == "--key" and i + 1 < len(args):
            patterns_arg.append(args[i+1]); i += 2; continue
        if a == "--keys" and i + 1 < len(args):
            patterns_csv = args[i+1]; i += 2; continue
        if a == "--keyfile" and i + 1 < len(args):
            keyfile = args[i+1]; i += 2; continue
        if a == "--regex":
            regex = True; i += 1; continue
        if a == "--ignore-case":
            ignore_case = True; i += 1; continue
        if a == "--segment":
            segment = True; i += 1; continue
        if a == "--invert":
            invert = True; i += 1; continue
        if a == "--sort":
            do_sort = True; i += 1; continue
        if a == "--dry-run":
            dry_run = True; i += 1; continue
        # json 파일명 또는 기타는 건너뜀
        i += 1

    if patterns_csv:
        for p in patterns_csv.split(","):
            p = p.strip()
            if p:
                patterns_arg.append(p)

    patterns = load_patterns(patterns_arg, keyfile)
    if not patterns:
        print("❗ 패턴이 없습니다. --key/--keys/--keyfile 중 하나를 사용하세요.\n")
        print(HELP); sys.exit(1)

    # 로드
    with open(input_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    if not isinstance(data, dict):
        print("❗ 최상위 JSON은 객체여야 합니다(dict).")
        sys.exit(1)

    # 매처 만들고 필터 적용
    matcher = build_matcher(patterns, regex=regex, ignore_case=ignore_case, segment_mode=segment)

    to_remove = [k for k in data if matcher(k)]
    kept = [k for k in data if not matcher(k)]
    result = filter_object(data, matcher, invert=invert)

    if do_sort:
        result = natural_sort_dict(result)

    # 드라이런: 통계만 보여주고 종료
    if dry_run:
        if invert:
            print(f"[DRY-RUN] 유지(매칭) {len(result)}개 / 제거 {len(data)-len(result)}개")
            print("예시(유지):", list(result.keys())[:10])
        else:
            print(f"[DRY-RUN] 제거(매칭) {len(to_remove)}개 / 유지 {len(kept)}개")
            print("예시(제거):", to_remove[:10])
        return

    # 저장
    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(result, f, indent=4, ensure_ascii=False)

    if invert:
        print(f"✅ 완료: '{output_path}' (매칭된 키만 유지, {len(result)}/{len(data)} 개)")
    else:
        print(f"✅ 완료: '{output_path}' (매칭된 키 제거, {len(to_remove)} 제거 / 총 {len(data)} 개)")

if __name__ == "__main__":
    main()
