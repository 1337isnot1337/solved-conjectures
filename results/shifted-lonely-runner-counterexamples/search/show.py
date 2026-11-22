import sys
from fractions import Fraction as F
def arcs(V, D, ms):
    A = []
    for q, m in zip(V, ms):
        for j in range(q):
            c = F(j * D - m, q) % D
            A.append((c - F(1, q), c + F(1, q), q, c))
    return A
def show(V, D, ms):
    A = arcs(V, D, ms)
    pts = sorted({x % D for a in A for x in (a[0], a[1])} | {F(0)}); pts.append(F(D))
    def covers(a, u):
        lo, hi = a[0], a[1]
        return lo < u < hi or lo < u + D < hi or lo < u - D < hi
    segs = []
    for x, y in zip(pts, pts[1:]):
        mid = (x + y) / 2; cov = sorted(a[2] for a in A if covers(a, mid)); segs.append((x, y, cov))
    # merge consecutive segments with identical cover sets
    out = []
    for x, y, cov in segs:
        if out and out[-1][2] == cov: out[-1] = (out[-1][0], y, cov)
        else: out.append((x, y, cov))
    tot1 = sum(y - x for x, y, c in out if len(c) == 1)
    print("D=%d  speeds %s\nshifts m=%s" % (D, V, ms)); print("singly covered measure: %s of %d (%.3f); uncovered segs: %d" % (tot1, D, float(tot1 / D), sum(1 for o in out if not o[2])))
    for x, y, cov in out:
        print("  [%8.4f, %8.4f] len %-7s by %s" % (float(x), float(y), y - x, cov))
if __name__ == "__main__":
    D = int(sys.argv[1]); ms = [int(x) for x in sys.argv[2].split(',')]
    show(list(range(1, len(ms) + 1)), D, ms)
