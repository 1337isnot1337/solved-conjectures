"""Exact interval certificate for Lyon's gamma-median conjecture.

All verification arithmetic is integer arithmetic. Endpoint floats were used
only to propose candidate brackets in medians.json, which are not trusted.
No third-party dependency. See PROOF.md for the analytic tails and the
convexity implication which makes each checked cell cover a real interval.
"""

from dataclasses import dataclass
from functools import lru_cache
from pathlib import Path
import json
import time

BITS = 128
SCALE = 1 << BITS


def ceildiv(a, b):
    assert b > 0
    return -((-a) // b)


@dataclass(frozen=True)
class I:
    lo: int
    hi: int

    def __post_init__(self):
        assert type(self.lo) is int and type(self.hi) is int
        assert self.lo <= self.hi

    @staticmethod
    def rat(p, q=1):
        assert type(p) is int and type(q) is int
        assert q > 0
        return I((p * SCALE) // q, ceildiv(p * SCALE, q))

    @staticmethod
    def coerce(x):
        return x if isinstance(x, I) else I.rat(x)

    def __add__(self, other):
        other = I.coerce(other)
        return I(self.lo + other.lo, self.hi + other.hi)

    __radd__ = __add__

    def __neg__(self):
        return I(-self.hi, -self.lo)

    def __sub__(self, other):
        return self + (-I.coerce(other))

    def __rsub__(self, other):
        return I.coerce(other) - self

    def __mul__(self, other):
        other = I.coerce(other)
        products = (self.lo * other.lo, self.lo * other.hi,
                    self.hi * other.lo, self.hi * other.hi)
        return I(min(products) // SCALE, ceildiv(max(products), SCALE))

    __rmul__ = __mul__

    def reciprocal(self):
        assert self.lo > 0
        return I(SCALE * SCALE // self.hi,
                 ceildiv(SCALE * SCALE, self.lo))

    def __truediv__(self, other):
        return self * I.coerce(other).reciprocal()

    def __rtruediv__(self, other):
        return I.coerce(other) / self

    def __pow__(self, n):
        assert isinstance(n, int) and n >= 0
        result, power = I.rat(1), self
        while n:
            if n & 1:
                result = result * power
            power = power * power
            n //= 2
        return result


def log_reduced(y):
    """Log on [1,2], using 64 positive atanh-series terms."""
    assert y.lo >= SCALE and y.hi <= 2 * SCALE
    u = (y - 1) / (y + 1)
    square = u * u
    power = u
    total = I.rat(0)
    for k in range(64):
        total = total + power / (2 * k + 1)
        power = power * square
    remainder = 2 * power / (129 * (1 - square))
    return 2 * total + I(0, remainder.hi)


LN2 = log_reduced(I.rat(2))


@lru_cache(maxsize=100000)
def log_point(p):
    """Enclose log(p/SCALE), p a positive integer."""
    assert p > 0
    shift = p.bit_length() - 1 - BITS
    if shift >= 0:
        reduced = I.rat(p, SCALE << shift)
    else:
        reduced = I.rat(p << (-shift), SCALE)
    return log_reduced(reduced) + shift * LN2


def log_interval(x):
    assert x.lo > 0
    return I(log_point(x.lo).lo, log_point(x.hi).hi)


def exp_positive(x):
    """Enclose exp(x), 0<=x<=8, by a positive series and squaring."""
    assert x.lo >= 0 and x.hi <= 8 * SCALE
    y = x / 16
    term = I.rat(1)
    total = term
    for k in range(1, 41):
        term = term * y / k
        total = total + term
    next_term = term * y / 41
    remainder = next_term / (1 - y / 42)
    answer = total + I(0, remainder.hi)
    for _ in range(4):
        answer = answer * answer
    return answer


def atan_reciprocal(q):
    """Alternating series with a rigorous next-term bound."""
    x = I.rat(1, q)
    square = x * x
    power = x
    total = I.rat(0)
    for k in range(64):
        term = power / (2 * k + 1)
        total = total + (term if k % 2 == 0 else -term)
        power = power * square
    # The first omitted term is positive because 64 is even.
    return total + I(0, (power / 129).hi)


PI = 16 * atan_reciprocal(5) - 4 * atan_reciprocal(239)
HALF_LOG_2PI = log_interval(2 * PI) / 2

# B_(2k)/(2k(2k-1)), k=1,...,8. Next term is positive.
STIRLING = ((1, 12), (-1, 360), (1, 1260), (-1, 1680),
            (1, 1188), (-691, 360360), (1, 156), (-3617, 122400))
NEXT_STIRLING = (43867, 244188)


def log_gamma_one_plus(a):
    """Stirling at z=a+17 and recurrence, with signed remainder."""
    z = a + 17
    out = (z - I.rat(1, 2)) * log_interval(z) - z + HALF_LOG_2PI
    inv = z.reciprocal()
    inv2 = inv * inv
    power = inv
    for numerator, denominator in STIRLING:
        out = out + I.rat(numerator, denominator) * power
        power = power * inv2
    remainder = I.rat(*NEXT_STIRLING) * power
    out = out + I(0, remainder.hi)
    for j in range(1, 17):
        out = out - log_interval(a + j)
    return out


def log_twice_cdf(a, x, log_gamma):
    """Enclose log(2 P(a,x)), using a positive incomplete-gamma series."""
    term = I.rat(1)
    total = term
    for n in range(1, 81):
        term = term * x / (a + n)
        total = total + term
    next_term = term * x / (a + 81)
    remainder = next_term / (1 - x / (a + 82))
    total = total + I(0, remainder.hi)
    return a * log_interval(x) - x - log_gamma + log_interval(total) + LN2


def partition():
    nodes = [100000]
    while nodes[-1] < 7000000:
        nodes.append(min(7000000, nodes[-1] + nodes[-1] // 1000))
    nodes.append(nodes[-1] + nodes[-1] // 1000)
    return nodes


def main():
    start = time.monotonic()
    data = json.loads(Path(__file__).with_name("medians.json").read_text())
    nodes = partition()
    assert data["parameter_denominator"] == 1000000
    assert data["median_denominator"] == 1000000000000
    assert data["nodes"] == nodes
    brackets = data["brackets"]
    assert len(brackets) == len(nodes)
    medians = []
    for i, (node, bracket) in enumerate(zip(nodes, brackets)):
        lo, hi = bracket
        assert type(lo) is int and type(hi) is int
        assert 0 < lo < hi and hi - lo <= 4
        a = I.rat(node, 1000000)
        low = I.rat(lo, 1000000000000)
        high = I.rat(hi, 1000000000000)
        lg = log_gamma_one_plus(a)
        lower_check = log_twice_cdf(a, low, lg)
        upper_check = log_twice_cdf(a, high, lg)
        assert lower_check.hi < 0, ("lower median bracket", i)
        assert upper_check.lo > 0, ("upper median bracket", i)
        medians.append((low, high))
        if i and i % 500 == 0:
            print(f"certified {i} median brackets", flush=True)

    margins = []
    for i in range(len(nodes) - 2):
        a, b, c = (I.rat(x, 1000000) for x in nodes[i:i + 3])
        slope = (medians[i + 2][1] - medians[i + 1][0]) / (c - b)
        positive_exp = exp_positive(LN2 / a)
        threshold = positive_exp.reciprocal() + LN2 * medians[i][0] / (b * b)
        margin = threshold - slope
        assert margin.lo > 0, ("interval derivative inequality", i)
        margins.append(margin.lo)

    # Elementary constants used in the analytic tails.
    assert LN2.lo > I.rat(693, 1000).hi
    assert LN2.hi < I.rat(7, 10).lo
    assert (PI * PI).hi < 10 * SCALE
    assert I.rat(2000, 2289).hi < SCALE
    harmonic_100 = sum((I.rat(1, j) for j in range(1, 101)), I.rat(0))
    # gamma > H_100-log(101) > 57/100.
    assert (harmonic_100 - log_interval(I.rat(101)) - I.rat(57, 100)).lo > 0
    assert log_interval(I.rat(3, 2)).hi < I.rat(41, 100).lo
    assert (I.rat(4, 25) - I.rat(1, 12) - I.rat(5, 768)).lo > 0
    # For L=log2, 7(3L-2)>L^2 is enough for the large tail.
    assert (7 * (3 * LN2 - 2) - LN2 * LN2).lo > 0

    smallest = min(margins)
    result = {
        "status": "PASS",
        "integer_interval_bits": BITS,
        "certified_median_brackets": len(nodes),
        "covered_real_intervals": len(margins),
        "compact_domain": ["1/10", "7"],
        "smallest_margin_lower_numerator": smallest,
        "margin_denominator": SCALE,
        "seconds": round(time.monotonic() - start, 3),
    }
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
