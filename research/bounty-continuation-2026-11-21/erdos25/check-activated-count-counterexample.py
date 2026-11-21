#!/usr/bin/env python3
"""Exact certificate against a proposed auxiliary E25 counting inequality.

This is a single counterexample to a universal inequality, not an E25
counterexample. All computations are integer or rational computations.
"""

from fractions import Fraction
from math import isqrt, prod
from pathlib import Path
import json


def main():
    cutoff = 1_000_000
    root = isqrt(cutoff)
    assert root * root == cutoff

    prime = bytearray(b"\x01") * (cutoff + 1)
    prime[0:2] = b"\x00\x00"
    for p in range(2, root + 1):
        if prime[p]:
            prime[p * p : cutoff + 1 : p] = b"\x00" * (
                (cutoff - p * p) // p + 1
            )
    moduli = [p for p in range(2, root + 1) if prime[p]]
    trial_division_moduli = [
        p for p in range(2, root + 1)
        if all(p % d for d in range(2, isqrt(p) + 1))
    ]
    assert moduli == trial_division_moduli
    modulus_count = len(moduli)
    prime_count = sum(prime)
    assert modulus_count == 168
    assert prime_count == 78_498

    # Independently mark the activated zero-residue classes. Their first
    # positive point is p, so the activation cutoff removes no multiples.
    deleted = bytearray(cutoff + 1)
    for p in moduli:
        deleted[p : cutoff + 1 : p] = b"\x01" * (cutoff // p)
    deleted_count = sum(deleted)
    assert deleted_count == cutoff - 1 - prime_count + modulus_count
    assert deleted_count == 921_669

    numerator = prod(p - 1 for p in moduli)
    denominator = prod(moduli)
    survivor_density = Fraction(numerator, denominator)
    deleted_density = 1 - survivor_density
    coarse_lower_bound = Fraction(79, 1000)
    cross_difference = 1000 * numerator - 79 * denominator
    assert cross_difference > 0
    assert survivor_density > coarse_lower_bound

    proposed_rhs = cutoff * deleted_density + modulus_count
    coarse_rhs = cutoff * (1 - coarse_lower_bound) + modulus_count
    assert coarse_rhs == 921_168
    assert proposed_rhs < coarse_rhs < deleted_count

    certificate = {
        "scope": "Counterexample to an auxiliary activated-count bound; not to Erdos 25",
        "cutoff": cutoff,
        "moduli": moduli,
        "all_residues": 0,
        "modulus_count": modulus_count,
        "prime_count_at_cutoff": prime_count,
        "deleted_count_direct": deleted_count,
        "deleted_count_composite_identity": cutoff - 1 - prime_count + modulus_count,
        "survivor_density": {
            "numerator": str(survivor_density.numerator),
            "denominator": str(survivor_density.denominator),
        },
        "product_lower_bound": {
            "numerator": 79,
            "denominator": 1000,
            "integer_cross_difference": str(cross_difference),
            "strictly_positive": cross_difference > 0,
        },
        "proposed_rhs": {
            "numerator": str(proposed_rhs.numerator),
            "denominator": str(proposed_rhs.denominator),
        },
        "strict_upper_bound_on_proposed_rhs": int(coarse_rhs),
        "margin_over_coarse_upper_bound": deleted_count - int(coarse_rhs),
        "prime_list_checked_by_trial_division": True,
        "assertions_passed": True,
    }
    output = Path(__file__).with_name("activated-count-counterexample.json")
    output.write_text(json.dumps(certificate, indent=2) + "\n")
    print(json.dumps({
        "output": str(output),
        "deleted_count": deleted_count,
        "strict_upper_bound_on_proposed_rhs": int(coarse_rhs),
        "assertions_passed": True,
    }))


if __name__ == "__main__":
    main()
