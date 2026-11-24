"""Exact verifier of the seven interval-covering rows in PROOF.md."""
from fractions import Fraction as Q

A, B = 0, 1
sets = {
    Q(1,6): ((3,19),(28,64)),
    Q(1,3): ((1,64),),
    Q(1): ((7,64),),
    Q(2,3): ((1,64),),
    Q(2): ((1,64),),
    Q(4): ((1,64),),
    Q(12): ((1,22),),
}
cover = {
    Q(1,6): ((3,19,A,3),(28,64,A,2)),
    Q(1,3): ((1,26,A,3),(24,64,A,2)),
    Q(1): ((7,Q(77,5), B,3),(Q(77,5),64,A,2)),
    Q(2,3): ((1,34,A,3),(16,64,B,2)),
    Q(2): ((1,16,A,3),(11,64,A,2)),
    Q(4): ((1,15,B,4),(9,Q(55,2),B,3),(Q(55,2),64,B,2)),
    Q(12): ((1,9,B,4),(9,22,B,3)),
}

def h(lam, x):
    low = Q(2,5) + lam*Q(3,11)
    return low + Q(x,64)*(1+lam-low)

def merge(intervals):
    out = []
    for left, right in sorted(intervals):
        if out and left <= out[-1][1]:
            out[-1] = out[-1][0], max(right, out[-1][1])
        else:
            out.append((left, right))
    return tuple(out)

for lam, intervals in cover.items():
    assert merge((left,right) for left,right,side,d in intervals) == sets[lam]
    for left,right,side,d in intervals:
        r = Q(1,d*(d-1))
        if side == A:
            assert d in (2,3)
            nxt = lam/r
            c, m = Q(1,d), r
        else:
            assert d in (2,3,4)
            nxt = lam*r
            c, m = lam/d, Q(1)
        assert nxt in sets
        assert any(c+m*h(nxt,l) <= h(lam,left) < h(lam,right) <= c+m*h(nxt,u)
                   for l,u in sets[nxt])

assert h(Q(1),7) == Q(2879,3520) < 1 and h(Q(1),64) == 2
print("All 15 exact containments pass; [2879/3520,2] is covered.")
