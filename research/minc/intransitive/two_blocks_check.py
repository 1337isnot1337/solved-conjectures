"""Exact checks on Gaussian-integer Gram matrices and a sharp first coefficient."""

from random import Random

from sympy import I, Matrix, eye, expand
from sympy.polys.domains import ZZ_I


def exchange_coefficients(matrix, k):
    """Subset recursion, recording the number of first-packet rows sent across."""
    n = matrix.rows
    entries = [[ZZ_I.from_sympy(matrix[i, j]) for j in range(n)] for i in range(n)]
    table = [[ZZ_I.zero] * (k + 1) for _ in range(1 << n)]
    table[0][0] = ZZ_I.one
    for mask in range(1, 1 << n):
        i = mask.bit_count() - 1
        for j in range(n):
            if mask & (1 << j):
                previous = table[mask ^ (1 << j)]
                change = int(i < k <= j)
                for degree in range(change, k + 1):
                    table[mask][degree] += entries[i][j] * previous[degree - change]
    return [ZZ_I.to_sympy(value) for value in table[-1]]


def permanent(matrix):
    return exchange_coefficients(matrix, 0)[0]


def permanental_adjoint(matrix):
    n = matrix.rows
    return Matrix(n, n, lambda i, j: permanent(matrix.minor_submatrix(j, i)))


def check(matrix, k):
    b, c, d = matrix[:k, :k], matrix[:k, k:], matrix[k:, k:]
    left, right = permanental_adjoint(b), permanental_adjoint(d)
    coeff = exchange_coefficients(matrix, k)
    det_c_squared = expand(c.det() * c.det().conjugate())
    assert all(value >= 0 for value in coeff)
    assert left.det() >= b.det() ** (k - 1) and right.det() >= d.det() ** (k - 1)
    assert coeff[0] == permanent(b) * permanent(d)
    assert coeff[k] == abs(permanent(c)) ** 2
    assert coeff[1] == expand((left * c * right * c.H).trace())
    assert coeff[1] >= k * det_c_squared
    return coeff[1], det_c_squared


if __name__ == "__main__":
    rng = Random(20261120)
    count = 0
    for k in (2, 3, 4, 5):
        identity = eye(k)
        repeated = identity.row_join(identity)
        value, determinant = check(repeated.H * repeated, k)
        assert value == k * determinant
        count += 1
        for rank in (k - 1, k, k + 2):
            vectors = Matrix(rank, 2 * k,
                             lambda i, j: rng.randrange(-1, 2) + I * rng.randrange(-1, 2))
            check((vectors.H * vectors).applyfunc(expand), k)
            count += 1
    print(f"Checked {count} exact Gaussian-integer Gram matrices, including sharp examples.")
