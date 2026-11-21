"""Exact rational checks for the near-scalar P1 fourth-order reduction."""
import itertools
from fractions import Fraction as Q


def mm(a, b):
    n = len(a)
    return [[sum(a[i][k] * b[k][j] for k in range(n))
             for j in range(n)] for i in range(n)]


def comm(a, b):
    ab, ba = mm(a, b), mm(b, a)
    return [[ab[i][j] - ba[i][j] for j in range(len(a))]
            for i in range(len(a))]


def trace(a):
    return sum(a[i][i] for i in range(len(a)))


def perm(a):
    return sum(__import__("math").prod(a[i][p[i]] for i in range(len(a)))
               for p in itertools.permutations(range(len(a))))


def qk(a, k):
    return sum((perm([[a[i][j] for j in s] for i in s])
                for s in itertools.combinations(range(len(a)), k)), Q(0))


def pmul(a, b, degree=4):
    return [sum(a[i] * b[k - i] for i in range(k + 1))
            for k in range(degree + 1)]


def pperm(a, degree=4):
    n = len(a)
    out = [Q(0)] * (degree + 1)
    for p in itertools.permutations(range(n)):
        prod = [Q(1)] + [Q(0)] * degree
        for i in range(n):
            prod = pmul(prod, a[i][p[i]], degree)
        out = [x + y for x, y in zip(out, prod)]
    return out


def flow_skew(h):
    """Chain edges realize minus the centered squared row norms."""
    n = len(h)
    h2 = mm(h, h)
    r = [h2[i][i] for i in range(n)]
    mean = sum(r) / n
    v = [mean - ri for ri in r]
    k = [[Q(0) for _ in range(n)] for _ in range(n)]
    prefix = Q(0)
    for i in range(n - 1):
        prefix += v[i]
        assert h[i][i + 1] != 0
        k[i][i + 1] = prefix / (2 * h[i][i + 1])
        k[i + 1][i] = -k[i][i + 1]
    assert [comm(k, h)[i][i] for i in range(n)] == v
    return k, r, mean


def check(h):
    n = len(h)
    assert all(h[i][i] == 0 for i in range(n))
    k, r, mean = flow_skew(h)
    chain = [h]
    for j in range(1, 4):
        t = comm(k, chain[-1])
        chain.append([[z / j for z in row] for row in t])
    # I + eps * exp(eps*K) H exp(-eps*K), truncated at eps^4.
    a = [[[Q(i == j), h[i][j], chain[1][i][j],
           chain[2][i][j], chain[3][i][j]]
          for j in range(n)] for i in range(n)]
    coefficients = pperm(a)
    expected = [Q(1), Q(0), trace(mm(h, h)) / 2,
                trace(mm(mm(h, h), h)) / 3,
                qk(h, 4) + sum((ri - mean) ** 2 for ri in r)]
    assert coefficients == expected, (n, coefficients, expected)
    print("order", n, "coefficients", list(map(str, coefficients)),
          "q4", qk(h, 4), "drift_gain",
          sum((ri - mean) ** 2 for ri in r))


if __name__ == "__main__":
    cases = [
        [[0, 1, 2], [1, 0, 3], [2, 3, 0]],
        [[0, 1, 2, 1], [1, 0, 3, 1],
         [2, 3, 0, 2], [1, 1, 2, 0]],
    ]
    for a in cases:
        check([[Q(z) for z in row] for row in a])
    checked = 0
    for n in (3, 4, 5):
        for seed in range(8):
            h = [[Q(0) for _ in range(n)] for _ in range(n)]
            for i in range(n):
                h[i][i] = Q((3 * i + 5 * seed) % 9 - 4)
                for j in range(i):
                    h[i][j] = h[j][i] = Q(
                        (3 * i + 5 * j + 2 * seed) % 7 - 3, 2)
            h[-1][-1] -= trace(h)
            h2, h3 = mm(h, h), mm(mm(h, h), h)
            d = [h[i][i] for i in range(n)]
            r = [sum(h[i][j] ** 2 for j in range(n) if j != i)
                 for i in range(n)]
            assert qk(h, 2) == trace(h2) / 2 - sum(t ** 2 for t in d)
            assert qk(h, 3) == trace(h3) / 3 - 2 * sum(
                t * z for t, z in zip(d, r))
            checked += 1
    print("traceless coefficient identity checks:", checked)
