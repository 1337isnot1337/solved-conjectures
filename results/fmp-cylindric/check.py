#!/usr/bin/env python3
"""Exact checks of the cylindric determinant and linear coefficient by ideal DP.

Run with Python 3. No dependencies. These checks are diagnostic, not the proof.
"""
from fractions import Fraction
from itertools import permutations, product
from math import comb, factorial, prod
from random import Random


def ideals_count(lam, mu, d):
    """Order polynomial values at 0,...,n via lower ideals and exact zeta."""
    ell = len(lam)
    cells = [(i, j) for i in range(ell) for j in range(mu[i]+1, lam[i]+1)]
    cells.sort(key=lambda ij: (ell*ij[1]+d*ij[0], ij))
    index = {p: a for a, p in enumerate(cells)}
    n = len(cells)
    preds, succ = [0]*n, [0]*n
    for a, (i, j) in enumerate(cells):
        for p in [(i, j+1), (i+1, j) if i+1<ell else (0, j+d)]:
            if p in index:
                b = index[p]
                if a != b:
                    assert a < b
                    preds[b] |= (1<<a)
                    succ[a] |= (1<<b)
    ideals = [0]
    for a in range(n):
        ideals += [mask|(1<<a) for mask in ideals if not preds[a]&~mask]
    where = {mask: j for j, mask in enumerate(ideals)}
    ops = [[(j, where[mask^(1<<a)]) for j, mask in enumerate(ideals)
            if mask>>a&1 and not mask&succ[a]] for a in range(n)]
    current = [1]*len(ideals)
    vals = [0, 1]
    for k in range(2,n+1):
        for pairs in ops:
            for p, q in pairs:
                current[p] += current[q]
        vals.append(current[-1])
    return vals


def signed_terms(lam, mu, d):
    """Yields (sign, list of (upper shift, lower index, J-i))."""
    ell = len(lam)
    for perm in permutations(range(ell)):
        ranges_hi = [(lam[i]-mu[j]+j-i)//(d+ell) for i,j in enumerate(perm)]
        ranges = [range(hi-(sum(ranges_hi)), hi+1) for hi in ranges_hi]
        sign = (-1)**sum(perm[a]>perm[b] for a in range(ell) for b in range(a+1,ell))
        for shifts in product(*ranges):
            if sum(shifts):
                continue
            row = []
            for i, (j,k) in enumerate(zip(perm,shifts)):
                b = lam[i]-mu[j]-d*k
                D = j-i-ell*k
                row.append((b-1,b+D,D))
            yield sign,row


def gbinom(a,b):
    ans = 1
    for j in range(b):
        ans = ans*(a-j)//(j+1)
    return ans


def audit(lam,mu,d):
    vals = ideals_count(lam,mu,d)
    n = sum(lam)-sum(mu)
    terms = list(signed_terms(lam,mu,d))
    for t, val in enumerate(vals):
        assert val == sum(s*prod(gbinom(t+b,N)
                            for b,N,_ in row) for s,row in terms), (lam,mu,d,t)
    exhaustive = sum(Fraction((-1)**(j-1)*comb(n,j)*vals[j],j) for j in range(1,n+1))
    outline = Fraction(0)
    for sign,row in terms:
        fwd = [u for u in row if u[2]>=0]
        if len(fwd)!=1:
            continue
        b,N,D = fwd[0]
        # Used only on examples with occupied rows and nonempty wrap overlap.
        assert b>=0 and N==b+1+D
        weight = Fraction((-1)**D*factorial(b)*factorial(D),factorial(N))
        for a,M,e in row:
            if e<0:
                weight *= comb(a,M)
        outline += sign*weight
    assert outline==exhaustive and outline>=0, (lam,mu,d,outline,exhaustive)
    return exhaustive


def graph(lam, mu, d):
    cells = [(i,j) for i,a in enumerate(lam) for j in range(mu[i]+1,a+1)]
    where = set(cells)
    ell = len(lam)
    edges = [(a,b) for a in cells
             for b in ((a[0],a[1]+1),(a[0]+1,a[1]) if a[0]+1<ell else (0,a[1]+d))
             if b in where and b!=a]
    return cells,edges


def direct_ideal_count(lam,mu,d):
    """Independent certificate: deliberately use the literal double-loop recurrence."""
    cells, edges = graph(lam,mu,d)
    n = len(cells)
    assert all(len(lam)*a[1]+d*a[0] < len(lam)*b[1]+d*b[0]
               for a,b in edges)
    index = {p:i for i,p in enumerate(cells)}
    edge_bits = [(1<<index[a],1<<index[b]) for a,b in edges]
    ideals = sorted(S for S in range(1<<n)
                    if not any(S&b and not S&a for a,b in edge_bits))
    lower = {I:[J for J in ideals if not(J&~I)] for I in ideals}
    f = {I:int(I==0) for I in ideals}
    vals = [f[ideals[-1]]]
    for _ in range(n):
        f={I:sum(f[J] for J in lower[I]) for I in ideals}
        vals.append(f[ideals[-1]])
    return vals


if __name__=='__main__':
    cases = [((5,4,3),(3,2,1),2), ((6,5,4),(3,2,1),2),
                ((7,6,4,4),(3,1,1,0),4), ((4,4,4),(0,0,0),1)]
    for triple in cases:
        print('standard:',*triple, audit(*triple))
    assert ideals_count((7,4,3),(4,4,1),4) == ideals_count((7,3),(4,1),4)
    rng = Random(21901)
    checked = 0
    for _ in range(1500):
        l=rng.randint(2,5)
        lam=tuple(sorted([rng.randint(1,5) for i in range(l)],reverse=True))
        mu=tuple(sorted([rng.randrange(a) for a in lam],reverse=True))
        if min(a-b for a,b in zip(lam,mu))<1 or sum(lam)-sum(mu)>15:
            continue
        d=max(1,lam[0]-lam[-1],mu[0]-mu[-1])+rng.randrange(2)
        if max(mu[0]+1,mu[-1]+d+1)>min(lam[0],lam[-1]+d):
            continue
        audit(lam,mu,d)
        checked+=1
    print('Exact determinant and linear coefficient checks passed for', checked, 'random standard shapes.')

    L,M,d=(9,9,8,6,2),(7,7,6,1,0),6
    observed=direct_ideal_count(L,M,d)
    expected=[0,1,99,2559,33041,275160,1687503,8248254,33826449,120595278,
              383436376,1108248906,2954764590,7350892820]
    assert observed==expected==ideals_count(L,M,d)
    c1=sum(Fraction((-1)**(j-1)*comb(13,j)*observed[j],j) for j in range(1,14))
    assert c1==Fraction(-1,17160)
    print('Exact relaxed-seam counterexample:', c1)

    L,M,d=(6,5,4),(3,2,1),1
    cells,edges=graph(L,M,d)
    t=2
    solutions=[f for values in product(range(1,t+1),repeat=len(cells))
               if all((f:=dict(zip(cells,values)))[a]<=f[b] for a,b in edges)]
    # Our graph values are increasing to the east and south, in contrast
    # to the decreasing convention of the GK plane-partition coordinates.
    pinned=[f for f in solutions if f[0,L[0]]==t and f[len(L)-1,M[-1]+1]==1]
    det_count=sum(s*prod(gbinom(t+b,N) for b,N,_ in row)
                  for s,row in signed_terms(L,M,d))
    assert len(solutions)==12 and len(pinned)==det_count==8
    print('Exceptional pins check:', len(solutions), len(pinned), det_count)
