"""Loops for a fixed distance set B (no extra parameter): which periods p admit proper k-colourings of G(Z,B)
obtained by concatenating loops at a common window state."""
import sys, json, math, time
import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from loops import proper_word
from family import semigroup
from pysat.solvers import Cadical153

def sat_word(B, k, n, eqs, fix=None, budget=200000):
    var = lambda i, c: i * k + c + 1
    s = Cadical153()
    for i in range(n):
        s.add_clause([var(i, c) for c in range(k)])
        for c1 in range(k):
            for c2 in range(c1 + 1, k):
                s.add_clause([-var(i, c1), -var(i, c2)])
        for d in B:
            if i + d < n:
                for c in range(k):
                    s.add_clause([-var(i, c), -var(i + d, c)])
    for (i, j) in eqs:
        for c in range(k):
            s.add_clause([-var(i, c), var(j, c)]); s.add_clause([var(i, c), -var(j, c)])
    if fix:
        for i, c in fix: s.add_clause([var(i, c)])
    s.conf_budget(budget)
    ok = s.solve_limited()
    if not ok: s.delete(); return None
    m = set(x for x in s.get_model() if x > 0)
    z = [next(c for c in range(k) if var(i, c) in m) for i in range(n)]
    s.delete(); return z

def two_loops(B, k, l1, l2):
    w = max(B); n = l1 + l2 + w
    eqs = [(i, l1 + i) for i in range(w)] + [(l1 + i, l1 + l2 + i) for i in range(w)]
    return sat_word(B, k, n, eqs, fix=[(0, 0)])

def loop_at(B, k, u, l):
    w = max(B); n = l + w
    z = sat_word(B, k, n, [], fix=[(i, c) for i, c in enumerate(u)] + [(l + i, c) for i, c in enumerate(u)])
    if z is not None: assert proper_word(z, B) and z[:w] == list(u) == z[l:]
    return z

def build_base(B, k, lmax=60, pairmax=24, verbose=True):
    B = sorted(B); w = max(B)
    pairs = [(a, b) for a in range(2, pairmax + 1) for b in range(a + 1, pairmax + 1) if math.gcd(a, b) == 1]
    pairs.sort(key=lambda ab: (ab[0] - 1) * (ab[1] - 1))
    best = None
    tried = 0
    for (a, b) in pairs:
        z = two_loops(B, k, a, b)
        if z is None: continue
        u = z[:w]
        loops = {}
        for l in range(2, lmax + 1):
            zz = loop_at(B, k, u, l)
            if zz is not None: loops[l] = zz
        gens = sorted(loops); mingens = []
        for g in gens:
            S = semigroup(mingens, g) if mingens else [True] + [False] * g
            if not S[g]: mingens.append(g)
        S = semigroup(mingens, 3000)
        gap = max([n for n in range(3001) if not S[n]] or [0])
        if verbose: print("  B=%s pair (%d,%d): generators %s largest gap %d" % (B, a, b, mingens, gap), flush=True)
        if best is None or gap < best["largest_gap"]:
            best = {"B": B, "k": k, "u": u, "generators": mingens, "loops": {str(l): loops[l] for l in mingens}, "largest_gap": gap}
        tried += 1
        if tried >= 3 or gap < 40: break
    return best

if __name__ == "__main__":
    for B in ([1,2,3,5,7,8], [1,3,4,5,6,9]):
        t = time.time(); best = build_base(B, 6)
        print("BASE", B, "->", None if best is None else (best["generators"], best["largest_gap"]), "[%.0fs]" % (time.time() - t), flush=True)
        if best: json.dump(best, open("base_%s.json" % '_'.join(map(str, B)), "w"))
