#!/usr/bin/env python3
"""Exact diagnostic for Erdős 49. Finite success does not prove the conjecture."""

from __future__ import annotations

import argparse
from array import array
from bisect import bisect_left
import hashlib
import json
from math import gcd
from pathlib import Path


def sieve(limit: int) -> tuple[array, array]:
    phi = array("I", range(limit + 1))
    prime_count = array("I", [0]) * (limit + 1)
    count = 0
    for p in range(2, limit + 1):
        if phi[p] == p:
            count += 1
            for n in range(p, limit + 1, p):
                phi[n] -= phi[n] // p
        prime_count[p] = count
    return phi, prime_count


def blocker_count(chain: list[int], phi: array, pi: array) -> int:
    return len({p for c in chain for p in range(phi[c] + 1, c)
                if pi[p] > pi[p - 1]})


def positive_group(chain: list[int], phi: array, pi: array) -> list[int]:
    """Extract a group with more composites than its blocking-prime interval."""
    group: list[int] = []
    left = right = 0
    for c in chain:
        lo, hi = pi[phi[c]] + 1, pi[c]
        if lo > hi:
            return [c]
        if group and lo > right + 1:
            if len(group) > right - left + 1:
                return group
            group = []
        if not group:
            left = lo
        group.append(c)
        right = hi
    if group and len(group) > right - left + 1:
        return group
    raise AssertionError("An increasing witness must contain a positive group")


def small_checks() -> dict:
    phi, pi = sieve(250)
    for n in range(1, 251):
        assert phi[n] == sum(gcd(n, k) == 1 for k in range(1, n + 1))
    dp = [0] * 251
    tails: list[int] = []
    lengths = [0] * 251
    for n in range(1, 251):
        dp[n] = 1 + max((dp[m] for m in range(1, n) if phi[m] < phi[n]), default=0)
        k = bisect_left(tails, phi[n])
        if k == len(tails):
            tails.append(phi[n])
        else:
            tails[k] = phi[n]
        lengths[n] = len(tails)
        assert lengths[n] == max(dp[: n + 1])

    checked = 0
    for n in range(2, 26):
        comps = [c for c in range(4, n + 1) if phi[c] != c - 1]
        best = 0
        for mask in range(1 << len(comps)):
            chain = [c for j, c in enumerate(comps) if mask >> j & 1]
            if any(phi[a] >= phi[b] for a, b in zip(chain, chain[1:])):
                continue
            checked += 1
            deficit = len(chain) - blocker_count(chain, phi, pi)
            best = max(best, deficit)
        assert lengths[n] == pi[n] + best
    return {"gcd_totients_through": 250, "quadratic_lis_through": 250,
            "exhaustive_chain_formula_through": 25, "chains_checked": checked}


def search(limit: int) -> dict:
    phi, pi = sieve(limit)
    tails: list[int] = []
    tail_indices: list[int] = []
    predecessor = array("I", [0]) * (limit + 1)
    for n in range(1, limit + 1):
        k = bisect_left(tails, phi[n])
        predecessor[n] = tail_indices[k - 1] if k else 0
        if k == len(tails):
            tails.append(phi[n])
            tail_indices.append(n)
        else:
            tails[k] = phi[n]
            tail_indices[k] = n
        if n < 2 or len(tails) == pi[n]:
            continue
        assert len(tails) > pi[n]  # All primes are an admissible subsequence.
        witness = []
        cur = tail_indices[-1]
        while cur:
            witness.append(cur)
            cur = predecessor[cur]
        witness.reverse()
        if witness[0] == 1:
            witness[0] = 2
        assert all(a < b and phi[a] < phi[b] for a, b in zip(witness, witness[1:]))
        comps = [c for c in witness if phi[c] != c - 1]
        core = positive_group(comps, phi, pi)
        assert len(core) > pi[core[-1]] - pi[phi[core[0]]]
        return {"status": "candidate_counterexample_requires_independent_review",
                "first_mismatch": n, "f": len(tails), "pi": pi[n],
                "core": core, "core_totients": [phi[c] for c in core],
                "core_prime_span_count": pi[core[-1]] - pi[phi[core[0]]],
                "bounty_solutions": 0, "bounty_submissions": 0}
    return {"status": "finite_check_no_counterexample",
            "checked_every_prefix_from": 2, "checked_through": limit,
            "f_at_limit": len(tails), "pi_at_limit": pi[limit],
            "bounty_solutions": 0, "bounty_submissions": 0}


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--limit", type=int, default=2_000_000)
    parser.add_argument("--output", type=Path, default=Path("erdos49_check.json"))
    args = parser.parse_args()
    if not 2 <= args.limit < 2 ** 32:
        parser.error("limit must be in [2, 2**32)")
    checks = small_checks()
    result = search(args.limit)
    result["checks"] = checks
    result["script_sha256"] = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    args.output.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
