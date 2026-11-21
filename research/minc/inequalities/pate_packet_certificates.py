"""Exact checks of the Pate indicator reduction and two-copy expansion.

The cited theorem proves the inequality in general. This fixed Gram example
checks indexing, conjugation-free integer specialization, and polynomial factors.
No search, numerical optimization, or finite-order conjecture claim is made.
"""

from fractions import Fraction
from itertools import combinations, permutations
from math import comb, factorial


def permanent(a):
    n = len(a)
    dp = [0] * (1 << n)
    dp[0] = 1
    for mask in range(1, 1 << n):
        i = mask.bit_count() - 1
        dp[mask] = sum(a[i][j] * dp[mask ^ (1 << j)]
                       for j in range(n) if mask & (1 << j))
    return dp[-1]


def minor(a, rows, cols):
    return [[a[i][j] for j in cols] for i in rows]


def complement(s, n):
    return tuple(i for i in range(n) if i not in s)


def multiply(p, q):
    out = {}
    for a, ca in p.items():
        for b, cb in q.items():
            c = tuple(x + y for x, y in zip(a, b))
            out[c] = out.get(c, 0) + ca * cb
    return {a: c for a, c in out.items() if c}


def add(p, q):
    out = p.copy()
    for a, c in q.items():
        out[a] = out.get(a, 0) + c
    return {a: c for a, c in out.items() if c}


def fischer_norm(p):
    return sum(c * c * product(factorial(i) for i in alpha)
               for alpha, c in p.items())


def product(xs):
    out = 1
    for x in xs:
        out *= x
    return out


def linear(v, offset):
    out = {}
    for j, c in enumerate(v):
        if c:
            a = [0] * 8
            a[offset + j] = 1
            out[tuple(a)] = c
    return out


def main():
    vectors = [(1, 0), (0, 1), (1, 1), (1, -1)]
    n = len(vectors)
    b = [[sum(x * y for x, y in zip(u, v)) for v in vectors]
         for u in vectors]
    h = [[b[i % n][j % n] if (i < n) == (j < n) else 0
          for j in range(2 * n)] for i in range(2 * n)]
    per_b = permanent(b)
    assert permanent(h) == per_b ** 2
    two_part = []
    for r in range(n + 1):
        subsets = list(combinations(range(n), r))
        lhs = 0
        indicator_form = 0
        for s in subsets:
            sc = complement(s, n)
            us = s + tuple(n + i for i in s)
            usc = complement(us, 2 * n)
            for t in subsets:
                tc = complement(t, n)
                ut = t + tuple(n + j for j in t)
                utc = complement(ut, 2 * n)
                x = permanent(minor(b, s, t))
                y = permanent(minor(b, sc, tc))
                lhs += x * x * y * y
                hx = permanent(minor(h, us, ut))
                hy = permanent(minor(h, usc, utc))
                assert hx == x * x and hy == y * y
                indicator_form += hx * hy
        assert lhs == indicator_form
        assert lhs <= comb(n, r) * per_b ** 2
        two_part.append(lhs)

    # Independent derivation of the expansion by polynomial multiplication.
    # The index records how many coordinates use the first independent copy.
    coeff = [{(0,) * 8: 1}]
    for v in vectors:
        first = multiply(linear(v, 0), linear(v, 2))
        second = multiply(linear(v, 4), linear(v, 6))
        new = [{} for _ in range(len(coeff) + 1)]
        for r, p in enumerate(coeff):
            new[r] = add(new[r], multiply(p, second))
            new[r + 1] = add(new[r + 1], multiply(p, first))
        coeff = new
    polynomial_coeff = [fischer_norm(p) for p in coeff]
    assert polynomial_coeff == two_part

    t = Fraction(2, 5)
    mixed_moment = sum(t ** r * (1 - t) ** (n - r) * two_part[r]
                       for r in range(n + 1))
    assert mixed_moment <= per_b ** 2
    endpoint_derivative = n * per_b ** 2 - two_part[1]
    assert endpoint_derivative >= 0

    cross_minor = minor(b, (0, 1), (0, 2))
    assert cross_minor == [[1, 1], [0, 1]]
    assert cross_minor != [list(row) for row in zip(*cross_minor)]

    d = [[b[i][j] * permanent(minor(b, complement((i,), n),
                                    complement((j,), n)))
          for j in range(n)] for i in range(n)]
    per_d = permanent(d)
    assert all(sum(row) == per_b for row in d)
    perms = list(permutations(range(n)))
    selected_sum = 0
    for sigma in perms:
        row_sum = sum(product(d[sigma[r]][tau[r]] for r in range(n))
                      for tau in perms)
        assert row_sum == per_d
        selected_sum += row_sum
    assert selected_sum == factorial(n) * per_d
    assert selected_sum <= factorial(n) * per_b ** n
    print({"per_B": per_b, "two_part_coefficients": two_part,
           "two_copy_moment_at_2_over_5": str(mixed_moment),
           "gaussian_endpoint_derivative": endpoint_derivative,
           "per_cofactor_product": per_d,
           "cofactor_product_bound": per_b ** n,
           "nonhermitian_cross_minor": cross_minor})
    print("Exact indexing and polynomial certificates passed.")


if __name__ == "__main__":
    main()
