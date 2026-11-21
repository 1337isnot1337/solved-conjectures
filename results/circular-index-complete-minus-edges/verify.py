"""Standard library only.  Checks every (p,q)-edge-colouring in colourings.json:
the edge list is exactly E(K_n - F), adjacent edges get colours at circular distance >= q in Z_p,
and computes the fractional lower bound |E|/alpha' (alpha' = (n-1)/2 for odd n and these F)."""
import json, itertools, os
from fractions import Fraction
def matching_number_ok(n, edges):
    # for odd n, alpha' <= (n-1)/2 trivially; a perfect-minus-one matching exists in these dense graphs:
    # find one greedily-with-backtracking to certify alpha' = (n-1)/2
    m = (n - 1) // 2; E = [tuple(e) for e in edges]
    def rec(i, used, k):
        if k == m: return True
        for j in range(i, len(E)):
            a, b = E[j]
            if a not in used and b not in used and rec(j + 1, used | {a, b}, k + 1): return True
        return False
    return rec(0, frozenset(), 0)
cases = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'colourings.json')))
for c in cases:
    n, F, p, q, edges, col = c['n'], c['F'], c['p'], c['q'], c['edges'], c['colour']
    Fs = {frozenset(e) for e in F}
    expect = {frozenset((a, b)) for a in range(n) for b in range(a + 1, n)} - Fs
    assert len(Fs) == len(F) and {frozenset(e) for e in edges} == expect and len(edges) == len(expect)
    assert all(0 <= x < p for x in col)
    for i, j in itertools.combinations(range(len(edges)), 2):
        if set(edges[i]) & set(edges[j]):
            d = (col[i] - col[j]) % p
            assert min(d, p - d) >= q, (n, F, edges[i], edges[j])
    assert matching_number_ok(n, edges)
    m = (n - 1) // 2
    frac = Fraction(len(edges), m)
    upper = Fraction(p, q)
    print("K_%d - %s: (%d,%d)-colouring OK; |E|/alpha' = %s, so %s <= chi'_c <= %s%s" % (
        n, F, p, q, frac, frac, upper, "  => chi'_c = %s" % upper if frac == upper else ""))
print("all", len(cases), "colourings verified")
