"""Independent finite checks for the Hadamard code divisibility criterion."""
from functools import lru_cache
from math import factorial, prod
from random import Random


def family(t,seed):
    rng = Random(seed)
    blocks = []
    for _ in range(1<<t):
        row_sign = [rng.choice((-1,1)) for _ in range(4)]
        column_sign = [rng.choice((-1,1)) for _ in range(4)]
        order = rng.sample(range(4),4)
        blocks.append([[r*column_sign[j]*(-1)**((order[i]&j).bit_count()%2)
                        for j in range(4)] for i,r in enumerate(row_sign)])
    rows = [[(-1)**((u&v).bit_count()%2)*blocks[v][i][j]
             for v in range(1<<t) for j in range(4)]
            for u in range(1<<t) for i in range(4)]
    return [[a*row[0]*rows[0][j]*rows[0][0] for j,a in enumerate(row)]
            for row in rows]


def permanent(a):
    n = len(a)
    sums = [0]*n
    total = previous = 0
    for i in range(1,1<<n):
        mask = i^(i>>1)
        bit = mask^previous
        sign = 1 if mask&bit else -1
        j = bit.bit_length()-1
        for l,row in enumerate(a):
            sums[l] += sign*row[j]
        total += (-1 if (n-mask.bit_count())%2 else 1)*prod(sums)
        previous = mask
    return total


def sectors(a):
    n = len(a)
    cols = [sum((row[j]<0)<<i for i,row in enumerate(a)) for j in range(n)]
    @lru_cache(None)
    def xor(mask):
        bit = mask&-mask
        return (cols[bit.bit_length()-1]^xor(mask^bit)) if mask else 0
    @lru_cache(None)
    def part(mask,r):
        if not r or not mask:
            return int(not r and not mask)
        bit = mask&-mask
        sub = mask
        total = 0
        while sub:
            if sub&bit:
                k = sub.bit_count()
                total += factorial(k-1)*(n-2*xor(sub).bit_count())*part(mask^sub,r-1)
            sub = (sub-1)&mask
        return total
    return [(-1)**(n-r)*part((1<<n)-1,r) for r in range(1,n+1)]


def rook_sectors(a):
    n = len(a)
    masks = [sum((row[j]<0)<<i for i,row in enumerate(a)) for j in range(n)]
    @lru_cache(None)
    def common(mask):
        if not mask:
            return (1<<n)-1
        bit = mask & -mask
        return masks[bit.bit_length()-1] & common(mask^bit)
    @lru_cache(None)
    def count(mask,r):
        if not r or not mask:
            return int(not r and not mask)
        sub = mask
        value = 0
        while sub:
            if sub & (mask&-mask):
                k = sub.bit_count()
                value += (-1)**(k-1)*factorial(k-1)*common(sub).bit_count()*count(mask^sub,r-1)
            sub = (sub-1)&mask
        return value
    return [sum((-2)**mask.bit_count()*factorial(n-mask.bit_count())*count(mask,r)
                for mask in range(1<<n)) for r in range(n+1)]


def check():
    quarter_words = 0
    universal = {}
    for t,seeds in [(0,range(1)),(1,range(4)),(2,range(5))]:
        for seed in seeds:
            a=family(t,seed)
            n=len(a)
            assert all(sum(x*y for x,y in zip(row,other)) == (n if i==j else 0)
                       for i,row in enumerate(a) for j,other in enumerate(a))
            span={0}
            for j in range(n):
                col=sum((row[j]<0)<<i for i,row in enumerate(a))
                span |= {w^col for w in span}
            assert all(w.bit_count()%(n//4)==0 for w in span)
            quarter_words += any(w.bit_count()==n//4 for w in span)
            per=permanent(a)
            assert per%(1<<n) == 1<<(n-1)
            if n<=8:
                terms=sectors(a)
                assert sum(terms)==per
                assert all(v%(1<<n)==0 for v in terms[3:])
                rook = rook_sectors(a)
                assert sum(rook)==per
                assert rook[:3]==universal.setdefault(n,rook[:3])
    assert quarter_words
    print("10 exact permanents and column codes; 5 checks of both independent partition decompositions")
    print("matrices whose code has a word of weight n/4:",quarter_words)


if __name__ == '__main__':
    check()
