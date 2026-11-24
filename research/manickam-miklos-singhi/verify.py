"""Exact finite checks of the opposite-pair special case. Not a proof."""
from collections import Counter
from itertools import combinations, combinations_with_replacement
from math import comb
from random import Random


def verify(core, pairs, include_open_odd=False):
    x = (sum(core), *(-b for b in core), *(a for u in pairs for a in (u, -u)))
    m, n = len(core) + 1, len(x)
    checks = 0
    for k in range(1, n // 2 + 1):
        if m % 2 and k > (m + 1) // 2 and n < 3*k and not include_open_odd:
            continue
        ge = sum(sum(values) >= 0 for values in combinations(x, k))
        if ge < comb(n - 1, k - 1):
            raise AssertionError((core, pairs, k, ge, comb(n - 1, k - 1)))
        checks += 1
    return checks


def verify_conditional(core, pairs, k):
    """Check all H, including the combinatorial weights by a second count."""
    ys = (sum(core), *(-b for b in core))
    xs = (*ys, *(a for u in pairs for a in (u, -u)))
    m, n = len(ys), len(xs)
    stats = Counter()
    for ix in combinations(range(n), k):
        U = set(ix)
        H = frozenset(j for j in range(len(pairs)) if
                      ((m + 2*j in U) != (m + 2*j + 1 in U)))
        s = sum(i < m for i in ix)
        stats[H, s, 'total'] += 1
        stats[H, s, 'positive'] += sum(xs[i] for i in ix) >= 0
    spare = 0
    for H in {key[0] for key in stats}:
        h = len(H)
        for s in range(m + 1):
            t = k - h - s
            W = (comb(m, s) * comb(len(pairs) - h, t//2) * (2**h)
                 if t % 2 == 0 and 0 <= t//2 <= len(pairs) - h else 0)
            assert W == stats[H, s, 'total']
            if s <= m//2:
                assert m*stats[H, s, 'positive'] >= s*W
                if m % 2 == 0:
                    assert W >= stats[H, m-s, 'total']
        if m % 2 == 0:
            assert sum(m*stats[H,s,'positive']-s*stats[H,s,'total']
                       for s in range(m+1)) >= 0
        elif m >= 7:
            for s in range(m//2+1, m):
                sp = m-s-1
                assert stats[H,sp,'total'] >= stats[H,s,'total']
                assert sum(m*stats[H,j,'positive']-j*stats[H,j,'total']
                           for j in (s,sp)) >= 0
            spare += stats[H,0,'total'] - stats[H,m-1,'total'] - stats[H,m,'total']
    assert spare >= 0
    assert sum(m*stats[H,s,'positive']-s*stats[H,s,'total']
               for H in {key[0] for key in stats} for s in range(m+1)) >= 0


if __name__ == '__main__':
    checks = 0
    for m in range(1, 9):
        for P in range(5):
            if m + 2*P > 14:
                continue
            for core in combinations_with_replacement(range(4), m-1):
                for pairs in combinations_with_replacement((0, 1, 3, 6), P):
                    checks += verify(core, pairs)
    print(f'{checks:,} exact enumerations in the proved range')
    rng = Random(20261124)
    for runs in range(200):
        m = rng.choice((2, 3, 4, 5, 6, 7, 8))
        P = rng.randrange(3, 7) if m % 2 else rng.randrange(5)
        core = [rng.randrange(20) for _ in range(m-1)]
        pairs = [rng.randrange(50) for _ in range(P)]
        ratio = 2 if m%2 == 0 else 3
        verify_conditional(core, pairs, rng.randrange(1, (m+2*P)//ratio+1))
    print(f'{runs+1:,} conditional weighting and reflection checks')
    odd = 0
    for _ in range(300):
        m = rng.choice((3,5,7,9))
        P = rng.randrange(6)
        core = [rng.randrange(20) for _ in range(m-1)]
        pairs = [rng.randrange(30) for _ in range(P)]
        odd += verify(core, pairs, include_open_odd=True)
    print(f'{odd:,} exploratory odd-core checks; not a parity-free proof')
    # The odd-core k<=n/2 extension is false. Check the all-t formula
    # against an independent coefficient count with four weight types.
    for t in range(1, 101):
        k = 2*t + 1
        n = 4*t + 3
        a, b = comb(2*t,t), comb(2*t,t-1)
        numerator = comb(n,k) - a*a - 2*a*b + b*b
        assert numerator % 2 == 0
        actual = 0
        for gate in (0,1):
            for low in range(3):
                for plus in range(2*t+1):
                    minus = k-gate-low-plus
                    if 0 <= minus <= 2*t and 4*gate-2*low+3*(plus-minus) >= 0:
                        actual += comb(2,low)*comb(2*t,plus)*comb(2*t,minus)
        assert actual == numerator//2 < comb(n-1,k-1)
    print('100 exact checks of the counterexample family outside the MMS range')
