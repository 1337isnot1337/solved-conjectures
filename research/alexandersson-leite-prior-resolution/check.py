"""Exact coefficient certificates for Alexandersson--Saud Maia Leite Conj3.14.

Standard library only. Three independent counting formulas are compared:
  1. bounded Dyck walks, directly tracking the current height;
  2. the two-wall reflection sum of binomial coefficients;
  3. bounded bicolored Motzkin excursions of length n-1.
The infinite-family conclusion is proved in PROOF.md, not by this program.
"""
import argparse
import json
from math import comb
from pathlib import Path


def dyck_bounded(n, h):
    if h < 0:
        return 0
    v = [1] + [0] * h
    for _ in range(2*n):
        v = [(v[i-1] if i else 0) + (v[i+1] if i < h else 0)
             for i in range(h+1)]
    return v[0]


def choose(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def dyck_reflection(n, h):
    if h < 0:
        return 0
    period = h+2
    return sum(choose(2*n, n+j*period) - choose(2*n, n+j*period+1)
               for j in range(-n//period-2, n//period+3))


def motzkin_bounded(n, h, connected=False):
    if h < 0:
        return 0
    v = [1] + [0]*h
    for _ in range(n-1):
        v = [(1 if connected and i == 0 else 2)*v[i]
             + (v[i-1] if i else 0) + (v[i+1] if i < h else 0)
             for i in range(h+1)]
    return v[0]


def dyck_coefficient(n, i, connected, method):
    if i < 1:
        return 0
    semilength = n-int(connected)
    upper = 2*i-int(connected)
    return method(semilength, upper) - method(semilength, upper-2)


def motzkin_coefficient(n, i, connected):
    return (motzkin_bounded(n, i-1, connected)
            - motzkin_bounded(n, i-2, connected)) if i >= 1 else 0


def certificate(n, i, connected, normalization):
    triple = [dyck_coefficient(n, j, connected, dyck_bounded)
              for j in [i-1, i, i+1]]
    assert triple == [dyck_coefficient(n, j, connected, dyck_reflection)
                      for j in [i-1, i, i+1]]
    assert triple == [motzkin_coefficient(n, j, connected)
                      for j in [i-1, i, i+1]]
    degree = (n+1)//2
    if normalization == 'poisson':
        left = i*triple[1]**2
        right = (i+1)*triple[0]*triple[2]
    else:
        assert normalization == 'degree'
        left = i*(degree-i)*triple[1]**2
        right = (i+1)*(degree-i+1)*triple[0]*triple[2]
    assert left < right
    return dict(n=n, degree=degree, index=i, connected=connected,
                normalization=normalization, triple=triple,
                left=left, right=right, margin=left-right)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    for n in range(1, 13):
        for connected in [False, True]:
            row = [dyck_coefficient(n, i, connected, dyck_bounded)
                   for i in range(1, (n+1)//2+1)]
            assert row == [motzkin_coefficient(n, i, connected)
                           for i in range(1, (n+1)//2+1)]
            N = n-int(connected)
            assert sum(row) == comb(2*N, N)//(N+1)
    # Source examples from Section3.1, Table2 / the exact Dyck-height formula.
    assert [motzkin_coefficient(5,i,False) for i in range(4)] == [0,16,25,1]
    assert [motzkin_coefficient(5,i,True) for i in range(4)] == [0,1,12,1]
    results = [certificate(210,17,False,'poisson'),
               certificate(222,18,True,'poisson'),
               certificate(130,15,False,'degree'),
               certificate(139,16,True,'degree')]
    path = Path(__file__).with_name('witnesses.json')
    if args.write:
        path.write_text(json.dumps(results,indent=2)+'\n')
    else:
        assert results == json.loads(path.read_text())
    for r in results:
        family = 'connected' if r['connected'] else 'unrestricted'
        print(f"{family}, n={r['n']}, index={r['index']}, "
              f"{r['normalization']}: exact negative margin; "
              'all three coefficient formulas agree')
    print('Source examples and Catalan normalization checks passed.')


if __name__ == '__main__':
    main()
