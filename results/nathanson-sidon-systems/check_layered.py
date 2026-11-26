#!/usr/bin/env python3
"""Check the gcd-chain low digits and signed three-level coordinate construction."""

from itertools import product
from math import gcd, lcm, prod


def low_radices(weights, modulus):
    divisor = modulus
    backwards = []
    for weight in reversed(weights):
        next_divisor = gcd(divisor, weight)
        backwards.append(divisor // next_divisor)
        divisor = next_divisor
    return backwards[::-1], divisor


def submasks(mask):
    return [x for x in range(mask + 1) if x & mask == x]


def check():
    residues = 0
    for length in range(1, 5):
        for weights in product(range(1, 5), repeat=length):
            modulus = lcm(*weights)
            counts, divisor = low_radices(weights, modulus)
            outputs = {sum(w*d for w, d in zip(weights, digits)) % modulus
                       for digits in product(*(range(r) for r in counts))}
            assert outputs == set(range(0, modulus, divisor))
            assert prod(counts) == len(outputs)
            residues += 1

    systems = tuples = 0
    for coefficients in [(1, -1), (2, -3), (-4, 2), (1, -2, 1), (2, 3, -3)]:
        weights = list(map(abs, coefficients))
        modulus = lcm(*weights)
        low, divisor = low_radices(weights, modulus)
        for J in [1, 2, 3]:
            H = 2**J
            for D in range(H):
                upper = [[0] for _ in coefficients]
                upper[-2:] = [submasks(D), submasks(H-1-D)]
                period = lcm(*(l*len(u) for l, u in zip(low, upper)))
                for t in [1, 2]:
                    q = period*t
                    if q**len(weights) > 100000:
                        continue
                    middle = [q//(l*len(u)) for l, u in zip(low, upper)]
                    T = prod(middle)
                    assert modulus*T*H == divisor*q**len(weights)
                    sets = []
                    stride = 1
                    for weight, l, r, digits in zip(weights, low, middle, upper):
                        values = {a + (modulus//weight)*(stride*x+T*y)
                                  for a, x, y in product(range(l), range(r), digits)}
                        assert len(values) == q
                        sets.append(values)
                        stride *= r
                    N = 1 + max(map(max, sets))
                    signed = [{N-x if c<0 else x+1 for x in values}
                              for c, values in zip(coefficients, sets)]
                    assert all(min(s)>=1 and max(s)<=N for s in signed)
                    outputs = {sum(c*x for c, x in zip(coefficients, point))
                               for point in product(*signed)}
                    assert len(outputs) == q**len(weights)
                    systems += 1
                    tuples += len(outputs)
    print(f"Checked {residues} residue systems and {systems} signed constructions "
          f"with {tuples:,} actual tuples.")


if __name__ == "__main__":
    check()
