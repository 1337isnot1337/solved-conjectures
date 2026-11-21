"""Independent finite disproof check for Fang--Zhang--Zhao Conjecture 4.3.

Counts plane partitions as chains of weakly decreasing rows.  It does not use
the binomial-product formula to generate the tested Hoggatt sums.  The product
formula is used only as an independent comparison.
"""
from functools import lru_cache
from itertools import combinations_with_replacement
from fractions import Fraction
from math import comb, prod


@lru_cache(None)
def plane_partitions(k,l,m):
    if k==0 or l==0:
        return 1
    if k<l:
        k,l=l,k  # Transpose the plane partition array.
    rows=[tuple(reversed(r)) for r in combinations_with_replacement(range(m+1),l)]
    predecessors=[tuple(j for j,s in enumerate(rows) if all(a<=b for a,b in zip(r,s))) for r in rows]
    counts=[1]*len(rows)
    for _ in range(1,k):
        counts=[sum(counts[j] for j in before) for before in predecessors]
    return sum(counts)


def box_product(k,l,m):
    # MacMahon's telescoped boxed plane partition formula.
    return prod((Fraction(i+j+m-1,i+j-1) for i in range(1,k+1) for j in range(1,l+1)),start=Fraction(1))


def source_binomial(n,m,k):
    top=n+m-2
    return Fraction(prod(comb(top,k+i) for i in range(m)),prod(comb(top,j) for j in range(1,m)))


def hoggatt(n,m):
    entries=[]
    for k in range(n):
        a=plane_partitions(k,n-1-k,m)
        assert a==box_product(k,n-1-k,m)==source_binomial(n,m,k)
        entries.append(a)
    return sum(entries)


def L(seq):
    return [seq[i]*seq[i+2]-seq[i+1]**2 for i in range(len(seq)-2)]


if __name__=='__main__':
    expected={4:[1,2,7,32,177,1122,7898,60398,494078,4274228]}
    for m,upper,iterations in [(4,10,4),(5,10,4),(6,8,3)]:
        seq=[hoggatt(n,m) for n in range(1,upper+1)]
        if m in expected:assert seq==expected[m]
        print('m',m,'a_n for n=1..',upper,seq)
        for j in range(1,iterations+1):
            seq=L(seq)
            print('L^'+str(j),'starting index n=1:',seq)
        if m==4:assert seq[1]==-111509459048444462640611465400686603136
        if m==5:assert seq[1]==-44045680773437284570849713497906508911110782976
        if m==6:assert seq[1]==-663996112380294400
    print('PASS: independent plane-partition counting, two product identities, and exact negative iterates')
