#!/usr/bin/env python3
"""Exact finite checks for CANONICAL_POTENTIAL_OBSTRUCTIONS.md.

Uses only the Python standard library.  This checks the two-coordinate gadget
at every Boolean input and the Cauchy recovery formula on every basis vector
for dimensions 1 through --max-m.  The general identities are proved in the
Markdown note.  These checks do not verify the imported lower bound, the
analytic transfer lemmas, or any complexity-class separation.
"""

from argparse import ArgumentParser
from fractions import Fraction
from math import comb, factorial


def check_gadget() -> None:
    for c1 in (0, 1):
        for c2 in (0, 1):
            kernel = (2 * c1 - 1) * (2 * c2 - 1) * (c1 + c2) * (c1 - c2)
            assert kernel == c2 - c1, (c1, c2, kernel)

            # Drop the common K_A(b) factor from the two explicit potentials.
            q1 = lambda a, b: -Fraction(a, 2)
            q2 = lambda a, b: Fraction(b, 2)
            divergence = q1(c1, c2) - q1(1 - c1, c2)
            divergence += q2(c1, c2) - q2(c1, 1 - c2)
            assert divergence == kernel, (c1, c2, divergence, kernel)


def check_cauchy_recovery(m: int) -> None:
    # The note writes a_0 = sum_r weights[r] * v_r, where
    # v_r = (1/2) sum_j a_j/(r+j).  Test each formal basis vector a_j.
    weights = [
        Fraction(
            2 * (-1) ** (r - 1) * comb(m + 1, r) * factorial(r + m),
            factorial(m) * factorial(r - 1),
        )
        for r in range(1, m + 2)
    ]
    for j in range(m + 1):
        recovered = sum(
            weight * Fraction(1, 2 * (r + j))
            for r, weight in enumerate(weights, start=1)
        )
        expected = 1 if j == 0 else 0
        assert recovered == expected, (m, j, recovered, expected)


def main() -> None:
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("--max-m", type=int, default=8)
    args = parser.parse_args()
    if args.max_m < 1:
        parser.error("--max-m must be positive")

    check_gadget()
    for m in range(1, args.max_m + 1):
        check_cauchy_recovery(m)

    print("C block and its local potentials: all four Boolean inputs passed.")
    print(f"Cauchy recovery: all formal basis vectors passed for m=1,...,{args.max_m}.")
    print("Finite exact identity checks only; no separation theorem was verified.")


if __name__ == "__main__":
    main()
