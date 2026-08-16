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

json_data1={}
with open(current_directory + "/enchdesc_keyword.json", "r", encoding="utf-8") as f:
    json_data1 = json.load(f)

json_data2={}
for key in json_data1:
    minimum_name = re.split(r'[:/]',key)[-1]
    if minimum_name in lookup_table:
        json_data2[lookup_table[minimum_name]]=json_data1[key]

with open(current_directory + "/enchdesc_keyword_m.json", "w", encoding="utf-8") as f:
    for keyword in json_data2:
        f.write("\""+str(keyword)+ "\" : " + str(json_data2[keyword]) +",\n")
