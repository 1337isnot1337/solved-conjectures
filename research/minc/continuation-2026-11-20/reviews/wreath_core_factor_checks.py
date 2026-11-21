#!/usr/bin/env python3
"""Exact arithmetic check of the four wreath transfer factors.

The permanent and Fourier traces come from previously reviewed certificate
files. This script checks their new normalization and the exact powers of
kappa. It does not claim a new conjecture case or rerun the source proofs.
"""

from fractions import Fraction
import json
from math import prod
from pathlib import Path


def main():
    source = Path(__file__).resolve().parent.parent / "inequalities"
    f20 = json.loads((source / "f20_transfer_certificate.json").read_text())
    exceptional = json.loads(
        (source / "exceptional_transfer_certificate.json").read_text()
    )
    records = [
        ("Shchesnovich", 5, 5, f20["Shchesnovich"], "trace_32_block",
         [40, 22, 52, 34, 75],
         Fraction(88389238039897945309795, 378681867924813026457741)),
        ("Tran", 5, 5, f20["Tran"], "trace_32_block", [3, 3, 3, 3, 1],
         Fraction(2097152, 6751269)),
        ("Octahedral", 6, 5, exceptional["S6"], "trace_33_block",
         [1, 1, 2, 2, 2, 2], Fraction(1058841, 9765625)),
        ("Drury", 7, 14, exceptional["Fano_S7"], "trace_43_block",
         [1, 1, 2, 2, 2, 2, 2], Fraction(1953125, 56623104)),
    ]
    result = {}
    for name, n, degree, data, trace_key, diagonal, expected in records:
        assert len(diagonal) == n and all(x > 0 for x in diagonal)
        permanent = data["permanent"]
        normalized_trace = Fraction(data[trace_key], degree)
        diagonal_product = prod(diagonal)
        kappa_power = (
            normalized_trace ** n
            / (permanent ** (n - 2) * diagonal_product ** 2)
        )
        assert kappa_power == expected
        assert 0 < kappa_power < 1
        assert normalized_trace < permanent
        result[name] = {
            "order": n,
            "diagonal_product": diagonal_product,
            "normalized_trace": str(normalized_trace),
            "permanent": permanent,
            "kappa_to_order": str(kappa_power),
            "strict_gap_numerator": (
                kappa_power.denominator - kappa_power.numerator
            ),
        }
    print(json.dumps({"checks": "all exact comparisons passed", **result},
                     indent=2))


if __name__ == "__main__":
    main()
