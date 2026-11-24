"""Exact certificate for the nonsmoothability of Ap(tr(X^3)), X a 3x3 matrix.

The 36 quadratic apolar relations are computed over Q and cleared to integer
columns. Their 666 pairwise products span a rank-486 subspace of S_4, whose
dimension is 495. A nonzero minor modulo the prime1009 certifies this rank
lower bound over C; nine explicit annihilators certify the matching upper
bound over Q. No modular nullspace is lifted to characteristic zero.

The written proof obtains trivial negative tangents from this single rank
calculation and the irreducibility of tr(X^3). Nonsmoothability then uses
Jelisiejew, arXiv:1710.06124v5, Theorem1.2(1). This is not a Lean proof.
Dependency: NumPy. No floating-point arithmetic or randomness is used.
"""
from collections import Counter
from fractions import Fraction
from itertools import combinations_with_replacement, product
from math import lcm, isqrt, factorial
import numpy as np

PRIME = 1009
INT64_MAX = np.iinfo(np.int64).max


def rational_kernel_integer_columns(a):
    """Nullspace over Q with one distinguished free coordinate per column."""
    a=[[Fraction(int(x)) for x in row] for row in a]
    rows,cols=len(a),len(a[0]);rank=0;piv=[]
    for c in range(cols):
        rr=next((r for r in range(rank,rows) if a[r][c]),None)
        if rr is None:continue
        a[rank],a[rr]=a[rr],a[rank]
        scale=a[rank][c];a[rank]=[x/scale for x in a[rank]]
        for r in range(rows):
            if r!=rank and a[r][c]:
                scale=a[r][c]
                a[r]=[x-scale*y for x,y in zip(a[r],a[rank])]
        piv.append(c);rank+=1
        if rank==rows:break
    free=[c for c in range(cols) if c not in piv]
    b=np.zeros((cols,len(free)),dtype=np.int64)
    scales=[]
    for k,c in enumerate(free):
        vec=[Fraction(0)]*cols;vec[c]=Fraction(1)
        for r,j in enumerate(piv):vec[j]=-a[r][c]
        den=lcm(*(x.denominator for x in vec));scales.append(den)
        b[:,k]=[int(den*x) for x in vec]
    return b,piv,free,scales


def rref_mod(a):
    """Exact Gauss-Jordan elimination in F_1009."""
    assert 2*PRIME*PRIME < INT64_MAX
    a=np.array(a,dtype=np.int64,copy=True)%PRIME
    row=0;piv=[]
    for col in range(a.shape[1]):
        nz=np.flatnonzero(a[row:,col])
        if not len(nz):continue
        j=row+int(nz[0]);a[[row,j]]=a[[j,row]]
        a[row]=a[row]*pow(int(a[row,col]),-1,PRIME)%PRIME
        inds=np.flatnonzero(a[:,col]);inds=inds[inds!=row]
        for st in range(0,len(inds),128):
            ids=inds[st:st+128]
            a[ids]=(a[ids]-a[ids,col,None]*a[row,None,:])%PRIME
        piv.append(col);row+=1
        if row==a.shape[0]:break
    return a,piv


def derivative(f,m):
    out=Counter()
    for term,coefficient in f.items():
        rem=list(term);c=coefficient
        for x in m:
            c*=rem.count(x)
            if not c:break
            rem.remove(x)
        if c:out[tuple(rem)]+=c
    return out


def certify():
    assert all(PRIME%d for d in range(2,isqrt(PRIME)+1))
    n=3;v=9
    f=Counter()
    for i,j,k in product(range(n),repeat=3):
        f[tuple(sorted((i*n+j,j*n+k,k*n+i)))]+=1
    mon={d:list(combinations_with_replacement(range(v),d)) for d in (2,4)}
    ind={d:{m:i for i,m in enumerate(mon[d])} for d in mon}
    cat2=np.zeros((v,len(mon[2])),dtype=np.int64)
    for c,m in enumerate(mon[2]):
        for out,coef in derivative(f,m).items():cat2[out[0],c]=coef
    b2,p2,free2,den2=rational_kernel_integer_columns(cat2)
    assert len(p2)==9 and b2.shape==(45,36)
    assert 45*int(np.max(np.abs(cat2)))*int(np.max(np.abs(b2))) < INT64_MAX
    assert np.all(cat2@b2==0)
    assert all(d%PRIME for d in den2)
    q=36
    assert 45**2*int(np.max(np.abs(b2)))**2 < INT64_MAX
    products=np.zeros((495,666),dtype=np.int64)
    col=0
    for h in range(q):
        for k in range(h,q):
            for a in np.flatnonzero(b2[:,h]):
                for b in np.flatnonzero(b2[:,k]):
                    m=tuple(sorted(mon[2][a]+mon[2][b]))
                    products[ind[4][m],col]+=b2[a,h]*b2[b,k]
            col+=1
    assert col==666
    rank=len(rref_mod(products)[1])
    assert rank==486

    # The nine quartics x_a F are explicit annihilators under the apolar
    # differential pairing, whose diagonal entries are multi-index factorials.
    quartics=np.zeros((495,9),dtype=np.int64)
    for a in range(v):
        for m,c in f.items():quartics[ind[4][tuple(sorted(m+(a,)))],a]+=c
    differential_pairing=np.array([
        np.prod([factorial(c) for c in Counter(m).values()]) for m in mon[4]
    ],dtype=np.int64)
    assert 495*int(np.max(np.abs(products)))*24*int(np.max(np.abs(quartics))) < INT64_MAX
    assert np.all(products.T@(differential_pairing[:,None]*quartics)==0)
    assert len(rref_mod(quartics)[1])==9
    print("cat2 rank9 over Q; 36 integer quadratic apolar basis vectors")
    print("I2*I2 product matrix: shape495x666, rank486 modulo1009")
    print("nine independent quartics x_a*tr(X^3) annihilate the matrix exactly over Z")
    print("therefore degree-four inverse system is exactly tr(X^3)*S1")
    print("the written irreducibility/Frobenius-duality argument proves trivial negative tangents")
    print("Jelisiejew1710.06124v5 Theorem1.2(1) then proves this length20 algebra nonsmoothable")


if __name__=='__main__':certify()
