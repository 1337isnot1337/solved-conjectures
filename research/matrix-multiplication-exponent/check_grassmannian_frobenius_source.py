"""Exact independent checks for the Gr(2,4) four-party source.

The proof in the accompanying note is uniform. This check compares
integer coefficient extraction with the six-term root decomposition,
and checks the exterior action convention. No floating point is used.
"""

from collections import defaultdict
from fractions import Fraction
from itertools import combinations, product
import sympy as sp


def multiply(a, b):
    out = defaultdict(int)
    for (i, j), x in a.items():
        for (k, l), y in b.items():
            out[i + k, j + l] += x * y
    return {m: v for m, v in out.items() if v}


def schur(a, b):
    assert a >= b >= 0
    return {(a - j, b + j): 1 for j in range(a - b + 1)}


def trace_poly(f):
    # epsilon=-1, k!=2, Delta^2=(y-x)^2.
    g = multiply(f, {(2, 0): 1, (1, 1): -2, (0, 2): 1})
    out = defaultdict(Fraction)
    for (a, b), c in g.items():
        if a >= 3 and b >= 3 and (a - 3) % 4 == (b - 3) % 4 == 0:
            out[(a + b - 6) // 4] -= Fraction(c, 2)
    return {m: v for m, v in out.items() if v}


def eval_trace(f, kappa):
    return sum(c * kappa**m for m, c in trace_poly(f).items())


def gaussian_mul(a, b):
    return a[0] * b[0] - a[1] * b[1], a[0] * b[1] + a[1] * b[0]


def gaussian_pow(a, n):
    out = (1, 0)
    for _ in range(n):
        out = gaussian_mul(out, a)
    return out


def eval_gaussian(f, x, y):
    out = [0, 0]
    for (a, b), c in f.items():
        value = gaussian_mul(gaussian_pow(x, a), gaussian_pow(y, b))
        out[0] += c * value[0]
        out[1] += c * value[1]
    return tuple(out)


partitions = [(0, 0), (1, 0), (2, 0), (1, 1), (2, 1), (2, 2)]
polynomials = [schur(*lam) for lam in partitions]
complements = [partitions.index((2 - b, 2 - a)) for a, b in partitions]
subsets = [(b, a + 1) for a, b in partitions]
roots = [(1, 0), (0, 1), (-1, 0), (0, -1)]
root_subsets = list(combinations(roots, 2))
values = [[eval_gaussian(f, *pair) for f in polynomials] for pair in root_subsets]

# All weights have denominator 16. Compute their Gaussian numerators.
weights_times_16 = []
for x, y in root_subsets:
    diff = (y[0] - x[0], y[1] - x[1])
    numerator = gaussian_pow(diff, 2)
    denominator = gaussian_mul(gaussian_pow(x, 3), gaussian_pow(y, 3))
    inverse = (denominator[0], -denominator[1])  # norm one
    w = gaussian_mul(numerator, inverse)
    weights_times_16.append((-w[0], -w[1]))

for a, b in product(range(6), repeat=2):
    expected = {0: Fraction(1)} if b == complements[a] else {}
    assert trace_poly(multiply(polynomials[a], polynomials[b])) == expected

for indices in product(range(6), repeat=4):
    polynomial = {(0, 0): 1}
    for index in indices:
        polynomial = multiply(polynomial, polynomials[index])
    expected = 16 * eval_trace(polynomial, 1)
    actual = [0, 0]
    for r, weight in enumerate(weights_times_16):
        term = weight
        for index in indices:
            term = gaussian_mul(term, values[r][index])
        actual[0] += term[0]
        actual[1] += term[1]
    assert actual == [expected, 0], (indices, actual, expected)

for kappa in (0, 1, -2):
    shift = sp.zeros(4)
    for i in range(3):
        shift[i + 1, i] = 1
    shift[0, 3] = kappa
    for m in range(1, 7):
        p_m = {(m, 0): 1, (0, m): 1}
        mult = sp.zeros(6)
        for col in range(6):
            for row in range(6):
                f = multiply(multiply(polynomials[col], p_m),
                             polynomials[complements[row]])
                mult[row, col] = eval_trace(f, kappa)
        power = shift**m
        exterior = sp.zeros(6)
        for col, pair in enumerate(subsets):
            for slot in range(2):
                for new in range(4):
                    value = power[new, pair[slot]]
                    if not value:
                        continue
                    out = list(pair)
                    out[slot] = new
                    if out[0] == out[1]:
                        continue
                    sign = 1 if out[0] < out[1] else -1
                    row = subsets.index(tuple(sorted(out)))
                    exterior[row, col] += sign * value
        assert mult == exterior, (kappa, m, mult, exterior)

# Full ordinary Frobenius trace is deliberately not used.
pairing = sp.Matrix([[int(b == complements[a]) for b in range(6)]
                     for a in range(6)])
assert pairing.det() != 0
print("PASS: all 36 pairings are parameter-independent complement pairings.")
print("PASS: all 1296 four-party coefficients match the exact six-term root sum.")
print("PASS: 18 power-sum matrices match the additive exterior cyclic shift.")
print("PASS: the special Frobenius pairing has rank 6.")
