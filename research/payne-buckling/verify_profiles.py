"""Finite character-profile checks for the cyclic index shift, not a PDE proof."""

from itertools import product

count = 0
for n in range(2, 16):
    for lower in product(range(5), repeat=n//2+1):
        ranks = tuple(lower[min(l, n-l)] for l in range(n))
        k = sum(ranks)
        if not k:
            continue
        plus, minus = [], []
        for l in range(n):
            a = ranks[(l-1)%n]
            b = ranks[(l+1)%n]
            d = ranks[l]
            skew_p = (2*l-1)%n == 0
            skew_m = (2*l+1)%n == 0
            assert not skew_p or a == d
            assert not skew_m or b == d
            plus.append(max(0,a-d) + (d%2 if skew_p else 0))
            minus.append(max(0,b-d) + (d%2 if skew_m else 0))
        shift = sum(map(max, plus, minus))
        assert plus == [minus[(-l)%n] for l in range(n)]
        assert shift == 0 if len(set(ranks))==1 and (n%2==0 or ranks[0]%2==0) else shift >= 1
        if n%2 and len(set(ranks))==1 and ranks[0]%2:
            assert shift == 2
        count += 1
print(f"{count:,} conjugate-symmetric cyclic character profiles checked")
