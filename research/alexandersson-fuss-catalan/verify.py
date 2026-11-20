"""Independent finite checks of the path convention and coefficient formula.

The proof for all parameters is in PROOF.md. No root approximation is used.
Run with Python 3; there are no third-party dependencies.
"""

from collections import Counter
from fractions import Fraction
from math import comb


def path_counts(m, n):
    counts = Counter()

    def visit(north, east, suffix, peaks, long_peaks):
        if north == n and east == m * n:
            counts[peaks, long_peaks] += 1
            return
        if north < n:
            visit(north + 1, east, (suffix + "N")[-2:], peaks, long_peaks)
        if east < m * north:
            visit(north, east + 1, (suffix + "E")[-2:],
                  peaks + suffix.endswith("N"), long_peaks + (suffix == "NN"))

    visit(0, 0, "", 0, 0)
    return counts


def formula_counts(m, n):
    counts = Counter()
    length = m * n + 1
    for k in range(1, n + 1):
        factor = Fraction(comb(length, k), length)
        if n == k:
            assert factor.denominator == 1
            counts[k, 0] = factor.numerator
        else:
            for i in range(1, min(k, n - k) + 1):
                value = factor * comb(k, i) * comb(n - k - 1, i - 1)
                assert value.denominator == 1
                counts[k, i] = value.numerator
    return counts


def main():
    path_total = 0
    for m in range(1, 4):
        for n in range(1, 7):
            actual = path_counts(m, n)
            expected = formula_counts(m, n)
            assert actual == expected, (m, n, actual, expected)
            assert sum(actual.values()) == comb((m + 1) * n, n) // (m * n + 1)
            path_total += sum(actual.values())
    print("Passed 18 direct path-enumeration comparisons;", path_total, "paths.")
    print("These checks verify conventions only; the all-parameter proof is analytic.")


if __name__ == "__main__":
    main()
