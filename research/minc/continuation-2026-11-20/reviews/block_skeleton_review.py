#!/usr/bin/env python3
"""Independent integer checks for the P7 triangular-block construction.

These checks certify identities and the order-nine failure of one proposed
construction. They do not settle Minc Problem 7 or produce new existence orders.
No modules from the other agent's checker are imported.
"""

from collections import defaultdict
from fractions import Fraction
from itertools import product
from math import factorial, prod


def permanent(a):
    n = len(a)
    dp = [0] * (1 << n)
    dp[0] = 1
    for mask in range(1 << n):
        i = mask.bit_count()
        if i == n:
            continue
        for j in range(n):
            if not mask >> j & 1:
                dp[mask | 1 << j] += dp[mask] * a[i][j]
    return dp[-1]


def determinant(a):
    n = len(a)
    b = [[Fraction(x) for x in row] for row in a]
    result = Fraction(1)
    for i in range(n):
        pivot = next((j for j in range(i, n) if b[j][i]), None)
        if pivot is None:
            return 0
        if pivot != i:
            b[i], b[pivot] = b[pivot], b[i]
            result = -result
        p = b[i][i]
        result *= p
        for j in range(i + 1, n):
            q = b[j][i] / p
            for k in range(i + 1, n):
                b[j][k] -= q * b[i][k]
    assert result.denominator == 1
    return result.numerator


def stirling(n, k):
    if n == 0:
        return int(k == 0)
    if k < 1 or k > n:
        return 0
    row = [1]
    for m in range(1, n + 1):
        row = [0] + [j * (row[j] if j < len(row) else 0) + row[j - 1]
                     for j in range(1, m + 1)]
    return row[k]


def repeat(c, multiplicities):
    labels = [i for i, m in enumerate(multiplicities) for _ in range(m)]
    return [[c[i][j] for j in labels] for i in labels]


def expand(c, sizes):
    labels = [(i, h) for i, m in enumerate(sizes) for h in range(m)]
    return [[c[i][j] if i != j else (1 if h < k else -1)
             for j, k in labels] for i, h in labels]


def stirling_permanent(c, sizes):
    return sum(permanent(repeat(c, k)) *
               prod(2 ** (m - h) * stirling(m, h)
                    for m, h in zip(sizes, k))
               for k in product(*(range(m + 1) for m in sizes)))


def partitions(n, least=1):
    if not n:
        yield ()
    for first in range(least, n + 1):
        for rest in partitions(n - first, first):
            yield (first,) + rest


def polynomial_product(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i + j] += x * y
    return c


def all_ones_skeleton_permanent(sizes):
    r = [1]
    for m in sizes:
        r = polynomial_product(r, [stirling(m + 1, m + 1 - j)
                                    for j in range(m + 1)])
    n = sum(sizes)
    return sum((-2) ** j * factorial(n - j) * x
               for j, x in enumerate(r))


def check_order_nine():
    groups = defaultdict(set)
    count = 0
    for sizes in partitions(9):
        s = len(sizes)
        c = [[-1 if i == j else 1 for j in range(s)] for i in range(s)]
        a = expand(c, sizes)
        p, d = permanent(a), determinant(a)
        assert p == all_ones_skeleton_permanent(sizes)
        assert d == (-2) ** 8 * (s - 2)
        assert not d or abs(p) != abs(d)
        assert p % 64 == 0
        groups[s].add(p // 64)
        count += 1
    assert count == 30
    expected = {
        1: {-124},
        2: {124, -107, 73, -26},
        3: {-107, 90, -77, 72, -60, 21, 25},
        4: {90, -60, 21, -22, 78, 107},
        5: {-43, -52, 113, 131, 238},
        6: {-95, 160, 310},
        7: {182, 411},
        8: {553},
        9: {766},
    }
    assert dict(groups) == expected
    print('Order-nine all-ones skeleton: all 30 partitions checked; no solution.')
    for s in sorted(groups):
        print(f'  blocks={s}, permanent/64={sorted(groups[s])}')


def check_skeleton_identities():
    # Exhaust this small sign skeleton class solely to check indexing and
    # normalization of the general formulas, including singular skeletons.
    count = 0
    for entries in product((-1, 1), repeat=6):
        c = [[-1] * 3 for _ in range(3)]
        it = iter(entries)
        for i in range(3):
            for j in range(3):
                if i != j:
                    c[i][j] = next(it)
        for sizes in ((2, 1, 2), (0, 2, 1)):
            a = expand(c, sizes)
            assert permanent(a) == stirling_permanent(c, sizes)
            active = [i for i, m in enumerate(sizes) if m]
            restricted = [[c[i][j] for j in active] for i in active]
            assert determinant(a) == (-2) ** (sum(sizes) - len(active)) * determinant(restricted)
        for i in range(3):
            sizes = [1] * 3
            sizes[i] = 2
            assert permanent(expand(c, sizes)) == 2 * permanent(c) + permanent(repeat(c, sizes))
        count += 1
    assert count == 64
    print('General skeleton identities: 64 three-vertex sign skeletons checked.')


def check_repetition_polynomial():
    # Independent rank-one coefficient expansion for a concrete nonsingular
    # skeleton; this verifies the falling-factorial signs and multiplicities.
    c = [[-1, 1, -1], [-1, -1, 1], [1, -1, -1]]
    i = 0
    rest = [j for j in range(len(c)) if j != i]
    from itertools import combinations
    coefficients = []
    for ell in range(len(c)):
        total = 0
        for rows in combinations(rest, ell):
            for cols in combinations(rest, ell):
                minor = [[c[a][b] for b in rest if b not in cols]
                         for a in rest if a not in rows]
                total += permanent(minor) * prod(c[a][i] for a in rows) * prod(c[i][b] for b in cols)
        coefficients.append(total)
    assert abs(coefficients[-1]) == 1
    for k in range(6):
        falling = lambda ell: prod(k - j for j in range(ell))
        value = (-1) ** k * factorial(k) * sum((-1) ** ell * falling(ell) * e
                                                for ell, e in enumerate(coefficients))
        sizes = [1] * len(c)
        sizes[i] = k
        assert value == permanent(repeat(c, sizes))
    print('Repeated-index falling-factorial polynomial: exact checks passed.')


if __name__ == '__main__':
    check_order_nine()
    check_skeleton_identities()
    check_repetition_polynomial()
    print('All independent exact checks passed.')
