"""Exact checks of the cyclic quantum-component witnesses.

The uniform proof is in QUANTUM_GRASSMANNIAN_COMPONENTS.md.
For k=2 this checks coefficient extraction directly, independently
of multiplying exterior shift matrices. No numerical linear algebra
or floating point is used.
"""

from collections import defaultdict
from fractions import Fraction
from itertools import combinations


def mul(f, g):
    out = defaultdict(int)
    for (a, b), x in f.items():
        for (c, d), y in g.items():
            out[a + c, b + d] += x * y
    return {ab: v for ab, v in out.items() if v}


def schur(a, b):
    assert a >= b >= 0
    return {(a - j, b + j): 1 for j in range(a - b + 1)}


def trace_poly(f, s):
    # For k=2, epsilon/k! = -1/2 and Delta^2=(y-x)^2.
    g = mul(f, {(2, 0): 1, (1, 1): -2, (0, 2): 1})
    out = defaultdict(Fraction)
    for (a, b), x in g.items():
        if a >= s - 1 and b >= s - 1:
            if (a - s + 1) % s == (b - s + 1) % s == 0:
                ell = (a + b - 2 * (s - 1)) // s
                out[ell] -= Fraction(x, 2)
    return {ell: x for ell, x in out.items() if x}


def part(I):
    return I[1] - 1, I[0]


def complement(lam, n):
    return n - lam[1], n - lam[0]


checks = 0
for s in range(3, 9):
    n = s - 2
    subsets = list(combinations(range(s), 2))
    polys = {I: schur(*part(I)) for I in subsets}
    # This includes every two-rectangle/private-column witness.
    for I in subsets:
        for m in range(2 * n + 1):
            shifted = tuple(sorted((a + m) % s for a in I))
            w = sum((a + m) // s for a in I)
            residual = m % s
            t = sum(a + residual >= s for a in I)
            sign = (-1) ** (t * (2 - t))
            mu = complement(part(shifted), n)
            right = schur(*mu)
            for J in subsets:
                f = mul(polys[J], right)
                f = {(a + m, b + m): x for (a, b), x in f.items()}
                actual = trace_poly(f, s)
                expected = {w: Fraction(sign)} if J == I else {}
                assert actual == expected, (s, I, m, J, actual, expected)
                checks += 1

    # The three-rectangle witnesses establish the wider range.
    attained = set()
    I = (0, 1)
    for m in range(3 * n + 1):
        shifted = tuple(sorted((a + m) % s for a in I))
        w = sum((a + m) // s for a in I)
        t = sum(a + (m % s) >= s for a in I)
        sign = (-1) ** (t * (2 - t))
        mu = complement(part(shifted), n)
        f = {(a + m, b + m): x for (a, b), x in schur(*mu).items()}
        assert trace_poly(f, s) == {w: Fraction(sign)}
        attained.add(w)
    assert set(range(4 * n // s + 1)) <= attained

# Purely combinatorial parts of the uniform proof, for all k in these sizes.
for s in range(2, 31):
    for k in range(1, s):
        d = k * (s - k)
        w = [sum((m + a) // s for a in range(k))
             for m in range(3 * (s - k) + 1)]
        assert w[0] == 0
        assert all(y - x in (0, 1) for x, y in zip(w, w[1:]))
        assert w[-1] * s >= 2 * d
        ell_star = (d + s - 1) // s
        assert ell_star <= (2 * d) // s

print(f"PASS: {checks} exact k=2 private-column coefficient identities.")
print("PASS: three-rectangle witnesses attain the claimed nonzero ranges.")
print("PASS: all uniform cyclic-count inequalities for 2<=s<=30.")
