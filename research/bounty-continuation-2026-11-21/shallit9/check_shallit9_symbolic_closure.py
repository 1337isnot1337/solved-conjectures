#!/usr/bin/env python3
"""Replay specific symbolic identities and witnesses, not a determinant search."""

from __future__ import annotations

import json
from pathlib import Path

import sympy as sp


MORPHISM = {1: (1, 2), 2: (2, 3), 3: (1, 4), 4: (3, 2)}


def prefix(length: int) -> list[int]:
    word = [1]
    while len(word) < length:
        word = [c for x in word for c in MORPHISM[x]]
    return word[:length]


def hankel(sequence: list[int], n: int, k: int = 0) -> sp.Matrix:
    return sp.Matrix(n, n, lambda i, j: sequence[k + i + j])


def matrix_strings(matrix: sp.Matrix) -> list[list[str]]:
    return [[str(x) for x in row] for row in matrix.tolist()]


def main() -> None:
    a = prefix(256)
    odd = [int(x in (1, 3)) for x in a]
    letter_one = [int(x == 1) for x in a]

    def term(coefficients: list[int], scale: int, shift: int, n: int) -> int:
        if n < shift or (n - shift) % scale:
            return 0
        return coefficients[(n - shift) // scale]

    for n in range(128):
        g_rhs = (
            term(odd, 2, 0, n)
            - term(odd, 2, 1, n)
            + term(odd, 4, 2, n)
            - term(odd, 4, 3, n)
            - term(odd, 8, 2, n)
            + term(odd, 8, 3, n)
            + int(n % 2 == 1)
        )
        assert odd[n] == g_rhs, ("G Mahler", n)
        assert letter_one[n] == term(odd, 2, 0, n)
        f_rhs = (
            term(letter_one, 2, 0, n)
            - term(letter_one, 2, 2, n)
            + term(letter_one, 4, 4, n)
            - term(letter_one, 4, 6, n)
            - term(letter_one, 8, 4, n)
            + term(letter_one, 8, 6, n)
            + int(n >= 2 and n % 4 == 2)
        )
        assert letter_one[n] == f_rhs, ("F Mahler", n)
        a_rhs_2 = (
            2
            + odd[n]
            - 2 * term(odd, 2, 0, n)
            + 2 * term(odd, 2, 1, n)
            - 2 * term(odd, 4, 1, n)
        )
        a_rhs_3 = (
            (2 if n % 2 == 0 else 3)
            - term(odd, 2, 0, n)
            + term(odd, 2, 1, n)
            + term(odd, 4, 2, n)
            - term(odd, 4, 3, n)
            - 2 * term(odd, 4, 1, n)
            - term(odd, 8, 2, n)
            + term(odd, 8, 3, n)
        )
        assert a[n] == a_rhs_2 == a_rhs_3, ("A expression", n)

    t0 = sp.Matrix([[1, 0, 0], [0, 0, 0], [0, 1, 0]])
    t1 = sp.Matrix([[-1, 1, 0], [-1, 0, 1], [0, 0, 0]])
    basis = [sp.eye(3), t0, t1, t0**2, t1*t0, t0*t1,
             t1**2, t1*t0**2, t0*t1*t0]
    basis_determinant = sp.Matrix.hstack(*(x.reshape(9, 1) for x in basis)).det()
    assert basis_determinant == -1

    even_map = (1, 2, 1, 3)
    odd_map = (2, 3, 4, 2)
    even_section = [even_map[x-1] for x in a]
    odd_section = [odd_map[x-1] for x in a]
    p = hankel(even_section, 3)
    q = hankel(odd_section, 3)
    r = hankel(even_section, 3, 1)
    expected_p = sp.Matrix([[1, 2, 2], [2, 2, 1], [2, 1, 2]])
    expected_q = sp.Matrix([[2, 3, 3], [3, 3, 4], [3, 4, 3]])
    expected_r = sp.Matrix([[2, 2, 1], [2, 1, 2], [1, 2, 1]])
    assert p == expected_p and q == expected_q and r == expected_r
    schur = r - q * p.inv() * q
    expected_schur = sp.Matrix([
        [sp.Rational(-8, 5), -3, -4], [-3, -6, -4], [-4, -4, -6]
    ])
    assert schur == expected_schur
    assert p.det() == -5 and schur.det() == 22
    assert schur[0, 2] - schur[1, 1] == 2
    permutation = [0, 2, 4, 1, 3, 5]
    full = hankel(a, 6)
    assert full.extract(permutation, permutation) == p.row_join(q).col_join(q.row_join(r))
    assert full.det() == p.det() * schur.det() == -110

    b = [x-1 for x in a]
    second_difference = [a[i+2] - 2*a[i+1] + a[i] for i in range(len(a)-2)]
    witnesses = []
    for n, k, word, expected_d, expected_c, expected_det in [
        (10, 56, "1232231423141232122", 53, -56, -3),
        (9, 60, "23142314123212231", -619, 284, -335),
    ]:
        assert "".join(map(str, a[k:k+2*n-1])) == word
        d = hankel(b, n, k).det(method="bareiss")
        c = hankel(second_difference, n-1, k).det(method="bareiss")
        determinant = hankel(a, n, k).det(method="bareiss")
        assert (d, c, determinant) == (expected_d, expected_c, expected_det)
        assert d + c == determinant
        witnesses.append({"n": n, "k": k, "factor": word,
                          "D": int(d), "C": int(c),
                          "original_determinant": int(determinant)})

    result = {
        "scope": "Specified exact witnesses and transcription checks; no target search.",
        "all_checks_passed": True,
        "formal_series_transcription_coefficients": 128,
        "transition_algebra_basis_words": ["id", "0", "1", "00", "10", "01", "11", "100", "010"],
        "transition_algebra_basis_determinant": int(basis_determinant),
        "schur_complement": matrix_strings(schur),
        "schur_non_hankel_difference": str(schur[0, 2] - schur[1, 1]),
        "affine_witnesses": witnesses,
        "full_target_resolved": False,
    }
    output = Path(__file__).with_name("shallit9-symbolic-closure-check.json")
    output.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
