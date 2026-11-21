"""Find and exactly verify a weighted obstruction to a fixed Pell-period cover.

The floating-point optimizer only proposes integer weights.  The final check
uses Python integers: each prime can cover at most one of its residue classes,
and the sum of those capacities must be smaller than the total cell weight.
This rules out this finite-period covering method, not Sun's conjecture.
"""
from __future__ import annotations

import argparse
import json
import math
from pathlib import Path

import numpy as np
from scipy.optimize import linprog
from scipy.sparse import coo_matrix, hstack
import sympy as sp

from search_cover import pell_pair, pell_residues


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--period", type=int, required=True)
    ap.add_argument("--n-parity", type=int, choices=[0, 1], required=True)
    ap.add_argument("--output", type=Path, required=True)
    ap.add_argument("--fixed", default="", help="Comma-separated p:a congruences")
    ap.add_argument("--time-limit", type=int, default=40)
    ap.add_argument("--factor-file", type=Path)
    ap.add_argument("--sample", type=int, default=0)
    args = ap.parse_args()
    L = args.period
    fixed = {int(p): int(a) for p, a in (s.split(":") for s in args.fixed.split(",") if s)}
    a, b = pell_pair(L)
    g = math.gcd(a, b - 1)
    factors = ({int(p): int(e) for p, e in json.loads(args.factor_file.read_text()).items()}
               if args.factor_file else sp.factorint(g))
    assert math.prod(int(p)**int(e) for p, e in factors.items()) == g
    assert all(sp.isprime(p) for p in factors)
    primes = sorted(int(p) for p in factors if p > 2)
    assert 3 * max(primes) < 2**63, "Use arbitrary precision for larger residue arithmetic."
    assert set(fixed).issubset(primes)
    pairs = np.array([(s, t) for s in range(1 - args.n_parity, L, 2) for t in range(L)])
    keep = np.ones(len(pairs), dtype=bool)
    all_sums = {}
    for p in primes:
        vals = pell_residues(L, p)
        sums = (vals[pairs[:, 0]] + 2 * vals[pairs[:, 1]]) % p
        all_sums[p] = sums
        if p in fixed:
            keep &= sums != fixed[p]
    pairs = pairs[keep]
    if args.sample and len(pairs) > args.sample:
        rng = np.random.default_rng(20261121 + args.n_parity + sum(fixed.values()))
        chosen = np.sort(rng.choice(len(pairs), args.sample, replace=False))
        pairs = pairs[chosen]
    else:
        chosen = None
    primes = [p for p in primes if p not in fixed]
    rows, cols, group_rows, group_cols = [], [], [], []
    sums_by_prime = {}
    start = 0
    for k, p in enumerate(primes):
        sums = all_sums[p][keep]
        if chosen is not None:
            sums = sums[chosen]
        residues, inverse = np.unique(sums, return_inverse=True)
        sums_by_prime[p] = sums
        rows.extend((start + inverse).tolist())
        cols.extend(range(len(pairs)))
        group_rows.extend(range(start, start + len(residues)))
        group_cols.extend([k] * len(residues))
        start += len(residues)
    incidence = coo_matrix((np.ones(len(rows)), (rows, cols)), shape=(start, len(pairs))).tocsr()
    group = coo_matrix((np.ones(len(group_rows)), (group_rows, group_cols)), shape=(start, len(primes))).tocsr()
    cost = np.r_[np.zeros(len(pairs)), np.ones(len(primes))]
    result = linprog(cost, A_ub=hstack([incidence, -group], format="csr"), b_ub=np.zeros(start),
                     A_eq=coo_matrix((np.ones(len(pairs)), (np.zeros(len(pairs), dtype=int), np.arange(len(pairs)))),
                                     shape=(1, len(pairs) + len(primes))),
                     b_eq=[1], bounds=(0, None), options={"time_limit": args.time_limit})
    out = {"period": L, "n_parity": args.n_parity, "fixed_congruences": fixed,
           "factorization": {str(p): int(e) for p, e in factors.items()},
           "cells_considered": len(pairs),
           "lp_status": int(result.status), "lp_message": result.message,
           "status": "no exact obstruction found"}
    if result.x is not None:
        out["lp_capacity_ratio"] = float(result.fun)
        assert np.all(np.isfinite(result.x))
        weights = np.maximum(np.rint(result.x[:len(pairs)] * 10**9), 0).astype(np.int64)
        selected = np.flatnonzero(weights)
        caps = {}
        total = sum(int(weights[i]) for i in selected)
        for p in primes:
            buckets = {}
            for i in selected:
                residue = int(sums_by_prime[p][i])
                buckets[residue] = buckets.get(residue, 0) + int(weights[i])
            caps[p] = max(buckets.values(), default=0)
        if sum(caps.values()) < total:
            out.update(status="exact weighted capacity obstruction verified",
                       total_weight=total, total_capacity=sum(caps.values()),
                       capacities={str(p): c for p, c in caps.items()},
                       weighted_cells=[[int(pairs[i, 0]), int(pairs[i, 1]), int(weights[i])] for i in selected])
    args.output.write_text(json.dumps(out, indent=2) + "\n")
    print(json.dumps({k: v for k, v in out.items() if k != "weighted_cells"}), flush=True)


if __name__ == "__main__":
    main()
