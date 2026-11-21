"""Verify the Hamilton-cycle cofactors and the two radial differentials exactly."""
from fractions import Fraction as F
from itertools import permutations
from math import prod


def per(matrix, rows, cols):
    return sum(prod(matrix[i][j] for i,j in zip(rows,order)) for order in permutations(cols))


def verify(n):
    ids = range(n)
    q = F(1,2)+F(1,100*n**3)
    p = q**n/((1-q)**n+q**n)
    Hcenter = F(n*(n-1),2)-1
    Hcenter *= F(n,n-1)
    assert n*(n-1)*p < Hcenter
    # Input edge weights q on the forward cycle have Gibbs marginals p.
    per_slope = F(0)
    cycle = [[int(j==i or j==(i+1)%n) for j in ids] for i in ids]
    for i in ids:
        for j in ids:
            h = (i-j)%n
            cof = (1-p)**(n-1-h)*p**h
            center = F(int(j!=(i-1)%n),n-1)
            mass = 1-p if i==j else p if j==(i+1)%n else F(0)
            per_slope += (center-mass)*cof
    assert per_slope > 0
    # Simultaneous cyclic shifts reduce literal minor computations to one row.
    for j in ids:
        h = -j % n
        rows,cols = list(range(1,n)), [v for v in ids if v!=j]
        matches = [order for order in permutations(cols)
                   if all(cycle[r][c] for r,c in zip(rows,order))]
        assert len(matches)==1 and sum(r!=c for r,c in zip(rows,matches[0]))==h
        two_minor_sum = sum(per(cycle,[r for r in rows if r!=i],[c for c in cols if c!=l])
                            for i in rows for l in cols)
        assert two_minor_sum == (h*(h+1)+(n-h-1)*(n-h))//2
    return n*n


if __name__ == '__main__':
    count = sum(verify(n) for n in range(4,9))
    print(f'{count} cofactor positions covered by literal deletion and rotation; '
          'five strict paired slope witnesses verified')
