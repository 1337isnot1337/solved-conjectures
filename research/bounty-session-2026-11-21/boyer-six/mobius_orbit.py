#!/usr/bin/env python3
"""Exact obstruction to repairing four published near-squares by one Mobius map.

Source: Boonsiriseth, Quines and Raphael, report of 16 May 2023, Tables 5--8.
https://github.com/talkon/magic-squares/blob/3d899975a69f1b41cc62aa8327931319ccbdf0b9/project-report.pdf
This is not an impossibility proof for general 6 by 6 squares.
"""

import hashlib
import itertools
import json
from math import prod
from pathlib import Path

import sympy as sp


SQUARES = {
    "table5_SP_P": [
        [112, 200, 81, 16, 28, 195],
        [320, 39, 98, 54, 96, 25],
        [60, 30, 40, 42, 208, 252],
        [78, 147, 240, 120, 15, 32],
        [27, 24, 160, 260, 105, 56],
        [35, 192, 13, 140, 180, 72],
    ],
    "table6_SP_S": [
        [252, 42, 96, 125, 36, 26],
        [52, 15, 108, 128, 225, 49],
        [28, 64, 50, 39, 126, 270],
        [30, 210, 117, 84, 16, 120],
        [135, 90, 196, 12, 104, 40],
        [80, 156, 10, 189, 70, 72],
    ],
    "table7_SP": [
        [243, 14, 100, 60, 64, 11],
        [28, 180, 33, 192, 9, 50],
        [110, 36, 8, 108, 20, 210],
        [15, 18, 84, 22, 225, 128],
        [16, 200, 27, 105, 132, 12],
        [80, 44, 240, 5, 42, 81],
    ],
    "table8_P_P": [
        [175, 117, 5, 48, 72, 16],
        [144, 36, 10, 8, 105, 130],
        [13, 14, 80, 90, 20, 216],
        [9, 100, 104, 12, 180, 28],
        [32, 6, 108, 210, 52, 25],
        [60, 160, 126, 65, 4, 18],
    ],
}


def coefficients(polynomial):
    return [str(c) for c in polynomial.all_coeffs()]


def gcd_certificate(polynomials, variable):
    """Return a Bezout identity for the exact monic gcd over Q."""
    zero = sp.Poly(0, variable, domain=sp.QQ)
    gcd = zero
    weights = []
    for polynomial in polynomials:
        if polynomial.is_zero:
            weights.append(zero)
            continue
        if gcd.is_zero:
            divisor = polynomial.LC()
            gcd = polynomial.monic()
            weights.append(sp.Poly(1 / divisor, variable, domain=sp.QQ))
            continue
        left, right, next_gcd = sp.gcdex(gcd, polynomial)
        weights = [weight * left for weight in weights]
        weights.append(right)
        gcd = next_gcd
        if gcd.degree() == 0:
            weights.extend([zero] * (len(polynomials) - len(weights)))
            break
    check = sum((weight * polynomial for weight, polynomial in zip(weights, polynomials)), zero)
    assert check == gcd
    assert all(polynomial.rem(gcd).is_zero for polynomial in polynomials)
    return {
        "gcd_coefficients_descending": coefficients(gcd),
        "bezout_coefficients_descending": [coefficients(weight) for weight in weights],
        "identity_checked": True,
        "all_remainders_zero": True,
    }


def reversal_pair(first, second):
    """Whether two transversals can become the two long diagonals together."""
    inverse = {column: row for row, column in enumerate(first)}
    relative = [inverse[second[row]] for row in range(6)]
    return all(relative[row] != row and relative[relative[row]] == row for row in range(6))


def audit(name, matrix):
    flat = [entry for row in matrix for entry in row]
    assert len(flat) == len(set(flat)) == 36
    assert all(type(entry) is int and entry > 0 for entry in flat)
    lines = matrix + [list(column) for column in zip(*matrix)]
    magic_sum, magic_product = sum(matrix[0]), prod(matrix[0])
    assert all(sum(line) == magic_sum and prod(line) == magic_product for line in lines)

    t = sp.Symbol("t")
    polynomials = [sp.Poly(prod(t - entry for entry in line), t, domain=sp.QQ) for line in lines]
    base = polynomials[0]
    additive_obstructions = [polynomial.diff() * base - polynomial * base.diff() for polynomial in polynomials[1:]]
    multiplicative_obstructions = [polynomial - base for polynomial in polynomials[1:]]
    nonaffine = gcd_certificate(additive_obstructions, t)
    affine = gcd_certificate(multiplicative_obstructions, t)
    assert nonaffine["gcd_coefficients_descending"] == ["1"]
    assert affine["gcd_coefficients_descending"] == ["1", "0"]

    good = []
    for permutation in itertools.permutations(range(6)):
        transversal = [matrix[row][permutation[row]] for row in range(6)]
        if sum(transversal) == magic_sum and prod(transversal) == magic_product:
            good.append(permutation)
    compatible = [(first, second) for first, second in itertools.combinations(good, 2) if reversal_pair(first, second)]
    assert not compatible
    return {
        "name": name,
        "sum": magic_sum,
        "product": magic_product,
        "nonaffine_additive_obstruction": nonaffine,
        "affine_product_obstruction": affine,
        "transversals_checked": 720,
        "good_transversals": good,
        "compatible_diagonal_pairs": compatible,
        "conclusion": "No nonsingular common Mobius map followed by arbitrary row and column permutations yields a full square.",
    }


def main():
    source = Path(__file__)
    result = {
        "source_sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
        "arithmetic": "Exact rational polynomial arithmetic in SymPy; not a Lean certificate.",
        "scope": "Only the four source matrices, their global nonsingular Mobius transforms, and row/column permutations.",
        "results": [audit(name, matrix) for name, matrix in SQUARES.items()],
    }
    output = source.with_name("mobius_orbit_results.json")
    output.write_text(json.dumps(result, indent=2) + "\n")
    for item in result["results"]:
        print(item["name"], "nonaffine gcd=1; affine gcd=t; good transversals=", len(item["good_transversals"]), "; compatible pairs=0")
    print(output)


if __name__ == "__main__":
    main()
