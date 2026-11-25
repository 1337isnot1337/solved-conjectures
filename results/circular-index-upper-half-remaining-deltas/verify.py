#!/usr/bin/env python3
"""Exact check of the seven certificates (Python 3, standard library only).

For each certificate (graph G on n = 2m+1 vertices, colouring c: E -> Z_p):
  1. G is simple and has maximum degree Delta.
  2. c is a (p,q)-edge-colouring, checked twice and independently:
     (a) every two edges sharing a vertex get colours at circular distance >= q;
     (b) for every c0 the union of classes c0, ..., c0+q-1 is a matching.
  3. |E|/m <= chi'_c(G) <= p/q, and both bounds lie in (Delta + 1/2, Delta + 1).
     Upper bound: a (p,q)-colouring.  Lower bound: every colour class of any
     circular colouring is a matching, so chi'_c >= chi'_f >= |E|/m.
Exits non-zero on any failure."""
import json, os, sys
from fractions import Fraction as Fr
here = os.path.dirname(os.path.abspath(__file__))
certs = json.load(open(os.path.join(here, "certificates.json")))
fail = 0; seen = []
for c in certs:
    n, p, q, D = c["n"], c["p"], c["q"], c["Delta"]
    E = [tuple(map(int, k.split("-"))) for k in c["edges"]]; col = list(c["edges"].values())
    ok = n % 2 == 1 and all(0 <= a < b < n for a, b in E) and len(set(E)) == len(E)
    ok &= all(isinstance(x, int) and 0 <= x < p for x in col)
    deg = [0] * n
    for a, b in E: deg[a] += 1; deg[b] += 1
    ok &= max(deg) == D
    inc = [[] for _ in range(n)]
    for (a, b), x in zip(E, col): inc[a].append(x); inc[b].append(x)
    ok &= all(min((x - y) % p, (y - x) % p) >= q for L in inc for i, x in enumerate(L) for y in L[:i])   # (a)
    cls = [[] for _ in range(p)]
    for e, x in zip(E, col): cls[x].append(e)
    for c0 in range(p):                                                                                 # (b)
        vs = [v for j in range(q) for e in cls[(c0 + j) % p] for v in e]
        ok &= len(vs) == len(set(vs))
    lo, hi = Fr(len(E), (n - 1) // 2), Fr(p, q)
    ok &= Fr(2 * D + 1, 2) < lo <= hi < D + 1
    fail += not ok; seen.append(D)
    print(f"{'PASS' if ok else 'FAIL'}  Delta={D:2d}  n={n:2d}  |E|={len(E):3d}  ({p},{q})-colouring   {lo} <= chi'_c <= {hi}")
if sorted(seen) != [9, 11, 13, 15, 17, 19, 23]: print("FAIL: wrong set of degrees"); fail += 1
print("ALL CHECKS PASSED" if not fail else f"{fail} FAILURES"); sys.exit(1 if fail else 0)
