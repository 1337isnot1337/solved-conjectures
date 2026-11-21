"""Certificate builder for a one-parameter family W u {x}, x = 0 mod k, with k = |W|+1 colours."""
import sys, json, math, time
import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from loops import proper_word, periodic_proper, find_two_loops
from pysat.solvers import Cadical153

def find_loop(W, k, r, u, l, budget=200000):
    """loop of length l at state u for W u {r} (word of length l + w with prefix and suffix u)."""
    D = sorted(set(W) | {r}); w = max(D); n = l + w
    assert len(u) == w
    var = lambda i, c: i * k + c + 1
    s = Cadical153()
    for i in range(n):
        s.add_clause([var(i, c) for c in range(k)])
        for c1 in range(k):
            for c2 in range(c1 + 1, k):
                s.add_clause([-var(i, c1), -var(i, c2)])
        for d in D:
            if i + d < n:
                for c in range(k):
                    s.add_clause([-var(i, c), -var(i + d, c)])
    for i, c in enumerate(u):
        s.add_clause([var(i, c)]); s.add_clause([var(l + i, c)])
    s.conf_budget(budget)
    ok = s.solve_limited()
    if not ok: s.delete(); return None
    m = set(x for x in s.get_model() if x > 0)
    z = [next(c for c in range(k) if var(i, c) in m) for i in range(n)]
    s.delete()
    assert proper_word(z, D) and z[:w] == list(u) == z[l:]
    return z

def periodic_colouring(D, k, p, budget=200000):
    if any(d % p == 0 for d in D): return None
    var = lambda i, c: i * k + c + 1
    s = Cadical153()
    for i in range(p):
        s.add_clause([var(i, c) for c in range(k)])
    edges = set()
    for i in range(p):
        for d in D:
            j = (i + d) % p; edges.add((min(i, j), max(i, j)))
    for (i, j) in edges:
        for c in range(k):
            s.add_clause([-var(i, c), -var(j, c)])
    s.add_clause([var(0, 0)])
    s.conf_budget(budget)
    ok = s.solve_limited()
    if not ok: s.delete(); return None
    m = set(l for l in s.get_model() if l > 0)
    col = [next(c for c in range(k) if var(i, c) in m) for i in range(p)]
    s.delete()
    assert periodic_proper(col, D)
    return col

def semigroup(gens, upto):
    S = [False] * (upto + 1); S[0] = True
    for n in range(1, upto + 1):
        S[n] = any(n >= g and S[n - g] for g in gens)
    return S

def build(W, k, r, u, lmax=60, direct_pmax=80, verbose=True):
    W = sorted(W); w = max(W + [r])
    loops = {}
    for l in range(2, lmax + 1):
        z = find_loop(W, k, r, u, l)
        if z is not None: loops[l] = z
    gens = sorted(loops)
    # minimal generating set
    mingens = []
    for g in gens:
        S = semigroup(mingens, g) if mingens else [True] + [False] * g
        if not S[g]: mingens.append(g)
    upto = 4000
    S = semigroup(mingens, upto)
    frob = max([n for n in range(upto + 1) if not S[n]] or [0])
    if verbose: print("r=%d: loop lengths at u: %s\n   minimal generators %s, largest gap %d" % (r, gens, mingens, frob), flush=True)
    # which x = 0 mod k are not covered by x+r in S or x-r in S ?
    small = []
    for x in range(k, frob + r + k + 1, k):
        if x in W: continue
        if S[x + r] or (x - r > 0 and S[x - r]): continue
        small.append(x)
    direct = {}; failed = []
    for x in small:
        D = W + [x]; got = None
        for p in range(k, direct_pmax + 1):
            col = periodic_colouring(D, k, p)
            if col is not None: got = (p, col); break
        if got: direct[x] = got
        else: failed.append(x)
    if verbose: print("   x not covered by the semigroup: %s\n   of these, directly coloured: %s ; FAILED: %s" % (small, sorted(direct), failed), flush=True)
    return {"W": W, "k": k, "r": r, "u": list(u), "loops": {str(l): loops[l] for l in mingens}, "generators": mingens,
            "largest_gap": frob, "direct": {str(x): {"period": p, "word": col} for x, (p, col) in direct.items()}, "failed": failed}

if __name__ == "__main__":
    pass
