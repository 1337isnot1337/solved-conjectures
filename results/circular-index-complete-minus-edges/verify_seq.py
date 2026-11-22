"""Standard-library checks for the perfect-sequencing proof (PROOF.md, Part A).

A perfect sequencing of G = K_n - F (n = 2m+1) is a cyclic order e_0..e_{N-1} of all edges
in which every m cyclically consecutive edges are pairwise disjoint.

1. Exhaustive search, from the definition only, for perfect sequencings of K_n - e (n = 5, 7, 9).
2. On every perfect sequencing of K_5 - e found (e_0 fixed), check Lemmas A2, A3, A4 and the class counts of A5
   (each full vertex twice in an ordinary class, once in a special class).  The full A5 statement
   (consecutive slots, bijection, edges z_{k-1}z_k) and A6 are checked by review/lemma_check.py.
3. Exhaustive search for perfect sequencings of K_7 - P_3 and K_7 - 2K_2 (data for Part B).
"""
import sys, time, itertools
sys.setrecursionlimit(10000)

def Kminus(n, F):
    F = {frozenset(e) for e in F}
    return [frozenset((a, b)) for a in range(n) for b in range(a + 1, n) if frozenset((a, b)) not in F]

def perfect_sequencings(n, F, limit=None):
    """All perfect sequencings with e_0 = first edge (every sequencing is a rotation of one of these)."""
    m = (n - 1) // 2; E = Kminus(n, F); N = len(E)
    out = []; seq = [E[0]]; used = {E[0]}
    def ok_close():
        for j in range(N - m + 1, N):             # windows that wrap around
            win = [seq[(j + i) % N] for i in range(m)]
            vs = [v for e in win for v in e]
            if len(vs) != len(set(vs)): return False
        return True
    def rec():
        if limit and len(out) >= limit: return
        if len(seq) == N:
            if ok_close(): out.append(list(seq))
            return
        recent = set(v for e in seq[-(m - 1):] for v in e) if m > 1 else set()
        for e in E:
            if e not in used and not (e & recent):
                seq.append(e); used.add(e); rec(); seq.pop(); used.discard(e)
    rec()
    return out

def check_structure(n, seq, u, v):
    """Lemmas A2-A5 for K_n - uv, m = (n-1)/2, on one perfect sequencing."""
    m = (n - 1) // 2; N = len(seq)
    pos = {x: [j for j in range(N) if x in seq[j]] for x in range(n)}
    nxt = {}
    for x in range(n):
        P = pos[x]
        for i, j in enumerate(P): nxt[(x, j)] = (P[(i + 1) % len(P)] - j) % N
    # A2: at each position one endpoint has next gap m, the other m+1
    for j in range(N):
        a, b = sorted(seq[j]); assert sorted((nxt[(a, j)], nxt[(b, j)])) == [m, m + 1]
    # A3: N = (m+1)(2m-1); u and v each fill one residue class mod m+1
    assert N == (m + 1) * (2 * m - 1)
    ru = {j % (m + 1) for j in pos[u]}; rv = {j % (m + 1) for j in pos[v]}
    assert len(ru) == 1 and len(rv) == 1 and ru != rv and len(pos[u]) == 2 * m - 1
    ru, rv = ru.pop(), rv.pop()
    full = [x for x in range(n) if x not in (u, v)]
    prev = {}
    for x in range(n):
        P = pos[x]
        for i, j in enumerate(P): prev[(x, j)] = (j - P[i - 1]) % N
    # A4: at a full-full position the vertex that arrived by gap m+1 leaves by gap m, and conversely
    for j in range(N):
        a, b = sorted(seq[j])
        if a in full and b in full:
            assert {prev[(a, j)], prev[(b, j)]} == {m, m + 1}
            for x in (a, b): assert prev[(x, j)] + nxt[(x, j)] == 2 * m + 1
    # A5: in an ordinary class every full vertex occupies exactly two consecutive slots
    ordinary = [r for r in range(m + 1) if r not in (ru, rv)]
    cycles = []
    for r in ordinary:
        for x in full:
            assert sum(1 for j in pos[x] if j % (m + 1) == r) == 2
        cycles.append({seq[j] for j in range(N) if j % (m + 1) == r})
    for r in (ru, rv):
        for x in full: assert sum(1 for j in pos[x] if j % (m + 1) == r) == 1
    return len(ordinary)

if __name__ == "__main__":
    t0 = time.time()
    S5 = perfect_sequencings(5, [(0, 1)])
    print("K_5 - e: %d perfect sequencings starting with the first edge" % len(S5))
    for s in S5: assert check_structure(5, s, 0, 1) == 1
    print("  Lemmas A2-A4 and the class counts of A5 hold on all of them (one ordinary class each)")
    for n in (7, 9):
        t = time.time(); S = perfect_sequencings(n, [(0, 1)])
        print("K_%d - e: %d perfect sequencings (exhaustive, %.1fs)" % (n, len(S), time.time() - t))
        assert not S
    for name, F in (("P_3", [(0, 1), (1, 2)]), ("2K_2", [(0, 1), (2, 3)])):
        t = time.time(); S = perfect_sequencings(7, F)
        print("K_7 - %s: %d perfect sequencings (exhaustive, %.1fs)" % (name, len(S), time.time() - t))
    print("total %.1fs" % (time.time() - t0))
