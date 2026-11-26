"""Exact finite sanity checks for the identities used in Erdős #153.

This is not a proof of any asymptotic claim. Python standard library only.
"""

from collections import Counter
from fractions import Fraction
from itertools import combinations, combinations_with_replacement, product


def gap_energy(values):
    return sum((b - a) ** 2 for a, b in zip(values, values[1:]))


def psi(x):
    if x < 2:
        raise ValueError("the remaining gaps must be at least 2")
    k = x.numerator // x.denominator
    return k * k + (2 * k + 1) * (x - k)


def check_finite_gap_set(values):
    gaps = [b - a for a, b in zip(values, values[1:])]
    unit = gaps.count(1)
    count = len(gaps) - unit
    if count:
        assert gap_energy(values) >= unit + count * psi(
            Fraction(values[-1] - values[0] - unit, count)
        )
    for split in range(values[0], values[-1] + 1):
        left = sorted({v for v in values if v <= split} | {split})
        right = sorted({v for v in values if v >= split} | {split})
        assert gap_energy(left) + gap_energy(right) <= gap_energy(values)


def check_sidon(A):
    S = {a + b for a, b in combinations_with_replacement(A, 2)}
    if len(S) != len(A) * (len(A) + 1) // 2:
        return False
    D = {a - b for a, b in product(A, repeat=2) if a != b}
    T = {2 * a for a in A}
    m = len(A)
    assert len(D) == m * (m - 1)
    rp = Counter(a + b for a, b in product(A, repeat=2))
    rm = Counter(a - b for a, b in product(A, repeat=2))
    for h in range(1, 2 * (A[-1] - A[0]) + 1):
        ps = sum(s + h in S for s in S)
        dd = sum(d + h in D for d in D)
        correction = (
            2 * m * (h in D)
            + 2 * sum(s + h in T for s in S)
            + 2 * sum(s + h in S for s in T)
            - sum(s + h in T for s in T)
        )
        assert correction >= 0
        assert 4 * ps == dd + correction
        assert sum(v * rp[s + h] for s, v in rp.items()) == sum(
            v * rm[s + h] for s, v in rm.items()
        )
    check_finite_gap_set(sorted(S))
    return True


def check_marked_identity(A):
    """Use the ordered representations, including repeated endpoints."""
    plus = {}
    minus = {}
    for a, b in product(A, repeat=2):
        plus.setdefault(a + b, []).append((a, b))
        minus.setdefault(a - b, []).append((a, b))
    for h in range(1, 2 * (max(A) - min(A)) + 1):
        sum_side = Counter(
            (a, b, c, d)
            for s in plus
            for a, b in plus[s]
            for c, d in plus.get(s + h, ())
        )
        difference_side = Counter(
            (a, b, c, d)
            for u in minus
            for c, a in minus[u]
            for b, d in minus.get(u - h, ())
        )
        assert sum_side == difference_side


def main():
    count = sum(
        check_sidon(A)
        for k in range(2, 7)
        for A in combinations(range(16), k)
        if A[0] == 0
    )
    for data in [(0, 1, 4, 6), (0, 1, 3), (0, 2, 5, 11), (0, 1, 2, 3)]:
        check_marked_identity(data)
    print(f"Checked {count} integer Sidon sets and 4 marked fixtures.")


if __name__ == "__main__":
    main()
