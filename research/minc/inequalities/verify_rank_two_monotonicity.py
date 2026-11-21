"""Exact checks of the rank-two Dirichlet inequality and its endpoint identity."""
from fractions import Fraction as Q
from itertools import combinations, permutations
from math import comb, factorial


def density(probs, ref):
    law = [Q(1)]
    for p in probs:
        nxt = [Q(0)] * (len(law) + 1)
        for k, mass in enumerate(law):
            nxt[k] += (1 - p) * mass
            nxt[k + 1] += p * mass
        law = nxt
    return [v / b for v, b in zip(law, ref)]


def binomial(n, p):
    return [comb(n, k) * p**k * (1 - p)**(n-k) for k in range(n + 1)]


def slopes(values):
    return [b - a for a, b in zip(values, values[1:])]


def occupation_checks():
    pairs = opposed = missing = 0
    for n in range(2, 11):
        for h in range(n):
            for delta in [Q(1, 5), Q(1, 2), Q(4, 5)]:
                m = h + delta
                p = m / n
                ref = binomial(n, p)
                w = [(n-k)*p*ref[k] for k in range(n)]
                densities = []
                for s in range(h + 1):
                    for z in range(n - h):
                        c = (m-s) / (n-s-z)
                        probs = [Q(1)]*s + [c]*(n-s-z) + [Q(0)]*z
                        f = density(probs, ref)
                        densities.append((f, slopes(f)))
                for i, (f, df) in enumerate(densities):
                    for g, dg in densities[i:]:
                        terms = [weight*x*y for weight, x, y in zip(w, df, dg)]
                        assert sum(terms) >= 0
                        pairs += 1
                        if terms[h] < 0:
                            opposed += 1
                            assert 0 < h < n-1
                            assert terms[h-1]*terms[h+1] >= terms[h]**2
                            assert all(v >= 0 for k, v in enumerate(terms) if k != h)
                            if not all((f[h-1], f[h+2], g[h-1], g[h+2])):
                                missing += 1
    assert missing > 0
    return pairs, opposed, missing


def matching_sum(A, k):
    n = len(A)
    total = Q(0)
    for rows in combinations(range(n), k):
        for cols in permutations(range(n), k):
            value = Q(1)
            for i, j in zip(rows, cols):
                value *= A[i][j]
            total += value
    return total


def endpoint_checks():
    tests = [
        ([0, 0, 6, 7], [1, 3, 4, 5]),
        ([7, 3, 3, 0, 0], [0, 1, 3, 4, 5]),
        ([0, 7, 2, 5, 1, 0], [3, 1, 5, 4, 2, 0]),
        ([7, 7, 0, 0, 0], [0, 1, 3, 3, 7]),
    ]
    for aa, bb in tests:
        a, b = [[Q(x, 7) for x in vec] for vec in (aa, bb)]
        n = len(a)
        p = sum(a)/n
        assert sum(b) == n*p
        ref = binomial(n, p)
        A = [[(1+(x-p)*(y-p)/(p*(1-p)))/n for y in b] for x in a]
        d = Q(factorial(n), n**n)
        df, dg = (slopes(density(vec, ref)) for vec in (a, b))
        form = sum(ref[k]*(n-k)*p*df[k]*dg[k] for k in range(n))
        sums = [matching_sum(A, k) for k in range(n+1)]
        assert d*form == n*sums[n] - sums[n-1]/n
        assert all(n*k*sums[k] >= (n-k+1)**2*sums[k-1] for k in range(2,n+1))
    return len(tests)


if __name__ == "__main__":
    print("pairs, opposed central slopes, missing neighbor sites:", occupation_checks())
    print("direct subpermanent checks:", endpoint_checks())
