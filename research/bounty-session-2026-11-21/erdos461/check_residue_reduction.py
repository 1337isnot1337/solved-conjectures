#!/usr/bin/env python3
"""Finite verification of the residue reduction; not a solution of Erdős 461."""
from __future__ import annotations
import json
import math
from pathlib import Path
import numpy as np


def primes_below(t: int) -> list[int]:
    return [p for p in range(2, t) if all(p % d for d in range(2, math.isqrt(p) + 1))]


def modulus(t: int) -> int:
    out = 1
    for p in primes_below(t):
        power = p
        while power < t:
            power *= p
        out *= power
    return out


def smooth(m: int, t: int) -> int:
    assert m > 0
    out = 1
    for p in primes_below(t):
        while m % p == 0:
            m //= p
            out *= p
    return out


def partition(values: list[int]) -> tuple[int, ...]:
    labels: dict[int, int] = {}
    return tuple(labels.setdefault(v, len(labels)) for v in values)


def run(max_t: int = 11) -> dict:
    rows = []
    collision_checks = 0
    for t in range(2, max_t + 1):
        L = modulus(t)
        best = t + 1
        witness = None
        minimizers = 0
        for start in range(0, L, 100_000):
            ns = np.arange(start, min(L, start + 100_000), dtype=np.int64)
            vals = np.gcd(ns[:, None] + np.arange(1, t+1)[None, :], L)
            vals.sort(axis=1)
            counts = 1 + np.sum(vals[:, 1:] != vals[:, :-1], axis=1)
            found = int(counts.min())
            if found < best:
                best = found
                witness = int(ns[np.flatnonzero(counts == found)[0]])
                minimizers = int(np.sum(counts == found))
            elif found == best:
                minimizers += int(np.sum(counts == best))
        assert witness is not None
        sample = sorted({0, 1, t, L//2, L-1, witness})
        for n0 in sample:
            for k in range(4):
                n = n0 + k * L
                ss = [smooth(n+i, t) for i in range(1, t+1)]
                gs = [math.gcd(n+i, L) for i in range(1, t+1)]
                assert partition(ss) == partition(gs)
                assert len(set(ss)) == len(set(math.gcd(n0+i, L) for i in range(1,t+1)))
                if t > 2:
                    for i in range(t):
                        for j in range(i+1, t):
                            if ss[i] == ss[j]:
                                assert (j-i) % (2*ss[i]) == 0
                                collision_checks += 1
        rows.append({
            't': t, 'period': L, 'all_residues_enumerated': L,
            'minimum_count': best, 'ratio': best/t,
            'first_minimizer': witness, 'minimizing_residues': minimizers,
            'witness_smooth_components': [smooth(witness+i,t) for i in range(1,t+1)],
            'witness_gcds': [math.gcd(witness+i,L) for i in range(1,t+1)],
        })
    return {'status':'finite_check_only_no_bounty_solution',
            'full_periods_enumerated':rows,
            'sampled_equal_component_pair_checks':collision_checks}

if __name__ == '__main__':
    result = run()
    target = Path(__file__).with_name('residue-checks.json')
    target.write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result, indent=2))
