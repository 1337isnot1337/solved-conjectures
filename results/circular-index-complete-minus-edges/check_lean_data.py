"""Compare the expanded Lean tables with the three original colouring records."""

import json
import re
from pathlib import Path

RESULTS = Path(__file__).resolve().parents[1]
LEAN = RESULTS.parent / "lean" / "Conjectures"
DELETED = RESULTS / "circular-index-complete-minus-edges"
TWO_BLOCK = RESULTS / "circular-index-upper-half-delta-2-mod-4"
THREE_BLOCK = RESULTS / "circular-index-upper-half-delta-3-mod-4"


def check_tables(source, vertex_count, colour_count, edges):
    colours = [[255] * vertex_count for _ in range(vertex_count)]
    inverse = [[255] * colour_count for _ in range(vertex_count)]
    degrees = [0] * vertex_count
    for left, right, colour in edges:
        a, b = sorted((left, right))
        assert 0 <= a < b < vertex_count and 0 <= colour < colour_count < 255
        assert colours[a][b] == inverse[a][colour] == inverse[b][colour] == 255
        colours[a][b] = colour
        inverse[a][colour], inverse[b][colour] = b, a
        degrees[a] += 1
        degrees[b] += 1
    for name, rows in [("rows", colours), ("inverse", inverse)]:
        match = re.search(rf"def {name} : Array ℕ := #\[([^\]]+)\]", source)
        assert match, name
        values = [int(token.strip(), 16) for token in match[1].split(",")]
        assert values == [int.from_bytes(bytes(row), "little") for row in rows], name
    return degrees


def rotated_classes(g, bases):
    n = 6 * g + 1
    for colour in range(2 * n):
        shift, kind = divmod((4 * g + 1) * colour % (2 * n), 2)
        yield [((u + shift) % n, (v + shift) % n) for u, v in bases[kind]]


def check_insertion(g, classes, blocks):
    n = 6 * g + 1
    expanded = []
    for position, group in enumerate(classes):
        expanded.extend(blocks.get(position, []))
        expanded.append(group)
    p = len(expanded)
    degree = 4 * g + len(blocks)
    source = (LEAN / f"CircularInsertionDegree{degree:02}.lean").read_text()
    assert f"abbrev G := tableGraph {n} {p} rows" in source
    edges = [(u, v, c) for c, group in enumerate(expanded) for u, v in group]
    degrees = check_tables(source, n, p, edges)
    assert max(degrees) == degree and len(edges) * 3 == p * (n // 2)
    match = re.search(r"def degrees : Array ℕ := #\[([^\]]+)\]", source)
    assert match and list(map(int, match[1].split(","))) == degrees
    return len(edges)


def main():
    if not __debug__:
        raise SystemExit("Run with Python assertions enabled.")
    deleted = json.loads((DELETED / "colourings.json").read_text())
    two_block = json.loads((TWO_BLOCK / "certificates.json").read_text())
    three_block = json.loads((THREE_BLOCK / "certificates.json").read_text())
    assert len(deleted) == 32 and all(r in deleted for r in two_block["Kn_minus_F"])
    deletions_edges = 0
    for number, row in enumerate(deleted, 1):
        n, p, q = row["n"], row["p"], row["q"]
        name = f"Witness{number:02}"
        module = (LEAN / f"CircularDeletedWitness{n:02}.lean").read_text()
        source = module.split(f"namespace {name}\n", 1)[1].split(f"end {name}\n", 1)[0]
        recorded = re.search(r"def deleted : Finset .*? := \{([^}]+)\}", source)
        assert recorded
        missing = {tuple(sorted(edge)) for edge in row["F"]}
        assert {tuple(sorted((int(a), int(b)))) for a, b in
                re.findall(r"s\((\d+),(\d+)\)", recorded[1])} == missing
        edges = [(a, b, c) for (a, b), c in zip(row["edges"], row["colour"], strict=True)]
        assert {(a, b) for a, b, _ in edges} == {
            (a, b) for a in range(n) for b in range(a + 1, n)
        } - missing
        assert f"RowValid deleted {p} {q} rows inverse" in source
        check_tables(source, n, p, edges)
        deletions_edges += len(edges)

    classes = list(rotated_classes(6, two_block["base_g6"]))
    blocks = {}
    for position, starts in [(0, [0, *range(3, 36, 2)]), (6, [1, *range(4, 37, 2)])]:
        block = []
        for group in classes[position:position + 3]:
            support = {v for pair in group for v in pair}
            block.append([(v, (v + 1) % 37) for v in starts if v in support])
        blocks[position] = block
    insertion_edges = check_insertion(6, classes, {0: blocks[0]})
    insertion_edges += check_insertion(6, classes, blocks)
    assert [r["g"] for r in three_block] == list(range(6, 15))
    for r in three_block:
        classes = rotated_classes(r["g"], [r["M0"], r["M1"]])
        blocks = dict(zip(r["block_colours"], r["blocks"], strict=True))
        insertion_edges += check_insertion(r["g"], classes, blocks)
    print(f"Matched 32 deleted-edge tables ({deletions_edges:,} edges) and "
          f"11 insertion tables ({insertion_edges:,} edges) to the original JSON.")


if __name__ == "__main__":
    main()
