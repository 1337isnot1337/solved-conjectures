"""Check the clone polynomial and boundary variance by exact integer counts."""

from fractions import Fraction as F
from math import comb, factorial


def coefficients(n,l):
    row = [comb(l,t)**2 * factorial(t) for t in range(l+1)]
    coeff = [1]
    for _ in range(n):
        values = [0]*(len(coeff)+l)
        for j,z in enumerate(coeff):
            for i,t in enumerate(row):
                values[j+i] += z*t
        coeff = values
    return coeff


def variance(n,m,l):
    d = n-m
    single = coefficients(1,l)
    rest = coefficients(n-1,l)
    counts = [single[i]*rest[d*l-i] if 0 <= d*l-i < len(rest) else 0
              for i in range(l+1)]
    total = sum(counts)
    mu = F(l*d,n)
    assert sum(i*v for i,v in enumerate(counts)) == mu*total
    return sum((i-mu)**2*v for i,v in enumerate(counts))/total


def full(m,n,l,x):
    y = (1-x)/n
    a = 1-m*y
    size = (m+n)*l
    var = [[(a if i==j and i<n else x/m if i>=n and j>=n
             else y if (i<n)!=(j<n) else 0)/l
            for j in range(m+n)] for i in range(m+n)]
    dp = {0:F(1)}
    for i in range(size):
        nxt = {}
        for mask,value in dp.items():
            for j in range(size):
                w = var[i//l][j//l]
                if w and not (mask >> j & 1):
                    key = mask | (1 << j)
                    nxt[key] = nxt.get(key,0)+value*w
        dp = nxt
    return dp[(1<<size)-1]


if __name__ == '__main__':
    full_count = 0
    for m,n,l in ((2,3,1),(2,3,2),(2,4,2),(3,4,1)):
        coeff = coefficients(n,l)
        for x in (F(0), F(1,3), F(3,5), F(1)):
            y = (1-x)/n
            a = 1-m*y
            pred = F(factorial(m*l)**2, l**((m+n)*l))*sum(
                F(coeff[(n-m)*l+j],factorial(j))*a**((n-m)*l+j)*y**(2*(m*l-j))*(x/m)**j
                for j in range(m*l+1))
            assert pred == full(m,n,l,x)
            full_count += 1
    counts = 0
    for n in range(3,9):
        for m in range(2,n):
            d = n-m
            for l in (1,3,5):
                v = variance(n,m,l)
                s = coefficients(n,l)
                left = -m*l + F(n*d,m)*F(s[d*l+1],s[d*l])
                right = (n*n*d*v-m*m*l)/(m*(d*l+1))
                assert left == right
                counts += 1
    for d in (2,3,4):
        n,m = d*d, d*d-d
        target = F((d-1)*(d*d+2*d-1), d*d*(d+1)**3)
        diffs = []
        for l in (3,8,19):
            observed = variance(n,m,l)-F(m*m*l,n*n*d)
            assert observed > 0
            diffs.append(abs(observed-target))
        assert diffs[-1] < diffs[1] < diffs[0]
    print(f'Passed {full_count} full permanents, {counts} boundary identities, '
          'and three threshold variance limits.')
