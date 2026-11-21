"""Family q = 3: G_g = Cay(Z_n, +-{1,...,2g-2, 2g+1, 3g}), n = 6g+1, Delta = 4g.  Explicit (2n,3)-edge-colouring:
class(2i) = M0 + i, class(2i+1) = M1 + i (i in Z_n) at a-position a, colour c = 3a mod 2n, where
M0 = {(0,4g)} u {(2g+1+i, 4g-i): 1<=i<=g-1},  M1 = {(1,3g+1)} u {(2g+1+i, 4g+1-i): 1<=i<=g-1}."""
import sys
from fractions import Fraction
def colouring(g):
    n = 6 * g + 1; p = 2 * n
    M0 = [(0, 4 * g)] + [(2 * g + 1 + i, 4 * g - i) for i in range(1, g)]
    M1 = [(1, 3 * g + 1)] + [(2 * g + 1 + i, 4 * g + 1 - i) for i in range(1, g)]
    col = {}
    for i in range(n):
        for (M, a) in ((M0, 2 * i), (M1, 2 * i + 1)):
            c = (3 * a) % p
            for (x, y) in M:
                e = tuple(sorted(((x + i) % n, (y + i) % n)))
                assert e not in col, ("edge repeated", e)
                col[e] = c
    return n, p, col
def check(g):
    n, p, col = colouring(g)
    S = set(range(1, 2 * g - 1)) | {2 * g + 1, 3 * g}
    E = {tuple(sorted((x, (x + s) % n))) for x in range(n) for s in S}
    assert set(col) == E and len(E) == n * 2 * g, "edge set is not the circulant"
    # (p,3)-colouring: adjacent edges have colours at circular distance >= 3
    inc = [[] for _ in range(n)]
    for (x, y), c in col.items(): inc[x].append(c); inc[y].append(c)
    for v in range(n):
        cs = sorted(inc[v]); assert len(cs) == 4 * g
        for a, b in zip(cs, cs[1:] + [cs[0] + p]): assert b - a >= 3, (v, a, b)
    # lower bound: |E| / alpha' with alpha' = (n-1)/2
    lb = Fraction(len(E), (n - 1) // 2); ub = Fraction(p, 3)
    assert lb == ub == Fraction(4 * g * 3 + 2, 3)
    return n, 4 * g, ub
for g in range(2, int(sys.argv[1]) + 1):
    n, D, v = check(g)
    print("g=%d: n=%d, Delta=%d, chi'_c = %s = Delta + 2/3  (colouring verified, fractional bound equal)" % (g, n, D, v))
