#!/usr/bin/env python3
"""Independent brute-force scan: which primitive k-sets D in {1,...,M_k} have chi(G(Z,D)) = k+1?

This does NOT use the loneliness-spectrum classifications (R5-R8) or any certificate
from certificates.json.  Every set ends in exactly one of two outcomes:

  colourable      an explicit periodic proper k-colouring of G(Z,D) was found and
                  checked directly (word w of period p with w[i] != w[(i+d) % p]
                  for all i and all d in D);
  not colourable  a SAT solver (CaDiCaL 1.5.3 via python-sat) returned UNSAT for
                  proper k-colourings of the subgraph induced on {0,...,N-1}.

Stage 1 tries "rational rotation" words w_n = floor(k * (n*a mod q) / q) for every
q = k*m (1 <= m <= M_k) and 0 < a < q.  For each such word we record, by a direct
check of the word, the set of distances d <= M_k for which it is proper; D is
coloured if it is contained in that set.  (Lemma 1 of PROOF.md says this succeeds
exactly when L(D) >= 1/k, but the scan does not rely on that: the words are
checked directly.)

Stage 2 handles every remaining set with SAT: interval UNSAT on short intervals,
then periodic colourings for periods p = k, k+1, ..., then longer intervals, with
bounds raised until a decision is reached (no "unknown" outcome is allowed).

The outcome is compared with Theorem A of PROOF.md: the non-k-colourable sets in
range must be exactly {1,...,k-1,ks} (ks <= M_k), {1,2,3,5,8}, {1,4,5,6,7} (k=5)
and {1,2,3,4,5,7,12} (k=7).  As a side check, the Stage-2 sets are compared with
R5-R8: each must be a family member or a table row, and its exact L(D) must be
below 1/k.  (A rotation word with q = k*m that is proper for d forces ||d*a/q|| >= 1/k,
so every Stage-1 set has L(D) >= 1/k; conversely, if L(D) >= 1/k, the first point of
[0,1/2] where all ||d t|| >= 1/k is an endpoint (k*j+1)/(k*d), so Stage 1 colours D.
Hence the Stage-2 sets are exactly the sets in range with L(D) < 1/k.)

Optionally (--small) the same scan is run for k = 3, 4 and compared with the
classical characterizations quoted in PROOF.md, section "Statement".

Usage:  python3 bruteforce_scan.py [--small] > bruteforce_scan.txt
Needs python-sat.  Not needed to check the proof.
"""
import os
import sys
import time
from fractions import Fraction
from functools import reduce
from itertools import combinations
from math import gcd

from pysat.solvers import Cadical153

RANGES = {5: 80, 6: 60, 7: 48, 8: 42}
SMALL_RANGES = {3: 80, 4: 50}


# ---------------------------------------------------------------- direct checks

def periodic_proper(word, D):
    p = len(word)
    return all(word[i] != word[(i + d) % p] for d in D for i in range(p))


def rotation_word(k, q, a):
    return [k * (n * a % q) // q for n in range(q)]


# ---------------------------------------------------------------- SAT helpers

def _solver_for(D, k, n, periodic):
    var = lambda i, c: i * k + c + 1
    s = Cadical153()
    for i in range(n):
        s.add_clause([var(i, c) for c in range(k)])
    edges = set()
    for i in range(n):
        for d in D:
            j = i + d
            if periodic:
                j %= n
            elif j >= n:
                continue
            edges.add((min(i, j), max(i, j)))
    for i, j in edges:
        if i == j:
            s.delete()
            return None, var
        for c in range(k):
            s.add_clause([-var(i, c), -var(j, c)])
    s.add_clause([var(0, 0)])           # colour symmetry
    return s, var


def sat_periodic(D, k, p):
    s, var = _solver_for(D, k, p, True)
    if s is None:
        return None
    if not s.solve():
        s.delete()
        return None
    m = set(x for x in s.get_model() if x > 0)
    s.delete()
    word = [next(c for c in range(k) if var(i, c) in m) for i in range(p)]
    assert periodic_proper(word, D)
    return word


def sat_interval_colourable(D, k, N):
    s, _ = _solver_for(D, k, N, False)
    ok = s.solve()
    s.delete()
    return ok


def decide_by_sat(D, k):
    """Return ("col", p, word) or ("nocol", N).  Raises bounds until decided."""
    M = max(D)
    N = M + 2
    p_done = k - 1
    p_max = 2 * M + 10
    while True:
        while N <= 4 * M + 8:
            if not sat_interval_colourable(D, k, N):
                return ("nocol", N)
            N += max(1, M // 2)
        for p in range(p_done + 1, p_max + 1):
            w = sat_periodic(D, k, p)
            if w is not None:
                return ("col", p, w)
        p_done = p_max
        p_max *= 2
        N_big = 8 * N
        if not sat_interval_colourable(D, k, N_big):
            return ("nocol", N_big)
        if p_max > 5000:
            raise RuntimeError("undecided set %s" % (D,))


def shortest_bad_interval(D, k, start):
    """Least N such that {0..N-1} has no proper k-colouring (monotone in N; binary search)."""
    lo, hi = 1, start           # {0..lo-1} colourable (trivially for lo = 1), {0..hi-1} not
    while hi - lo > 1:
        mid = (lo + hi) // 2
        if sat_interval_colourable(D, k, mid):
            lo = mid
        else:
            hi = mid
    return hi


# ---------------------------------------------------------------- exact L (side check only)

def L_exact(D):
    best = Fraction(0)
    for i in range(len(D)):
        for j in range(i, len(D)):
            q = D[i] + D[j]
            for a in range(q + 1):
                t = Fraction(a, q)
                m = min(min(d * t - (d * t).numerator // (d * t).denominator,
                            1 - (d * t - (d * t).numerator // (d * t).denominator)) for d in D)
                best = max(best, m)
    return best


# ---------------------------------------------------------------- predictions

def theorem_A_noncolourable(k, M):
    out = set()
    for s in range(1, M // k + 1):
        out.add(tuple(list(range(1, k)) + [k * s]))
    extra = {5: [(1, 2, 3, 5, 8), (1, 4, 5, 6, 7)], 7: [(1, 2, 3, 4, 5, 7, 12)]}
    for D in extra.get(k, []):
        if max(D) <= M:
            out.add(D)
    return out


SPORADIC = {   # R5-R8 tables (side check only)
    5: [(1, 3, 4, 5, 9), (1, 2, 3, 5, 8), (1, 3, 4, 5, 18), (1, 4, 5, 6, 7), (1, 3, 4, 5, 11),
        (1, 7, 8, 9, 15), (2, 5, 7, 8, 9), (2, 3, 5, 8, 19), (3, 5, 8, 9, 13), (3, 5, 8, 11, 13),
        (1, 3, 4, 5, 27), (1, 4, 5, 6, 27)],
    6: [(1, 2, 5, 6, 7, 8), (2, 5, 6, 8, 10, 11), (1, 4, 5, 6, 7, 22), (1, 2, 3, 5, 8, 18),
        (2, 3, 5, 6, 8, 11), (2, 5, 6, 7, 8, 11), (1, 3, 4, 5, 18, 46), (1, 3, 4, 5, 7, 24),
        (1, 4, 5, 6, 7, 33)],
}


def sporadic_from_file(path):
    rows = []
    with open(path) as f:
        for line in f:
            parts = line.split()
            if parts:
                rows.append(tuple(int(x) for x in parts[:-1]))
    return rows


def R_candidates(k, M):
    """Sets in range that R5-R8 allow to be near-tight (superset; exact L decides)."""
    fam = {5: [(1, 2, 3, 4), (1, 3, 4, 7)], 6: [(1, 2, 3, 4, 5), (1, 3, 4, 5, 9)],
           7: [(1, 2, 3, 4, 5, 6)],
           8: [(1, 2, 3, 4, 5, 6, 7), (1, 2, 3, 4, 5, 7, 12), (1, 4, 5, 6, 7, 11, 13)]}[k]
    cands = set()
    for W in fam:
        for a in range(1, M + 1):
            for b in range(1, M + 1):
                if gcd(a, b) != 1:
                    continue
                D = sorted(set(a * w for w in W) | {b})
                if len(D) == k and max(D) <= M:
                    cands.add(tuple(D))
    if k == 6:
        for s in range(-M, M + 1):
            for t in range(1, M + 1):
                vals = set(abs(x) for x in (s, t, s + t, 2 * s + t, 3 * s + t, 3 * s + 2 * t))
                if gcd(abs(s), t) == 1 and 0 not in vals and len(vals) == 6 and max(vals) <= M:
                    cands.add(tuple(sorted(vals)))
    if k in SPORADIC:
        rows = SPORADIC[k]
    else:
        here = os.path.dirname(os.path.abspath(__file__))
        rows = None
        for p in ('%s/../../../results/%s-speed-spectrum/sporadic.txt' % (here, {7: 'seven', 8: 'eight'}[k]),):
            try:
                rows = sporadic_from_file(p)
                break
            except OSError:
                pass
        if rows is None:
            return None
    for D in rows:
        if max(D) <= M:
            cands.add(tuple(D))
    return cands


def small_prediction(k, M):
    out = set()
    if k == 3:
        for n in range(1, M // 3 + 1):
            out.add(tuple(sorted({1, 2, 3 * n})))
        for x in range(1, M + 1):
            for y in range(x + 1, M + 1):
                if x + y <= M and gcd(x, y) == 1 and (x - y) % 3 != 0:
                    out.add((x, y, x + y))
    if k == 4:
        for n in range(1, M // 4 + 1):
            out.add((1, 2, 3, 4 * n))
        for a in range(2, M + 1, 2):
            for b in range(1, M + 1, 2):
                D = tuple(sorted({a, b, a + b, a + 2 * b}))
                if len(D) == 4 and max(D) <= M and reduce(gcd, D) == 1:
                    out.add(D)
    return out


# ---------------------------------------------------------------- main scan

def scan(k, M, log, shortest=True):
    t0 = time.time()
    full = (1 << (M + 1)) - 2          # bits 1..M
    good = {}
    for m in range(1, M + 1):
        q = k * m
        for a in range(1, q):
            w = rotation_word(k, q, a)
            mask = 0
            for d in range(1, M + 1):
                if periodic_proper(w, [d]):
                    mask |= 1 << d
            if mask not in good:
                good[mask] = (q, a)
    # drop masks contained in another mask
    masks = sorted(good, key=lambda x: -bin(x).count('1'))
    kept = []
    for x in masks:
        if not any(x & ~y == 0 for y in kept):
            kept.append(x)
    bad = [full & ~x for x in kept]
    n_sets = n_stage1 = 0
    stage2 = []
    for D in combinations(range(1, M + 1), k):
        if reduce(gcd, D) != 1:
            continue
        n_sets += 1
        dm = 0
        for d in D:
            dm |= 1 << d
        for i, b in enumerate(bad):
            if dm & b == 0:
                if i > 0:             # move to front
                    bad[i], bad[i - 1] = bad[i - 1], bad[i]
                n_stage1 += 1
                break
        else:
            stage2.append(D)
    t1 = time.time()
    results = {}
    for D in stage2:
        results[D] = decide_by_sat(D, k)
    t2 = time.time()
    noncol = {D for D, r in results.items() if r[0] == "nocol"}
    log("k=%d, M_k=%d: %d primitive %d-subsets of {1..%d}; %d rotation masks (%d maximal); stage 1 coloured %d "
        "[%.1fs]; stage 2 (SAT) decided %d [%.1fs]" % (k, M, n_sets, k, M, len(good), len(kept), n_stage1,
                                                       t1 - t0, len(stage2), t2 - t1))
    assert n_stage1 + len(stage2) == n_sets
    for D in stage2:
        r = results[D]
        if r[0] == "col":
            log("   %-32s colourable, period %3d: %s" % (D, r[1], ''.join(map(str, r[2]))))
        elif shortest:
            N = shortest_bad_interval(D, k, r[1])
            log("   %-32s NOT %d-colourable: no proper colouring of {0..%d} (shortest such interval: N=%d)"
                % (D, k, N - 1, N))
    return n_sets, stage2, noncol, t2 - t0


def main():
    small = "--small" in sys.argv
    out = []
    log = lambda s: (out.append(s), print(s, flush=True))
    T = time.time()
    log("Brute-force scan of primitive k-sets, independent of the spectrum classifications.")
    log("python-sat Cadical153; colourings verified directly; UNSAT answers trusted from the solver.")
    log("")
    all_ok = True
    for k, M in sorted(RANGES.items()):
        n_sets, stage2, noncol, sec = scan(k, M, log)
        pred = theorem_A_noncolourable(k, M)
        if noncol == pred:
            log("   Theorem A check: the %d non-%d-colourable sets are exactly the predicted ones. OK" % (len(noncol), k))
        else:
            all_ok = False
            log("   *** DISCREPANCY WITH THEOREM A ***  found-but-not-predicted: %s ; predicted-but-not-found: %s"
                % (sorted(noncol - pred), sorted(pred - noncol)))
        cands = R_candidates(k, M)
        st2 = set(stage2)
        nt = {D for D in st2 if L_exact(D) < Fraction(1, k)}
        if nt != st2:
            all_ok = False
            log("   side check: stage-2 sets with L >= 1/k (rotation search incomplete?): %s" % sorted(st2 - nt))
        if cands is None:
            log("   side check vs R%d skipped (sporadic table not found)" % k)
        elif st2 <= cands:
            log("   side check: all %d stage-2 sets have L(D) < 1/%d (exact) and are allowed by R%d "
                "(family member or table row). OK" % (len(st2), k, k))
        else:
            all_ok = False
            log("   *** side check vs R%d differs ***  near-tight sets not allowed by R%d: %s"
                % (k, k, sorted(st2 - cands)))
        log("")
    if small:
        log("Classical cases quoted in PROOF.md, section Statement (same method):")
        for k, M in sorted(SMALL_RANGES.items()):
            n_sets, stage2, noncol, sec = scan(k, M, lambda s: None, shortest=False)
            pred = small_prediction(k, M)
            ok = noncol == pred
            all_ok &= ok
            log("k=%d, M_k=%d: %d primitive sets, %d sent to SAT, %d not %d-colourable; matches the quoted "
                "characterization: %s%s [%.1fs]" % (k, M, n_sets, len(stage2), len(noncol), k,
                                                     "yes" if ok else "NO",
                                                     "" if ok else " extra=%s missing=%s" % (sorted(noncol - pred), sorted(pred - noncol)),
                                                     sec))
        log("")
    log("Total time %.0fs. %s" % (time.time() - T, "All outcomes agree with Theorem A." if all_ok else "DISCREPANCIES FOUND (see above)."))
    return 0 if all_ok else 1


if __name__ == "__main__":
    sys.exit(main())
