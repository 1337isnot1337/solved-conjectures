"""Regenerate and check the exact data used by the Lean proof of the Jack witness.

Standard library only. Five variables, degree five, alpha = 2/3 (target tau = 3/2).

* Normalized Schur values (Jacobi--Trudi) at the evaluation points
  (1,1,1,0,0), (2,1,0,0,0), (1,1,1,1,0) and at (1,1,1,1,1).
* For each degree d <= 5 the value vectors of all degree-d generator products,
  closure of these lists under multiplication, and nonnegativity of
  L = -45 f(1,1,1,0,0) + 10 f(2,1,0,0,0) + 18 f(1,1,1,1,0) on degree five.
* The monic Jack family by Gram--Schmidt for <p_l, p_m> = delta z_l alpha^len(l),
  its dual vectors, and L of the normalized Jack difference, which is -3/4522.
"""

from collections import Counter
from fractions import Fraction as Q
from itertools import permutations, product
from math import factorial, prod

N = 5
PTS = [(1, 1, 1, 0, 0), (2, 1, 0, 0, 0), (1, 1, 1, 1, 0)]
ONES = (1,) * N
WEIGHTS = (-45, 10, 18)
ALPHA = Q(2, 3)


def partitions(n, largest=None):
    if n == 0:
        yield ()
        return
    for first in range(min(n, largest or n), 0, -1):
        for rest in partitions(n - first, first):
            yield (first,) + rest


def pad(p):
    return tuple(p) + (0,) * (N - len(p))


def h(k, x):
    """Complete homogeneous symmetric polynomial h_k at x."""
    if k < 0:
        return 0
    table = [1] + [0] * k
    for v in x:
        for j in range(1, k + 1):
            table[j] += v * table[j - 1]
    return table[k]


def det(m):
    if not m:
        return 1
    return sum((-1) ** j * m[0][j] * det([row[:j] + row[j + 1:] for row in m[1:]])
               for j in range(len(m)))


def schur(p, x):
    lam = pad(p)
    return det([[h(lam[i] - i + j, x) for j in range(N)] for i in range(N)])


def dominates(a, b):
    a, b = pad(a), pad(b)
    return sum(a) == sum(b) and all(sum(a[:r]) >= sum(b[:r]) for r in range(1, N + 1))


def mul(u, w):
    return tuple(x * y for x, y in zip(u, w))


ALL = [p for d in range(N + 1) for p in partitions(d)]
RAW = {p: [schur(p, x) for x in PTS + [ONES]] for p in ALL}
VEC = {p: tuple(Q(RAW[p][i], RAW[p][3]) for i in range(3)) for p in ALL}

generators = {d: set() for d in range(N + 1)}
for a in ALL:
    generators[sum(a)].add(VEC[a])
    for b in ALL:
        if dominates(a, b):
            generators[sum(a)].add(tuple(x - y for x, y in zip(VEC[a], VEC[b])))
tab = {0: {(Q(1), Q(1), Q(1))} | generators[0]}
for d in range(1, N + 1):
    tab[d] = set(generators[d])
    for k in range(1, d):
        tab[d] |= {mul(u, w) for u in generators[k] for w in tab[d - k]}
for n in range(N + 1):
    for m in range(N + 1 - n):
        assert all(mul(u, w) in tab[n + m] for u in tab[n] for w in tab[m])
for a in ALL:
    assert VEC[a] in tab[sum(a)]
    for b in ALL:
        if dominates(a, b):
            assert tuple(x - y for x, y in zip(VEC[a], VEC[b])) in tab[sum(a)]
L = lambda v: sum(c * x for c, x in zip(WEIGHTS, v))
assert all(L(v) >= 0 for v in tab[5])

# Jack family in the monomial basis, partitions of five in increasing dominance order.
IDX = sorted(partitions(5))
orbit = {p: sorted(set(permutations(pad(p)))) for p in IDX}


def power_product(shape):
    poly = Counter({(0,) * N: 1})
    for part in shape:
        new = Counter()
        for e, c in poly.items():
            for i in range(N):
                f = list(e)
                f[i] += part
                new[tuple(f)] += c
        poly = new
    return poly


A = [[power_product(nu)[pad(mu)] for mu in IDX] for nu in IDX]  # p_nu = sum A m_mu


def inverse(m):
    n = len(m)
    a = [[Q(x) for x in row] + [Q(int(i == j)) for j in range(n)] for i, row in enumerate(m)]
    for c in range(n):
        r = next(r for r in range(c, n) if a[r][c])
        a[c], a[r] = a[r], a[c]
        a[c] = [x / a[c][c] for x in a[c]]
        for r in range(n):
            if r != c and a[r][c]:
                a[r] = [x - a[r][c] * y for x, y in zip(a[r], a[c])]
    return [row[n:] for row in a]


B = inverse(A)  # m_mu = sum B p_nu
z = lambda l: prod(k ** c * factorial(c) for k, c in Counter(l).items())
W = [z(l) * ALPHA ** len(l) for l in IDX]


def form(u, v):
    pu = [sum(u[i] * B[i][j] for i in range(7)) for j in range(7)]
    pv = [sum(v[i] * B[i][j] for i in range(7)) for j in range(7)]
    return sum(pu[j] * pv[j] * W[j] for j in range(7))


jack = []
for i in range(7):
    v = [Q(int(k == i)) for k in range(7)]
    for w in jack:
        c = form(v, w) / form(w, w)
        v = [x - c * y for x, y in zip(v, w)]
    jack.append(v)
dual = [[form([Q(int(k == a)) for k in range(7)], jack[j]) for a in range(7)] for j in range(7)]


def mono(i, x):
    return sum(prod(x[k] ** e[k] for k in range(N)) for e in orbit[IDX[i]])


def jack_value(i, x):
    return sum(jack[i][k] * mono(k, x) for k in range(7))


i32, i311 = IDX.index((3, 2)), IDX.index((3, 1, 1))
target = tuple(Q(jack_value(i32, x)) / jack_value(i32, ONES)
               - Q(jack_value(i311, x)) / jack_value(i311, ONES) for x in PTS)
assert (jack_value(i32, ONES), jack_value(i311, ONES)) == (Q(2261, 10), Q(1938, 13))
assert L(target) == Q(-3, 4522)

print("table sizes", {d: len(tab[d]) for d in tab})
print("Jack family (monomial coordinates, increasing dominance):")
for p, row in zip(IDX, jack):
    print(" ", p, [str(x) for x in row])
print("dual vectors <e_a, P_j>:")
for p, row in zip(IDX, dual):
    print(" ", p, [str(x) for x in row])
print("L(normalized Jack difference) =", L(target))
print("All Lean certificate checks passed.")
