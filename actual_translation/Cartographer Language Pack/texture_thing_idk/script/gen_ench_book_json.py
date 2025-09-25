import json
import re
import sys
import os


'''
Utility Script to automatically generate a enchanted_book.json file according to enchants.json

input: enchants.json
file structure
{
    "enchant_id": "model_id",
    ...
}

output: enchanted_book.json
file structure:
{   
    "model":{
      "type":"minecraft:condition",
      "property":"minecraft:component",
      "predicate":"stored_enchantments",
      "value":[
         {
            "enchantments":"enchant_id"
         }
      ],
      "on_true":{
         "type":"minecraft:model",
         "model":"model_id"
      },
      "on_false":{
        ... same as on_true for each enchantment, repeats until enchants.json is exhausted ...
      }
}
'''

# JSON read
def load_json(input_file):
    with open(input_file, "r", encoding="utf-8") as f:
        return json.load(f)

# JSON write
def save_json(data, output_file):
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(data)

# CLI usage
if __name__ == "__main__":
    inputsize = len(sys.argv)
    #if -h or --help in args, print usage
    if "-h" in sys.argv or "--help" in sys.argv:
        print("Usage: python gen_ench_book_json.py input.json output.json")
        print("By default, generates enchanted_book.json based on enchants.json")
        print("if input.json is not specified, will use enchants.json")
        print("if output.json is not specified, will overwrite enchanted_book.json")
        print("if -h or --help is specified, prints this help message and exits.")
        sys.exit(0)
        
    # Default filenames
    base_directory = os.path.dirname(__file__)
    enchants_file = base_directory + "/enchants.json"
    output_file = base_directory + "/enchanted_book.json"
    if inputsize >= 2:
        enchants_file = sys.argv[1]
    if inputsize >= 3:
        output_file = sys.argv[2]

    # Load enchants.json
    enchants_data = load_json(enchants_file)

    # Base structure of enchanted_book.json
    enchanted_book_data = {
        "model": {
            "type": "minecraft:condition",
            "property": "minecraft:component",
            "predicate": "stored_enchantments",
            "value": [],
            "on_true": {
                "type": "minecraft:model",
                "model": ""
            },
            "on_false": {
                "type": "minecraft:model",
                "model": ""
            }
        }
    }

    # Populate the JSON structure based on enchants.json
    current = enchanted_book_data["model"]
    first = True
    for enchant_id, model_id in enchants_data.items():
        if first:
            current["value"].append({"enchantments": enchant_id})
            current["on_true"]["model"] = model_id
            first = False
        else:
            new_condition = {
                "type": "minecraft:condition",
                "property": "minecraft:component",
                "predicate": "stored_enchantments",
                "value": [{"enchantments": enchant_id}],
                "on_true": {
                    "type": "minecraft:model",
                    "model": model_id
                },
                "on_false": {
                    # Placeholder, will be filled in next iteration or left empty at end
                    "type": "minecraft:model",
                    "model": ""
                }
            }
            current["on_false"] = new_condition
            current = new_condition
    # Fallback model if no enchantments match
    current["on_false"] = {
        "type": "minecraft:model",
        "model": "item/enchanted_book"
    }
    # Save the generated enchanted_book.json
    save_json(json.dumps(enchanted_book_data, indent=4), output_file)