"""Exact checks for gyires_substochastic_transfer.md; no search or optimizer."""
from fractions import Fraction as Q
from math import factorial


def transpose(a):
    return [list(x) for x in zip(*a)]


def multiply(a, b):
    return [[sum((x * y for x, y in zip(row, col)), Q(0))
             for col in zip(*b)] for row in a]


def margins(b):
    r = [sum(row, Q(0)) for row in b]
    c = [sum(col, Q(0)) for col in zip(*b)]
    assert min(r + c) >= 0 and max(r + c) <= 1
    return r, c


def completion(b, M):
    m = len(b)
    r, c = margins(b)
    q = Q(m) - sum(r)
    assert M >= m
    return ([list(row) + [(1 - r[i]) / M] * M
             for i, row in enumerate(b)] +
            [[(1 - c[j]) / M for j in range(m)] +
             [(M - q) / M**2] * M for _ in range(M)])


def permanent(a):
    n = len(a)
    dp = [Q(0)] * (1 << n)
    dp[0] = Q(1)
    for mask in range(1, 1 << n):
        i = mask.bit_count() - 1
        dp[mask] = sum((a[i][j] * dp[mask ^ (1 << j)]
                        for j in range(n) if mask & (1 << j)), Q(0))
    return dp[-1]


def matching_weights(b):
    """W[k] includes both unmatched-vertex products."""
    m = len(b)
    r, c = margins(b)
    u, v = [1 - x for x in r], [1 - x for x in c]
    dp = {0: Q(1)}
    for i in range(m):
        new = {}
        for mask, x in dp.items():
            new[mask] = new.get(mask, Q(0)) + u[i] * x
            for j in range(m):
                if not mask & (1 << j):
                    key = mask | (1 << j)
                    new[key] = new.get(key, Q(0)) + b[i][j] * x
        dp = new
    ans = [Q(0)] * (m + 1)
    for mask, x in dp.items():
        for j in range(m):
            if not mask & (1 << j):
                x *= v[j]
        ans[mask.bit_count()] += x
    return ans


def Z(b):
    return sum(matching_weights(b), Q(0))


def permanent_count_formula(b, M):
    m = len(b)
    r, _ = margins(b)
    q = Q(m) - sum(r)
    assert M > m
    beta = (M - q) / M**2
    total = Q(0)
    for k, w in enumerate(matching_weights(b)):
        h = m - k
        falling = factorial(M) // factorial(M - h)
        total += w * falling / (M - q)**h
    return factorial(M) * beta**M * total


def mass(b):
    return sum((sum(row, Q(0)) for row in b), Q(0))


def block_diagonal(a, b):
    n, m = len(a), len(b)
    return ([list(row) + [Q(0)] * m for row in a] +
            [[Q(0)] * n + list(row) for row in b])


def symmetric_lift(b):
    n = len(b)
    return ([[Q(0)] * n + list(row) for row in b] +
            [list(row) + [Q(0)] * n for row in transpose(b)])


def main():
    cores = [
        [[Q(1, 3)]],
        [[Q(1, 3), Q(1, 6)], [Q(1, 4), Q(1, 2)]],
        [[Q(0), Q(1), Q(0)],
         [Q(1, 2), Q(0), Q(1, 4)],
         [Q(1, 4), Q(0), Q(1, 2)]],
    ]
    composition_checks = 0
    counting_checks = 0
    for b in cores:
        m = len(b)
        rb, cb = margins(b)
        ub = [1 - x for x in rb]
        for c in (transpose(b), [[x / 2 for x in row] for row in b]):
            _, cc = margins(c)
            vc = [1 - x for x in cc]
            for M in (m + 1, m + 2):
                bc = multiply(b, c)
                core = [[bc[i][j] + ub[i] * vc[j] / M
                         for j in range(m)] for i in range(m)]
                actual = multiply(completion(b, M), completion(c, M))
                assert actual == completion(core, M)
                assert transpose(completion(b, M)) == completion(transpose(b), M)
                composition_checks += 1
        for M in (m + 1, m + 2):
            assert permanent(completion(b, M)) == permanent_count_formula(b, M)
            counting_checks += 1

        d = symmetric_lift(b)
        assert Z(d) == Z(b)**2 and mass(d) == 2 * mass(b)
        bbt = multiply(b, transpose(b))
        btb = multiply(transpose(b), b)
        dd = multiply(d, d)
        assert dd == block_diagonal(bbt, btb)
        assert Z(dd) == Z(bbt) * Z(btb)
        assert mass(dd) == mass(bbt) + mass(btb)

    n = 6
    a = [[(Q(1, 2) if j == i or j == (i + 1) % n else Q(0))
          for j in range(n)] for i in range(n)]
    c = permanent(a)
    gram = permanent(multiply(a, transpose(a)))
    dn = Q(factorial(n), n**n)
    assert c == Q(1, 32)
    assert gram == Q(25, 512)
    assert gram - 2 * c + dn == Q(73, 41472)
    assert c**2 / gram == Q(1, 50) > dn

    # Independent recurrence for lambda_+^n + lambda_-^n.
    L0, L1 = 2, 2
    for _ in range(2, n + 1):
        L0, L1 = L1, 2 * L1 + L0
    assert gram == Q(L1 + 2, 4**n)

    print(f"Passed {composition_checks} exact completion compositions.")
    print(f"Passed {counting_checks} exact permanent counting comparisons.")
    print("Passed all three symmetric-lift matching identities.")
    print("Cycle obstruction: excess = 73/41472; true Gram ratio = 1/50 > 5/324.")


if __name__ == "__main__":
    main()

