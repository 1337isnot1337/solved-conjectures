"""Exact ancillary checks for PROOF-DIM5.md (Python 3 standard library only).

Run: python verify_dim5.py
Formal polynomial identities and rational margins are checked, not sampled.
The written proof covers all points and the existence of the chart widths.
"""

from collections import defaultdict
from fractions import Fraction as Q


class Poly:
    """Sparse Q-polynomial: a monomial is a sorted tuple of variable names."""

    def __init__(self, terms):
        self.terms = {word: Q(c) for word, c in terms.items() if c}

    @staticmethod
    def coerce(x):
        return x if isinstance(x, Poly) else Poly({(): x})

    def __add__(self, other):
        coeffs = self.terms.copy()
        for word, c in self.coerce(other).terms.items():
            coeffs[word] = coeffs.get(word, 0) + c
        return Poly(coeffs)

    __radd__ = __add__

    def __neg__(self):
        return Poly({word: -c for word, c in self.terms.items()})

    def __sub__(self, other):
        return self + (-self.coerce(other))

    def __rsub__(self, other):
        return self.coerce(other) + (-self)

    def __mul__(self, other):
        coeffs = defaultdict(Q)
        for m, a in self.terms.items():
            for n, b in self.coerce(other).terms.items():
                coeffs[tuple(sorted(m + n))] += a * b
        return Poly(coeffs)

    __rmul__ = __mul__

    def __pow__(self, n):
        if not isinstance(n, int) or n < 0:
            raise ValueError("polynomial exponent must be a nonnegative integer")
        product = Poly.coerce(1)
        for _ in range(n):
            product = product * self
        return product

    def jet(self, variables, degree):
        names = set(variables.split())
        return Poly({word: c for word, c in self.terms.items()
                     if sum(x in names for x in word) <= degree})

    def reduce_square(self, name, replacement):
        """Reduce using name**2 = replacement, which is independent of name."""
        result = Poly.coerce(0)
        for word, c in self.terms.items():
            pairs, parity = divmod(word.count(name), 2)
            rest = tuple(sorted(tuple(x for x in word if x != name) + (name,) * parity))
            result += Poly({rest: c}) * replacement ** pairs
        return result


def vars_(names):
    return tuple(Poly({(name,): 1}) for name in names.split())


def require(condition, label):
    if not condition:
        raise SystemExit(f"FAIL: {label}")


def equal(actual, expected, label):
    difference = Poly.coerce(actual) - expected
    if difference.terms:
        raise SystemExit(f"FAIL: {label}; nonzero coefficients: {difference.terms}")


def dot(left, right):
    return sum(a * b for a, b in zip(left, right))


def algebra():
    ti, tk, r, B, X, Z = vars_("ti tk r B X Z")
    h, s = ti + tk, ti - tk
    equal(ti ** 2 - tk ** 2, s * h, "base and secondary difference formula")
    v = r * (X - Z)
    graph = B - h * v - 4 * (v - r * (X - Z)) ** 2 - r * s * (X + Z)
    equal(graph, B - 2 * ti * r * X + 2 * tk * r * Z,
          "height after substituting the prescribed primary coordinates")

    # Check the derivative jets of B(y)=sqrt(1-y^2) and h(y)=y/B(y).
    # Scale both proposed jets by B(y)^3 to stay in a polynomial ring.
    y, b, dy = vars_("y b dy")
    B_scaled = b ** 4 - y * b ** 2 * dy - dy ** 2 * Q(1, 2)
    h_scaled = y * b ** 2 + dy
    circle = B_scaled ** 2 - b ** 6 * (1 - (y + dy) ** 2)
    ratio = B_scaled * h_scaled - b ** 6 * (y + dy)
    equal(circle.jet("dy", 2).reduce_square("b", 1 - y ** 2), 0,
          "B'=-h and B''=-B^{-3} via the circle equation")
    equal(ratio.jet("dy", 1).reduce_square("b", 1 - y ** 2), 0,
          "h'=B^{-3} via B*h=y")

    # Verify the full primary Taylor polynomial through order two at v=w=0.
    # The y-dependent direction-matrix entries are kept formal and unrelated.
    dy, dv, w1, w2 = vars_("dy dv w1 w2")
    b0, b3, h0, h2, D, r0, r1, s0, s1, ki, kt, kt1 = vars_(
        "b0 b3 h0 h2 D r0 r1 s0 s1 ki kt kt1")
    A, B, C, E, A1, B1, C1, E1 = vars_("A B C E A1 B1 C1 E1")
    b_jet = b0 - h0 * dy - D * dy ** 2 * Q(1, 2) + b3 * dy ** 3
    h_jet = h0 + D * dy + h2 * dy ** 2
    r_jet, s_jet = r0 + r1 * dy, s0 + s1 * dy
    xi = (A + A1 * dy) * w1 + (B + B1 * dy) * w2
    eta = (C + C1 * dy) * w1 + (E + E1 * dy) * w2
    X, Z = ki * xi ** 2, (kt + kt1 * dy) * eta ** 2
    minus_f = -b_jet + h_jet * dv + 4 * (dv - r_jet * (X - Z)) ** 2 + r_jet * s_jet * (X + Z)
    expected = (-b0 + h0 * (dy + dv) + D * dy ** 2 * Q(1, 2) + D * dy * dv + 4 * dv ** 2
                + r0 * s0 * (ki * (A * w1 + B * w2) ** 2 + kt * (C * w1 + E * w2) ** 2))
    equal(minus_f.jet("dy dv w1 w2", 2), expected, "primary normal and Hessian along the tag axis")

    # Independent expansion of the quartic penalty's first and second jets.
    u1, u2, d1, d2 = vars_("u1 u2 d1 d2")
    u = (u1, u2)
    d = (d1, d2)
    ud = tuple(a + b for a, b in zip(u, d))
    usq = dot(u, u)
    rem = dot(ud, ud) ** 2 - usq ** 2 - 4 * usq * dot(u, d)
    equal(rem.jet("d1 d2", 2), 2 * usq * dot(d, d) + 4 * dot(u, d) ** 2,
          "quartic Bregman jet (twice the quadratic part is the Hessian form)")

    z = vars_("z1 z2 z3 z4 z5")
    zp = vars_("p1 p2 p3 p4 p5")
    dz = tuple(b - a for a, b in zip(z, zp))
    equal(2 * dot(z, dz) + dot(dz, dz), dot(zp, zp) - dot(z, z),
          "secondary support identity when both Euclidean norms are one")


def rational_margins():
    ratio, t1 = Q(1, 8), Q(1, 128)
    h_lo, h_hi = Q(7, 8), Q(5, 4)
    tag_cap = h_hi * t1
    delta, eps, gamma = Q(1, 4096), Q(1, 1_000_000), Q(1, 16)
    gap = Q(1, 4)
    s_lo = 2 - h_hi
    transverse_Hess = 2 * s_lo ** 2 * Q(1, 2) * Q(1, 2)
    full_Hess, box_Hess = Q(1, 4), Q(1, 8)

    require(t1 == ratio / 16 and 0 < ratio < 1, "geometric scale")
    require(h_lo <= 1 <= 1 + ratio <= h_hi, "all pair tags are inside the chart")
    require(tag_cap < Q(1, 100), "cap for h and y")
    require((1 + tag_cap ** 2) ** 3 < 4, "Y' exceeds 1/2")
    require((h_lo - h_hi * ratio) / 2 >= gap, "adjacent or further tag boxes are separated")
    require(s_lo == Q(3, 4) and max(1 - h_lo, h_hi - 1) == Q(1, 4), "nondegenerate chart direction pair")
    require((1 - tag_cap ** 2) ** 3 > Q(1, 4), "1 <= D < 2")
    require(1 + 4 * t1 ** 2 <= 4, "both direction-normalizing kappas at most 2")
    require(8 - 2 * 2 >= 4 and Q(1, 2) >= full_Hess > box_Hess, "tag and vertical Hessian slack")
    require(transverse_Hess == Q(9, 32) and transverse_Hess >= full_Hess,
            "transverse Hessian lower bound")
    require(2 * Q(1, 8) / s_lo <= 1 and t1 < 1, "both free coordinates stay within the box")

    require(1 + tag_cap ** 2 <= 4 and 1 + 2 * tag_cap ** 2 <= 4,
            "reference position derivative and reference normal bounded by 2")
    require(2 + 2 * delta * t1 / gap <= 3, "cross-box Euclidean displacement bound")
    require(7 * delta / gap ** 2 < Q(1, 4), "cross-box scalar-product error")
    require(2 * tag_cap + delta * t1 ** 2 < gamma, "primary and secondary cap errors")
    require(1 + gamma < 2, "prescribed points in the radius-2 ball")
    require(1 - 4 * gamma - 2 * gamma ** 2 > Q(1, 2), "mixed and opposite-primary margin")
    require(1 - 2 * gamma - gamma ** 2 >= Q(3, 4), "origin scalar-product margin")

    second_order_bound = Q(max(2, 12 * 2 ** 2), 2)
    require(second_order_bound == 24, "global Bregman coefficient on the radius-2 ball")
    require(second_order_bound * (3 + 1) * eps < box_Hess / 2, "same-box penalty absorption")
    require(second_order_bound * 3 ** 2 * eps < Q(1, 4), "cross-box penalty absorption")
    require(second_order_bound * eps < Q(1, 2), "secondary penalty absorption with no separation")
    require(second_order_bound * 4 ** 2 * eps < Q(1, 2), "mixed and opposite-primary penalty absorption")
    require(1 - Q(3, 4) + second_order_bound * 2 ** 2 * eps < 1, "uniform slack at the origin")


if __name__ == "__main__":
    algebra()
    rational_margins()
    print("PASS: exact primary graph and Hessian, penalty jet, secondary identity, and rational margins")
