"""Rational certificate for the pointwise proof and an independent finite-law replay."""
from decimal import Decimal, localcontext
from fractions import Fraction
from functools import lru_cache
from math import factorial
from verify import independent_configurations, test_graphs


def taylor_seven(v):
    return sum(v**i / factorial(i) for i in range(8))


def rational_certificate():
    x = Fraction(9, 4)
    y = Fraction(853, 1000)
    assert y * taylor_seven(y) > 2
    assert taylor_seven(x) > Fraction(500, 53)
    exp_y_upper = taylor_seven(y) + y**8 / (factorial(8) * (1 - y/9))
    assert exp_y_upper < Fraction(47, 20)
    margin = 2 * (Fraction(20, 47) - Fraction(53, 500)) / (x - y)
    margin -= Fraction(53, 500) + x / (2 * (1 + x))
    assert margin == Fraction(2262199, 426783500) > 0
    assert x * Fraction(33, 80) - Fraction(37, 40) == Fraction(1, 320)
    print(f"Exact lower-range margin {margin}; upper-range coefficient 1/320.")


def lambert(value):
    if not value:
        return Decimal(0)
    w = (1 + value).ln()
    for _ in range(20):
        w -= (w - value * (-w).exp()) / (1 + w)
    assert abs(w * w.exp() - value) < Decimal("1e-54")
    return w


@lru_cache(maxsize=None)
def proposed_density(t, degree):
    y = lambert(2 * t)
    if degree == 2:
        return t * (-y).exp() / (1 + y)
    return (lambert(t * degree) - y) / (degree - 2)


def finite_examples():
    cases = 0
    degrees = set()
    for graph in test_graphs():
        n = len(graph)
        degree = Fraction(sum(mask.bit_count() for mask in graph), n)
        degrees.add(degree)
        hist = [0] * (n + 1)
        for mask, _, _ in independent_configurations(graph):
            hist[mask.bit_count()] += 1
        for a, b in [(1, 32), (1, 4), (3, 4), (1, 1)]:
            weights = [count * a**k * b**(n-k) for k, count in enumerate(hist)]
            density = Fraction(sum(k*w for k, w in enumerate(weights)), n*sum(weights))
            expected_floor = proposed_density(Decimal(a)/b,
                                              Decimal(degree.numerator)/degree.denominator)
            observed = Decimal(density.numerator)/density.denominator
            assert observed + Decimal("1e-53") >= expected_floor
            cases += 1
    assert 0 in degrees and 2 in degrees and any(d.denominator > 1 for d in degrees)
    print(f"Pointwise bound replayed on {cases} graph-fugacity cases, including degrees 0 and 2.")


if __name__ == "__main__":
    rational_certificate()
    with localcontext() as ctx:
        ctx.prec = 65
        finite_examples()
