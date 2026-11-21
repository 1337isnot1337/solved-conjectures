"""Counterexample discovery for Xie--Xu's additive 2-matroid conjecture.

This is not a proof by itself. A negative objective produces a set family that
is independently checked with exact arithmetic and every augmentation pair.
No positive bounded result is a resolution of the conjecture.
"""

import argparse
import json
from math import comb
from pathlib import Path

import numpy as np
from scipy.optimize import Bounds, LinearConstraint, milp
from scipy.sparse import lil_matrix


def exact_check(n, family):
    fam = set(family)
    if 0 not in fam:
        raise ValueError("empty set missing")
    for s in fam:
        for i in range(n):
            if s >> i & 1 and s ^ (1 << i) not in fam:
                raise ValueError(("not downward closed", s, i))
    for s in fam:
        for t in fam:
            if t.bit_count() < s.bit_count() + 2:
                continue
            if not any(s | (1 << i) in fam for i in range(n)
                       if (t & ~s) >> i & 1):
                raise ValueError(("augmentation failed", s, t))
    counts = [sum(s.bit_count() == k for s in fam) for k in range(n + 1)]
    margins = [k * (n-k) * counts[k] ** 2
               - (k+1) * (n-k+1) * counts[k-1] * counts[k+1]
               for k in range(1, n)]
    return counts, margins


def problem(n=8, rank=5, index=4, complete_skeleton=1):
    N = 1 << n
    bysize = [[s for s in range(N) if s.bit_count() == k]
              for k in range(n + 1)]
    rows, lows, highs = [], [], []

    def add(row, lo=-np.inf, hi=np.inf):
        rows.append(row)
        lows.append(lo)
        highs.append(hi)

    for s in range(N):
        if s.bit_count() > rank:
            continue
        for i in range(n):
            if s >> i & 1:
                add({s: 1, s ^ (1 << i): -1}, hi=0)
    # Exact gaps of two imply all larger gaps by choosing a feasible subset T'.
    for k in range(1, rank-1):
        for s in bysize[k]:
            for t in bysize[k+2]:
                if s & ~t == 0:
                    continue
                row = {s: 1, t: 1}
                for i in range(n):
                    if (t & ~s) >> i & 1:
                        row[s | (1 << i)] = -1
                add(row, hi=1)
    # t >= i_index^2, exact at every integral count.
    for a in range(comb(n, index) + 1):
        row = {s: -2*a for s in bysize[index]}
        row[N] = 1
        add(row, lo=-a*a)
    mat = lil_matrix((len(rows), N+1), dtype=float)
    for j, row in enumerate(rows):
        for i, v in row.items():
            mat[j, i] = v
    lb, ub = np.zeros(N+1), np.ones(N+1)
    ub[N] = np.inf
    # Restriction to a complete skeleton is only a discovery choice.
    for s in range(N):
        if s.bit_count() <= complete_skeleton:
            lb[s] = 1
        if s.bit_count() > rank:
            ub[s] = 0
    # One rank-r facet may be fixed by ground-set permutation symmetry.
    lb[(1 << rank)-1] = 1
    integrality = np.ones(N+1)
    integrality[N] = 0
    return N, bysize, LinearConstraint(mat.tocsr(), lows, highs), Bounds(lb, ub), integrality


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--q", type=int, nargs="+", default=[7, 14, 28, 42])
    parser.add_argument("--seconds", type=float, default=15)
    parser.add_argument("--n", type=int, default=8)
    parser.add_argument("--rank", type=int, default=5)
    parser.add_argument("--skeleton", type=int, default=1)
    parser.add_argument("--out", default="xie_xu_witness.json")
    args = parser.parse_args()
    n, r = args.n, args.rank
    k = r - 1
    N, bysize, base, bounds, integer = problem(n,r,k,args.skeleton)
    for q in args.q:
        row = np.zeros((1,N+1))
        row[0,bysize[k+1]] = 1
        c = np.zeros(N+1)
        c[N] = k*(n-k)
        c[bysize[k-1]] = -(k+1)*(n-k+1)*q
        result = milp(c, integrality=integer, bounds=bounds,
                      constraints=[base, LinearConstraint(row,q,q)],
                      options={"time_limit":args.seconds, "mip_rel_gap":0})
        record = {"q":q,"status":int(result.status),"message":result.message}
        if result.x is not None:
            family = [s for s in range(N) if result.x[s] > .5]
            counts, margins = exact_check(n, family)
            record.update(counts=counts, min_margin=min(margins),
                          target_margin=margins[k-1], objective=float(result.fun))
            if min(margins) < 0:
                Path(args.out).write_text(json.dumps({"n":n,"family":family,
                    "counts":counts,"margins":margins},indent=2)+"\n")
                print(json.dumps(record),flush=True)
                print("EXACT COUNTEREXAMPLE WRITTEN",args.out,flush=True)
                return
        print(json.dumps(record),flush=True)


if __name__ == "__main__":
    main()
