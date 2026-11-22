"""Exhaustive: does the Family B base problem have a solution for g = 3,4,5,6? (perfect matchings of W0, W1,
2g pairwise distinct lengths != 1). Counts solutions."""
def pms(vs):
    if not vs: yield []; return
    a = vs[0]
    for k in range(1, len(vs)):
        b = vs[k]; rest = vs[1:k] + vs[k+1:]
        for r in pms(rest): yield [(a, b)] + r
for g in (3, 4, 5, 6):
    n = 6*g+1; I = list(range(2*g+3, 4*g+1))
    ln = lambda a, b: min((a-b) % n, (b-a) % n)
    def masks(W):
        out = set()
        for M in pms(W):
            L = [ln(*e) for e in M]
            if 1 in L or len(set(L)) != g: continue
            m = 0
            for s in L: m |= 1 << s
            out.add(m)
        return out
    A = masks([0, 1] + I); B = masks([1, 2] + I)
    sols = sum(1 for a in A for b in B if not a & b)
    print("g=%d: distinct length-masks M0:%d M1:%d, compatible pairs (length-mask level): %d" % (g, len(A), len(B), sols))
