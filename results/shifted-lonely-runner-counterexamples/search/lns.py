"""Exact large-neighbourhood finisher on the lattice (speeds 1..n, threshold P/Q, shifts m_q/Q).
Free a few runners, keep the rest, and ask SAT for shifts of the free runners that cover everything the others leave open."""
import sys, time, random, json, os, subprocess
import numpy as np
from math import gcd
from fractions import Fraction as F
from pysat.solvers import Solver
from pysat.card import CardEnc, EncType
class Lattice:
    def __init__(self, n, P, Q):
        self.n, self.P, self.Q = n, P, Q
        fr = sorted({F(a, q) for q in range(1, n + 1) for a in range(q)})
        self.F = len(fr); self.M = Q * self.F
        pos = {f: i for i, f in enumerate(fr)}
        self.idx = [None] + [np.array([pos[F(a, q)] for a in range(q)], dtype=np.int64) for q in range(1, n + 1)]
        self.len = np.array([float((fr[i + 1] if i + 1 < len(fr) else 1) - fr[i]) for i in range(len(fr))])
    def G(self, q, A):
        A = np.mod(A, q * self.Q); return (A // q) * self.F + self.idx[q][A % q]
    def ranges(self, q, m):
        """start and end interval indices (end exclusive, cyclic) of the q arcs of runner q at shift m"""
        A = np.arange(q, dtype=np.int64) * self.Q - m - self.P
        return self.G(q, A), self.G(q, A + 2 * self.P)
    def counts(self, ms, skip=()):
        diff = np.zeros(self.M + 1, dtype=np.int64)
        for q in range(1, self.n + 1):
            if q in skip: continue
            g0, g1 = self.ranges(q, ms[q - 1])
            np.add.at(diff, g0, 1); np.add.at(diff, g1, -1)
            wrap = g0 > g1
            diff[0] += int(wrap.sum())          # wrapped arcs also cover [0, g1)
        return np.cumsum(diff[:-1])
    def uncovered(self, ms): return np.flatnonzero(self.counts(ms) == 0)
def finish(lat, ms, k=7, tries=40, conf=200000, seed=0, log=print):
    rng = random.Random(seed); n, Q = lat.n, lat.Q; ms = list(ms)
    for it in range(tries):
        cnt = lat.counts(ms); U = np.flatnonzero(cnt == 0)
        if len(U) == 0: return ms
        # runners whose arcs end next to an uncovered interval are the natural candidates
        near = []
        for q in range(2, n + 1):
            g0, g1 = lat.ranges(q, ms[q - 1])
            d = min(np.min(np.abs(((U[:, None] - g0[None, :] + lat.M // 2) % lat.M) - lat.M // 2)), np.min(np.abs(((U[:, None] - g1[None, :] + lat.M // 2) % lat.M) - lat.M // 2)))
            near.append((int(d), q))
        near.sort()
        pool = [q for _, q in near[:max(k, 12)]]
        S = set(rng.sample(pool, min(k - 2, len(pool)))) 
        while len(S) < k: S.add(rng.randrange(2, n + 1))
        S = sorted(S)
        cntF = lat.counts(ms, skip=set(S)); W = np.flatnonzero(cntF == 0); wpos = {int(i): j for j, i in enumerate(W)}
        clause = [[] for _ in W]; var = {}; t0 = time.time()
        for q in S:
            for m in range(Q):
                g0, g1 = lat.ranges(q, m); v = len(var) + 1; var[(q, m)] = v; hit = False
                for a, b in zip(g0, g1):
                    if a <= b: lo, hi = np.searchsorted(W, a), np.searchsorted(W, b); idxs = range(lo, hi)
                    else: idxs = list(range(np.searchsorted(W, a), len(W))) + list(range(0, np.searchsorted(W, b)))
                    for j in idxs: clause[j].append(v)
        if any(not c for c in clause): log("  it %d: S=%s some interval unreachable" % (it, S)); continue
        top = len(var); cls = [c for c in clause]
        for q in S:
            enc = CardEnc.equals(lits=[var[(q, m)] for m in range(Q)], bound=1, top_id=top, encoding=EncType.seqcounter); top = max(top, enc.nv); cls.extend(enc.clauses)
        s = Solver(name='glucose4', bootstrap_with=cls); s.conf_budget(conf)
        res = s.solve_limited()
        log("  it %d: unc=%d free=%s |W|=%d build %.1fs -> %s (%.1fs)" % (it, len(U), S, len(W), time.time() - t0, {True: 'SAT', False: 'UNSAT', None: 'budget'}[res], time.time() - t0))
        if res:
            model = set(x for x in s.get_model() if x > 0)
            for q in S: ms[q - 1] = next(m for m in range(Q) if var[(q, m)] in model)
        s.delete()
    return ms if len(lat.uncovered(ms)) == 0 else None
if __name__ == "__main__":
    n, P, Q = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]); mult = float(sys.argv[4]); seed = int(sys.argv[5]); k = int(sys.argv[6]) if len(sys.argv) > 6 else 7
    from lrun import run
    from math import gcd as _g
    Fn = sum(1 for q in range(1, n + 1) for a in range(q) if _g(a, q) == 1)
    t0 = time.time(); unc, cost, m = run(n, P, Q, int(30000 * n * mult), seed, T0=0.5 * Fn, T1=0.5, lam=0.0, pu=0.15, dmax=max(2, P // 2))
    print("n=%d thr=%d/%d seed=%d anneal unc=%d (%.0fs) m=%s" % (n, P, Q, seed, unc, time.time() - t0, m), flush=True)
    lat = Lattice(n, P, Q); assert len(lat.uncovered(m)) == unc, (len(lat.uncovered(m)), unc)
    res = finish(lat, m, k=k, seed=seed, log=lambda s: print(s, flush=True))
    if res:
        sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__))); from slr import gamma_exact
        g = gamma_exact(list(range(1, n + 1)), [F(x, Q) for x in res])[0]
        print("SOLVED n=%d gamma=%s <= %d/%d: %s  m=%s (total %.0fs)" % (n, g, P, Q, g <= F(P, Q), res, time.time() - t0), flush=True)
        json.dump({"n": n, "P": P, "Q": Q, "m": res, "gamma": str(g)}, open("lat_cert_%d.json" % n, "w"))
    else: print("not solved (total %.0fs)" % (time.time() - t0), flush=True)
