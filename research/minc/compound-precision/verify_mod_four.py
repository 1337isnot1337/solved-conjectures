"""Exact integer checks for the simultaneous modulo-four coefficient formula.

The polynomial operations here use schoolbook multiplication for readability.
Run with Python and SymPy.
"""

from itertools import combinations, permutations
from math import comb, prod
from random import Random

from sympy import Matrix, eye, ones, zeros


def reverse_det(matrix):
    return [int(a) for a in matrix.charpoly().all_coeffs()]


def multiply(left, right, size, modulus):
    result = [0] * size
    for i, a in enumerate(left):
        for j, b in enumerate(right[: size - i]):
            result[i + j] += a * b
    return [value % modulus for value in result]


def from_traces(traces, accuracy):
    size = len(traces) + 1
    loss = (size - 1).bit_length()
    bits = accuracy + loss**2
    prefix = [1]
    while len(prefix) < size:
        m = len(prefix)
        end = min(size, 2 * m)
        modulus = 2**bits
        inverse = [1]
        for d in range(1, end):
            inverse.append(-sum(prefix[i] * inverse[d - i]
                                for i in range(1, min(d + 1, m))) % modulus)
        derivative = [i * prefix[i] for i in range(1, m)]
        log_derivative = multiply(derivative, inverse, end - 1, modulus)
        correction = [1] + [0] * (end - 1)
        for j in range(m, end):
            numerator = (-traces[j - 1] - log_derivative[j - 1]) % modulus
            power = j & -j
            assert numerator % power == 0
            correction[j] = numerator // power * pow(j // power, -1, modulus // power)
        bits -= loss
        prefix = multiply(prefix, correction, end, 2**bits)
    return [x % 2**accuracy for x in prefix]


def reduced(matrix, modulus):
    return matrix.applyfunc(lambda entry: int(entry) % modulus)


def correction_trace(matrix, start, following, k):
    if k < 2:
        return 0
    det = reverse_det(following)
    # In characteristic two the inverse of I + t*following has positive powers.
    powers = [reduced(start, 2)]
    for _ in range(k - 2):
        powers.append(reduced(powers[-1] * following, 2))
    total = 0
    ordered = list(combinations(range(matrix.rows), 2))
    for i, h in ordered:
        for q, j in ordered:
            if not (matrix[i, j] * matrix[h, q]) % 2:
                continue
            for d, left in enumerate(powers):
                for e, right in enumerate(powers[: k - 1 - d]):
                    total += det[k - 2 - d - e] * (
                        left[j, i] * right[q, h] - left[j, h] * right[q, i])
    return int(total % 2)


def compound_charpoly_mod_four(matrix, k):
    n = matrix.rows
    count = comb(n, k)
    mod = 2 ** (2 + count.bit_length()**2)
    current = eye(n)
    traces = []
    correction = [1]
    for _ in range(count):
        following = reduced(current * matrix, mod)
        traces.append((-1)**k * reverse_det(following)[k] % mod)
        correction.append(2 * correction_trace(matrix, current, following, k))
        current = following
    return multiply(from_traces(traces, 2), correction, count + 1, 4)


def direct(matrix, k):
    subsets = list(combinations(range(matrix.rows), k))
    compound = Matrix([[sum(prod(matrix[i, j] for i, j in zip(rows, perm))
                            for perm in permutations(cols)) for cols in subsets]
                       for rows in subsets])
    return [v % 4 for v in reverse_det(compound)]


def main():
    rng = Random(219113)
    cases = 0
    for n in range(1, 6):
        matrices = [zeros(n), eye(n), ones(n), Matrix(n, n, lambda i, j: (j == i + 1) * 1)]
        for _ in range(5):
            matrices.append(Matrix(n, n, [rng.randrange(-4, 5) for _ in range(n*n)]))
        for a in matrices:
            for k in range(n + 1):
                got = compound_charpoly_mod_four(a, k)
                assert got == direct(a, k), (a, k, got)
                cases += 1
    # The determinant compound and the permanent compound genuinely differ here.
    assert compound_charpoly_mod_four(ones(2), 2) == [1, 2]
    assert reverse_det(ones(2))[2] == 0
    print(f"{cases} exact characteristic polynomials, including signed and singular matrices")


if __name__ == "__main__":
    main()
