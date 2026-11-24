"""Replay cut-point counts and line-incidence rank over the rationals."""

from fractions import Fraction
from itertools import combinations


BASE = (
    (0, 2, 4, 2, 2, 2),
    (2, 0, 2, 4, 4, 2),
    (4, 2, 0, 2, 4, 4),
    (2, 4, 2, 0, 2, 4),
    (2, 4, 4, 2, 0, 3),
    (2, 2, 4, 4, 3, 0),
)


def line(d, u, v, chosen):
    return frozenset(w for w in chosen if d[u][w] + d[v][w] == d[u][v]
                     or abs(d[u][w] - d[v][w]) == d[u][v])


def lines(d, chosen):
    return {line(d, u, v, chosen) for u, v in combinations(chosen, 2)}


def rational_rank(sets, size):
    pivots = {}
    for line_set in sets:
        row = [Fraction(i in line_set) for i in range(size)]
        for i, value in enumerate(row):
            if not value:
                continue
            if i not in pivots:
                pivots[i] = [x / value for x in row]
                break
            for j, pivot in enumerate(pivots[i]):
                row[j] -= value * pivot
    return len(pivots)


def check(copies):
    template = (0, 1, 2, 3, 5)
    positions = [(None, 4)] + [(i, u) for i in range(copies) for u in template]
    d = [
        [BASE[u][v] if i is None or j is None or i == j else BASE[u][4] + BASE[4][v]
         for j, v in positions]
        for i, u in positions
    ]
    vertices = set(range(len(d)))
    assert all(d[u][v] <= d[u][w] + d[w][v] for u, v in combinations(vertices, 2) for w in vertices)
    branches = [{0} | {1 + 5 * i + j for j in range(5)} for i in range(copies)]
    all_lines = lines(d, vertices)
    assert vertices not in all_lines

    local_count = 0
    radial_counts = []
    compressed_count = 0
    for branch in branches:
        local_count += len({line(d, u, v, vertices) for u, v in combinations(branch, 2)})
        radial = {
            frozenset(w for w in branch if d[u][w] == abs(d[u][0] - d[w][0]))
            for u in branch - {0}
        }
        radial_counts.append(len(radial))
        if copies > 1:
            compressed = (branch - {0}) | {min(vertices - branch)}
            compressed_lines = lines(d, compressed)
            assert compressed not in compressed_lines
            compressed_count += len(compressed_lines)
        support = sorted(branch - {0})[:4]
        assert all(sum((-1) ** j for j, u in enumerate(support) if u in ell) == 0
                   for ell in all_lines)

    assert len(all_lines) == local_count + sum(x * y for x, y in combinations(radial_counts, 2))
    assert len(all_lines) == 8 * copies + 9 * (copies * (copies - 1) // 2) >= compressed_count
    assert rational_rank(all_lines, len(d)) == 4 * copies + 1


def main():
    for copies in range(1, 7):
        check(copies)
    print("Exact line counts, compressed spaces, and rational ranks passed for six amalgams.")


if __name__ == "__main__":
    main()
