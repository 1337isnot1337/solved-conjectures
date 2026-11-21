"""Exact convention checks for the Novelli--Thibon manuscript.

These finite checks are not the proof.  The verifier independently converts
the permutation expansion to Schur coefficients through Kostka numbers and
checks the source's full (mu,lambda)=((2,2,2),(3,2,1)) example.
No network and no proof assistant are used.
"""
from collections import Counter
from functools import lru_cache
from itertools import permutations
from math import comb
import json


@lru_cache(None)
def partitions(n, maximum=None):
    if n == 0:
        return ((),)
    if maximum is None or maximum > n:
        maximum = n
    return tuple((a,) + tail for a in range(maximum, 0, -1)
                 for tail in partitions(n-a, a))


@lru_cache(None)
def kostka(shape, content):
    """Count SSYT via successive horizontal strips for each letter."""
    if not content:
        return int(not shape)
    size = sum(shape)-content[-1]
    total = 0
    for inner in partitions(size):
        if len(inner) > len(shape):
            continue
        padded = inner+(0,)*(len(shape)-len(inner))
        if all(shape[i] >= padded[i] >=
               (shape[i+1] if i+1 < len(shape) else 0)
               for i in range(len(shape))):
            total += kostka(inner, content[:-1])
    return total


@lru_cache(None)
def vertical_two_tableaux(shape):
    if sum(shape) == 2:
        return int(shape == (1, 1))
    if sum(shape) < 2:
        return 0
    total = 0
    for i, a in enumerate(shape):
        if i+1 == len(shape) or a > shape[i+1]:
            child = list(shape)
            child[i] -= 1
            total += vertical_two_tableaux(tuple(x for x in child if x))
    return total


def graph_data(mu):
    # French rows indexed from zero at the bottom. Reading order is top down.
    cells = [(r, c) for r in range(len(mu)-1, -1, -1)
             for c in range(mu[r])]
    indices = {cell: i for i, cell in enumerate(cells)}
    edges = []
    for i, (r, c) in enumerate(cells):
        for j, (s, d) in enumerate(cells):
            if i < j and (r == s or (r == s+1 and d < c)):
                edges.append((i, j))
    vertical = []
    for i, (r, c) in enumerate(cells):
        if r:
            arm = mu[r]-c-1
            leg_label = 1+sum(mu[s] > c for s in range(r+1, len(mu)))
            vertical.append((i, indices[(r-1, c)], arm, leg_label))
    return edges, vertical


def fundamental_coefficients(mu):
    n = sum(mu)
    edges, vertical = graph_data(mu)
    result = {}
    for sigma in permutations(range(n)):
        exponent = [0]*len(mu)
        exponent[0] = sum(sigma[i] > sigma[j] for i, j in edges)
        for i, j, arm, label in vertical:
            if sigma[i] > sigma[j]:
                exponent[0] -= arm
                exponent[label] += 1
        assert min(exponent) >= 0
        inverse = [0]*n
        for i, value in enumerate(sigma):
            inverse[value] = i
        descents = frozenset(i+1 for i in range(n-1)
                             if inverse[i] > inverse[i+1])
        result.setdefault(descents, Counter())[tuple(exponent)] += 1
    return result


def schur_coefficients(mu):
    n = sum(mu)
    ps = partitions(n)
    fund = fundamental_coefficients(mu)
    monomial = {}
    for rho in ps:
        cuts, partial = set(), 0
        for part in rho[:-1]:
            partial += part
            cuts.add(partial)
        value = Counter()
        for desc, poly in fund.items():
            if desc <= cuts:
                value.update(poly)
        monomial[rho] = value
    schur = {}
    for rho in ps:
        value = monomial[rho].copy()
        for lam, poly in schur.items():
            k = kostka(lam, rho)
            for exponent, coefficient in poly.items():
                value[exponent] -= k*coefficient
        assert kostka(rho, rho) == 1
        schur[rho] = {e: c for e, c in value.items() if c}
    return schur


def main():
    checked = 0
    for n in range(1, 7):
        for mu in partitions(n):
            for lam, polynomial in schur_coefficients(mu).items():
                d = vertical_two_tableaux(lam)
                moments = [sum(e[j]*c for e, c in polynomial.items())
                           for j in range(len(mu))]
                expected = [sum(comb(a, 2) for a in mu)*d]
                expected += [mu[j]*d for j in range(1, len(mu))]
                assert moments == expected, (mu, lam, moments, expected)
                checked += 1
    source_example = {
        (3,1,0):1, (3,0,1):1, (2,2,0):1, (2,1,1):2,
        (2,0,2):1, (1,2,1):1, (1,1,2):1, (2,1,0):1,
        (2,0,1):1, (1,2,0):1, (1,1,1):2, (1,0,2):1,
        (0,2,1):1, (0,1,2):1,
    }
    assert schur_coefficients((2,2,2))[(3,2,1)] == source_example
    assert vertical_two_tableaux((3,2,1)) == 8
    assert vertical_two_tableaux((2,2,2)) == 3
    report = {
        "status": "passed",
        "partition_pairs_checked": checked,
        "sizes": "1 through 6; finite convention checks only",
        "source_example": "arXiv:2502.09072v2, after Conjecture 5.7",
        "source_example_exact_polynomial_match": True,
        "d_321": 8,
        "d_222": 3,
        "proof": "Universal word-comparison and Pieri argument in proof.md",
    }
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
