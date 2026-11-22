"""Independent check of Lemmas A2-A6 (and the paragraph after A3) on perfect sequencings of K_n - uv.
Reads sequencings (one per line, tokens a-b) from a file written by ./seqsearch.  u,v given on command line.
Also checks all rotations and reversals (every perfect sequencing is a rotation of one with e_0 fixed,
or a reversal of such)."""
import sys

def check(seq, n, u, v):
    m = (n - 1) // 2; N = len(seq); R = m + 1
    assert N == m * n - 1 == (m + 1) * (2 * m - 1)
    # definition
    for j in range(N):
        vs = [x for i in range(m) for x in seq[(j + i) % N]]
        assert len(set(vs)) == 2 * m
    pos = {x: [j for j in range(N) if x in seq[j]] for x in range(n)}
    def nxt(x, j):
        P = pos[x]; i = P.index(j); return (P[(i + 1) % len(P)] - j) % N
    def prv(x, j):
        P = pos[x]; i = P.index(j); return (j - P[i - 1]) % N
    # A2 incl. H_j description
    for j in range(N):
        win = set(x for i in range(m) for x in seq[(j + i) % N]); H = (set(range(n)) - win).pop()
        a = [x for x in seq[j] if nxt(x, j) == m]; b = [x for x in seq[j] if nxt(x, j) == m + 1]
        assert len(a) == 1 and len(b) == 1
        assert seq[(j + m) % N] == frozenset((H, a[0]))
        win1 = set(x for i in range(m) for x in seq[(j + 1 + i) % N]); assert (set(range(n)) - win1) == {b[0]}
    # A3
    full = [x for x in range(n) if x not in (u, v)]
    for x in full: assert sum(1 for j in pos[x] if nxt(x, j) == m + 1) == m - 1
    ru = {j % R for j in pos[u]}; rv = {j % R for j in pos[v]}
    assert len(ru) == 1 and len(rv) == 1 and ru != rv
    ru, rv = ru.pop(), rv.pop()
    assert sorted(pos[u]) == [j for j in range(N) if j % R == ru] and sorted(pos[v]) == [j for j in range(N) if j % R == rv]
    # paragraph: each full vertex visits each residue class in one block, entered by a move
    for x in full:
        P = pos[x]
        blocks = []
        for i, j in enumerate(P):
            if prv(x, j) == m: blocks.append([j])      # entered by a move -> new block
            else: blocks[-1 if blocks else 0].append(j) if blocks else None
        # rebuild cyclically: start at a move-entry
        start = next(i for i, j in enumerate(P) if prv(x, j) == m)
        Pc = P[start:] + P[:start]; blocks = []
        for j in Pc:
            if prv(x, j) == m: blocks.append([j])
            else: blocks[-1].append(j)
        assert len(blocks) == m + 1
        assert sorted(b[0] % R for b in blocks) == list(range(R))
        for b in blocks: assert len({j % R for j in b}) == 1
        for b in blocks:
            if b[0] % R in (ru, rv): assert len(b) == 1
    # A4
    for j in range(N):
        x, y = tuple(seq[j])
        if x in full and y in full:
            gx, gy = (prv(x, j), nxt(x, j)), (prv(y, j), nxt(y, j))
            assert {gx, gy} == {(m + 1, m), (m, m + 1)}, (j, gx, gy)
    # A5
    ordinary = [r for r in range(R) if r not in (ru, rv)]
    assert len(ordinary) == m - 1
    Z = {}
    for r in ordinary:
        z = {}
        for k in range(2 * m - 1):
            j = (r + k * R) % N
            newc = [x for x in seq[j] if prv(x, j) == m]
            assert len(newc) == 1; z[k] = newc[0]
        assert sorted(z.values()) == sorted(full)
        for k in range(2 * m - 1):
            assert seq[(r + k * R) % N] == frozenset((z[(k - 1) % (2 * m - 1)], z[k]))
        for x in full:
            js = [j for j in pos[x] if j % R == r]; assert len(js) == 2
        Z[r] = z
    # A6 slot arithmetic
    for s in range(R):
        for k in range(2 * m - 1):
            P = (s + k * R) % N; Q = (P + m) % N
            exp = (s - 1 + ((k + 1) % (2 * m - 1)) * R) % N if s >= 1 else (m + k * R) % N
            assert Q == exp
    # A6 rotation (rho' = first ordinary class after rho, cyclically)
    shifts = {}
    for r in ordinary:
        rp = next((r + i) % R for i in range(1, R + 1) if (r + i) % R in ordinary)
        L = 2 * m - 1
        cs = [c for c in range(L) if all(Z[r][k] == Z[rp][(k - c) % L] for k in range(L))]
        assert cs, ("A6 fails", r, rp)
        shifts[(r, rp)] = cs
    return ru, rv, ordinary, shifts

if __name__ == "__main__":
    fn, n, u, v = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4])
    seqs = [[frozenset(map(int, tok.split('-'))) for tok in line.split()] for line in open(fn) if line.strip()]
    cnt = 0; allseq = set()
    for s in seqs:
        for rev in (s, s[::-1]):
            for r in range(len(rev)):
                rot = rev[r:] + rev[:r]
                key = tuple(tuple(sorted(e)) for e in rot)
                if key in allseq: continue
                allseq.add(key)
                out = check(rot, n, u, v); cnt += 1
    print("checked %d distinct (rotated/reversed) sequencings from %d base ones; last: ru,rv,ordinary,shifts=%s" % (cnt, len(seqs), out))
