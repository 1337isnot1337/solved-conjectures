"""Compare the exceptional degree-21 Lean table with its original colouring."""

import json
import runpy
from pathlib import Path


def main():
    if not __debug__:
        raise SystemExit("Run with Python assertions enabled.")
    results = Path(__file__).resolve().parents[1]
    tools = runpy.run_path(str(results / "circular-index-complete-minus-edges/check_lean_data.py"))
    record = json.loads((results / "circular-index-upper-half-circulants/data/part2_certificates.json").read_text())["delta21"]
    assert record["g"] == 5
    classes = tools["rotated_classes"](5, record["base"])
    count = tools["check_insertion"](5, classes, {0: record["block_before_colour_0"]})
    print(f"Matched all {count} coloured edges of the original degree-21 graph.")


if __name__ == "__main__":
    main()
