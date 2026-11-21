"""Exact rational checks of the Gaussian deletion bound and the full cofactor inequality."""
from fractions import Fraction as F
from itertools import combinations, permutations
from math import prod
from random import Random

from verify_orthonormal_packets import permanent


def submatrix(a, rows, cols):
    return [[a[i][j] for j in cols] for i in rows]


def determinant(a):
    total = 0
    for perm in permutations(range(len(a))):
        inversions = sum(s > t for i, s in enumerate(perm) for t in perm[i+1:])
        total += (-1)**inversions * prod(a[i][j] for i, j in enumerate(perm))
    return total


def test(c):
    n = len(c)
    t = F(2, 3)
    a = [[(1-t)*int(i == j) + t*c[i][j] for j in range(n)] for i in range(n)]
    labels = range(n)
    values = {}
    cofactor_checks = deletions = 0
    for m in range(n+1):
        for subset in combinations(labels, m):
            values[subset] = permanent(submatrix(a, subset, subset))
            if not subset:
                continue
            omitted = [tuple(j for j in subset if j != i) for i in subset]
            z = values[subset]
            smaller = [values[s] for s in omitted]
            if m <= 4:
                # Multiply the asserted PSD matrix by Z^2, a positive scalar.
                margin = [[z*permanent(submatrix(a, s, u))
                           - ((1-t)*smaller[h]**2 if h == k else 0)
                           for k, u in enumerate(omitted)] for h, s in enumerate(omitted)]
                for degree in range(1, m+1):
                    for indices in combinations(range(m), degree):
                        assert determinant(submatrix(margin, indices, indices)) >= 0
                        cofactor_checks += 1
            for j, i in enumerate(subset):
                before = omitted[j]
                previous = values[before]
                correction = sum(c[i][h]**2 *
                                 (values[tuple(v for v in before if v != h)]/previous)**2
                                 for h in before)
                assert z/previous >= 1 + (1-t)*t*t*correction
                deletions += 1
    return cofactor_checks, deletions


if __name__ == '__main__':
    rng = Random(30711)
    sums = [0, 0]
    for n in range(3, 8):
        for ambient in (2, 4, 6):
            vectors = [[rng.choice([-1, 1]) for _ in range(ambient)] for _ in range(n)]
            c = [[F(sum(a*b for a,b in zip(u,v)), ambient) for v in vectors] for u in vectors]
            for i, total in enumerate(test(c)):
                sums[i] += total
    print(f'{sums[0]} cofactor principal minors and {sums[1]} deletion inequalities')
