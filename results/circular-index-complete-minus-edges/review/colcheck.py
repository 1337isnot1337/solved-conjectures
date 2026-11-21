import json, sys
from fractions import Fraction
cs = json.load(open(sys.argv[1]))
for c in cs:
    n, F, p, q, E, col = c['n'], c['F'], c['p'], c['q'], c['edges'], c['colour']
    Fs = set(tuple(sorted(e)) for e in F)
    full = set((a, b) for a in range(n) for b in range(a+1, n))
    Es = [tuple(sorted(e)) for e in E]
    assert len(Es) == len(set(Es)) and set(Es) == full - Fs and Fs <= full and len(Fs) == len(F)
    # check at each vertex: sorted colours have cyclic consecutive gaps >= q
    for x in range(n):
        cols = sorted(col[i] % p for i, e in enumerate(Es) if x in e)
        gaps = [(cols[(i+1) % len(cols)] - cols[i]) % p for i in range(len(cols))]
        assert min(gaps) >= q and len(cols) == len(set(cols)), (n, F, x)
    m = (n-1)//2; t = len(F); N = len(Es)
    print(n, t, F, "(%d,%d) ok" % (p, q), "N/m =", Fraction(N, m), "p/q =", Fraction(p, q), "2t vs m:", 2*t, m)
