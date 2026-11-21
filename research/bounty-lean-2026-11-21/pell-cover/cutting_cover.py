"""Constraint-generation search for a full finite Pell congruence cover.

Only a cover verified on every residue pair is a positive result. An interim
sample, a timeout, or a solver infeasibility message is not a counterexample.
"""
from __future__ import annotations
import argparse
import json
import math
from pathlib import Path
import time

import numpy as np
from scipy.optimize import Bounds, LinearConstraint, milp
from scipy.sparse import coo_matrix, vstack
import sympy as sp

from search_cover import pell_pair, pell_residues


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--period", type=int, required=True)
    ap.add_argument("--n-parity", type=int, choices=[0, 1], required=True)
    ap.add_argument("--factor-file", type=Path)
    ap.add_argument("--output", type=Path, required=True)
    ap.add_argument("--rounds", type=int, default=8)
    ap.add_argument("--batch", type=int, default=512)
    ap.add_argument("--time-limit", type=int, default=20)
    args = ap.parse_args()
    L = args.period
    a, b = pell_pair(L)
    g = math.gcd(a, b - 1)
    factors = ({int(p): int(e) for p, e in json.loads(args.factor_file.read_text()).items()}
               if args.factor_file else sp.factorint(g))
    assert math.prod(int(p)**int(e) for p, e in factors.items()) == g
    assert all(sp.isprime(p) for p in factors)
    primes = sorted(int(p) for p in factors if p > 2)
    assert 3 * max(primes) < 2**63
    sequence = {p: pell_residues(L, p) for p in primes}
    ss = np.arange(1 - args.n_parity, L, 2)
    cells = len(ss) * L
    rng = np.random.default_rng(20261121 + args.n_parity)
    # Include small indices and deterministic random residue cells.
    selected = set((i * L + t) for i in range(min(15, len(ss))) for t in range(min(30, L)))
    selected.update(int(i) for i in rng.choice(cells, min(cells, args.batch), replace=False))
    out = {"period": L, "n_parity": args.n_parity, "cells": cells,
           "factorization": {str(p): int(e) for p, e in factors.items()},
           "status": "no full cover found", "rounds": []}
    started = time.monotonic()
    for round_no in range(args.rounds):
        chosen_cells = np.array(sorted(selected), dtype=np.int64)
        s = ss[chosen_cells // L]
        t = chosen_cells % L
        rows, cols, grows, gcols, descriptors = [], [], [], [], []
        offset = 0
        for k, p in enumerate(primes):
            vals = sequence[p]
            sums = (vals[s] + 2 * vals[t]) % p
            residues, inverse = np.unique(sums, return_inverse=True)
            rows.extend(range(len(chosen_cells)))
            cols.extend((offset + inverse).tolist())
            grows.extend([k] * len(residues))
            gcols.extend(range(offset, offset + len(residues)))
            descriptors.extend((p, int(r)) for r in residues)
            offset += len(residues)
        cover = coo_matrix((np.ones(len(rows)), (rows, cols)), shape=(len(chosen_cells), offset)).tocsr()
        group = coo_matrix((np.ones(len(grows)), (grows, gcols)), shape=(len(primes), offset)).tocsr()
        mat = vstack([cover, group], format="csc")
        rec = {"round": round_no, "constrained_cells": len(chosen_cells), "variables": offset}
        out["rounds"].append(rec)
        args.output.write_text(json.dumps(out, indent=2) + "\n")
        result = milp(np.zeros(offset), integrality=np.ones(offset), bounds=Bounds(0, 1),
                      constraints=LinearConstraint(mat, np.r_[np.ones(len(chosen_cells)), np.zeros(len(primes))],
                                                   np.r_[np.full(len(chosen_cells), np.inf), np.ones(len(primes))]),
                      options={"time_limit": args.time_limit})
        rec.update(solver_status=int(result.status), solver_message=result.message)
        if result.x is None:
            out["status"] = ("solver reports infeasible; no exact certificate reconstructed" if result.status == 2
                             else "no full cover found within solver limit")
            print(json.dumps(rec), flush=True)
            break
        indices = np.flatnonzero(result.x > .5)
        x = np.zeros(offset, dtype=np.int64)
        x[indices] = 1
        assert np.all(cover @ x >= 1)
        assert np.all(group @ x <= 1)
        congruences = [descriptors[i] for i in indices]
        covered = np.zeros((len(ss), L), dtype=bool)
        for p, r in congruences:
            vals = sequence[p]
            covered |= (vals[ss, None] + 2 * vals[None, :]) % p == r
        uncovered = np.flatnonzero(~covered.ravel())
        rec["uncovered_full_period_cells"] = len(uncovered)
        if len(uncovered) == 0:
            # Recheck using Python integer recurrences, independently of the
            # vectorized int64 arithmetic used in candidate generation.
            exact_vals = {p: [pell_pair(i)[0] % p for i in range(L)] for p, r in congruences}
            for s0 in ss:
                for t0 in range(L):
                    assert any((exact_vals[p][int(s0)] + 2 * exact_vals[p][t0]) % p == r
                               for p, r in congruences)
            out.update(status="full congruence cover found and integer-verified; prime exceptions remain",
                       congruences=congruences)
            print(json.dumps(rec), flush=True)
            break
        selected.update(int(i) for i in rng.choice(uncovered, min(args.batch, len(uncovered)), replace=False))
        print(json.dumps(rec), flush=True)
    out["elapsed_seconds"] = time.monotonic() - started
    args.output.write_text(json.dumps(out, indent=2) + "\n")


if __name__ == "__main__":
    main()
