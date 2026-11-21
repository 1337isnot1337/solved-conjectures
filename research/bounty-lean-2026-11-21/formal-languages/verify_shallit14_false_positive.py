"""Exact false positive for an attempted extension of ACCEPTS-POWER.

This checks a counterexample to a proposed reduction. It does not decide
Shallit's problem 14 and is not a bounty solution.
"""
import json


def main():
    radix = 4
    initial_length = 13
    final_length = 1
    top = "3" + "1" * initial_length + "3" + "0" * (final_length + 1)
    bottom = "0" * (initial_length + 1) + "3" + "2" * final_length + "3"
    pairs = list(zip(top, bottom, strict=True))
    expected = (
        [("3", "0")]
        + [("1", "0")] * initial_length
        + [("3", "3")]
        + [("0", "2")] * final_length
        + [("0", "3")]
    )
    assert pairs == expected
    numerator = int(top, radix)
    denominator = int(bottom, radix)
    quotient, remainder = divmod(numerator, denominator)
    assert remainder == 0 and denominator == 59
    assert numerator == 14_316_557_680
    assert quotient == 242_653_520
    assert quotient % 16 == 0
    assert quotient // 16 > 1 and (quotient // 16) % 2 == 1
    # Exact periodicity used in the infinite-family proof.
    assert pow(4, 29, 59) == 1
    assert (2 * pow(4, 14, 59) + 1) % 59 == 0
    print(json.dumps({
        "verified": True,
        "base": radix,
        "initial_length": initial_length,
        "final_length": final_length,
        "top": top,
        "bottom": bottom,
        "numerator": numerator,
        "denominator": denominator,
        "integer_quotient": quotient,
        "quotient_is_power_of_base": False,
        "scope": "unmodified ACCEPTS-POWER reduction fails for integer quotients"
    }))


if __name__ == "__main__":
    main()
