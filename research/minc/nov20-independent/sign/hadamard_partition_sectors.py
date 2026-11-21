"""Exact checks of normalized Hadamard partition-sector identities.

This checks identities, not new order cases or a solution of Minc P5.
Run with Python 3; no third-party packages are required.
"""

from collections import Counter, defaultdict
from fractions import Fraction
from functools import lru_cache
from itertools import combinations, product
from math import comb, factorial


def sylvester(n):
    assert n > 0 and n & (n - 1) == 0
    return [[(-1) ** ((i & j).bit_count() % 2) for j in range(n)] for i in range(n)]


def normalized(a):
    a = [row[:] for row in a]
    for i in range(len(a)):
        if a[i][0] < 0:
            a[i] = [-v for v in a[i]]
    for j in range(len(a)):
        if a[0][j] < 0:
            for row in a:
                row[j] *= -1
    return a


def paley12():
    q = 11
    squares = {x * x % q for x in range(1, q)}
    a = [[1] * (q + 1)]
    for i in range(q):
        a.append([1] + [-1 if i == j else (1 if (i - j) % q in squares else -1) for j in range(q)])
    return normalized(a)


def switched16():
    a = sylvester(16)
    for i in range(4):
        for j in range(0, 16, 4):
            a[i][j] *= -1
    return normalized(a)


def check_hadamard(a):
    n = len(a)
    assert n % 4 == 0
    assert all(x in (-1, 1) for row in a for x in row)
    assert a[0] == [1] * n and [row[0] for row in a] == [1] * n
    for i in range(n):
        for j in range(n):
            assert sum(a[i][k] * a[j][k] for k in range(n)) == (n if i == j else 0)
    assert all(product_int(row[j] for row in a) == 1 for j in range(n))


def product_int(values):
    ans = 1
    for value in values:
        ans *= value
    return ans


def permanent(a):
    n = len(a)
    dp = [0] * (1 << n)
    dp[0] = 1
    for mask in range(1, 1 << n):
        row = mask.bit_count() - 1
        bits = mask
        while bits:
            bit = bits & -bits
            bits ^= bit
            dp[mask] += a[row][bit.bit_length() - 1] * dp[mask ^ bit]
    return dp[-1]


def moments(a):
    n = len(a)
    result = [0] * (1 << n)
    for j in range(n):
        signs = [1] * (1 << n)
        result[0] += 1
        for mask in range(1, 1 << n):
            bit = mask & -mask
            signs[mask] = signs[mask ^ bit] * a[bit.bit_length() - 1][j]
            result[mask] += signs[mask]
    return result


def direct_sectors(a, largest=3):
    n = len(a)
    s = moments(a)
    w = [0] * (1 << n)
    for mask in range(1, 1 << n):
        size = mask.bit_count()
        w[mask] = (-1) ** (size - 1) * factorial(size - 1) * s[mask]

    @lru_cache(None)
    def sector(mask, blocks):
        if blocks == 0:
            return int(mask == 0)
        if mask.bit_count() < blocks:
            return 0
        if blocks == 1:
            return w[mask]
        first = mask & -mask
        rest = mask ^ first
        subset = rest
        total = 0
        while True:
            block = subset | first
            if w[block]:
                total += w[block] * sector(mask ^ block, blocks - 1)
            if subset == 0:
                break
            subset = (subset - 1) & rest
        return total

    full = (1 << n) - 1
    return [sector(full, r) for r in range(1, largest + 1)]


def universal_t2(n):
    harmonic = lambda r: sum((Fraction(1, k) for k in range(1, r + 1)), Fraction())
    value = factorial(n) * (n * harmonic(n - 1) - 2 * (n - 1) * harmonic(n // 2) + (n - 1) * harmonic(n // 4))
    assert value.denominator == 1
    return value.numerator


def poly_multiply(a, b):
    c = defaultdict(int)
    for alpha, av in a.items():
        for beta, bv in b.items():
            c[tuple(x + y for x, y in zip(alpha, beta))] += av * bv
    return {alpha: value for alpha, value in c.items() if value}


def universal_s3(n):
    out = defaultdict(int)
    for a in range(n + 1):
        for b in range(n - a + 1):
            c = n - a - b
            out[a, b, c] += n * factorial(n) // (factorial(a) * factorial(b) * factorial(c))
    for singled in range(3):
        others = [i for i in range(3) if i != singled]
        for ell in range(n // 2 + 1):
            degree = n - 2 * ell
            for a in range(degree + 1):
                alpha = [0, 0, 0]
                alpha[singled] = 2 * ell
                alpha[others[0]] = a
                alpha[others[1]] = degree - a
                out[tuple(alpha)] += n * (n - 1) * (-1) ** ell * comb(n // 2, ell) * comb(degree, a)
    q = {(4, 0, 0): 1, (0, 4, 0): 1, (0, 0, 4): 1,
         (2, 2, 0): -2, (2, 0, 2): -2, (0, 2, 2): -2}
    qpower = {(0, 0, 0): 1}
    for _ in range(n // 4):
        qpower = poly_multiply(qpower, q)
    for alpha, value in qpower.items():
        out[alpha] += n * (n - 1) * (n - 2) * value
    return dict(out)


def universal_t3(n):
    value = sum(value * product_int(factorial(k - 1) for k in alpha)
                for alpha, value in universal_s3(n).items() if min(alpha) > 0)
    assert value % 6 == 0
    return -value // 6


def fourth_spectrum(a):
    n = len(a)
    spectrum = Counter(sum(product_int(a[i][j] for j in cols) for i in range(n))
                       for cols in combinations(range(n), 4))
    assert sum(spectrum.values()) == comb(n, 4)
    assert sum(c * count for c, count in spectrum.items()) == n * n * (n - 1) * (n - 2) // 24
    assert sum(c * c * count for c, count in spectrum.items()) == n ** 3 * (n - 1) * (n - 2) // 24
    for cols in combinations(range(n), 4):
        c = sum(product_int(a[i][j] for j in cols) for i in range(n))
        counts = Counter(tuple(a[i][cols[t]] * a[i][cols[3]] for t in range(3)) for i in range(n))
        for signs in product((-1, 1), repeat=3):
            assert counts[signs] == (n + product_int(signs) * c) // 8
            assert (n + product_int(signs) * c) % 8 == 0
        for x in [(1, 2, 3, 4), (1, -1, 2, 3)]:
            lhs = product_int(sum(x[t] * a[i][cols[t]] for t in range(4)) for i in range(n))
            r = sum(v ** 4 for v in x) - 2 * sum(x[i] ** 2 * x[j] ** 2 for i, j in combinations(range(4), 2))
            p = product_int(x)
            rhs = (r + 8 * p) ** ((n + c) // 8) * (r - 8 * p) ** ((n - c) // 8)
            assert lhs == rhs
    return dict(sorted(spectrum.items()))


def main():
    all_results = []
    for name, a in [("Sylvester4", sylvester(4)), ("Sylvester8", sylvester(8)),
                    ("Paley12", paley12()), ("Sylvester16", sylvester(16)),
                    ("switched16", switched16())]:
        check_hadamard(a)
        n = len(a)
        sectors = direct_sectors(a)
        assert sectors == [-factorial(n), universal_t2(n), universal_t3(n)]
        per = permanent(a)
        spectrum = fourth_spectrum(a)
        print(name, "permanent", per, "T1,T2,T3", sectors, "fourth spectrum", spectrum)
        if n <= 8:
            assert sum(direct_sectors(a, n)) == per
        all_results.append((name, per, sectors))
    assert all_results[-1][2] == all_results[-2][2]
    assert all_results[-1][1] != all_results[-2][1]
    print("All exact partition, polynomial, correlation and permanent checks passed.")


if __name__ == "__main__":
    main()
