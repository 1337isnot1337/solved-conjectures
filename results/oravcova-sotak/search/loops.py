"""Closed-walk ("loop") certificates for one-parameter families W u {x}.

A loop at state u (a word of length w = max(W u {r})) of length l is a word z of length l + w,
proper for the distance set W u {r} (no two positions at a distance in the set carry the same colour),
with z[0:w] == u == z[l:l+w].  Loops at the same state concatenate; a loop of length p gives a
p-periodic proper colouring of G(Z, W u {r}), which is also proper for W u {x} whenever x = +-r mod p.
"""
import sys, itertools, json, math
from pysat.solvers import Cadical153

def proper_word(z, D):
    n = len(z)
    return all(z[i] != z[i + d] for d in D for i in range(n - d))

def periodic_proper(word, D):
    p = len(word)
    return all(d % p != 0 and all(word[i] != word[(i + d) % p] for i in range(p)) for d in D)

def find_two_loops(W, k, r, l1, l2, budget=300000, fix_state=None):
    """SAT search for a word z of length l1 + l2 + w, proper for W u {r}, with
    z[0:w] == z[l1:l1+w] == z[l1+l2 : l1+l2+w].  Returns (u, loop1, loop2) or None/'?'."""
    D = sorted(set(W) | {r}); w = max(D); n = l1 + l2 + w
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
    def eq(i, j):
        for c in range(k):
            s.add_clause([-var(i, c), var(j, c)]); s.add_clause([var(i, c), -var(j, c)])
    for i in range(w):
        eq(i, l1 + i); eq(l1 + i, l1 + l2 + i)
    if fix_state is not None:
        for i, c in enumerate(fix_state): s.add_clause([var(i, c)])
    else:
        s.add_clause([var(0, 0)])
    s.conf_budget(budget)
    ok = s.solve_limited()
    if ok is None: s.delete(); return '?'
    if not ok: s.delete(); return None
    m = set(l for l in s.get_model() if l > 0)
    z = [next(c for c in range(k) if var(i, c) in m) for i in range(n)]
    s.delete()
    u = z[:w]; loop1 = z[:l1 + w]; loop2 = z[l1:l1 + l2 + w]
    assert proper_word(loop1, D) and proper_word(loop2, D) and loop1[:w] == u == loop1[l1:] and loop2[:w] == u == loop2[l2:]
    return u, loop1, loop2

def search(W, k, rs, lmax, verbose=True):
    best = None
    for r in rs:
        if r in W: continue
        pairs = [(a, b) for a in range(2, lmax + 1) for b in range(a + 1, lmax + 1) if math.gcd(a, b) == 1]
        pairs.sort(key=lambda ab: (ab[0] - 1) * (ab[1] - 1))
        for (a, b) in pairs:
            frob = (a - 1) * (b - 1)          # every p >= frob is in <a,b>
            if best is not None and frob - r >= best[0]: break
            res = find_two_loops(W, k, r, a, b)
            if res not in (None, '?'):
                best = (frob - r, r, a, b, res)
                if verbose: print("  r=%d loops (%d,%d): all periods >= %d, so all x >= %d" % (r, a, b, frob, frob - r), flush=True)
                break
    return best

if __name__ == "__main__":
    name = sys.argv[1]
    W = {"A5": [1,3,4,7], "A6": [1,3,4,5,9], "W2": [1,2,3,4,5,7,12], "W3": [1,4,5,6,7,11,13]}[name]
    k = len(W) + 1
    rs = [int(x) for x in sys.argv[2].split(",")]; lmax = int(sys.argv[3])
    print("W =", W, "k =", k, flush=True)
    best = search(W, k, rs, lmax)
    if best:
        bound, r, a, b, (u, l1, l2) = best
        print("BEST: r=%d, loop lengths (%d,%d), state u=%s" % (r, a, b, ''.join(map(str, u))))
        print("loop1 =", ''.join(map(str, l1))); print("loop2 =", ''.join(map(str, l2)))
        json.dump({"W": W, "k": k, "r": r, "l1": a, "l2": b, "u": u, "loop1": l1, "loop2": l2, "x_bound": bound}, open("loops_%s.json" % name, "w"))
