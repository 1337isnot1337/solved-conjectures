"""Exact scalar checks for the prior-consequence audit.

This checks logarithmic comparisons, not instances of Chollet's conjecture.
The mathematical reduction to these comparisons is in the companion note.
Only the Python standard library is used.
"""

from fractions import Fraction as F
from functools import lru_cache


def unit_log_bounds(x, terms=48):
    """Bound log(x) for 1 <= x <= 2 with the atanh series."""
    x = F(x)
    assert 1 <= x <= 2
    t = (x - 1) / (x + 1)
    lower = 2 * sum((t ** (2 * j + 1) / (2 * j + 1)
                     for j in range(terms)), F(0))
    remainder = 2 * t ** (2 * terms + 1) / ((2 * terms + 1) * (1 - t * t))
    return lower, lower + remainder


@lru_cache(None)
def log_bounds(x):
    x = F(x)
    assert x >= 1
    power = 0
    while x >= 2:
        x /= 2
        power += 1
    lo, hi = unit_log_bounds(x)
    two_lo, two_hi = unit_log_bounds(2)
    return lo + power * two_lo, hi + power * two_hi


def harmonic(n):
    return sum((F(1, j) for j in range(1, n + 1)), F(0))


def psi_bounds(r):
    lo, hi = log_bounds(r)
    shift = 2 * harmonic(r - 1) + 2
    return 3 * lo - shift, 3 * hi - shift


def sphere_combination_lower(r, n):
    """Lower bound log(alpha_(n,r) (r)_n exp(-n H_(r-1)))."""
    log_factorial_lower = sum((log_bounds(j)[0] for j in range(1, n + 1)), F(0))
    log_rising_lower = sum((log_bounds(j)[0] for j in range(r, r + n)), F(0))
    return (log_factorial_lower + log_rising_lower - n * log_bounds(n)[1]
            + n * log_bounds(r)[0] - 2 * n * harmonic(r - 1))


def main():
    assert psi_bounds(23)[0] > F(1, 50)
    assert psi_bounds(64)[0] > F(51, 50)
    # These are the ceilings of exp(2 + 2 H_(r-1))/r.  Both sides
    # of each claimed ceiling are certified by rational log intervals.
    thresholds = [96, 119, 142, 166, 189, 212, 236, 259, 282,
                  306, 329, 353, 376, 399, 423, 446, 470, 493]
    for r, threshold in zip(range(5, 23), thresholds):
        shift = 2 + 2 * harmonic(r - 1)
        assert log_bounds(r * threshold)[0] > shift
        assert log_bounds(r * (threshold - 1))[1] < shift
    for r in range(18, 23):
        n = r * r
        assert sphere_combination_lower(r, n) > 0
        # Lower bound for the positive increment in n of its exact logarithm.
        assert log_bounds(r * (n + r))[0] - 1 - 2 * harmonic(r - 1) > 0
    print("PASS: Psi(23)>1/50; Psi(64)>51/50; all 18 conservative thresholds.")
    print("r : first order covered by the conservative prior bound")
    print(dict(zip(range(5, 23), thresholds)))
    print("PASS: Yuan-Parrilo plus the published untilted sphere bound covers ranks 18..22 at every n>=r^2.")


if __name__ == "__main__":
    main()
