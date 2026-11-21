"""Search finite congruence covers for Sun's odd-prime + Pell + 2 Pell problem.

A covering solution is only an intermediate certificate. It must be followed
by an explicit CRT integer and an exact check of exceptional prime remainders.
The default run includes every prime divisor of gcd(P_L, P_(L+1)-1).
"""
from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
import time

import numpy as np
import scipy.optimize as opt
from scipy.sparse import coo_matrix, vstack
import sympy as sp


def pell_pair(n):
    a, b = 0, 1
    for _ in range(n):
        a, b = b, 2 * b + a
    return a, b


def pell_residues(period, p):
    a, b = 0, 1
    out = []
    for _ in range(period):
        out.append(a)
        a, b = b, (a + 2 * b) % p
    assert a == 0 and b == 1, (period, p, a, b)
    return np.array(out, dtype=np.int64)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--period", type=int, default=120)
    ap.add_argument("--n-parity", type=int, choices=[0, 1], default=0)
    ap.add_argument("--time-limit", type=int, default=40)
    ap.add_argument("--output", type=Path, required=True)
    ap.add_argument("--lp-only", action="store_true")
    ap.add_argument("--factor-file", type=Path)
    args = ap.parse_args()
    L = args.period
    assert L % 2 == 0
    a, b = pell_pair(L)
    g = math.gcd(a, b - 1)
    factors = ({int(p): int(e) for p, e in json.loads(args.factor_file.read_text()).items()}
               if args.factor_file else sp.factorint(g))
    assert math.prod(int(p) ** e for p, e in factors.items()) == g
    assert all(sp.isprime(p) for p in factors)
    primes = sorted(int(p) for p in factors if p > 2)
    assert 3 * max(primes) < 2**63, "Use arbitrary precision for larger residue arithmetic."
    # Odd residual prime requires s parity different from n parity.
    ss = np.arange(1 - args.n_parity, L, 2)
    cells = len(ss) * L
    rows, cols, group_rows, group_cols = [], [], [], []
    descriptors = []
    incidence = []
    variable_offset = 0
    sizes = []
    for k, p in enumerate(primes):
        values = pell_residues(L, p)
        sums = ((values[ss, None] + 2 * values[None, :]) % p).ravel()
        residues, inv, counts = np.unique(sums, return_inverse=True, return_counts=True)
        indices = inv + variable_offset
        rows.extend(range(cells))
        cols.extend(indices.tolist())
        group_rows.extend([k] * len(residues))
        group_cols.extend(range(variable_offset, variable_offset + len(residues)))
        descriptors.extend((p, int(r)) for r in residues)
        incidence.append(indices)
        sizes.append({"prime": p, "residue_classes": len(residues), "largest_class": int(counts.max())})
        variable_offset += len(residues)
    cover = coo_matrix((np.ones(len(rows)), (rows, cols)), shape=(cells, variable_offset)).tocsr()
    group = coo_matrix((np.ones(len(group_rows)), (group_rows, group_cols)), shape=(len(primes), variable_offset)).tocsr()
    summary = {"status": "no result yet", "period": L, "n_parity": args.n_parity,
               "period_prime_gcd": str(g), "factorization": {str(p): int(e) for p, e in factors.items()},
               "cells": cells, "variables": variable_offset, "prime_classes": sizes}
    started = time.monotonic()
    lp = opt.linprog(np.zeros(variable_offset), A_ub=-cover,
                     b_ub=-np.ones(cells), A_eq=group, b_eq=np.ones(len(primes)),
                     bounds=(0, 1), method="highs", options={"time_limit": args.time_limit})
    summary["lp"] = {"status": int(lp.status), "message": lp.message}
    args.output.write_text(json.dumps(summary, indent=2) + "\n")
    print(json.dumps({"phase": "LP", **summary["lp"], "cells": cells, "variables": variable_offset}), flush=True)
    if lp.status == 2:
        summary["status"] = "LP relaxation reported infeasible; no exact dual certificate reconstructed"
    elif args.lp_only:
        summary["status"] = "LP check only; integral cover undetermined"
    else:
        constraint = opt.LinearConstraint(vstack([cover, group], format="csc"),
                                          np.ones(cells + len(primes)),
                                          np.r_[np.full(cells, np.inf), np.ones(len(primes))])
        result = opt.milp(np.zeros(variable_offset), integrality=np.ones(variable_offset),
                          bounds=opt.Bounds(0, 1), constraints=constraint,
                          options={"time_limit": args.time_limit})
        summary["milp"] = {"status": int(result.status), "message": result.message}
        if result.x is not None:
            chosen = np.flatnonzero(result.x > .5)
            x = np.zeros(variable_offset, dtype=int)
            x[chosen] = 1
            assert np.all(cover @ x >= 1)
            assert np.all(group @ x == 1)
            summary["cover"] = [list(descriptors[i]) for i in chosen]
            summary["status"] = "integral cover found and exact incidence checked"
        elif result.status == 2:
            summary["status"] = "MILP reported infeasible; no independent exact proof"
        else:
            summary["status"] = "no cover found within solver limit; infeasibility unproved"
        print(json.dumps({"phase": "MILP", **summary["milp"]}), flush=True)
    summary["elapsed_seconds"] = time.monotonic() - started
    args.output.write_text(json.dumps(summary, indent=2) + "\n")


if __name__ == "__main__":
    main()
