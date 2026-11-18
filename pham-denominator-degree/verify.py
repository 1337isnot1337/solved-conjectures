#!/usr/bin/env python3
"""Exact certificate for a counterexample to Pham's 2022 denominator-degree guess.

No third-party dependencies. Run `python verify.py` for the primary proof,
`python verify.py --dual` for the dual generating function as well.
"""

from __future__ import annotations

import argparse
from collections import Counter
from fractions import Fraction
from typing import Iterable

PRIMARY = "0001001011"  # 1 = black; 0 = white
DUAL = "0010110111"  # reverse and complement PRIMARY

# Coefficients in ascending order, constant term first.
Q = (1, 0, 0, -1, -4, -6)
R = (10, 4, 10, 8, -14, -34, 14, 2)
Q_DUAL = (1, 0, 0, 0, 0, 0, -1, -8, -28, -48, -36)
R_DUAL = (10, 5, 12, 20, 32, 58, 97, 92, -46, -227, -161, 90, 18)

COEFFICIENTS_PRIMARY = (
    10, 4, 10, 18, 30, 52, 96, 164, 280, 484, 860, 1512, 2588,
    4476, 7856, 13796, 23900, 41288, 72076, 126220, 219664,
    380628, 662252, 1157000, 2016604, 3502748,
)
COEFFICIENTS_DUAL = (
    10, 5, 12, 20, 32, 58, 107, 177, 286, 509, 967, 1720,
    2877, 4913, 8634, 14977, 25395, 43808, 78441, 140829,
    245866, 421629, 726359, 1257624, 2169685, 3753113,
    6585850, 11674025, 20567307, 35745520, 61658097,
)


def is_primitive(word: str) -> bool:
    return all(len(word) % d or word != word[:d] * (len(word) // d)
               for d in range(1, len(word)))


def level_counts(word: str, max_level: int) -> list[int]:
    """Count limiting depth coefficients by a compressed reverse-move enumeration.

    At a fixed repetition length L=|word|*k, encode the head of a partition
    by a_i=lambda_i-(L-1-i), with i starting at zero. Away from the head,
    a_i is the periodic word shifted by `phase`. `prefix` stores deviations
    from that periodic tail; `offset` is len(lambda)-L.

    Each reverse move chooses a distinct pile size lambda_j >= len(lambda)-1.
    It deletes the jth pile, increments all remaining piles and appends
    lambda_j-(len(lambda)-1) ones. Its exact action near the head is
      a'_i = a_i+1 (i<j),  a'_i = a_{i+1} (i>=j),
      phase' = phase+1, offset' = a_j-j-1.
    We only inspect an O(max_level)-long head; see PROOF.md for why that is
    sufficient for the limiting coefficients.

    Multiple actual partitions may share the same compressed key. Their
    multiplicities MUST be summed, not deduplicated. Also, a compressed key
    that looks like a cycle state after level one is not necessarily a cycle
    partition (the boundary differs). Hence we suppress cycle predecessors
    at level one only.
    """
    assert word and set(word) <= {"0", "1"}
    assert is_primitive(word)
    assert max_level >= 0
    bits = tuple(map(int, word))
    p = len(bits)

    def at(prefix: tuple[int, ...], phase: int, i: int) -> int:
        return prefix[i] if i < len(prefix) else bits[(phase + i) % p]

    def trim(prefix: tuple[int, ...], phase: int) -> tuple[int, ...]:
        size = len(prefix)
        while size and prefix[size - 1] == bits[(phase + size - 1) % p]:
            size -= 1
        return prefix[:size]

    roots = {((), t, bits[(t - 1) % p] - 1) for t in range(p)}
    frontier = Counter({root: 1 for root in roots})
    totals = [p]

    for depth in range(1, max_level + 1):
        next_frontier: Counter[tuple[tuple[int, ...], int, int]] = Counter()
        for (prefix, phase, offset), multiplicity in frontier.items():
            # For j >= len(prefix), a_j is 0 or 1 and legality forces
            # j <= 1-offset. The other bound covers the entire exceptional head.
            upper = max(len(prefix) + 3, 3 - offset)
            for j in range(upper):
                value = at(prefix, phase, j)
                if value < j + offset:
                    continue
                # Two adjacent equal piles produce the same predecessor.
                if j and value == at(prefix, phase, j - 1) + 1:
                    continue
                phase_new = (phase + 1) % p
                length = max(len(prefix) - 1, j + 1)
                head_new = tuple(
                    at(prefix, phase, i) + 1 if i < j
                    else at(prefix, phase, i + 1)
                    for i in range(length)
                )
                next_state = (trim(head_new, phase_new), phase_new, value - j - 1)
                if depth == 1 and next_state in roots:
                    continue  # the recurrent cycle, not a depth-one transient
                next_frontier[next_state] += multiplicity
        frontier = next_frontier
        totals.append(sum(frontier.values()))
    return totals


def brute_force_level_counts(word: str, max_level: int) -> list[int]:
    """Independent finite-partition enumeration, intended for small depths.

    This routine explicitly stores full integer partitions. It makes no use
    of the compressed-head transitions in level_counts().
    """
    assert is_primitive(word)
    p = len(word)
    k = max(2, max_level + 1)
    length = p * k
    periodic = word * k
    cycle = set()
    for t in range(p):
        w = periodic[t:] + periodic[:t]
        partition = tuple(length - i - 1 + int(b) for i, b in enumerate(w)
                          if length - i - 1 + int(b) > 0)
        assert partition == tuple(sorted(partition, reverse=True))
        cycle.add(partition)
    assert len(cycle) == p
    frontier = cycle
    totals = [len(frontier)]
    for _ in range(max_level):
        successor = set()
        for part in frontier:
            m = len(part)
            prev_value = None
            for idx, pile in enumerate(part):
                if pile == prev_value:
                    continue
                prev_value = pile
                append_ones = pile - (m - 1)
                if append_ones < 0:
                    continue
                predecessor = (
                    tuple(v + 1 for i, v in enumerate(part) if i != idx)
                    + (1,) * append_ones
                )
                if predecessor not in cycle:
                    # An independent check of the forward Bulgarian-solitaire map.
                    forward = tuple(sorted(
                        (len(predecessor),)
                        + tuple(v - 1 for v in predecessor if v > 1),
                        reverse=True,
                    ))
                    assert forward == part
                    assert predecessor not in successor
                    successor.add(predecessor)
        frontier = successor
        totals.append(len(frontier))
    return totals


def multiply(a: Iterable[int], b: Iterable[int]) -> tuple[int, ...]:
    a, b = tuple(a), tuple(b)
    result = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            result[i + j] += x * y
    return tuple(result)


def series_product(poly: Iterable[int], series: Iterable[int]) -> tuple[int, ...]:
    poly, series = tuple(poly), tuple(series)
    return tuple(sum(poly[j] * series[n - j]
                     for j in range(min(n, len(poly) - 1) + 1))
                 for n in range(len(series)))


def polynomial_gcd_is_one(a: Iterable[int], b: Iterable[int]) -> bool:
    """Euclidean algorithm over Q[x], using exact fractions only."""
    def strip(q: list[Fraction]) -> list[Fraction]:
        while q and q[-1] == 0:
            q.pop()
        return q

    A = strip([Fraction(c) for c in a])
    B = strip([Fraction(c) for c in b])
    while B:
        rem = A[:]
        while len(rem) >= len(B):
            ratio = rem[-1] / B[-1]
            offset = len(rem) - len(B)
            for j, v in enumerate(B):
                rem[offset + j] -= ratio * v
            strip(rem)
        A, B = B, rem
    return len(A) == 1 and A[0] != 0


def verify_main(*, dual: bool = False, brute_depth: int = 12) -> None:
    assert PRIMARY == "0001001011"
    assert DUAL == "".join("1" if c == "0" else "0" for c in reversed(PRIMARY))
    assert is_primitive(PRIMARY) and is_primitive(DUAL)

    computed = level_counts(PRIMARY, 25)
    assert tuple(computed) == COEFFICIENTS_PRIMARY, (computed, COEFFICIENTS_PRIMARY)
    certificate = series_product(Q, computed)
    assert certificate == R + (0,) * (26 - len(R)), certificate
    assert polynomial_gcd_is_one(Q, R)

    if brute_depth:
        brute_depth = min(brute_depth, 16)
        brute = brute_force_level_counts(PRIMARY, brute_depth)
        assert brute == computed[:brute_depth + 1]

    print("P =", PRIMARY)
    print("Primitive necklace of length 10: yes")
    print("h_0 through h_25:", computed)
    print("Q(x) = 1 - x^3 - 4*x^4 - 6*x^5")
    print("R(x) = 10 + 4*x + 10*x^2 + 8*x^3 - 14*x^4 - 34*x^5 + 14*x^6 + 2*x^7")
    print("Q(x)*H_P(x) - R(x) = O(x^26): verified by exact integer arithmetic")
    print("gcd(Q,R) = 1: verified by exact rational polynomial arithmetic")
    print("Pham 2022 rationality bounds imply the identity holds to all orders")
    print("Minimum denominator degree: 5 (necklace length: 10)")
    if brute_depth:
        print(f"Independent full-partition enumeration agrees through level {brute_depth}")

    if dual:
        computed_dual = level_counts(DUAL, 30)
        assert tuple(computed_dual) == COEFFICIENTS_DUAL
        cert_dual = series_product(Q_DUAL, computed_dual)
        assert cert_dual == R_DUAL + (0,) * (31 - len(R_DUAL)), cert_dual
        assert polynomial_gcd_is_one(Q_DUAL, R_DUAL)
        q_plus = (1, 0, 0, 1, 4, 6)
        assert multiply(Q, q_plus) == Q_DUAL
        if brute_depth:
            assert brute_force_level_counts(DUAL, min(13, brute_depth)) == computed_dual[:min(13, brute_depth)+1]
        print()
        print("P* =", DUAL)
        print("h*_0 through h*_30:", computed_dual)
        print("Q*(x) = Q(x)*(1 + x^3 + 4*x^4 + 6*x^5)")
        print("Q*(x)*H_P*(x) - R*(x) = O(x^31): verified")
        print("gcd(Q*,R*) = 1: verified")
        print("Minimum dual denominator degree: 10")
        print("The 2025 common-denominator conjecture is NOT contradicted by this example")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--dual", action="store_true", help="also certify the dual necklace")
    parser.add_argument("--brute-depth", type=int, default=12,
                        help="compare against full partition enumeration through this level (0 to disable; max 16)")
    args = parser.parse_args()
    verify_main(dual=args.dual, brute_depth=args.brute_depth)
