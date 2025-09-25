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

output: ./model_id
file structure:
model_id: A:B/C
create folder A, then folder 'models' and 'textures' inside A, 
then create folder B inside both folders, then create file C.json inside models/B with the following

{
	"parent": "item/generated",
	"textures":
    {
		"layer0": "model_id"
	},
	"gui_light": "front",
	"display": {}
}

C always needs to be the last part after the last / or : if no / is present in model_id
B is the part after : and before the last /
A is the part before :
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
        print("Usage: python create_filestruct.py input.json")
        print("By default, generates resource folders based on enchants.json")
        print("if input.json is not specified, will use enchants.json")
        print("if -h or --help is specified, prints this help message and exits.")
        sys.exit(0)
        
    # Default filenames
    base_directory = os.path.dirname(__file__)
    enchants_file = base_directory + "/enchants.json"
    if inputsize >= 2:
        enchants_file = sys.argv[1]
    enchants = load_json(enchants_file)

    for enchant_id, model_id in enchants.items():
        # Split model_id into parts
        if ':' in model_id:
            part_a, rest = model_id.split(':', 1)
        else:
            part_a, rest = model_id, ''
        if '/' in rest:
            part_b, part_c = rest.rsplit('/', 1)
        else:
            part_b, part_c = '', rest

        # Create directories
        model_dir = os.path.join(base_directory, part_a, 'models', part_b)
        texture_dir = os.path.join(base_directory, part_a, 'textures', part_b)
        os.makedirs(model_dir, exist_ok=True)
        os.makedirs(texture_dir, exist_ok=True)

        # Create JSON content
        json_content = {
            "parent": "item/generated",
            "textures": {
                "layer0": model_id
            },
            "gui_light": "front",
            "display": {}
        }

        # Save JSON file
        json_file_path = os.path.join(model_dir, f"{part_c}.json")
        save_json(json.dumps(json_content, indent=4), json_file_path)
        print(f"✅ Created: {json_file_path}")
