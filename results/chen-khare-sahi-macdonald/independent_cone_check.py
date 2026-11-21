"""Independent exact cone audit for Chen--Khare--Sahi Conjecture 5.

No imports from the proposing agent's scripts; standard library only.
"""

from fractions import Fraction as Q
from itertools import permutations, combinations_with_replacement


def partitions(d):
    return [(i, j, d-i-j)
            for i in range(d, -1, -1)
            for j in range(min(i, d-i), -1, -1)
            if 0 <= d-i-j <= j]


def majorizes(p, r):
    return sum(p) == sum(r) and p[0] >= r[0] and sum(p[:2]) >= sum(r[:2])


def monomial(p):
    orbit = set(permutations(p))
    return {e: Q(1, len(orbit)) for e in orbit}


def subtract(p, r):
    out = dict(p)
    for e, a in r.items():
        out[e] = out.get(e, Q(0)) - a
    return {e: a for e, a in out.items() if a}


def multiply(p, r):
    out = {}
    for e, a in p.items():
        for f, b in r.items():
            g = tuple(e[i]+f[i] for i in range(3))
            out[g] = out.get(g, Q(0)) + a*b
    return {e: a for e, a in out.items() if a}


weights = dict(zip(partitions(6), (62, 28, 9, 9, 2, 2, 0)))


def functional(p):
    assert all(sum(e) == 6 for e in p)
    for e, a in p.items():
        assert all(p.get(f, Q(0)) == a for f in set(permutations(e)))
    return sum((a * weights[tuple(sorted(e, reverse=True))]
                for e, a in p.items()), Q(0))


def label(p):
    return ''.join(map(str, p))


basic = []
for d in range(2, 7):
    pp = partitions(d)
    for p in pp:
        for r in pp:
            if p == r or not majorizes(p, r):
                continue
            if any(s != p and s != r and majorizes(p, s) and majorizes(s, r)
                   for s in pp):
                continue
            basic.append((d, label(p)+'-'+label(r),
                          subtract(monomial(p), monomial(r))))


rows = []
for d, name, poly in basic:
    for p in partitions(6-d):
        rows.append(('one', f'({name})M{label(p)}',
                     functional(multiply(poly, monomial(p)))))
assert len(rows) == 27

for left, right in combinations_with_replacement(basic, 2):
    d, name, poly = left
    e, name2, poly2 = right
    if d+e > 6:
        continue
    for p in partitions(6-d-e):
        rows.append(('two', f'({name})({name2})M{label(p)}',
                     functional(multiply(multiply(poly, poly2), monomial(p)))))
assert len(rows) == 37

d, name, poly = basic[0]
assert d == 2
rows.append(('three', f'({name})^3', functional(multiply(multiply(poly, poly), poly))))
assert len(rows) == 38
assert all(value >= 0 for _, _, value in rows)
assert all(functional(monomial(p)) >= 0 for p in partitions(6))

if __name__ == '__main__':
    for kind, expr, value in rows:
        print(kind, expr, value)
    print('PASS: 38 reduced products and all 7 pure monomials.')
