#!/usr/bin/env python3
"""Exact small checks for the Sun v1 mask and phase audits.

These checks establish the stated local failures and identities. They do not
verify or refute the complete source-resolved matrix multiplication circuit.
Only Python's standard library is required.
"""

from fractions import Fraction as F
from itertools import product

from check_auxiliary_certificates import rank


def multiply(a, b):
    return [[sum(x * y for x, y in zip(row, col)) for col in zip(*b)]
            for row in a]


def check_mask():
    # Infinity is represented by 4. This is packet 3 in Section 5 / A.4.
    support = {f"A{i}": (0, i, i) for i in range(1, 4)}
    support.update({f"B{i}": (i, 0, i) for i in range(1, 4)})
    support.update({f"C{i}": (i, i, 0) for i in range(1, 4)})
    support.update({"P": (0, 0, 4), "Q": (0, 4, 0), "R": (4, 0, 0)})
    retained = {"A1", "A3", "B1", "B2", "C1", "P", "Q", "R"}
    x = [F(1, 128), F(1), F(1), F(0), F(1, 128)]
    y = [F(1), F(1), F(0), F(1), F(1)]
    z = [F(1), F(1), F(1), F(1), F(1)]
    printed = {name: x[i] * y[j] * z[k]
               for name, (i, j, k) in support.items()}
    assert {name for name, value in printed.items() if value} == retained
    assert printed["A1"] == F(1, 128)
    assert printed["B1"] == printed["B2"] == printed["C1"] == 1
    assert sum(printed.values()) == F(389, 128)
    # Local correction: the satellite X entries must also carry 1/128.
    corrected_x = [value / 128 if 1 <= i <= 3 else value
                   for i, value in enumerate(x)]
    corrected = {name: corrected_x[i] * y[j] * z[k]
                 for name, (i, j, k) in support.items()}
    assert all(value == F(int(name in retained), 128)
               for name, value in corrected.items())
    print("Packet 3 printed support sum: 389/128; asserted common-scale sum: 8/128")
    print("Scaling the satellite X entries repairs all 12 local support coefficients.")


def check_phase():
    labels = list(product(range(2), repeat=2))

    def theta(x, y):
        alpha, _ = x
        beta, r = y
        return (-1) ** ((alpha ^ beta) * r)

    x, y, zero = (0, 1), (1, 0), (0, 0)
    lhs = theta(x, y) * theta(y, zero) * theta(zero, x)
    rhs = theta(y, x) * theta(x, zero) * theta(zero, y)
    assert (lhs, rhs) == (1, -1)

    def weyl(alpha, q):
        return [[(-1) ** (alpha * v) * int(u == (v ^ q))
                 for v in range(2)] for u in range(2)]

    for (alpha, q), (beta, r) in product(labels, repeat=2):
        left = multiply(weyl(alpha, q), weyl(beta, r))
        right = [[(-1) ** (alpha * r) * value for value in row]
                 for row in weyl(alpha ^ beta, q ^ r)]
        assert left == right
        assert theta((alpha, q), (beta, r)) * (-1) ** (beta * r) == (-1) ** (alpha * r)
    basis = [[value for row in weyl(*label) for value in row] for label in labels]
    assert rank(basis) == 4
    e12, e21 = [[0, 1], [0, 0]], [[0, 0], [1, 0]]
    assert multiply(e12, e21) != multiply(e21, e12)
    print("Local phase factorization witness: left=1, right=-1")
    print("All 16 one-bit Weyl products, basis independence, and noncommutation checked.")


if __name__ == "__main__":
    check_mask()
    check_phase()
    print("No complete global source-to-target map or dyadic induction was checked.")
