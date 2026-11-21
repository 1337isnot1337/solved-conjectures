"""Check the phase-exit and finite valuation laws used in the recovery theorem."""
from collections import Counter
from fractions import Fraction
from itertools import product
from math import comb


def binomial(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def exit_counts(d):
    active = Counter({0: Fraction(1)})
    result = Counter()
    for t in range(1, d + 1):
        waiting = Counter()
        for height, prob in active.items():
            for amount in (1, 2):
                target = height + amount
                if target >= d:
                    result[(target - d, t)] += prob / 2
                else:
                    waiting[target] += prob / 2
        active = waiting
    return result


def check_exit():
    comparisons = 0
    for d in range(1, 26):
        counts = exit_counts(d)
        for overshoot in (0, 1):
            law = {}
            for t in range(1, d + 1):
                predicted = Fraction(binomial(t - overshoot, d - t), 2**t)
                assert counts[(overshoot, t)] == predicted
                if predicted:
                    law[t] = predicted
            mass = sum(law.values())
            law = {t: value / mass for t, value in law.items()}
            for h in range(5, 11):
                e = 2 - overshoot
                modulus = 2**(h-e)
                group = {pow(3, t, modulus) for t in range(modulus)}
                order = len(group)
                assert order == modulus // 4
                for s, c in product((-1, 1), (1, 3, 5, 9)):
                    ends = Counter()
                    for t, value in law.items():
                        ends[(s + 2**e * c * pow(3, t, modulus)) % 2**h] += value
                    allowed = {(s + 2**e * c * v) % 2**h for v in group}
                    assert set(ends) <= allowed
                    tv = sum(abs(ends[r] - Fraction(1, order)) for r in allowed) / 2
                    assert tv <= Fraction(order - 1, 2) * max(law.values())
                    assert len(allowed) * 8 >= 2**(h-1)
                    comparisons += 1
    return comparisons


def check_valuations():
    comparisons = 0
    for k in range(1, 6):
        h = 3*k
        # Each list of valuations with total below h defines one odd cylinder.
        expected = Counter()

        def count_lists(left, total, large):
            if left == 0:
                expected[total, large] += Fraction(1, 2**total)
                return
            for v in range(1, h - total):
                count_lists(left - 1, total + v, large + (v >= 3))

        count_lists(k, 0, 0)
        expected['exhausted'] = 1 - sum(expected.values())
        for signs in product((-1, 1), repeat=k):
            observed = Counter()
            for start in range(1, 2**h, 2):
                x, total, large, good = start, 0, 0, 0
                for sign in signs:
                    good += x % 8 in (3, 5)
                    numerator = 3*x + sign
                    divisor = numerator & -numerator
                    v = divisor.bit_length() - 1
                    large += v >= 3
                    total += v
                    x = numerator // divisor
                    if total >= h:
                        break
                assert good >= large
                key = 'exhausted' if total >= h else (total, large)
                observed[key] += 1
            assert {key: Fraction(count, 2**(h-1)) for key, count in observed.items()} == expected
            comparisons += 1
    return comparisons


if __name__ == '__main__':
    print(f'{check_exit()} exit residue laws and {check_valuations()} valuation laws passed')
