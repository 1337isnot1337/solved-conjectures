"""Finite checks of overlap, trimming and the color-witness implication."""
from itertools import combinations, product


def overlap_checks():
    widths = [columns for width in range(2, 6) for columns in combinations(range(6), width)]
    rows1 = (0, 1)
    cases = 0
    trims = 0
    for rows2 in ((0, 2), (2, 3)):
        for a, b in product(widths, repeat=2):
            first = frozenset(product(rows1, a))
            second = frozenset(product(rows2, b))
            bound = min(len(a), len(b))
            assert len(first & second) <= bound
            cases += 1
            for x in first:
                reduced = first - {x}
                assert {r for r, _ in reduced} == set(rows1)
                assert len({c for _, c in reduced}) == len(a)
                assert len(reduced & second) <= bound
                assert reduced != second
                trims += 1
    return cases, trims


def palette_checks():
    rows = range(3)
    columns = range(3)
    palettes = list(combinations(columns, 2))
    row_pairs = list(combinations(rows, 2))
    matches = 0
    arrays = 0
    for coloring in product((0, 1), repeat=9):
        def color(row, column):
            return coloring[3 * row + column]
        # Each row gets a deterministic monochromatic pair and its color.
        choices = [next((color(row, a), (a, b)) for a, b in palettes if color(row, a) == color(row, b))
                   for row in rows]
        for labels in product(palettes, repeat=3):
            arrays += 1
            for (r, s), label in zip(row_pairs, labels):
                j, a = choices[r]
                if choices[s] == (j, a) and label == a:
                    assert all(color(row, column) == j for row in (r, s) for column in label)
                    matches += 1
    return arrays, matches


if __name__ == '__main__':
    print('mixed rectangle pairs, single-vertex deletions:', overlap_checks())
    print('color-array and label assignments, realized target witnesses:', palette_checks())
