#!/usr/bin/env python3
"""Finite checks for the two normal-cover constructions (no dependencies)."""
from fractions import Fraction
from functools import cache
from itertools import product
from math import factorial


def verify_tree(c, b):
    words = lambda k: product(range(b), repeat=k)
    vertices = {w for i in range(1, c + 1) for w in words(i)}
    cliques = [tuple(w[:i] for i in range(1, c + 1)) for w in words(c)]
    stable = []
    for w in words(c - 1):
        antichain = []
        for i in range(c - 1):
            antichain.extend(w[:i] + (t,) for t in range(b) if t != w[i])
        antichain.extend(w + (t,) for t in range(b))
        for u, v in product(antichain, repeat=2):
            if u != v:
                assert u[: len(v)] != v and v[: len(u)] != u
        assert len(antichain) == c * (b - 1) + 1
        stable.append(frozenset(antichain))
    assert set().union(*map(set, cliques)) == vertices
    assert set().union(*stable) == vertices
    assert len(vertices) == sum(b**i for i in range(1, c + 1))
    for clique, independent in product(map(frozenset, cliques), stable):
        assert len(clique & independent) == 1
    return len(cliques) * len(stable)


def rectangle_partitions(rows, cols):
    """Enumerate all partitions of a rows-by-cols matrix into rectangles."""
    by_cell = [[] for _ in range(rows * cols)]
    for r in range(1, 1 << rows):
        for c in range(1, 1 << cols):
            cells = tuple(i * cols + j
                          for i, j in product(range(rows), range(cols))
                          if r >> i & 1 and c >> j & 1)
            mask = sum(1 << k for k in cells)
            for k in cells:
                by_cell[k].append(mask)

    def walk(left, blocks):
        if not left:
            yield blocks
            return
        low = (left & -left).bit_length() - 1
        for mask in by_cell[low]:
            if mask & left == mask:
                yield from walk(left ^ mask, (*blocks, mask))

    return walk((1 << (rows * cols)) - 1, ())


def verify_all_partitions(rows, cols):
    row_cells = [sum(1 << (i * cols + j) for j in range(cols))
                 for i in range(rows)]
    col_cells = [sum(1 << (i * cols + j) for i in range(rows))
                 for j in range(cols)]

    @cache
    def labels(mask):
        return (frozenset(i for i, cells in enumerate(row_cells) if cells & mask),
                frozenset(j for j, cells in enumerate(col_cells) if cells & mask))

    count = 0
    for tiling in rectangle_partitions(rows, cols):
        count += 1
        tiles = [labels(mask) for mask in tiling]
        c = max(sum(i in a for a, _ in tiles) for i in range(rows))
        s = max(sum(j in b for _, b in tiles) for j in range(cols))
        assert len(tiles) <= sum(s**h for h in range(1, c + 1))
        assert len(tiles) <= sum(c**h for h in range(1, s + 1))
        # Choose the first row and column of each tile as its pivot pair.
        # In that pair the tile is the sole common label. Compute the
        # resulting permutation-probability sum using exact rationals.
        row_sizes = [sum(i in a for a, _ in tiles) for i in range(rows)]
        col_sizes = [sum(j in b for _, b in tiles) for j in range(cols)]
        total = Fraction(0)
        for a, b in tiles:
            x, y = row_sizes[min(a)], col_sizes[min(b)]
            total += Fraction(factorial(x - 1) * factorial(y - 1),
                              factorial(x + y - 1))
        assert total <= 1
        assert len(tiles) * factorial(c - 1) * factorial(s - 1) <= factorial(c + s - 1)
        for column in range(cols):
            anchors = [k for k, (_, b) in enumerate(tiles) if column in b]
            found = set()
            for k in anchors:
                x, y = tiles[k]
                active = [(i, a, b) for i, (a, b) in enumerate(tiles)
                          if i != k and a & x]
                for _, _, b in active:
                    assert not (b & y)
                for r in x:
                    assert sum(r in a for _, a, _ in active) <= c - 1
                assert len(active) <= sum(s**h for h in range(1, c))
                found.update(i for i, _, _ in active)
            assert found == set(range(len(tiles))) - set(anchors)
    return count


if __name__ == "__main__":
    tree_pairs = sum(verify_tree(c, b) for c in range(1, 6) for b in range(2, 6))
    rectangles = sum(verify_all_partitions(r, c)
                     for r in range(1, 5) for c in range(1, 4))
    print(f"Checked {tree_pairs:,} clique–stable-set intersections in 20 trees.")
    print(f"Checked all {rectangles:,} rectangle partitions for sides 1–4 by 1–3.")
