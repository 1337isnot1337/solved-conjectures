"""Replay the integer certificate in the earlier Principia MathDB 332483 proof.

This is a priority check, not a new resolution. The ordinary proof is public in
PrincipiaMathOrg/math-solutions commit
34b8b155d7db464ad7306f70b16d3af9cee34501 (27 October 2026).
"""

from math import comb
import json


def main():
    values = [1, 8]
    for n in range(2, 27):
        numerator = (
            8 * (3 * n * n - 3 * n + 1) * values[-1]
            - 128 * (n - 1) ** 2 * values[-2]
        )
        quotient, remainder = divmod(numerator, n * n)
        assert remainder == 0 and quotient > 0
        values.append(quotient)

    a = b = 1
    for j in range(15):
        factor = values[12 + j] ** comb(14, j)
        if j % 2 == 0:
            a *= factor
        else:
            b *= factor

    assert 999999999814 * b < 10**12 * a < 999999999815 * b
    assert a < b
    print(json.dumps({
        "prior_certificate_replayed": True,
        "A_bits": a.bit_length(),
        "B_bits": b.bit_length(),
        "first_verified_github_commit":
            "34b8b155d7db464ad7306f70b16d3af9cee34501",
        "first_verified_github_date": "2026-10-27T02:59:18Z",
    }, indent=2))


if __name__ == "__main__":
    main()
