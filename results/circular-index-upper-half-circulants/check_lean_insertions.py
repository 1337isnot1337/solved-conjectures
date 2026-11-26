"""Compare every Section 7.3 nonregular Lean graph with its stored base."""

import json
import runpy
from pathlib import Path


def main():
    if not __debug__:
        raise SystemExit("Run with Python assertions enabled.")
    folder = Path(__file__).resolve().parent
    tables = runpy.run_path(str(folder.parent / "circular-index-complete-minus-edges/check_lean_data.py"))
    source = json.loads((folder / "data/part2_certificates.json").read_text())
    small = source["delta21"]
    assert small["g"] == 5
    total = tables["check_insertion"](5, tables["rotated_classes"](5, small["base"]),
                                      {0: small["block_before_colour_0"]})
    bases = source["familyB_bases"]
    assert set(bases) == {str(g) for g in range(6, 14)}
    for g in range(6, 14):
        n = 6 * g + 1
        classes = list(tables["rotated_classes"](g, bases[str(g)]))
        blocks = {}
        for position, starts in [(0, [0, *range(3, n - 1, 2)]),
                                 (6, [1, *range(4, n, 2)])]:
            block = []
            for group in classes[position:position + 3]:
                support = {v for edge in group for v in edge}
                block.append([(v, (v + 1) % n) for v in starts if v in support])
            blocks[position] = block
        total += tables["check_insertion"](g, classes, {0: blocks[0]})
        total += tables["check_insertion"](g, classes, blocks)
    print(f"Matched all 17 stored nonregular graphs, with {total:,} coloured edges.")


if __name__ == "__main__":
    main()
