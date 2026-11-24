#!/usr/bin/env python3
"""Independently enumerate the first three shells of the dimension-ten witness."""

from itertools import product
from math import isqrt


def shell_moments(dimension, radius2, parity):
    def visit(i, remaining):
        if i == dimension:
            if remaining == 0:
                yield ()
            return
        limit = isqrt(remaining)
        for v in range(-limit, limit + 1):
            if v % 2 == parity[i]:
                for suffix in visit(i + 1, remaining - v * v):
                    yield (v,) + suffix
    return list(visit(0, radius2))


def main():
    n = 10
    observed = []
    for s in range(1, 10):
        shell = shell_moments(n, s, (0,) * n)
        shell += shell_moments(n, s, (0,) + (1,) * (n - 1))
        if not shell:
            continue
        assert len(set(shell)) == len(shell)
        assert all(sum(v[i] for v in shell) == 0 for i in range(n))
        matrix = [[sum(v[i] * v[j] for v in shell)
                   for j in range(n)] for i in range(n)]
        assert all(matrix[i][j] == 0 for i, j in product(range(n), repeat=2) if i != j)
        diagonal = [matrix[i][i] for i in range(n)]
        observed.append((s, len(shell), diagonal))
    assert observed == [
        (4, 20, [8] * 10), (8, 180, [144] * 10),
        (9, 512, [0] + [512] * 9),
    ]
    for s, count, diagonal in observed:
        print(f"squared norm {s}: {count} vectors, unnormalized diagonal {diagonal}")


if __name__ == "__main__":
    main()
