"""Exact finite falsification probe for a sufficient, unproved analytic step.

This is not a test or proof of Erdős 708. It tests whether each individual
prime's Shapley allocation satisfies the required interval comparison for
bounded first-power profiles u_p(m)=w_p*1_{p|m}. All costs are integer-scaled.
"""

import json
import math
import pathlib
import random

import numpy as np


PRIMES = (2, 3, 5, 7, 11, 13)
R = len(PRIMES)
PERIOD = math.prod(PRIMES)
FACT = math.factorial(R)
LENGTHS = (30, 42, 60, 70, 90, 120, 150, 210, 300, 420, 600, 1000, 2000, 5000)


def allocations(weights, denominator, threshold):
    result = np.zeros((1 << R, R), dtype=np.int64)
    for mask in range(1, 1 << R):
        t = mask.bit_count()
        base = FACT // math.factorial(t)
        for i in range(R):
            if not (mask >> i) & 1:
                continue
            other = mask ^ (1 << i)
            subset = other
            while True:
                k = subset.bit_count()
                before = sum(weights[j] for j in range(R) if (subset >> j) & 1)
                change = max(before + weights[i] - threshold * denominator, 0) - max(
                    before - threshold * denominator, 0
                )
                coefficient = base * math.factorial(k) * math.factorial(t - k - 1)
                result[mask, i] += coefficient * change
                if subset == 0:
                    break
                subset = (subset - 1) & other
    return result


def main():
    numbers = np.arange(1, PERIOD + 1, dtype=np.int64)
    masks = np.zeros(PERIOD, dtype=np.int64)
    for i, p in enumerate(PRIMES):
        masks += (numbers % p == 0) * (1 << i)

    rng = random.Random(70820261121)
    profiles = [(4, (4,) * R)]
    profiles.extend((4, tuple(rng.randint(1, 4) for _ in PRIMES)) for _ in range(36))
    profiles.extend((8, tuple(rng.randint(1, 8) for _ in PRIMES)) for _ in range(36))
    cases = 0
    found = None
    for denominator, weights in profiles:
        source = allocations(weights, denominator, 2)[masks]
        target = allocations(weights, denominator, 1)[masks]
        source_prefix = np.vstack((np.zeros((1, R), dtype=np.int64), np.cumsum(source, axis=0)))
        repeated = np.vstack((target, target[: max(LENGTHS)]))
        target_prefix = np.vstack((np.zeros((1, R), dtype=np.int64), np.cumsum(repeated, axis=0)))
        for length in LENGTHS:
            windows = target_prefix[length : PERIOD + length] - target_prefix[:PERIOD]
            difference = windows - source_prefix[length]
            flat = int(np.argmin(difference))
            shift, coordinate = divmod(flat, R)
            cases += 1
            if int(difference[shift, coordinate]) < 0:
                scale = denominator * FACT
                found = {
                    "primes": PRIMES,
                    "weights_numerators": weights,
                    "weight_denominator": denominator,
                    "length": length,
                    "shift": shift,
                    "coordinate_prime": PRIMES[coordinate],
                    "source_numerator": int(source_prefix[length, coordinate]),
                    "target_numerator": int(windows[shift, coordinate]),
                    "common_denominator": scale,
                    "difference_numerator": int(difference[shift, coordinate]),
                }
                break
        if found is not None:
            break
    output = {
        "scope": "finite falsification probe of per-prime order-averaged bounded-profile comparison",
        "full_hinge_solved": False,
        "erdos708_solved": False,
        "period": PERIOD,
        "profile_length_cases_examined": cases,
        "witness": found,
        "interpretation": "A witness refutes only this sufficient per-prime step; no witness proves nothing universal.",
    }
    path = pathlib.Path(__file__).with_name("order-average-probe.json")
    path.write_text(json.dumps(output, indent=2) + "\n")
    print(json.dumps(output, indent=2))


if __name__ == "__main__":
    main()
