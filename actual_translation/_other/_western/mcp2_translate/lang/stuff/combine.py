
import os
import json
import datetime
import importlib.util
from collections import OrderedDict


# ============================================================
# 1. 경로 설정
# ============================================================

snippet_dir = [
    "actual_translation/_other/_western/mcp2_translate/lang/stuff/ko_kr_oth.json"
]

mergejson_dir = "translation_tools/python/mergejson.py"
managemultivalue_dir = "translation_tools/python/managemultivalue.py"

base_dir = (
    "actual_translation/_other/_western/mcp2_translate/lang/stuff/"
    "en_us_pr.json"
)

save_dir_base = (
    "actual_translation/_other/_western/mcp2_translate/lang/stuff/"
    "assembly/"
)

# value -> value 형태의 번역 매핑 파일
# 여러 개 지정할 수 있으며 위에서 아래 순서로 적용
multivalue_dir = [
    "actual_translation/_other/_western/mcp2_translate/lang/stuff/ko_kr_key.json",
]

# True: 모듈 병합 이후에 일괄 치환
# False: 기본 JSON에 먼저 일괄 치환한 후 모듈 병합
MULTIVALUE_AFTER_MERGE = False

# True: 매핑에 존재하지 않는 원본 value가 있으면 경고
WARN_UNUSED_VALUES = True


# ============================================================
# 2. 외부 Python 모듈 불러오기
# ============================================================

def load_module(name, path):
    module_path = os.path.abspath(path)

    if not os.path.isfile(module_path):
        raise FileNotFoundError(module_path)

    spec = importlib.util.spec_from_file_location(
        name, module_path
    )

    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

    return module


mergejson = load_module("mergejson", mergejson_dir)

managemultivalue = load_module(
    "managemultivalue",
    managemultivalue_dir
)


# ============================================================
# 3. JSON 불러오기
# ============================================================

def load_json(path):
    with open(path, "r", encoding="utf-8-sig") as f:
        return json.load(
            f,
            object_pairs_hook=OrderedDict
        )


# ============================================================
# 4. 중복 value 번역 적용
# ============================================================

def apply_multivalue(data, translation_files):
    result = OrderedDict(data)

    for path in translation_files:
        pairs = managemultivalue.load_pairs(
            __import__("pathlib").Path(path)
        )

        translations = managemultivalue.as_unique_map(
            pairs,
            path
        )

        existing_values = set(result.values())

        if WARN_UNUSED_VALUES:
            unused = set(translations) - existing_values

            if unused:
                print(
                    f"[WARNING] {path}: "
                    f"{len(unused)}개 원본 value를 찾지 못함"
                )

        changed = 0

        for key, value in result.items():
            if value in translations:
                new_value = translations[value]

                if new_value != value:
                    result[key] = new_value
                    changed += 1

        print(
            f"[MULTIVALUE] {path}: "
            f"{changed}개 항목 변경"
        )

    return result


# ============================================================
# 5. 메인 처리
# ============================================================

def main():
    merged = load_json(base_dir)

    # 기본 JSON에 먼저 적용하는 방식
    if not MULTIVALUE_AFTER_MERGE:
        merged = apply_multivalue(
            merged,
            multivalue_dir
        )

    # 기존 JSON 병합
    for snippet in snippet_dir:
        snippet_data = load_json(snippet)

        merged = mergejson.merge_json(
            merged,
            snippet_data,
            override=True,
            discard_b_keys=False
        )

        print(f"[MERGE] {snippet}")

    # 병합 완료 후 적용하는 방식
    if MULTIVALUE_AFTER_MERGE:
        merged = apply_multivalue(
            merged,
            multivalue_dir
        )

    # 타임스탬프 출력 디렉터리
    ts = datetime.datetime.now().strftime(
        "%Y%m%d_%H%M%S"
    )

    out_dir = os.path.join(
        save_dir_base,
        ts
    )

    os.makedirs(out_dir, exist_ok=True)

    out_file = os.path.join(
        out_dir,
        "ko_kr.json"
    )

    # 기존 PUA 처리 유지
    json_text = mergejson.encode_real_pua_in_json_text(
        merged
    )

    mergejson.save_json(
        json_text,
        out_file
    )

    print(f"[DONE] {out_file}")


if __name__ == "__main__":
    main()
