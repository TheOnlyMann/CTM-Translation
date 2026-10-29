
import sys
import subprocess
import importlib.util
import tempfile
from pathlib import Path


# Relative paths provided by user
purify_dir = "translation_tools/python/purifyjson.py"
uniquefykey_dir = "translation_tools/python/uniquefykey.py"


def absolute_path(relative_path):
    """
    Convert a relative path to an absolute path
    based on the current working directory.
    Equivalent to os.path.abspath().
    """
    return Path(relative_path).resolve()


purify_path = absolute_path(purify_dir)
uniquefykey_path = absolute_path(uniquefykey_dir)


def load_module(module_name, module_path):
    module_path = Path(module_path).resolve()

    if not module_path.is_file():
        raise FileNotFoundError(
            f"Module not found: {module_path}\n"
            f"Current working directory: {Path.cwd()}"
        )

    spec = importlib.util.spec_from_file_location(
        module_name,
        str(module_path)
    )

    if spec is None or spec.loader is None:
        raise ImportError(
            f"Cannot load module: {module_path}"
        )

    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

    return module


def process_json(input_file):
    input_path = Path(input_file).resolve()

    if not input_path.is_file():
        raise FileNotFoundError(
            f"Input file not found: {input_path}"
        )

    output_path = input_path.with_name(
        f"{input_path.stem}_uniq.json"
    )

    purify = load_module(
        "purifyjson",
        purify_path
    )

    with tempfile.TemporaryDirectory() as temp_dir:
        purified_path = Path(temp_dir) / "purified.json"

        print("[1/2] Purifying JSON...")

        purify.process_file(
            input_path,
            purified_path
        )

        print("[2/2] Uniquefying JSON keys...")

        if not uniquefykey_path.is_file():
            raise FileNotFoundError(
                f"Script not found: {uniquefykey_path}"
            )

        subprocess.run(
            [
                sys.executable,
                str(uniquefykey_path),
                str(purified_path),
                str(output_path)
            ],
            check=True
        )

    print()
    print("Processing completed.")
    print(f"Input:  {input_path}")
    print(f"Output: {output_path}")


def main():
    if len(sys.argv) != 2:
        print(
            "Usage: python json_preset.py <input_json_file>"
        )
        sys.exit(1)

    try:
        process_json(sys.argv[1])

    except (
        OSError,
        ImportError,
        ValueError,
        subprocess.CalledProcessError
    ) as error:
        print(f"Error: {error}")
        sys.exit(1)


if __name__ == "__main__":
    main()
