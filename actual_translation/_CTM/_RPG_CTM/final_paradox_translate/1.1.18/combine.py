import os
import json
import datetime
from collections import OrderedDict




snippet_dir=[
    "actual_translation/_CTM/_RPG_CTM/final_paradox_translate/1.1.18/gameplay/ko_kr_gameplay.json",
    "actual_translation/_CTM/_RPG_CTM/final_paradox_translate/1.1.18/dialogue/ko_kr_dialogue.json",
    
    "actual_translation/_CTM/_RPG_CTM/final_paradox_translate/1.1.18/dlc_override/ko_kr_multi.json",
    "actual_translation/_CTM/_RPG_CTM/final_paradox_translate/1.1.18/dlc_new/ko_kr_dlc.json"
]
mergejson_dir="translation_tools/python/mergejson.py"
base_dir="actual_translation/_CTM/_RPG_CTM/final_paradox_translate/1.1.18/base/en_us.json"
save_dir_base="actual_translation/_CTM/_RPG_CTM/final_paradox_translate/1.1.18/assembly/"
import importlib.util

# load mergejson module from provided path
mergejson_path = os.path.abspath(mergejson_dir)
spec = importlib.util.spec_from_file_location("mergejson", mergejson_path)
mergejson = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mergejson)

# load base
with open(base_dir, "r", encoding="utf-8") as f:
    merged = json.load(f, object_pairs_hook=OrderedDict)

# merge each snippet into base (override ON)
for snippet in snippet_dir:
    with open(snippet, "r", encoding="utf-8") as f:
        snippet_data = json.load(f, object_pairs_hook=OrderedDict)
    merged = mergejson.merge_json(merged, snippet_data, override=True, discard_b_keys=False)

# prepare output directory with current time
ts = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
out_dir = os.path.join(save_dir_base, ts)
os.makedirs(out_dir, exist_ok=True)
out_file = os.path.join(out_dir, "ko_kr.json")

# serialize preserving PUA characters and save
json_text = mergejson.encode_real_pua_in_json_text(merged)
mergejson.save_json(json_text, out_file)