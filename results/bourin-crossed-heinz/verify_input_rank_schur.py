from fractions import Fraction as F
from itertools import product


def solve(a, b):
    z = [list(row) + [v] for row, v in zip(a, b)]
    for i in range(len(z)):
        j = next(j for j in range(i, len(z)) if z[j][i])
        z[i], z[j] = z[j], z[i]
        s = z[i][i]
        z[i] = [v / s for v in z[i]]
        for j in range(len(z)):
            if i != j:
                s = z[j][i]
                z[j] = [u - s*v for u, v in zip(z[j], z[i])]
    return [row[-1] for row in z]


def independent_moments(x, q):
    return [F(1), x, x*x, 1/(q - x**3)]


def prune(x, w, q):
    x, w = list(x), list(w)
    while len(w) > 4:
        moments = list(zip(*(independent_moments(y, q) for y in x[:5])))
        h = solve([row[:4] for row in moments], [-row[4] for row in moments])
        h += [F(1)] + [F(0)]*(len(w)-5)
        step = min(a/b for a, b in zip(w, h) if b > 0)
        w = [a-step*b for a, b in zip(w, h)]
        entries = [(y, a) for y, a in zip(x, w) if a > 0]
        x, w = map(list, zip(*entries))
    return x, w


def moments(x, w, q):
    return [sum(v*a for v, a in zip(row, w))
            for row in zip(*(independent_moments(y, q) for y in x))]


def low_quotient(x, w, q):
    # Standard coordinates have weighted inner product diag(w). The unit
    # vector is constant 1 and the remaining explicit vectors span its
    # orthogonal complement. All congruences are exact over the rationals.
    n = len(x)
    basis = [[F(1)]*n]
    for i in range(n-1):
        v = [F(0)]*n
        v[i], v[-1] = F(1), -w[i]/w[-1]
        basis.append(v)
    a = [[sum(wi*(q-y**3)*ui*vi for wi, y, ui, vi in zip(w, x, u, v))
          for v in basis] for u in basis]
    if n == 1:
        return a[0][0]
    c = solve([row[1:] for row in a[1:]], [row[0] for row in a[1:]])
    return a[0][0]-sum(cj*d for cj, d in zip(c, a[0][1:]))


instances = 0
for q, high, size in product([F(1),F(2),F(5,2)], [F(8),F(27)], [7,9]):
    x = [F(i, size+1) for i in range(size)]
    for weights in ([F(1,size)]*size,
                    [F(2*(i+1),size*(size+1)) for i in range(size)]):
        x1, w1 = prune(x,weights,q)
        old = moments(x, weights, q)
        assert len(x1) == 4 and moments(x1,w1,q) == old
        s0, s1 = low_quotient(x,weights,q), low_quotient(x1,w1,q)
        assert s0 == s1 == 1/old[-1] > 0
        # On the retained two-space choose K rank one and R indefinite,
        # with a singular positive Schur complement [[1,2],[2,4]].
        bh, bl = 1-(q-high), 4-s0
        assert bl > 0
        k = bh+1
        rh, rl, off = k-bh, -bl, -2
        assert rh*rl-off**2 < 0 and k > 0
        for s in (s0,s1):
            assert (q-high+k-rh, -off, s-rl) == (1,2,4)
            assert (q-high+k-rh)*(s-rl)-off**2 == 0
            assert (q-high+k-rh-1)*(s-rl)-off**2 < 0
        instances += 1
print(f'{instances} rational low-spectrum prunings, all with a retained high direction, indefinite R, singular positive budget and a failing downward perturbation.')
