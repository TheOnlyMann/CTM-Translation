import os
import argparse
from natsort import natsorted

MAX_DEPTH = 10  # Arbitrary recursion limit

def is_leaf_dir(path):
    """Return True if directory contains at least one file."""
    for entry in os.scandir(path):
        if entry.is_file():
            return True
    return False

def make_markdown_checklist(dir_path):
    """Generate markdown checklist for files in dir_path, sorted naturally (Windows style), with relative links."""
    items = []
    for entry in natsorted(os.listdir(dir_path)):
        full_path = os.path.join(dir_path, entry)
        if os.path.isfile(full_path):
            rel_path = os.path.relpath(full_path, dir_path).replace("\\", "/")
            items.append(f"- [ ] [{entry}]({rel_path}) :")
    return "\n".join(items)
def write_markdown(dir_path, base_dir=None):
    """Write the markdown checklist to tr_[folder_name].md in dir_path, showing relative path from base folder."""
    if base_dir is None:
        base_dir = os.path.abspath(os.getcwd())
    folder_name = os.path.basename(os.path.abspath(dir_path))
    md_name = f"tr_{folder_name}.md"
    md_path = os.path.join(dir_path, md_name)
    checklist = make_markdown_checklist(dir_path)
    rel_path_from_base = os.path.relpath(dir_path, base_dir).replace("\\", "/")
    if checklist:
        with open(md_path, "w", encoding="utf-8") as f:
            f.write(f"# Translation Checklist for `{folder_name}`\n\n")
            f.write(f"**Relative path from base folder:** `{rel_path_from_base}`\n\n")
            f.write(checklist + "\n")

def process_directory(dir_path, recursive=False, depth=0):
    if depth > MAX_DEPTH:
        return
    if is_leaf_dir(dir_path):
        write_markdown(dir_path)
    if recursive:
        for entry in os.scandir(dir_path):
            if entry.is_dir():
                process_directory(entry.path, recursive, depth + 1)

def main():
    parser = argparse.ArgumentParser(description="Generate markdown translation checklists.")
    parser.add_argument("directory", help="Target directory")
    parser.add_argument("-r", "--recursive", action="store_true", help="Recursively process subdirectories")
    args = parser.parse_args()

    if not os.path.isdir(args.directory):
        print("Provided path is not a directory.")
        return

    process_directory(args.directory, args.recursive)

if __name__ == "__main__":
    main()