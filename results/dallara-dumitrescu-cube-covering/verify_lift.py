"""Replay the planar packing by a column sweep and the cube bounds by exact arithmetic."""

from fractions import Fraction
from itertools import combinations
from math import ceil


def planar_tiles():
    # (Bottom coordinate, side length, columns) in the planar construction.
    rows = [
        (0, 1, range(14)),
        (1, 1, [0, 3, 4, 9, 10, 13]),
        (2, 1, [0, 3, 4, 9, 10, 13]),
        (3, 1, [0, 1, 2, 11, 12, 13]),
        (4, 1, [2, 11]),
        (5, 1, range(2, 12)),
        (1, 2, [1, 5, 7, 11]),
        (3, 2, [3, 5, 7, 9]),
    ]
    return [(x, y, size) for y, size, columns in rows for x in columns]


def maximum_area(tiles):
    # Each state retains the chosen tiles touching the current vertical line.
    states = {(): 0}
    for x in sorted({tile[0] for tile in tiles}):
        entering = [tile for tile in tiles if tile[0] == x]
        next_states = {}
        for active, area in states.items():
            remaining = tuple(tile for tile in active if tile[0] + tile[2] >= x)
            for count in range(len(entering) + 1):
                for chosen in combinations(entering, count):
                    together = remaining + chosen
                    intervals = sorted((y, y + side) for _, y, side in together)
                    if any(high >= low for (_, high), (low, _) in zip(intervals, intervals[1:])):
                        continue
                    total = area + sum(side**2 for _, _, side in chosen)
                    next_states[together] = max(total, next_states.get(together, 0))
        states = next_states
    return max(states.values())


def ratio_bound(k, height):
    side, union = 14, 76
    assert height % (2 * side) == 0
    max_big = (height // (2 * side)) ** k
    small = Fraction(union * (height + 2)**k - max_big * (side + 2)**k, 2**k)
    return (max_big * side**(k + 2) + small) / (4 * (side**2 + union) * height**k)


def main():
    tiles = planar_tiles()
    cells = {(i, j) for x, y, s in tiles for i in range(x, x+s) for j in range(y, y+s)}
    assert len(cells) == sum(s*s for _, _, s in tiles) == 76
    assert maximum_area(tiles) == 19
    assert maximum_area([tile for tile in tiles if tile[1] > 0]) == 18

    for height in (28, 56, 280):
        atoms = range(0, height + 1, 2)
        assert 2 * len(atoms) == height + 2
        for side, mass in [(1, 2), (2, 4), (14, 16)]:
            for left in range(0, height, side):
                assert 2 * sum(left <= a <= left + side for a in atoms) == mass

    assert Fraction(1, 8) - ratio_bound(1, 280) == Fraction(1, 76160)
    for k in range(1, 37):
        height = 28 * ceil((304 * k * Fraction(7, 4)**k + 1) / 28)
        limit = Fraction(1, 2**(k + 2)) - Fraction(2, 7)**k / 1088
        boundary = Fraction(76, 1088 * 2**k) * ((1 + Fraction(2, height))**k - 1)
        assert ratio_bound(k, height) == limit + boundary < Fraction(1, 2**(k + 2))
    print("Column sweep: 76 unit cells, optima 19 and 18.")
    print("Closed fiber masses checked. Dimension 3 gain: 1/76160 at height 280.")
    print("Exact finite and limiting formulas compared in dimensions 3 through 38.")


if __name__ == "__main__":
    main()
