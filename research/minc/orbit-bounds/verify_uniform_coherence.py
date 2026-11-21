"""Outward scalar certificates and exact checks of the cycle elimination and Gram estimates."""
from fractions import Fraction as F
from itertools import combinations
from math import prod
from random import Random

from verify_correlation_energy import determinant, submatrix
from verify_irregular_correlations import lower_gap
from verify_flat_correlations import log_bound
from verify_orthonormal_packets import permanent


def positive_intervals(lo, hi, use_resolvent):
    pending = [(lo, hi)]
    count = 0
    while pending:
        lo, hi = pending.pop()
        if lower_gap(lo, hi, use_resolvent) >= F(1, 10**5):
            count += 1
            continue
        assert hi-lo > F(1, 2**40)
        middle = (lo+hi)/2
        pending.extend([(lo, middle), (middle, hi)])
    return count


def constants():
    delta, e, beta = (F(1, 10**k) for k in (16, 32, 64))
    margin = F(1, 10**9)
    mix = F(1, 10**7)
    assert (1-mix)/10**5 - 50*mix > margin and mix/93 > margin
    assert log_bound(1/e, True) < 75
    # Coefficients here are normalized by J+L.
    trace = F(1,10**32)/delta + (3*beta+delta)/(1-delta)
    assert beta/(2*(1-delta)) + 2*e/delta + 75*trace < F(1,10**12)
    assert log_bound(F(4),False)+1-F(1156,1000)-F(4,5)-F(2,25) > F(1,10**5)
    return (positive_intervals(F(1,100), F(31,100), True)
            + positive_intervals(F(31,100), F(5), False))


def adjugate(matrix):
    n = len(matrix)
    return [[(-1)**(i+j)*determinant(submatrix(matrix, [k for k in range(n) if k != j],
                                               [k for k in range(n) if k != i]))
             for j in range(n)] for i in range(n)]


def eliminate(w, tail, q, d):
    head = [i for i in range(len(w)) if i not in tail]
    dt = prod(d[i] for i in tail)
    m = [[(d[i] if i == j else 0)-w[i][j] for j in tail] for i in tail]
    det = determinant(m)
    assert det > 0
    adj = adjugate(m)
    z = [[int(i == j)+w[i][j]+sum(w[i][s]*adj[a][b]*w[t][j]
                                  for a,s in enumerate(tail) for b,t in enumerate(tail))/det
          for j in head] for i in head]
    assert q <= dt**2 * permanent(z)/det
    delta = max((sum(w[i][j] for j in tail) for i in tail), default=0)
    beta = max(map(max,w))
    for h in head:
        energy = sum(w[h][j]**2 for j in tail)
        assert energy <= 2*beta+delta


def examples():
    rng = Random(103042)
    # Unit phases encoded by powers of i; all Gram squared moduli below are rational.
    count = 0
    for n in (4,5,6):
        for ambient in (2,3,5):
            vectors = [[rng.randrange(4) for _ in range(ambient)] for _ in range(n)]
            for damping in (F(1,4),F(1,2)):
                w = []
                for i,v in enumerate(vectors):
                    row = []
                    for j,z in enumerate(vectors):
                        c = [(x-y)%4 for x,y in zip(v,z)]
                        norm = (c.count(0)-c.count(2))**2 + (c.count(1)-c.count(3))**2
                        row.append(damping**2*F(norm,ambient**2) if i != j else F(0))
                    w.append(row)
                q = permanent([[int(i == j)+w[i][j] for j in range(n)] for i in range(n)])
                for size in (1,2,3):
                    for tail in combinations(range(n),size):
                        for d in ([F(1)]*n,[1+F((i+1)**2,19) for i in range(n)]):
                            eliminate(w,tail,q,d)
                            count += 1
    return count


if __name__ == '__main__':
    print(f'{constants()} outward intervals and {examples()} exact complex-Gram elimination checks')
