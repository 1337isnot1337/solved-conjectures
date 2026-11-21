"""Exact checks for the characteristic-three Hadamard checkpoint.

These compare independently computed permanents, determinants, and Cayley
principal minors. They are checks of an all-order proof, not new order cases.
"""
from itertools import product
from math import factorial
from random import Random

P = 3


def eye(n):
    return [[int(i == j) for j in range(n)] for i in range(n)]


def transpose(a):
    return [list(row) for row in zip(*a)]


def multiply(a, b):
    return [
        [sum(x * y for x, y in zip(row, col)) % P for col in zip(*b)]
        for row in a
    ]


def add(a, b, scale=1):
    return [[(x + scale * y) % P for x, y in zip(r, s)]
            for r, s in zip(a, b)]


def principal(a, mask):
    inds = [i for i in range(len(a)) if mask >> i & 1]
    return [[a[i][j] for j in inds] for i in inds]


def determinant(a):
    a = [row[:] for row in a]
    n, ans = len(a), 1
    for j in range(n):
        pivot = next((i for i in range(j, n) if a[i][j] % P), None)
        if pivot is None:
            return 0
        if pivot != j:
            a[j], a[pivot] = a[pivot], a[j]
            ans = -ans
        v = a[j][j] % P
        ans = ans * v % P
        inv = pow(v, -1, P)
        for i in range(j + 1, n):
            ratio = a[i][j] * inv % P
            a[i] = [(x - ratio * y) % P for x, y in zip(a[i], a[j])]
    return ans % P


def inverse(a):
    n = len(a)
    a = [row[:] + erow for row, erow in zip(a, eye(n))]
    for j in range(n):
        pivot = next(i for i in range(j, n) if a[i][j] % P)
        a[j], a[pivot] = a[pivot], a[j]
        inv = pow(a[j][j], -1, P)
        a[j] = [x * inv % P for x in a[j]]
        for i in range(n):
            if i != j:
                ratio = a[i][j]
                a[i] = [(x - ratio * y) % P for x, y in zip(a[i], a[j])]
    return [row[n:] for row in a]


def permanent(a, modulus=P):
    n = len(a)
    dp = [0] * (1 << n)
    dp[0] = 1
    for mask in range(1, 1 << n):
        i = mask.bit_count() - 1
        dp[mask] = sum(a[i][j] * dp[mask ^ (1 << j)]
                       for j in range(n) if mask >> j & 1)
        if modulus:
            dp[mask] %= modulus
    return dp[-1]


def signed_rows(a, mask):
    return [[((-1 if mask >> i & 1 else 1) * x) % P for x in row]
            for i, row in enumerate(a)]


def kogans_identity(a):
    n = len(a)
    full = (1 << n) - 1
    ds = [determinant(principal(a, s)) for s in range(1 << n)]
    value = (-1)**n * sum(ds[s] * ds[full ^ s] for s in range(1 << n))
    assert permanent(a) == value % P
    return ds


def check_orthogonal(u):
    n = len(u)
    ident = eye(n)
    assert multiply(u, transpose(u)) == ident
    ds = kogans_identity(u)
    f = [determinant(add(ident, signed_rows(u, s))) for s in range(1 << n)]
    inv_count = pow(pow(2, n, P), -1, P)
    assert sum(f) * inv_count % P == 1
    assert sum(x*x for x in f) * inv_count % P == sum(x*x for x in ds) % P
    d0 = next(s for s, x in enumerate(f) if x)
    common = f[d0]
    q = signed_rows(u, d0)
    cayley = multiply(add(ident, q, -1), inverse(add(ident, q)))
    assert add(cayley, transpose(cayley)) == [[0] * n for _ in range(n)]
    for s in range(1 << n):
        ratio = f[s ^ d0] * pow(common, -1, P) % P
        assert ratio == determinant(principal(cayley, s))
        assert ratio in (0, 1)
    assert set(f) <= {0, common}
    assert permanent(u) == ((-1)**n * determinant(u) * common) % P
    assert permanent(u) in (1, 2)


def reflection(v):
    n = len(v)
    q = sum(x*x for x in v) % P
    assert q
    return [[(int(i == j) - 2 * v[i] * v[j] * pow(q, -1, P)) % P
             for j in range(n)] for i in range(n)]


def main():
    rng = Random(314159)
    arbitrary = 0
    for n in range(1, 7):
        for _ in range(10):
            a = [[rng.randrange(P) for _ in range(n)] for _ in range(n)]
            kogans_identity(a)
            arbitrary += 1

    orthogonal = 0
    for n in range(1, 8):
        u = eye(n)
        for trial in range(12):
            v = [rng.randrange(P) for _ in range(n)]
            while not sum(x*x for x in v) % P:
                v = [rng.randrange(P) for _ in range(n)]
            r = reflection(v)
            q = sum(x*x for x in v) % P
            assert permanent(r) == -q % P
            u = multiply(r, u)
            check_orthogonal(u)
            orthogonal += 1

    # Exact integer check of the naive two-adic termwise obstruction.
    h4 = [[(-1)**((i & j).bit_count()) for j in range(4)] for i in range(4)]
    b = [[(1 - x) // 2 for x in row] for row in h4]
    rook = []
    for k in range(5):
        subtotal = 0
        masks = [s for s in range(16) if s.bit_count() == k]
        for s in masks:
            rows = [i for i in range(4) if s >> i & 1]
            for t in masks:
                cols = [j for j in range(4) if t >> j & 1]
                subtotal += permanent([[b[i][j] for j in cols] for i in rows],
                                      modulus=None)
        rook.append(subtotal)
    assert rook == [1, 6, 9, 2, 0]
    terms = [(-2)**k * factorial(4-k) * rook[k] for k in range(5)]
    assert terms == [24, -72, 72, -16, 0]
    assert sum(terms) == permanent(h4, modulus=None) == 8

    print(f"Passed {arbitrary} arbitrary-matrix identities and "
          f"{orthogonal} orthogonal-matrix/Cayley checks over F3.")
    print("Passed the exact order-four obstruction to termwise divisibility.")
    print("No new finite-order result or full P5 resolution is asserted.")


if __name__ == "__main__":
    main()

