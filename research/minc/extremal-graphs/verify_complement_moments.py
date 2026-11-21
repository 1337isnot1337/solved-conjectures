"""Exact checks of matching-moment defects and the complementary rook integral."""
from functools import lru_cache
from itertools import combinations
from math import factorial
from fractions import Fraction


def rook_counts(rows, n):
    ways = {0: 1}
    for row in rows:
        nxt = ways.copy()
        for mask,val in ways.items():
            available = row & ~mask
            while available:
                bit = available & -available
                key = mask | bit
                nxt[key] = nxt.get(key,0)+val
                available -= bit
        ways = nxt
    out = [0]*(n+1)
    for mask,val in ways.items():
        out[mask.bit_count()] += val
    return out


def moments(rook, count):
    coeff = [(-1)**i*a for i,a in enumerate(rook)]
    powers = [0]*(count+1)
    for j in range(1,count+1):
        powers[j] = -(j*coeff[j] if j < len(coeff) else 0)
        powers[j] -= sum(coeff[i]*powers[j-i] for i in range(1,min(j,len(coeff))))
    return powers


@lru_cache(None)
def complete(r):
    return moments(rook_counts([(1<<r)-1]*r,r),9)


def check(rows, r):
    n = len(rows)
    assert all(sum((row>>j)&1 for row in rows)==r for j in range(n))
    defect = sum((u&v).bit_count()*(r-(u&v).bit_count()) for u in rows for v in rows)
    counts = rook_counts(rows,n)
    comp = [(1<<n)-1-row for row in rows]
    assert sum((-1)**i*factorial(n-i)*v for i,v in enumerate(counts)) == rook_counts(comp,n)[n]
    for l, (a,b) in enumerate(zip(moments(counts,9),complete(r))):
        error = a - Fraction(n*b,r)
        if l < 4:
            assert error == 0
        elif l==4:
            assert error == defect
        else:
            assert 0 <= error <= 4**l*l**3*r**(l-4)*defect


def main():
    graphs = 0
    for n in range(3,11):
        for r in range(2,n):
            # Every circulant through order eight, with additional large-degree representatives.
            steps = combinations(range(n),r) if n<=8 else [tuple(range(r))]
            for S in steps:
                rows = [sum(1<<((i+j)%n) for j in S) for i in range(n)]
                check(rows,r)
                graphs += 1
                if n>8:
                    # A switch preserving margins and degree but generally destroying symmetry.
                    switch = next(((i,j) for i in range(n) for j in range(i) if rows[i]!=rows[j]),None)
                    if switch:
                        i,j = switch
                        u,v = rows[i]&~rows[j], rows[j]&~rows[i]
                        flip = (u&-u) | (v&-v)
                        rows[i] ^= flip
                        rows[j] ^= flip
                        check(rows,r)
                        graphs += 1
    print(f'{graphs} exact graph checks of nine matching moments, fourth deficits, and complementary permanents passed')


if __name__ == '__main__':
    main()
