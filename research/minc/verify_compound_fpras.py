"""Exact identity checks for the proposed general compound-root FPRAS.

This script does not implement the Jerrum--Sinclair--Vigoda sampler and does
not constitute a proof of the approximation theorem. It checks the finite
algebraic reductions independently with integer and rational arithmetic.
"""

from fractions import Fraction
from itertools import permutations
from math import comb
from random import Random

from compound_paths import compound, permanent


def matrix_product(left, right):
    return [[sum(x * y for x, y in zip(row, column))
             for column in zip(*right)] for row in left]


def matrix_power(matrix, exponent):
    size = len(matrix)
    result = [[int(i == j) for j in range(size)] for i in range(size)]
    while exponent:
        if exponent & 1:
            result = matrix_product(result, matrix)
        exponent >>= 1
        if exponent:
            matrix = matrix_product(matrix, matrix)
    return result


def cyclic_matrix(matrix, steps, fugacity):
    n = len(matrix)
    result = [[int(i == j) for j in range(n * steps)]
              for i in range(n * steps)]
    for layer in range(steps):
        for i in range(n):
            for j in range(n):
                result[layer * n + i][((layer + 1) % steps) * n + j] += (
                    fugacity * matrix[i][j])
    return result


def has_directed_cycle(matrix):
    size = len(matrix)
    color = [0] * size

    def visit(i):
        color[i] = 1
        for j in range(size):
            if not matrix[i][j]:
                continue
            if color[j] == 1 or (color[j] == 0 and visit(j)):
                return True
        color[i] = 2
        return False

    return any(color[i] == 0 and visit(i) for i in range(size))


def maximum_cycle_cover_size(matrix):
    """Exhaustive checker for small orders, not the polynomial-time routine."""
    n = len(matrix)
    best = 0
    for permutation in permutations(range(n)):
        if all(i == j or matrix[i][j] > 0
               for i, j in enumerate(permutation)):
            best = max(best, sum(matrix[i][j] > 0
                                 for i, j in enumerate(permutation)))
    return best


def verify():
    random = Random(20261120)
    matrices = [
        [[0, 1], [1, 0]],
        [[0, 2], [0, 0]],
        [[0, 1, 0], [0, 0, 1], [1, 0, 0]],
        [[0, 1, 1], [1, 0, 0], [1, 0, 0]],
        [[1, 0, 1, 0], [1, 0, 0, 0],
         [0, 1, 1, 1], [1, 0, 1, 0]],
    ]
    for n in (2, 3, 4):
        for _ in range(3):
            matrices.append([[random.randrange(3) for _ in range(n)]
                             for _ in range(n)])
    traces_checked = 0
    newton_checked = 0
    for matrix in matrices:
        n = len(matrix)
        compounds = [compound(matrix, k) for k in range(n + 1)]
        for steps in (1, 2, 3):
            powers = [matrix_power(b, steps) for b in compounds]
            trace = [sum(b[i][i] for i in range(len(b))) for b in powers]
            sums = [sum(map(sum, b)) for b in powers]
            for k in range(1, n):
                assert (sums[k] ** 2 * comb(n, k - 1) * comb(n, k + 1)
                        >= sums[k - 1] * sums[k + 1] * comb(n, k) ** 2)
                newton_checked += 1
            for fugacity in (Fraction(1, 2), Fraction(1), Fraction(2)):
                left = permanent(cyclic_matrix(matrix, steps, fugacity))
                right = sum(trace[k] * fugacity ** (k * steps)
                            for k in range(n + 1))
                assert left == right, (matrix, steps, fugacity, left, right)
                traces_checked += 1
    support_checked = 0
    n = 3
    for encoding in range(1 << (n * n)):
        matrix = [[(encoding >> (i * n + j)) & 1 for j in range(n)]
                  for i in range(n)]
        maximum = maximum_cycle_cover_size(matrix)
        for k in range(n + 1):
            assert has_directed_cycle(compound(matrix, k)) == (k <= maximum)
            support_checked += 1
    print(f"verified {traces_checked} exact cyclic trace identities")
    print(f"verified {newton_checked} exact Newton inequalities for path sums")
    print(f"verified {support_checked} exact support/zero-root comparisons")
    print("The FPRAS conclusion relies on the written proof and cited theorems.")


if __name__ == "__main__":
    verify()
