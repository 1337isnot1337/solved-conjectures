"""Exact block-Schur compound action; no full compound is built by the method.

The comparison implementation enumerates permutations independently.
Only rational arithmetic and the Python standard library are used.
"""

from collections import defaultdict
from fractions import Fraction as F
from itertools import combinations, permutations
from math import comb
import random


def clean(poly):
    return {e: c for e, c in poly.items() if c}


def shift(poly, source, target, scalar, capped):
    """Substitute x_source <- x_source + scalar*x_target, then cap.

Only variables in capped are projected to degree <= 1. The source and
target differ. For the block algorithm this projection is always safe.
"""
    if not scalar:
        return poly.copy()
    out = defaultdict(F)
    for e, c in poly.items():
        upper = e[source]
        if target in capped:
            upper = min(upper, 1 - e[target])
        for d in range(upper + 1):
            z = list(e)
            z[source] -= d
            z[target] += d
            out[tuple(z)] += c * comb(e[source], d) * scalar**d
    return clean(out)


def inverse_and_row_operations(matrix):
    n = len(matrix)
    a = [[F(x) for x in row] for row in matrix]
    inv = [[F(i == j) for j in range(n)] for i in range(n)]
    ops = []
    for j in range(n):
        pivot = next((i for i in range(j, n) if a[i][j]), None)
        if pivot is None:
            raise ValueError("singular pivot block")
        if pivot != j:
            a[pivot], a[j] = a[j], a[pivot]
            inv[pivot], inv[j] = inv[j], inv[pivot]
            ops.append(("swap", pivot, j, None))
        scalar = 1 / a[j][j]
        a[j] = [scalar * x for x in a[j]]
        inv[j] = [scalar * x for x in inv[j]]
        ops.append(("scale", j, None, scalar))
        for i in range(n):
            if i == j or not a[i][j]:
                continue
            scalar = -a[i][j]
            a[i] = [x + scalar * y for x, y in zip(a[i], a[j])]
            inv[i] = [x + scalar * y for x, y in zip(inv[i], inv[j])]
            ops.append(("add", i, j, scalar))
    return inv, ops


def left_substitution(poly, ops, capped):
    """Apply f(x) <- f(B^T x) on the left coordinates from row ops for B."""
    for kind, i, j, scalar in reversed(ops):
        if kind == "add":
            poly = shift(poly, j, i, -scalar, capped)
        elif kind == "scale":
            poly = {e: c * (1 / scalar)**e[i] for e, c in poly.items()}
        else:
            out = {}
            for e, c in poly.items():
                z = list(e)
                z[i], z[j] = z[j], z[i]
                out[tuple(z)] = c
            poly = out
    return clean(poly)


def matmul(a, b):
    return [[sum((a[i][q] * b[q][j] for q in range(len(b))), F(0))
             for j in range(len(b[0]))] for i in range(len(a))]


def action_good_pivots(a, k, poly):
    """Compute P_k(a) times the squarefree coefficient vector poly.

All leading principal minors of a must be nonzero. The wrapper below
removes this assumption by scalar interpolation.
"""
    n = len(a)
    if k == 0:
        return poly.copy()
    if n == 1:
        return {e: c * a[0][0] for e, c in poly.items()}
    m = n // 2
    r = n - m
    b = [row[:m] for row in a[:m]]
    c = [row[m:] for row in a[:m]]
    d = [row[:m] for row in a[m:]]
    eblock = [row[m:] for row in a[m:]]
    binv, operations = inverse_and_row_operations(b)
    upper = matmul(binv, c)
    lower = matmul(d, binv)
    correction = matmul(d, upper)
    schur = [[eblock[i][j] - correction[i][j] for j in range(r)]
             for i in range(r)]
    capped = frozenset(range(m, n))

    # U sends each right variable to itself plus a left linear form.
    current = poly.copy()
    for i in range(m):
        for j in range(r):
            current = shift(current, m + j, i, upper[i][j], capped)

    current = left_substitution(current, operations, capped)

    # The right block acts separately for each left monomial.
    groups = defaultdict(dict)
    for exponent, coefficient in current.items():
        groups[exponent[:m]][exponent[m:]] = coefficient
    current = {}
    for left, right_poly in groups.items():
        degree = k - sum(left)
        transformed = action_good_pivots(schur, degree, right_poly)
        for right, coefficient in transformed.items():
            current[left + right] = coefficient

    # L sends each left variable to itself plus a right linear form.
    # Existing repeated right variables could never become squarefree,
    # so every elementary substitution may discard them immediately.
    for i in range(m):
        for j in range(r):
            current = shift(current, i, m + j, lower[j][i], capped)
    return clean({e: c for e, c in current.items() if max(e, default=0) <= 1})


def good_leading_pivots(matrix):
    a = [[F(x) for x in row] for row in matrix]
    n = len(a)
    for j in range(n):
        if not a[j][j]:
            return False
        for i in range(j + 1, n):
            q = a[i][j] / a[j][j]
            for z in range(j, n):
                a[i][z] -= q * a[j][z]
    return True


def compound_action(matrix, k, poly):
    n = len(matrix)
    a = [[F(x) for x in row] for row in matrix]
    if k == 0 or good_leading_pivots(a):
        return action_good_pivots(a, k, poly)
    selected = []
    for t in range(1, n * (n + 1) // 2 + k + 2):
        shifted = [[a[i][j] + (t if i == j else 0) for j in range(n)]
                   for i in range(n)]
        if good_leading_pivots(shifted):
            selected.append((t, shifted))
        if len(selected) == k + 1:
            break
    assert len(selected) == k + 1
    out = defaultdict(F)
    for t, shifted in selected:
        weight = F(1)
        for u, _ in selected:
            if u != t:
                weight *= F(-u, t - u)
        value = action_good_pivots(shifted, k, poly)
        for exponent, coefficient in value.items():
            out[exponent] += weight * coefficient
    return clean(out)


def direct_action(a, k, poly):
    n = len(a)
    out = {}
    for rows in combinations(range(n), k):
        coefficient = F(0)
        for exponents, value in poly.items():
            cols = tuple(i for i, q in enumerate(exponents) if q)
            p = F(0)
            for ordering in permutations(cols):
                term = F(1)
                for i, j in zip(rows, ordering):
                    term *= a[i][j]
                p += term
            coefficient += value * p
        exponents = tuple(int(i in rows) for i in range(n))
        if coefficient:
            out[exponents] = coefficient
    return out


def main():
    rng = random.Random(20261120)
    checked = 0
    for n in range(2, 7):
        matrices = [
            [[F(rng.randint(-2, 3) + (5*n if i == j else 0))
              for j in range(n)] for i in range(n)],
            [[F((i + 1) * (j + 1)) for j in range(n)] for i in range(n)],
            [[F(int((j-i) % n == 1)) for j in range(n)] for i in range(n)],
        ]
        for a in matrices:
            for k in range(n + 1):
                poly = {}
                for subset in combinations(range(n), k):
                    exponents = tuple(int(i in subset) for i in range(n))
                    poly[exponents] = F(rng.randint(-3, 3))
                poly = clean(poly)
                got = compound_action(a, k, poly)
                expected = direct_action(a, k, poly)
                assert got == expected, (n, k, a, got, expected)
                checked += 1
    # The mixed dimension is the coefficient of (1+z)^r/(1-z)^m.
    dimensions = []
    for n in (4, 8, 12, 16, 20, 40):
        m = r = k = n // 2
        mixed = sum(comb(r, j) * comb(m+k-j-1, k-j)
                    for j in range(min(r, k)+1))
        full = comb(n+k-1, k)
        assert mixed <= full
        dimensions.append((n, mixed, full))
    print(f"exact compound actions checked: {checked}")
    print("n, mixed dimension, full symmetric dimension:")
    for row in dimensions:
        print(*row)


if __name__ == "__main__":
    main()
