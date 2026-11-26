#!/usr/bin/env python3
"""Check the rational Hermitian spindle pencil and orbit invariants over prime fields."""
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

    accepted = 0
    values, ratios = {}, {}
    for x, y in product(range(q), repeat=2):
        lam = F(x, y)
        if lam.norm() != 1:
            continue
        p2, q2 = (F(0), -lam, F(1)), (a*lam, b*lam, F(1))
        A, B = cross(p1, q1), cross(p2, q2)
        C, D = cross(T(p1), T(q1)), cross(T(p2), T(q2))
        lines = tuple(map(canon, (u,v,w,A,B,C,D)))
        if None in lines or len(set(lines)) != 7:
            continue
        points = [canon(cross(lines[i], lines[j])) for i, j in edges]
        if len(set(points)) != 9 or not points[2] == points[7] == points[10]:
            continue
        if any(signed(p, p) != 0 for p in points):
            continue
        basis = (u,v,w,B)
        if not all(dot(x,cross(y,z)) != 0 for x,y,z in combinations(basis,3)):
            continue
        for j in range(7):  # Every listed line contains two distinct unital points.
            assert len({p for e,p in zip(edges,points) if j in e}) >= 2
        assert not any(all(tuple(sorted(e)) not in edges for e in combinations(t,2))
                       for t in combinations(range(7),3))
        accepted += 1
        pv = pair(B, w)
        assert pv == pair(D, v)
        values[pv] = values.get(pv, 0) + 1
        s = -lam
        # The cross ratio uses projective coordinates, including infinity.
        _, py, pz = T(p2)
        ratio = (s-1)*(py+pz)/((s+1)*(py-pz))
        ratios[ratio] = ratios.get(ratio, 0) + 1
    assert accepted >= q-20 and accepted > 0, (q, accepted)
    assert max(values.values()) <= 2 and max(ratios.values()) <= 2
    return accepted


if __name__ == "__main__":
    primes = [p for p in range(17, 152)
              if all(p % d for d in range(2, 1+int(p**0.5)))]
    counts = [verify(p) for p in primes]
    print(f"{sum(counts)} parameter frames across {len(primes)} prime fields; both invariant fibers ≤2")
