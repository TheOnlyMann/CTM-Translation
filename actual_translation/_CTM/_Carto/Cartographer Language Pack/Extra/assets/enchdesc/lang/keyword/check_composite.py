import json
import sys
import os

json_data = []
keyword_data = {}
level_json = {}
current_directory = os.path.dirname(__file__)

with open(current_directory + "/keyword_composite.json", "r", encoding="utf-8") as f:
    json_data = json.load(f)
with open(current_directory + "/keyword.json", "r", encoding="utf-8") as f:
    keyword_data = json.load(f)
with open(current_directory + "/enchant_levels.json", "r", encoding="utf-8") as f:
    level_json = json.load(f)


def enchant_type_module(data_json,data_keyword):
    type_format = {
            "type": "minecraft:condition",
            "property": "minecraft:component",
            "predicate": "stored_enchantments",
            "value": [],
            "on_true": {
                "type": "minecraft:model",
            },
            "on_false": {
                "type": "minecraft:model",
            }
    }
    format_pointer = type_format
    fallback_method = {
        "type": "minecraft:empty"
    }
    checklist = []
    for keyword in data_json:
        model = data_json[keyword]
        if keyword == "fallback":
            fallback_method = {
                "type": "minecraft:model",
                "model": model
            }
        elif keyword in data_keyword:
            enchant_types = data_keyword[keyword]
            isUnique = False
            if len(enchant_types) == 1:
                enchant_types = enchant_types[0]
                isUnique = True
            format_pointer.update({
                "type": "minecraft:condition",
                "property": "minecraft:component",
                "predicate": "stored_enchantments",
                "value": [
                    {
                        "enchantments": enchant_types
                    }
                ],
                "on_true": {
                    "type": "minecraft:model",
                    "model": model
                },
                "on_false": {
                    "type": "minecraft:model",
                }
            })
            format_pointer = format_pointer["on_false"]
            if isUnique:
                if not enchant_types in checklist:
                    checklist.append(enchant_types)
                else:
                    print(f"Error: Overlapping enchant entry [{enchant_types}] for keyword [{keyword}]\n")
            else: 
                for overlapcheck in enchant_types:
                    if not overlapcheck in checklist:
                        checklist.append(overlapcheck)
                    else:
                        print(f"Error: Overlapping enchant entry [{overlapcheck}] for keyword [{keyword}]\n")
        else:
            print(f"Warning: there is no matching keyword for the entry [{keyword}]\n")
    format_pointer.update(fallback_method)
    return json.dumps(type_format, indent=4)


def enchant_composite_module(*args):
    composite_format = {
        "type": "minecraft:composite",
        "models":[
            
        ]
    }
    to_list = []
    for arg in args:
        to_list.append(json.loads(arg))
    composite_format["models"] = to_list
    return json.dumps(composite_format, indent=4)


def enchant_level_module(level_data):
    level_format = {
            "type": "minecraft:condition",
            "property": "minecraft:component",
            "predicate": "stored_enchantments",
            "value": [],
            "on_true": {
                "type": "minecraft:model",
            },
            "on_false": {
                "type": "minecraft:model",
            }
    }
    format_pointer = level_format
    fallback_method = {
        "type": "minecraft:empty"
    }
    for model, level in level_data.items():
        if level == "fallback":
            fallback_method = {
                "type": "minecraft:model",
                "model": model
            }
        else:
            format_pointer.update({
                "type": "minecraft:condition",
                "property": "minecraft:component",
                "predicate": "stored_enchantments",
                "value": [
                ],
                "on_true": {
                    "type": "minecraft:model",
                    "model": model
                },
                "on_false": {
                    "type": "minecraft:model",
                }
            })
            format_pointer["value"].append({
                "levels":level
            })
            format_pointer = format_pointer["on_false"]
    format_pointer.update(fallback_method)
    return json.dumps(level_format, indent=4)


composite_list =[]

for comp_level in json_data:
    composite_list.append(enchant_type_module(comp_level,keyword_data))

composite_list.append(enchant_level_module(level_json))

result_data = enchant_composite_module(*composite_list)

with open(current_directory + "/enchanted_book.json", "w", encoding="utf-8") as f:
    f.write(result_data)