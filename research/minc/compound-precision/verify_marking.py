"""Validate marked crossing unions, then all characteristic coefficients through five bits."""

from itertools import combinations, permutations
from math import prod
from random import Random

from sympy import Matrix, Poly, Symbol, eye, ones, zeros

from verify_gap_sums import compound, derivative


def marked_operators(matrix, k, precision):
    n = matrix.rows
    exterior = compound(matrix, k)
    operators = [exterior] + [zeros(exterior.rows) for _ in range(precision - 1)]
    for size in range(2, min(k, 2 * (precision - 1)) + 1):
        for rows in combinations(range(n), size):
            for cols in permutations(range(n), size):
                crossed = [(i, j) for i, j in combinations(range(size), 2)
                           if cols[i] > cols[j]]
                edges = tuple(zip(rows, cols))
                weight = prod(matrix[r, c] for r, c in edges)
                if not crossed or not weight:
                    continue
                forced = weight * derivative(matrix, k, edges)
                for h in range(1, min(precision-1, len(crossed))+1):
                    count = sum(len(set(x for pair in selected for x in pair)) == size
                                for selected in combinations(crossed, h))
                    operators[h] += count * forced
    return operators


def direct(matrix, k):
    subsets = list(combinations(range(matrix.rows), k))
    return Matrix([[sum(prod(matrix[r, c] for r, c in zip(rows, p))
                      for p in permutations(cols)) for cols in subsets] for rows in subsets])


def main():
    rng = Random(527)
    w = Symbol("w")
    highest = 5
    cases = 0
    for n in range(2, 5):
        matrices = [eye(n), ones(n),
                    Matrix(n, n, [rng.randrange(-2, 4) for _ in range(n*n)])]
        for matrix in matrices:
            for k in range(1, n+1):
                ops = marked_operators(matrix, k, highest)
                series = sum((w**j * mat for j, mat in enumerate(ops)), zeros(ops[0].rows))
                coefs = [Poly(c, w) for c in series.charpoly().all_coeffs()]
                reference = direct(matrix, k).charpoly().all_coeffs()
                for bits in range(1, highest+1):
                    modular = [sum(int(p.nth(j)) * (-2)**j for j in range(bits)) % 2**bits
                               for p in coefs]
                    assert modular == [int(v) % 2**bits for v in reference]
                    cases += 1
    print(f"{cases} full coefficient comparisons over five binary precisions")


if __name__ == "__main__":
    main()
