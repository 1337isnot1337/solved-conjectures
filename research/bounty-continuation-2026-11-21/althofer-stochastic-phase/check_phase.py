"""Exact consistency checks of phase formulas, not a Collatz range test."""

from collections import defaultdict
from fractions import Fraction
from math import comb
import json


def overshoot_formula(d, t):
    k = d - t
    return Fraction(comb(t - 1, k), 2**t) if 0 <= k <= t - 1 else Fraction(0)


def stopped_increment_law(d):
    frontier = {(0, 0): Fraction(1)}
    terminal = defaultdict(Fraction)
    while frontier:
        following = defaultdict(Fraction)
        for (total, length), probability in frontier.items():
            for step in (1, 2):
                state = total + step, length + 1
                if state[0] >= d:
                    terminal[state] += probability / 2
                else:
                    following[state] += probability / 2
        frontier = following
    return terminal


def valuation_two(n):
    assert n > 0
    return (n & -n).bit_length() - 1


def odd_part(n):
    return n >> valuation_two(n)


def literal_phase(sign, height, coefficient):
    frontier = {(sign + 2**height * coefficient, 0): Fraction(1)}
    terminal = defaultdict(Fraction)
    while frontier:
        following = defaultdict(Fraction)
        for (n, length), probability in frontier.items():
            old_sign_height = valuation_two(n - sign)
            if old_sign_height <= 2:
                terminal[(n, length, old_sign_height)] += probability
                continue
            for epsilon in (-1, 1):
                child = odd_part(3 * n + epsilon)
                following[(child, length + 1)] += probability / 2
        frontier = following
    return terminal


def main():
    progression_checks = 0
    for d in range(1, 61):
        law = stopped_increment_law(d)
        mass = [overshoot_formula(d, t) for t in range(1, d + 1)]
        assert sum(law.values()) == 1
        for t in range(1, d + 1):
            assert law.get((d + 1, t), Fraction(0)) == mass[t - 1]
        total = sum(mass)
        peak = max(mass)
        assert total == Fraction(1, 3) - Fraction(1, 3) * Fraction(-1, 2)**d
        assert peak * peak <= Fraction(1, 2 * d)
        assert peak * peak >= Fraction(1, 2500 * d)
        for modulus in range(1, 18):
            for residue in range(modulus):
                selected = sum(mass[t - 1] for t in range(1, d + 1)
                               if t % modulus == residue)
                assert selected <= total / modulus + peak
                progression_checks += 1

    constructed_checks = 0
    examples = []
    for d in range(1, 9):
        for t in range((d + 2) // 2, d + 1):
            for multiplier in (1, 2):
                next_height = 1 + 2 * 3**(t - 1) * multiplier
                numerator = 2**(next_height - 1) - 1
                assert numerator % 3**t == 0
                coefficient = numerator // 3**t
                assert coefficient > 0 and coefficient % 2 == 1
                law = literal_phase(1, d + 2, coefficient)
                target = (2**next_height - 1, t, 1)
                assert law[target] == overshoot_formula(d, t)
                assert valuation_two(target[0] + 1) == next_height
                peak = max(overshoot_formula(d, k) for k in range(1, d + 1))
                mean_height = sum(probability * max(valuation_two(n - 1), valuation_two(n + 1))
                                  for (n, _, _), probability in law.items())
                height_bound = (3**d * coefficient + 1).bit_length() + 1
                assert mean_height <= 3 + height_bound * peak
                constructed_checks += 1
                if d <= 3 and multiplier == 2:
                    examples.append({"d": d, "duration": t, "initial_height": d + 2,
                        "next_height": next_height, "event_probability": str(law[target]),
                        "initial_integer_bit_length": (1 + 2**(d + 2) * coefficient).bit_length(),
                        "mean_next_height": str(mean_height)})

    print(json.dumps({"status": "passed", "renewal_depths_checked": 60,
        "exact_progression_checks": progression_checks,
        "literal_constructed_transition_checks": constructed_checks,
        "examples": examples,
        "scope": "Formula checks only; no conjecture verification range or absorption claim."}, indent=2))


if __name__ == "__main__":
    main()
