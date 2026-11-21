"""Exact all-degree comparisons and independent marked-row coefficient checks."""

from collections import defaultdict
from fractions import Fraction as F
from math import comb, factorial, lcm


def matching_profile(a, l):
    h = len(a)
    n = h*l
    d = sum(a[0])
    assert all(sum(row)==d for row in a)
    assert all(sum(row[j] for row in a)==d for j in range(h))
    table = {(0,)*h: 1}
    for row in a:
        for _ in range(l):
            nxt = defaultdict(int, table)
            for counts, weight in table.items():
                for j, x in enumerate(row):
                    if x and counts[j]<l:
                        target = list(counts)
                        target[j] += 1
                        nxt[tuple(target)] += weight*x*(l-counts[j])
            table = nxt
    result = [0]*(n+1)
    for counts,weight in table.items():
        result[sum(counts)] += weight
    return [F(z*n**k, (l*d)**k * comb(n,k)**2 * factorial(k))
            for k,z in enumerate(result)]


def marked_rows(a,l,s,r):
    h = len(a)
    n = h*l
    d = sum(a[0])
    scale = lcm(h,d)
    tab = {(0,0,(0,)*h): 1}
    for row in a:
        for _ in range(l):
            nxt = defaultdict(int)
            for (i,j,occ), val in tab.items():
                for col, entry in enumerate(row):
                    if occ[col] == l:
                        continue
                    new = list(occ)
                    new[col] += 1
                    new = tuple(new)
                    original = entry*(scale//d)
                    uniform = scale//h
                    nxt[i,j,new] += val*original
                    if i<s:
                        nxt[i+1,j,new] += val*uniform
                    if j<r:
                        nxt[i,j+1,new] += val*(uniform-original)
            tab = nxt
    coeff = tab[s,r,(l,)*h]
    return F(coeff*factorial(l)**h*n**n,
             (l*scale)**n*factorial(n)*comb(n,r)*comb(n-r,s))


def diff(values):
    return [y-x for x,y in zip(values,values[1:])]


if __name__ == '__main__':
    bases = (
        [[1,0],[0,1]],
        [[2,1,0],[0,2,1],[1,0,2]],
        [[2,1,0],[1,2,0],[0,0,3]],
        [[1,0,1,0],[0,1,0,1],[1,0,1,0],[0,1,0,1]],
        [[2,1,0,0],[0,2,1,0],[1,0,2,0],[0,0,0,3]],
    )
    marks = 0
    differences = 0
    for a in bases:
        for l in (1,2,4,6):
            H = matching_profile(a,l)
            n = len(H)-1
            assert H[:2] == [1,1]
            row = H[::-1]
            for r in range(1,min(4,n)+1):
                row = diff(row)
                if l<=2:
                    for s in sorted({0, len(row)//2, len(row)-1}):
                        assert row[s] == marked_rows(a,l,s,r)
                        marks += 1
                if l>=4 and r==2:
                    assert min(row)>0
                    differences += len(row)
    print(f'Passed {marks} marked-row identities and {differences} strict '
          'second differences, with connected and disconnected base supports.')
