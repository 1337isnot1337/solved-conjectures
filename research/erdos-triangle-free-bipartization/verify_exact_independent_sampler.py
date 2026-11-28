"""Exact interval checks for EXACT-INDEPENDENT-LAW-SAMPLER.md."""

from fractions import Fraction as Q


def lengths(p, l, c):
    if p < c:
        return Q(1), Q(1)
    if p > 1 - c:
        return Q(0), Q(0)
    if l == 1:
        return Q(0), Q(1)
    if p <= Q(1, 2):
        return (l - 1) * (Q(1, 2) - p) / p, Q(1)
    return Q(0), 1 - (l - 1) * (p - Q(1, 2)) / (1 - p)


def run():
    tests = 0
    imperfect = 0
    for l in (Q(1), Q(4, 3), Q(2), Q(3), Q(4), Q(9)):
        a = l / (l + 2)
        c = (1 - 1 / l) / 2
        grid = sorted({Q(i, 48) for i in range(49)} | {c, 1 - c})
        for p in grid:
            for s in grid:
                q = 1 - p - s
                if q < 0:
                    continue
                u, v = lengths(p, l, c)
                z, w = lengths(s, l, c)
                assert all(0 <= h <= 1 for h in (u, v, z, w))
                pp = min(1-c, max(c, p))
                ss = min(1-c, max(c, s))
                P = a*p + (1-a)/2*(p*u+(1-p)*v)
                S = a*s + (1-a)/2*(s*z+(1-s)*w)
                assert P == (1+a)/4 + a*(p-pp)
                assert S == (1+a)/4 + a*(s-ss)
                J = p*max(0,u+w-1) + s*max(0,z+v-1) + q*min(v,w)
                low, high = sorted((p,s))
                eta = lambda t: l * max(0,c-t)
                if l == 1:
                    expected = q
                elif high <= Q(1,2):
                    expected = l*q-eta(p)-eta(s)
                elif high > 1-c:
                    expected = 0
                else:
                    expected = l*q-min(eta(low),(l-1)*q/(2-2*high))
                assert J == expected and 0 <= J <= l*q
                if pp == p and ss == s:
                    assert J == l*q
                exact = 1-P-S+(1-a)*J
                assert exact == (1-a)/2+a*(pp-p+ss-s)+2*a*q-(1-a)*(l*q-J)
                tests += 1
        inside = [p for p in grid if c <= p <= 1-c]
        for p in inside:
            for s in inside:
                q = 1-p-s
                u, v = lengths(p,l,c)
                z, w = lengths(s,l,c)
                lo, hi = max(0,-q), min(p,s)
                for r in {lo, (lo+hi)/2, hi}:
                    J = (
                        r*min(u,z) + (p-r)*max(0,u+w-1)
                        + (s-r)*max(0,z+v-1) + (q+r)*min(v,w)
                    )
                    assert 0 <= J <= l*(q+r)
                    if q >= 0:
                        assert J <= l*q+r
                    else:
                        assert J <= q+r
                    imperfect += 1
    print(f"{imperfect} imperfect-law checks pass.")
    m = Q(3997,9600)
    assert Q(1,25)*(2+3*(4*m-1)) == Q(3197,20000)
    assert (1+Q(797,3200))/3 == m
    print(f"{tests} rational interval-pair checks pass; both thresholds agree exactly.")


if __name__ == "__main__":
    run()
