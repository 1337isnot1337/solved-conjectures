"""Exact diagnostic for the doubled Fano-incidence graph; no conjecture claim."""
from fractions import Fraction
import json


def determinant(matrix):
    a = [row[:] for row in matrix]
    prev, sign = 1, 1
    for k in range(len(a) - 1):
        if a[k][k] == 0:
            j = next(j for j in range(k + 1, len(a)) if a[j][k])
            a[k], a[j] = a[j], a[k]
            sign = -sign
        pivot = a[k][k]
        for i in range(k + 1, len(a)):
            for j in range(k + 1, len(a)):
                value = a[i][j] * pivot - a[i][k] * a[k][j]
                quotient, remainder = divmod(value, prev)
                assert remainder == 0
                a[i][j] = quotient
            a[i][k] = 0
        prev = pivot
    return sign * a[-1][-1]


def inverse(matrix):
    n = len(matrix)
    a = [[Fraction(x) for x in row] + [Fraction(i == j) for j in range(n)]
         for i, row in enumerate(matrix)]
    for k in range(n):
        j = next(j for j in range(k, n) if a[j][k])
        a[k], a[j] = a[j], a[k]
        pivot = a[k][k]
        a[k] = [x / pivot for x in a[k]]
        for i in range(n):
            if i != k:
                factor = a[i][k]
                a[i] = [x - factor * y for x, y in zip(a[i], a[k])]
    return [row[n:] for row in a]


def main():
    edges = [(x - 1, y + 6) for x in range(1, 8) for y in range(1, 8)
             if (x & y).bit_count() % 2 == 0]
    assert len(edges) == 21
    lap = [[0] * 14 for _ in range(14)]
    for u, v in edges:
        lap[u][u] += 1
        lap[v][v] += 1
        lap[u][v] -= 1
        lap[v][u] -= 1
    assert all(lap[i][i] == 3 for i in range(14))
    reduced = [row[:13] for row in lap[:13]]
    trees = determinant(reduced)
    assert trees == 50421
    inv = inverse(reduced)
    marginals = []
    for u, v in edges:
        d = [Fraction((i == u) - (i == v)) for i in range(13)]
        p = sum(d[i] * inv[i][j] * d[j] for i in range(13) for j in range(13))
        assert p == Fraction(13, 21)
        assert Fraction(3, 5) < p < Fraction(4, 5)
        marginals.append(p)
    # Fix the last vertex outside the chosen side; each nontrivial cut is
    # represented exactly once by a nonempty subset of the other vertices.
    cuts = [sum(((mask >> u) & 1) != ((mask >> v) & 1) for u, v in edges)
            for mask in range(1, 1 << 13)]
    assert min(cuts) == 3
    print(json.dumps({
        "vertices": 14, "base_edges": 21, "doubled_edges": 42,
        "base_tree_count": trees, "doubled_tree_count": trees * 2**13,
        "base_edge_connectivity": min(cuts),
        "parallel_pair_inclusion_probability": str(marginals[0]),
        "merino_welsh_counterexample_claimed": False,
    }, indent=2))


if __name__ == "__main__":
    main()
