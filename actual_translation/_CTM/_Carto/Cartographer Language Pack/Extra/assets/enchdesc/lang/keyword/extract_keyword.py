import json
import sys
import os

json_data = []
current_directory = os.path.dirname(__file__)

with open(current_directory + "/enchdesc_keyword.json", "r", encoding="utf-8") as f:
    json_data = json.load(f)
keyword_list = {}
for enchant in json_data:
    keyword = json_data[enchant]
    if not enchant.startswith("##"):
        for key in keyword:
            if not key in keyword_list:
                keyword_list[key]=[]
            keyword_list[key].append(enchant)
broad_enchant = {}
unique_enchant = {}
for keyword in keyword_list:
    list = keyword_list[keyword]
    if len(list) > 1:
        broad_enchant[keyword] = list
    else:
        unique_enchant[keyword] = list

with open(current_directory + "/keyword.json","w",encoding="utf-8") as f:
    f.write("{\n")
    for keyword in broad_enchant:
        f.write("   \""+str(keyword)+ "\" : " + str(broad_enchant[keyword]).replace('\'','\"') +",\n")
    f.write("\n")
    for keyword in unique_enchant:
        f.write("   \""+str(keyword)+ "\" : " + str(unique_enchant[keyword]).replace('\'','\"') +",\n")
        
    f.write("}")
    
with open(current_directory + "/keyword_match_list.json","w",encoding="utf-8") as f:
    f.write("{\n")
    for keyword in broad_enchant:
        f.write("   \""+str(keyword)+ "\" :\"\" ,\n")
    f.write("\n")
    for keyword in unique_enchant:
        f.write("   \""+str(keyword)+ "\" :\"\" ,\n")
        
    f.write("}")