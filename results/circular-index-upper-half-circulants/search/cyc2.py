"""Cyclic perfect colourings of circulant graphs.
Parameters m, k (1 <= k < m/2): n = 2m+1 vertices (Z_n), G = Cay(Z_n, S) with m-k differences (up to sign), Delta = 2(m-k),
N = n(m-k) edges, fractional bound N/m = Delta + 1 - k/m.  g = gcd(m,k), q = m/g, classes of g edges, d = (m-k)/g base classes,
p = n*d classes.  a-coordinate: a = c * q^{-1} mod p.  Ansatz: class(a + d) = class(a) + 1 (translation in Z_n).
Window condition: class(a) and class(a + t*q^{-1}) are vertex-disjoint for 1 <= t <= q-1.
A solution gives chi'_c(G) = N/m exactly (upper bound: the colouring; lower bound: |E|/alpha')."""
import sys, time
from math import gcd
def setup(m, k):
    n = 2 * m + 1; g = gcd(m, k); q = m // g; d = (m - k) // g; p = n * d
    inv = pow(q, -1, p)
    # conflicts: vertex v in base class r1 and w in base class r2 conflict iff (v - w) mod n in C[r1][r2]
    C = [[set() for _ in range(d)] for _ in range(d)]
    for a in range(d):
        for t in range(1, q):
            b = (a + t * inv) % p; r = b % d; s = ((b - r) // d) % n
            # class(a) disjoint from class(r) + s : v in class a, w in class r: v != w + s
            C[a][r].add(s); C[r][a].add((-s) % n)
    for r in range(d): C[r][r].add(0)
    return n, g, q, d, p, inv, C
def solve(m, k, tlimit=600, verbose=False):
    n, g, q, d, p, inv, C = setup(m, k)
    t0 = time.time()
    # forb[r][v] = bitmask over (class r2, vertex w) ... simpler: keep placed vertices per class
    placed = [[] for _ in range(d)]          # vertices placed in base class r
    edges = [[] for _ in range(d)]
    useddiff = [False] * (m + 1)
    nodes = [0]; res = [None]
    def free(r, v):
        for r2 in range(d):
            Cs = C[r][r2]
            for w in placed[r2]:
                if (v - w) % n in Cs: return False
        return True
    def rec(r, j, lastx):
        # fill edge j of class r
        nodes[0] += 1
        if nodes[0] % 4096 == 0 and time.time() - t0 > tlimit: raise TimeoutError
        if r == d: res[0] = [list(e) for e in edges]; return True
        if j == g: return rec(r + 1, 0, -1)
        xs = [0] if (r == 0 and j == 0) else range(lastx + 1 if False else 0, n)
        for x in xs:
            if not free(r, x): continue
            placed[r].append(x)
            for delta in range(1, m + 1):
                if useddiff[delta]: continue
                for y in ((x + delta) % n, (x - delta) % n):
                    if r == 0 and j == 0 and y != (x + delta) % n: continue
                    if not free(r, y): continue
                    # canonical order inside a class: edges sorted by min endpoint to avoid permutations
                    key = min(x, y)
                    if j > 0 and key <= min(edges[r][-1]): continue
                    if x > y and (r, j) != (0, 0): continue      # each edge once: x is the smaller endpoint
                    placed[r].append(y); useddiff[delta] = True; edges[r].append((x, y))
                    if rec(r, j + 1, x): return True
                    edges[r].pop(); useddiff[delta] = False; placed[r].pop()
            placed[r].pop()
        return False
    try:
        ok = rec(0, 0, -1)
    except TimeoutError:
        return 'timeout', None, nodes[0]
    return ('found' if ok else 'none'), res[0], nodes[0]
def expand(m, k, base):
    n, g, q, d, p, inv, C = setup(m, k)
    cls = {}
    for a in range(p):
        r = a % d; s = (a - r) // d
        cls[(q * a) % p] = [tuple(sorted(((x + s) % n, (y + s) % n))) for (x, y) in base[r]]
    return n, g, q, p, cls
def verify(m, k, cls):
    n = 2 * m + 1; g = gcd(m, k); q = m // g; p = len(cls)
    E = [e for c in range(p) for e in cls[c]]
    assert len(E) == len(set(E)) == n * (m - k) and all(a != b for a, b in E)
    for c in range(p):
        vs = [v for t in range(q) for e in cls[(c + t) % p] for v in e]
        assert len(vs) == 2 * m == len(set(vs)), ("window", c)
    deg = [0] * n
    for a, b in E: deg[a] += 1; deg[b] += 1
    assert set(deg) == {2 * (m - k)}
    return True
if __name__ == "__main__":
    tl = float(sys.argv[1])
    for spec in sys.argv[2:]:
        m, k = map(int, spec.split(','))
        n, g, q, d, p, inv, C = setup(m, k)
        st, base, nodes = solve(m, k, tl)
        Delta = 2 * (m - k)
        head = "m=%d k=%d: n=%d Delta=%d value=%d/%d=Delta+1-%d/%d (classes of %d edges, p=%d)" % (m, k, n, Delta, n * (m - k) // g, q, k // g, q, g, p)
        if st == 'found':
            nn, gg, qq, pp, cls = expand(m, k, base); verify(m, k, cls)
            S = sorted(min((a - b) % n, (b - a) % n) for cl in base for a, b in cl)
            print(head, "FOUND base", base, "S =", S, "(nodes %d)" % nodes, flush=True)
        else: print(head, st.upper(), "(nodes %d)" % nodes, flush=True)
