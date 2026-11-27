"""Check the compressed enumeration against Conjecture 2.4 with exact arithmetic.

Usage: python -B verify.py [path/to/coefficient.csv]
"""
import csv
import sys
from fractions import Fraction
from math import comb, factorial
from pathlib import Path


def product(left, right):
    coefficients = [Fraction(0)] * (len(left) + len(right) - 1)
    for i, lhs in enumerate(left):
        for j, rhs in enumerate(right):
            coefficients[i + j] += lhs * rhs
    return coefficients


def binomial_polynomial(exposed, free):
    """Coefficients in the variable m=n-11, where m>=exposed."""
    coefficients = [Fraction(1)]
    for i in range(1, free):
        coefficients = product(coefficients, [Fraction(i - exposed, i), Fraction(1, i)])
    return coefficients


def actual(rows, n):
    free_values = n - 11
    answer = Fraction(0)
    for exposed, free, count in rows:
        remain = free_values - exposed
        if remain < 0:
            continue
        layouts = comb(remain + free - 1, free - 1) if free else int(remain == 0)
        answer += Fraction(count * layouts, factorial(exposed))
    return factorial(free_values) * answer


def target(n):
    bad = 1594 * n**3 - 14241 * n**2 + 39809 * n - 34236
    return Fraction(bad * factorial(n - 5), 60)


def verify(path):
    with path.open(encoding="utf-8", newline="") as source:
        rows = [(int(row["exposed"]), int(row["free"]), int(row["signed_orders"]))
                for row in csv.DictReader(source)]
    assert len({(e, u) for e, u, _ in rows}) == len(rows)
    assert all(0 <= exposed <= 6 and 0 <= free <= 10 for exposed, free, _ in rows)

    # For m>=7, terms with no free gap vanish and all remaining terms
    # are ordinary binomial polynomials.  Check the coefficients.
    obtained = [Fraction(0)] * 10
    for exposed, free, count in rows:
        if free:
            for i, term in enumerate(binomial_polynomial(exposed, free)):
                obtained[i] += Fraction(count, factorial(exposed)) * term

    # Substitute n=m+11 in the complement of the asserted count.
    cubic = [Fraction(-34236, 60)]
    n = [11, 1]
    power = [1]
    for coefficient in (39809, -14241, 1594):
        power = product(power, n)
        cubic += [Fraction(0)] * (len(power) - len(cubic))
        for i, term in enumerate(power):
            cubic[i] += Fraction(coefficient, 60) * term

    expected = cubic
    for offset in range(1, 7):
        expected = product(expected, [offset, 1])
    assert obtained == expected, (obtained, expected)

    # These boundary sizes may have no feasible gap compositions.
    for size in range(11, 18):
        assert actual(rows, size) == target(size), (size, actual(rows, size), target(size))

    print("Exact agreement for all n >= 11.")
    print("Complement divided by (n-11)! has coefficients in n-11:")
    print(", ".join(map(str, obtained)))


if __name__ == "__main__":
    default = Path(__file__).with_name("coefficients.csv")
    verify(Path(sys.argv[1]) if len(sys.argv) > 1 else default)
