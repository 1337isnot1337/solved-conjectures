#!/usr/bin/env python3
"""Audit independent frame parameters and every five-line stabilizer witness."""
from itertools import combinations, product


def verify(q):
    d = next(k for k in range(2, q) if pow(k, (q - 1) // 2, q) == q - 1)

    class F:
        def __init__(self, a, b=0):
            self.a, self.b = a % q, b % q

        def __add__(self, other):
            g = cast(other)
            return F(self.a + g.a, self.b + g.b)

        __radd__ = __add__
        def __rsub__(self, other):
            return cast(other) + (-self)


        def __neg__(self):
            return F(-self.a, -self.b)

        def __sub__(self, other):
            return self + (-cast(other))

        def __mul__(self, other):
            g = cast(other)
            return F(self.a*g.a + d*self.b*g.b, self.a*g.b + self.b*g.a)

        __rmul__ = __mul__

        def __truediv__(self, other):
            g = cast(other)
            return self * g.conj() * pow(g.norm(), -1, q)

        def conj(self):
            return F(self.a, -self.b)

        def norm(self):
            return (self.a**2 - d*self.b**2) % q

        def __eq__(self, other):
            g = cast(other)
            return (self.a, self.b) == (g.a, g.b)

        def __hash__(self):
            return hash((self.a, self.b))

    def cast(x):
        return x if isinstance(x, F) else F(x)

    def canon(x):
        pivot = next((a for a in x if a != 0), None)
        return None if pivot is None else tuple(a / pivot for a in x)

    def cross(x, y):
        a, b, c = x
        u, v, w = y
        return (b*w-c*v, c*u-a*w, a*v-b*u)

    def dot(x, y):
        return sum(a*b for a, b in zip(x, y))

    def signed(x, y):
        return dot((*x[:2], -x[2]), tuple(a.conj() for a in y))

    a, b = F(12)/13, F(5)/13

    def T(p):
        x, y, z = p
        den = 1-b*b
        return x, (2*b*z-(1+b*b)*y)/den, ((1+b*b)*z-2*b*y)/den

    u = (F(1), F(0), F(0))
    v = (b, -a, F(0))
    w = T(v)
    w = (w[0], w[1], -w[2])  # transpose action on covectors, T^t = J T J
    p1, q1 = (F(0), F(1), F(1)), (a, b, F(1))
    edges = ((0,3),(0,4),(1,3),(1,4),(3,4),
             (0,5),(0,6),(2,5),(2,6),(5,6),(1,2))

    def pair(x, y):
        return F(signed(x, y).norm()) / (signed(x, x)*signed(y, y))

    def det(x, y, z):
        return dot(x, cross(y, z))

    norms = [F(x,y) for x,y in product(range(q),repeat=2) if F(x,y).norm()==1]
    movable = {}
    for lam in norms:
        p2, q2 = (F(0), -lam, F(1)), (a*lam, b*lam, F(1))
        movable[lam] = cross(p2, q2), cross(T(p2), T(q2))

    A, C = cross(p1,q1), cross(T(p1),T(q1))
    good, witnesses, fibers = 0, 0, {}
    for lam, mu in product(norms,repeat=2):
        B, D = movable[lam][0], movable[mu][1]
        raw = (u,v,w,A,B,C,D)
        lines = tuple(map(canon, raw))
        if None in lines or len(set(lines)) != 7:
            continue
        points = [canon(cross(lines[i],lines[j])) for i,j in edges]
        if len(set(points)) != 9 or not points[2] == points[7] == points[10]:
            continue
        if any(signed(p,p) != 0 for p in points):
            continue
        if not all(det(*triple) != 0 for triple in combinations((u,v,w,B),3)):
            continue
        good += 1
        both = pair(B,w), pair(D,v)
        fibers[both] = fibers.get(both,0) + 1
        nonorthogonal = {(i,j) for i,j in combinations(range(7),2)
                         if signed(raw[i],raw[j]) != 0}
        generators = []
        for i,j,k in combinations(range(7),3):
            if det(raw[i],raw[j],raw[k]) == 0:
                continue
            if sum(e in nonorthogonal for e in ((i,j),(i,k),(j,k))) >= 2:
                generators.append({i,j,k})
        for subset in combinations(range(7),5):
            assert any(t <= set(subset) for t in generators)
            witnesses += 1
    assert good > q*q//3, (q,good)
    assert max(fibers.values()) <= 4
    return good, witnesses


if __name__ == "__main__":
    primes = (17,19,29,37,43,53,61)
    results = [verify(p) for p in primes]
    print(sum(x for x,_ in results), "good parameter pairs;",
          sum(y for _,y in results), "five-line stabilizer witnesses; max joint fiber ≤4")
