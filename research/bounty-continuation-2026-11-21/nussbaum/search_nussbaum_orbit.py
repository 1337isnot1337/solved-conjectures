#!/usr/bin/env python3
"""Bounded MILP search for a full counterexample, with exact post-checking.

Core variables encode a cyclic information-antichain in {0,*,1}^n and
cyclically invariant compatibility. The broader Boolean-formula extension
allows contradictory clauses. Every candidate is additionally tested against
the noncontradictory-DNF criterion before it is called a narrow-class witness.
No unsuccessful run proves the uniform conjecture.
"""

import argparse
import itertools
import json
import time
from pathlib import Path

import numpy as np
from scipy.optimize import Bounds, LinearConstraint, milp
from scipy.sparse import coo_matrix


class Model:
    def __init__(self):
        self.lo = []
        self.hi = []
        self.integer = []
        self.rows = []
        self.rlo = []
        self.rhi = []

    def var(self, binary=False, lo=0, hi=1):
        i = len(self.lo)
        self.lo.append(lo)
        self.hi.append(hi)
        self.integer.append(int(binary))
        return i

    def fix(self, i, x):
        self.lo[i] = self.hi[i] = x

    def row(self, terms, lo=-np.inf, hi=np.inf):
        d = {}
        for i, a in terms:
            d[i] = d.get(i, 0) + a
        self.rows.append({i: a for i, a in d.items() if a})
        self.rlo.append(lo)
        self.rhi.append(hi)

    def conjunction(self, x, y):
        a = self.var()
        self.row([(a, 1), (x, -1)], hi=0)
        self.row([(a, 1), (y, -1)], hi=0)
        self.row([(a, 1), (x, -1), (y, -1)], lo=-1)
        return a

    def known_star(self, xp, xm, yp, ym):
        a = self.var()
        self.row([(a, 1), (xp, -1), (xm, -1)], hi=0)
        self.row([(a, 1), (yp, 1), (ym, 1)], hi=1)
        self.row([(a, 1), (xp, -1), (xm, -1), (yp, 1), (ym, 1)], lo=0)
        return a

    def solve(self, seconds):
        rr, cc, aa = [], [], []
        for r, row in enumerate(self.rows):
            for c, a in row.items():
                rr.append(r)
                cc.append(c)
                aa.append(a)
        mat = coo_matrix((aa, (rr, cc)), shape=(len(self.rows), len(self.lo))).tocsc()
        result = milp(
            np.zeros(len(self.lo)),
            integrality=np.asarray(self.integer),
            bounds=Bounds(self.lo, self.hi),
            constraints=LinearConstraint(mat, self.rlo, self.rhi),
            options={"time_limit": seconds, "mip_rel_gap": 0, "presolve": True},
        )
        return result


def leq(x, y):
    return all(a == -1 or a == b for a, b in zip(x, y))


def compatible(x, y):
    return all(a == -1 or b == -1 or a == b for a, b in zip(x, y))


def complete(x, b):
    return all(a == -1 or a == c for a, c in zip(x, b))


def clause_value(clause, x):
    # Return integers 0,1,2 for formula truth values 0,*,1.
    return min((1 if x[j] == -1 else 2 * (x[j] == bit) for j, bit in clause), default=2)


def formula_value(clauses, x):
    return max((clause_value(c, x) for c in clauses), default=0)


def broad_formulas(states):
    n = len(states[0])
    p = len(states)
    maps = []
    for j in range(n):
        clauses = []
        for t, x in enumerate(states):
            desired = states[(t + 1) % p][j]
            if desired == 1:
                clauses.append([(i, bit) for i, bit in enumerate(x) if bit != -1])
            elif desired == -1:
                clause = []
                for i, bit in enumerate(x):
                    clause.extend([(i, 0), (i, 1)] if bit == -1 else [(i, bit)])
                clauses.append(clause)
        maps.append(clauses)
    return maps


def narrow_formulas(states):
    n = len(states[0])
    p = len(states)
    vertices = list(itertools.product((0, 1), repeat=n))
    maps = []
    missing = []
    for j in range(n):
        P = [states[t] for t in range(p) if states[(t + 1) % p][j] == 1]
        N = [states[t] for t in range(p) if states[(t + 1) % p][j] == 0]
        U = [(t, states[t]) for t in range(p) if states[(t + 1) % p][j] == -1]
        assert all(not compatible(x, y) for x in P for y in N)
        clauses = [[(i, bit) for i, bit in enumerate(x) if bit != -1] for x in P]
        for t, x in U:
            b = next((b for b in vertices if complete(x, b) and
                      not any(complete(y, b) for y in N)), None)
            if b is None:
                missing.append({"state": t, "coordinate": j})
            else:
                clauses.append(list(enumerate(b)))
        maps.append(clauses)
    return (maps if not missing else None), missing


def verify(states, n, p):
    assert len(states) == p and len(set(states)) == p
    assert p > 2 ** n
    assert all(len(x) == n and -1 in x for x in states)
    assert all(not leq(x, y) for x in states for y in states if x != y)
    for t in range(p):
        for s in range(p):
            assert compatible(states[t], states[s]) == compatible(
                states[(t + 1) % p], states[(s + 1) % p])
    broad = broad_formulas(states)
    narrow, missing = narrow_formulas(states)
    for maps in (broad, narrow):
        if maps is None:
            continue
        for t, x in enumerate(states):
            got = tuple({0: 0, 1: -1, 2: 1}[formula_value(c, x)] for c in maps)
            assert got == states[(t + 1) % p]
    return {"exact_checks_passed": True, "broad_formula": broad,
            "noncontradictory_dnf": narrow, "narrow_extension_failures": missing}


def build(n, p, rank, narrow=False):
    m = Model()
    pos = [[m.var(binary=True) for _ in range(n)] for _ in range(p)]
    neg = [[m.var(binary=True) for _ in range(n)] for _ in range(p)]
    far = {h: m.var(binary=True) for h in range(1, p // 2 + 1)}
    for t in range(p):
        for j in range(n):
            m.row([(pos[t][j], 1), (neg[t][j], 1)], hi=1)
        m.row([(i, 1) for i in pos[t] + neg[t]], lo=1, hi=rank)
    # Rotate to a state of maximal information rank, then use coordinate
    # permutations and simultaneous sign changes. These preserve the broader
    # formula class; they need not preserve the narrower DNF class.
    for j in range(n):
        m.fix(pos[0][j], 0)
        m.fix(neg[0][j], int(j < rank))
    m.row([(i, 1) for i in far.values()], hi=len(far) - 1)
    for t in range(p):
        for s in range(t + 1, p):
            h = min(s - t, p - (s - t))
            f = far[h]
            opposed = []
            ts = []
            st = []
            for j in range(n):
                for x, y in ((pos[t][j], neg[s][j]), (neg[t][j], pos[s][j])):
                    a = m.conjunction(x, y)
                    m.row([(a, 1), (f, -1)], hi=0)
                    opposed.append(a)
                ts.append(m.known_star(pos[t][j], neg[t][j], pos[s][j], neg[s][j]))
                st.append(m.known_star(pos[s][j], neg[s][j], pos[t][j], neg[t][j]))
            m.row([(a, 1) for a in opposed] + [(f, -1)], lo=0)
            for z in (ts, st):
                m.row([(a, 1) for a in z] + [(f, 1)], lo=1)

    if narrow:
        vertices = list(itertools.product((0, 1), repeat=n))
        completions = [[m.var() for _ in vertices] for _ in range(p)]
        for t in range(p):
            for b, vertex in enumerate(vertices):
                c = completions[t][b]
                wrong = [neg[t][j] if bit else pos[t][j] for j, bit in enumerate(vertex)]
                for w in wrong:
                    m.row([(c, 1), (w, 1)], hi=1)
                m.row([(c, 1)] + [(w, 1) for w in wrong], lo=1)
        outside = [[m.var() for _ in vertices] for _ in range(n)]
        for j in range(n):
            for b in range(len(vertices)):
                a = outside[j][b]
                for s in range(p):
                    m.row([(a, 1), (neg[(s + 1) % p][j], 1),
                           (completions[s][b], 1)], hi=2)
            for t in range(p):
                witness = []
                for b in range(len(vertices)):
                    w = m.var()
                    m.row([(w, 1), (outside[j][b], -1)], hi=0)
                    m.row([(w, 1), (completions[t][b], -1)], hi=0)
                    witness.append(w)
                m.row([(w, 1) for w in witness] +
                      [(pos[(t + 1) % p][j], 1), (neg[(t + 1) % p][j], 1)], lo=1)
    return m, pos, neg


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--n", type=int, required=True)
    ap.add_argument("--period", type=int, required=True)
    ap.add_argument("--rank", type=int, required=True)
    ap.add_argument("--seconds", type=float, default=30)
    ap.add_argument("--narrow", action="store_true")
    ap.add_argument("--output", type=Path, required=True)
    args = ap.parse_args()
    assert 1 <= args.rank < args.n and args.period > 2 ** args.n
    start = time.monotonic()
    m, pos, neg = build(args.n, args.period, args.rank, args.narrow)
    result = m.solve(args.seconds)
    record = {
        "n": args.n, "period": args.period, "maximum_rank": args.rank,
        "noncontradictory_constraints": args.narrow,
        "time_limit_seconds": args.seconds, "wall_seconds": time.monotonic() - start,
        "variables": len(m.lo), "integer_variables": sum(m.integer),
        "constraints": len(m.rows), "solver_status": int(result.status),
        "solver_message": str(result.message), "candidate": None,
        "scope": "An unsuccessful bounded search is not a proof of the uniform conjecture.",
    }
    if result.x is not None:
        states = []
        for t in range(args.period):
            row = []
            for j in range(args.n):
                values = result.x[pos[t][j]], result.x[neg[t][j]]
                assert all(abs(v - round(v)) < 1e-6 for v in values)
                row.append(1 if values[0] > .5 else 0 if values[1] > .5 else -1)
            states.append(tuple(row))
        record["candidate"] = {"states": states, **verify(states, args.n, args.period)}
    args.output.write_text(json.dumps(record, indent=2) + "\n")
    print(json.dumps({k: v for k, v in record.items() if k != "candidate"}))
    print("Exact candidate:", record["candidate"] is not None)


if __name__ == "__main__":
    main()
