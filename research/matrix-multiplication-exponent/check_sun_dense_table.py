#!/usr/bin/env python3
"""Audit Sun 2610.13971v1 Lemma 9.2 from the literal A.3 packet ledger.

The integer operator is independent of the already detected A.4 scalar typo.
This check assumes the source replacements realize the advertised records;
it does not verify that source-local realization or the global decoder.
"""

from fractions import Fraction
from itertools import product


def chi(a, b):
    return 1 if (a & b).bit_count() % 2 == 0 else -1


def linear(images, x):
    out = 0
    for bit, image in enumerate(images):
        if x & (1 << bit):
            out ^= image
    return out


THETA = dict(zip(
    ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3", "P", "Q", "R"],
    [3, 0, 0, 5, 9, 0, 6, 9, 0, 10, 12, 15],
))
GENERIC = ("A1", "A3", "B1", "B2", "C1", "P", "Q", "R")
SEVEN_B = ("A1", "B1", "B2", "C1", "P", "Q", "R")
SEVEN_A = ("A1", "A2", "B1", "C1", "P", "Q", "R")
PACKETS = {
    1: (1, 10, SEVEN_B), 3: (1, 0, GENERIC),
    4: (1, 11, SEVEN_A), 6: (1, 1, GENERIC),
    7: (0, 7, ("C1",)), 8: (0, 10, ("C1",)),
    9: (1, 15, GENERIC), 11: (1, 5, GENERIC),
    12: (1, 14, GENERIC), 14: (1, 4, GENERIC),
    17: (1, 8, GENERIC), 19: (1, 2, GENERIC),
    20: (1, 9, GENERIC), 22: (1, 3, GENERIC),
    23: (0, 6, ("C1",)), 24: (0, 11, ("C1",)),
    25: (1, 13, GENERIC), 27: (1, 7, SEVEN_A),
    28: (1, 12, GENERIC), 30: (1, 6, SEVEN_B),
}
MODULES = [
    (23, 30), (7, 27), (14,), (5, 11),
    (2, 19), (22,), (3,), (16, 6),
    (29, 12), (13, 9), (28,), (15, 25),
    (8, 1), (24, 4), (10, 17), (20,),
]
B = [(9, 4, 8, 6), (8, 6, 4, 9)]


def table_entry(lam, rho, beta):
    out = 0
    for packet in MODULES[lam]:
        if packet not in PACKETS:
            continue
        layer, character, supports = PACKETS[packet]
        out += chi(character, rho ^ linear(B[layer], beta)) * sum(
            chi(THETA[support], beta) for support in supports
        )
    return out


def main():
    failures = []
    for lam, rho, beta in product(range(16), repeat=3):
        expected = 0
        if beta in (0, 15):
            expected = 8 * chi(rho ^ (3 if beta else 0), lam ^ 6)
        actual = table_entry(lam, rho, beta)
        if actual != expected:
            failures.append((lam, rho, beta, actual, expected))
    print(f"Integer table: {4096 - len(failures)}/4096 entries pass.")
    if failures:
        print("First failures:", failures[:12])
    assert not failures

    for lam, b, d, g in product(range(16), range(2), range(16), range(2)):
        actual = Fraction(1, 128) * (-1) ** (g * b) * chi(d, 6) * table_entry(
            lam, d ^ (3 * b), 15 * b
        )
        assert actual == Fraction(1, 16) * (-1) ** (g * b) * chi(d, lam)
    print("All 1024 unrenormalized Walsh coefficients equal W32/16.")
    print("The integer table does not certify source-local record realization.")


if __name__ == "__main__":
    main()
