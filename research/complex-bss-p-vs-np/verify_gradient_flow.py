"""Exact modular inconsistency certificate for GRADIENT_FLOW_ATTEMPT.md."""

from itertools import permutations, product
from math import isqrt, prod


MATRIX = [
    [4, 6, 4, 6, 2, 6, 4],
    [6, 1, 3, 3, 5, 6, 4],
    [4, 3, 1, 4, 5, 4, 1],
    [3, 6, 4, 5, 5, 4, 6],
    [2, 2, 3, 3, 4, 5, 2],
    [6, 3, 5, 5, 5, 2, 4],
    [2, 4, 5, 4, 4, 1, 1],
]
PRIME = 1_000_003


def det_mod(matrix, prime):
    a = [[value % prime for value in row] for row in matrix]
    n = len(a)
    assert all(len(row) == n for row in a)
    determinant = 1
    for col in range(n):
        pivot_row = next((row for row in range(col, n) if a[row][col]), None)
        if pivot_row is None:
            return 0
        if pivot_row != col:
            a[col], a[pivot_row] = a[pivot_row], a[col]
            determinant = -determinant
        pivot = a[col][col]
        determinant = determinant * pivot % prime
        inverse = pow(pivot, prime - 2, prime)
        for row in range(col + 1, n):
            factor = a[row][col] * inverse % prime
            for k in range(col + 1, n):
                a[row][k] = (a[row][k] - factor * a[col][k]) % prime
            a[row][col] = 0
    return determinant % prime


def main():
    m = len(MATRIX)
    assert all(len(row) == m for row in MATRIX)
    assert PRIME > 1 and all(PRIME % d for d in range(2, isqrt(PRIME) + 1))

    permanent = 0
    determinant = 0
    for sigma in permutations(range(m)):
        term = prod(MATRIX[i][sigma[i]] for i in range(m))
        inversions = sum(sigma[i] > sigma[j] for i in range(m) for j in range(i + 1, m))
        permanent += term
        determinant += (-1) ** inversions * term
    assert permanent == 53_592_404
    assert determinant == -9_352

    points = list(product((0, 1), repeat=m))
    values = []
    deleted = []
    for b in points:
        linear = [sum(MATRIX[i][j] * b[j] for j in range(m)) for i in range(m)]
        values.append(prod(linear))
        deleted.append([prod(linear[:r] + linear[r + 1 :]) for r in range(m)])

    augmented = []
    for index in range(2**m):
        row = []
        for i in range(m):
            mask = 1 << (m - 1 - i)
            index_zero, index_one = index & ~mask, index | mask
            for r in range(m):
                row.extend((deleted[index_zero][r], deleted[index_one][r]))
        row.extend(int(index == 0 or index == (1 << (m - 1 - i))) for i in range(m))
        row.append(values[index] - (-1) ** m * permanent * int(index == 0))
        augmented.append(row)

    number_unknowns = 2 * m * m + m
    assert number_unknowns == 105
    square_minor = augmented[: number_unknowns + 1]
    residue = det_mod(square_minor, PRIME)
    assert residue == 64_147
    print(
        "PASS: det(X)=-9352; per(X)=53592404; "
        "106x106 augmented determinant is 64147 mod 1000003. "
        "The 105-unknown gradient-flow system is inconsistent over C."
    )


if __name__ == "__main__":
    main()
