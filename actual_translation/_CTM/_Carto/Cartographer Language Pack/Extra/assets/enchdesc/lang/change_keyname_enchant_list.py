import json
import sys
import re
import os

json_data = []
current_directory = os.path.dirname(__file__)

with open(current_directory + "/enchant_list.json", "r", encoding="utf-8") as f:
    json_data = json.load(f)

lookup_table={}
for stuff in json_data:
    minimum_name = re.split(r'[:/]',stuff)[-1]
    lookup_table[minimum_name] = stuff

with open(current_directory + "/enchdesc_keyword.json", "r", encoding="utf-8") as f: