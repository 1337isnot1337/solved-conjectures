#!/usr/bin/env python3
"""Exact finite transcription checks; the proof is the integral reduction.

Requires SymPy. No floating-point arithmetic is used.
"""

from itertools import combinations
from sympy import ZZ, zeros
from sympy.matrices.normalforms import smith_normal_form


def laplacian(r, n):
    """Build the simple graph directly from its r cliques."""
    vertices = r * (n - 1)
    edges = set()
    for i in range(r):
        clique = [i, (i + 1) % r]
        clique += list(range(r + i * (n - 2), r + (i + 1) * (n - 2)))
        edges.update(tuple(sorted(pair)) for pair in combinations(clique, 2))
    matrix = zeros(vertices)
    for a, b in edges:
        matrix[a, a] += 1
        matrix[b, b] += 1
        matrix[a, b] -= 1
        matrix[b, a] -= 1
    return matrix


def final_presentation(r, n):
    """Relations (8)--(9), before eliminating a c or d generator."""
    count = r * (n - 2)
    matrix = zeros(count)
    matrix[0, 0] = 2 * r
    for i in range(1, r):
        matrix[0, i] = 2
    for i in range(r, count):
        matrix[0, i] = -1
    for i in range(1, count):
        matrix[i, i] = n
    return matrix


def diagonal(matrix):
    smith = smith_normal_form(matrix, domain=ZZ)
    assert all(smith[i, j] == 0 for i in range(smith.rows)
               for j in range(smith.cols) if i != j)
    return [abs(int(smith[i, i])) for i in range(smith.rows)]


def main():
    checked = 0
    for r in range(3, 7):
        for n in range(3, 9):
            torsion = [n] * (r * (n - 2) - 2) + [2 * r * n]
            full_expected = [1] * r + torsion + [0]
            reduced_expected = [1] + torsion
            assert diagonal(laplacian(r, n)) == full_expected, (r, n, "graph")
            assert diagonal(final_presentation(r, n)) == reduced_expected, (
                r, n, "presentation")
            checked += 1
    print(f"PASS: {checked} exact graph Laplacians and {checked} exact reduced presentations.")
    print("Range: 3 <= r <= 6, 3 <= n <= 8.")
    print("All invariant factors match the full conjectured formula.")
    print("These finite checks supplement, and do not replace, PROOF.md.")


if __name__ == "__main__":
    main()
