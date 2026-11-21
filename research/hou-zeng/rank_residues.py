"""Rank all CRT classes by their exact number of coprime candidate shifts."""
import argparse
import json
from math import isqrt, prod
from pathlib import Path

import numpy as np


def primes_up_to(limit):
    sieve = bytearray([1]) * (limit + 1)
    for p in range(2, isqrt(limit) + 1):
        if sieve[p]:
            sieve[p * p::p] = bytes((limit - p * p) // p + 1)
    return [p for p in range(2, limit + 1) if sieve[p]]


def shifts(problem, high):
    if problem == "hou":
        fib = []
        a, b = 1, 2
        while a < high:
            fib.append(a)
            a, b = b, a + b
        catalan = []
        c, j = 1, 0
        while c < high:
            catalan.append(c)
            c = c * (4 * j + 2) // (j + 2)
            j += 1
        return sorted({f + c for f in fib for c in catalan if f + c <= high - 3})

    multiplier = 2 if problem == "sun-odd" else 1
    limit = (high - 3) // multiplier
    powers_five = []
    power = 1
    while power <= limit:
        powers_five.append(power)
        power *= 5
    odd_shifts = {2**k + y for k in range(1, limit.bit_length())
                  for y in powers_five if 2**k + y <= limit}
    for p in primes_up_to(isqrt(limit)):
        square = p * p
        odd_shifts = {s for s in odd_shifts if s % square}
    return sorted(multiplier * s for s in odd_shifts)


def coprime_scores(values, primes):
    shape = tuple(primes)
    counts = np.zeros(shape, dtype=np.int32)
    indices = tuple(np.array(values, dtype=np.int64) % p for p in primes)
    np.add.at(counts, indices, 1)
    for axis in range(len(primes)):
        totals = counts.sum(axis=axis, keepdims=True, dtype=counts.dtype)
        np.subtract(totals, counts, out=counts)
    return counts


def rank(problem, low, high, primes, keep):
    values = shifts(problem, high)
    scores = coprime_scores(values, primes)
    # Other parity would have no admissible odd residual by construction.
    if problem != "hou":
        scores[0 if problem == "sun-odd" else 1] = len(values) + 1
    modulus = prod(primes)
    factors = [modulus // p * pow(modulus // p, -1, p) for p in primes]
    if not 1 <= keep <= modulus // (1 if problem == "hou" else 2):
        raise ValueError("invalid number of classes")
    cutoff = int(np.partition(scores.ravel(), keep - 1)[keep - 1])
    candidates = []
    for coords in zip(*np.where(scores <= cutoff)):
        residue = sum(int(c) * f for c, f in zip(coords, factors)) % modulus
        candidates.append((int(scores[coords]), residue))
    best = sorted(candidates)[:keep]
    return dict(problem=problem, low=low, high=high, primes=primes, modulus=modulus,
                shifts=values, classes=[dict(score=v, residue=r) for v, r in best])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("problem", choices=("hou", "sun-even", "sun-odd"))
    parser.add_argument("low", type=int)
    parser.add_argument("high", type=int)
    parser.add_argument("keep", type=int)
    parser.add_argument("output", type=Path)
    parser.add_argument("--primes", type=int, nargs="+", default=[2, 3, 5, 7, 11, 13, 17, 19])
    args = parser.parse_args()
    if not 8 <= args.low <= args.high <= 10**15:
        parser.error("use 8 <= low <= high <= 10^15")
    if (not args.primes or args.primes[0] != 2 or len(set(args.primes)) != len(args.primes)
            or any(p < 2 or any(p % d == 0 for d in range(2, isqrt(p) + 1)) for p in args.primes)):
        parser.error("use distinct primes starting with 2")
    data = rank(args.problem, args.low, args.high, args.primes, args.keep)
    args.output.write_text(json.dumps(data, separators=(",", ":")) + "\n")
    print(f"{args.problem}: {len(data['shifts'])} distinct shifts, {data['modulus']} classes, "
          f"minimum {data['classes'][0]['score']}, retained maximum {data['classes'][-1]['score']}")


if __name__ == "__main__":
    main()
