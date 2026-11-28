"""Exact interval certificate for EQUITABLE-THREE.md.  Python 3, no packages.

It covers a real five-parameter box.  It does not enumerate input graphs.
Every interval operation is rounded outward on the fixed dyadic lattice.
"""
from dataclasses import dataclass

SCALE = 1 << 25
DIM = 5


def ceildiv(n, d):
    return -((-n) // d)


@dataclass(frozen=True, slots=True)
class Interval:
    lo: int
    hi: int

    @classmethod
    def q(cls, n, d=1):
        return cls(n*SCALE // d, ceildiv(n*SCALE, d))

    def __add__(self, other):
        return Interval(self.lo + other.lo, self.hi + other.hi)

    def __sub__(self, other):
        return Interval(self.lo - other.hi, self.hi - other.lo)

    def __mul__(self, other):
        p = (self.lo*other.lo, self.lo*other.hi,
             self.hi*other.lo, self.hi*other.hi)
        return Interval(min(p) // SCALE, ceildiv(max(p), SCALE))

    def __truediv__(self, other):
        if other.lo <= 0:
            raise ArithmeticError("denominator not certified positive")
        return self * Interval(SCALE*SCALE // other.hi,
                               ceildiv(SCALE*SCALE, other.lo))


ZERO = Interval.q(0)
ONE = Interval.q(1)


@dataclass(frozen=True, slots=True)
class Jet:
    value: Interval
    gradient: tuple = (ZERO,) * DIM

    def __add__(self, other):
        return Jet(self.value + other.value,
                   tuple(x+y for x, y in zip(self.gradient, other.gradient)))

    def __sub__(self, other):
        return Jet(self.value - other.value,
                   tuple(x-y for x, y in zip(self.gradient, other.gradient)))

    def __mul__(self, other):
        return Jet(self.value * other.value,
                   tuple(x*other.value+self.value*y
                         for x, y in zip(self.gradient, other.gradient)))

    def __truediv__(self, other):
        q = self.value / other.value
        return Jet(q, tuple((x-q*y)/other.value
                            for x, y in zip(self.gradient, other.gradient)))


def margins(box, jet=False, clipped_c=None):
    def constant(n, d=1):
        v = Interval.q(n, d)
        return Jet(v) if jet else v

    a, b, x, y, z = box
    c = clipped_c if clipped_c is not None else constant(1) - a - b
    one, two, eight, target = (constant(1), constant(2),
                               constant(8), constant(19, 500))

    def for_pivot(a, b, c, x, y, z):
        r, u, v = x/(a*b), y/(a*c), z/(b*c)
        mass = y+z
        h = y*u+z*v
        return ((target-x*(one-u-v))*mass-two*h*(mass-h))*(one-r) + eight*y*z*u*v*r

    return (for_pivot(a,b,c,x,y,z), for_pivot(a,c,b,y,x,z),
            for_pivot(b,c,a,z,x,y))


def verify():
    q = Interval.q
    lower, upper_b, upper_c = q(99,500).lo, q(401,1000).hi, q(151,250).hi
    third = q(1,3)
    edge = Interval(q(1,25).lo, q(2,25).hi)
    root = (Interval(lower,third.hi), Interval(lower,upper_b),
            edge, edge, edge)
    stack = [(root, 0)]
    seen = excluded = direct = derivative = maxdepth = 0

    while stack:
        box, depth = stack.pop()
        a,b,x,y,z = box
        seen += 1
        maxdepth = max(maxdepth, depth)
        c = ONE-a-b
        if (a.lo > b.hi or b.lo > c.hi or c.hi < third.lo
                or c.lo > upper_c or (x+y+z).lo > q(4,25).hi):
            excluded += 1
            continue
        cc = Interval(max(c.lo,third.lo), min(c.hi,upper_c))
        r,u,v = x/(a*b), y/(a*cc), z/(b*cc)
        if max((r+u).lo,(r+v).lo,(u+v).lo) > q(201,200).hi:
            excluded += 1
            continue
        if max(t.lo for t in margins(box, clipped_c=cc)) >= 0:
            direct += 1
            continue

        # The entire original box has a,b,c>0. The mean-value
        # inequality therefore applies from its center to every point,
        # including when that straight segment leaves the feasible set.
        center = tuple(Interval((t.lo+t.hi)//2, (t.lo+t.hi)//2) for t in box)
        disp = tuple(t-m for t,m in zip(box,center))
        jets = tuple(Jet(t, tuple(ONE if i==j else ZERO for j in range(DIM)))
                     for i,t in enumerate(box))
        proved = False
        for f, g in zip(margins(center), margins(jets,jet=True)):
            for h, shift in zip(g.gradient,disp):
                f = f+h*shift
            if f.lo >= 0:
                proved = True
                break
        if proved:
            derivative += 1
            continue

        j = max(range(DIM), key=lambda i: (box[i].hi-box[i].lo)*(1 if i<2 else 4))
        lo, hi = box[j].lo, box[j].hi
        mid = (lo+hi)//2
        if depth >= 85 or not lo < mid < hi:
            raise AssertionError((depth, box))
        leaf = lambda t: box[:j]+(t,)+box[j+1:]
        stack.append((leaf(Interval(lo,mid)), depth+1))
        stack.append((leaf(Interval(mid,hi)), depth+1))

    if seen != 2*(excluded+direct+derivative)-1:
        raise AssertionError("broken cover accounting")
    print(f"verified {seen} boxes, infeasible {excluded}, direct {direct}, "
          f"derivative {derivative}, max depth {maxdepth}")


if __name__ == "__main__":
    verify()
