"""Check primary projection, trace reconstruction and small compounds over Z_2[omega]."""
from fractions import Fraction as F
from itertools import combinations, permutations
from math import comb, prod
from random import Random

import numpy as np

# omega^2 = -omega-1. Pairs also work over Q for exact Newton divisions.
zero, one = (0,0), (1,0)


def plus(x,y):
    return (x[0]+y[0],x[1]+y[1])


def minus(x,y):
    return (x[0]-y[0],x[1]-y[1])


def times(x,y):
    a,b = x
    c,d = y
    return (a*c-b*d,a*d+b*c-b*d)


def multiply(f,g):
    out = [zero]*(len(f)+len(g)-1)
    for i,x in enumerate(f):
        for j,y in enumerate(g):
            out[i+j] = plus(out[i+j],times(x,y))
    return out


def det_polynomial(B):
    # Independent subset expansion in the polynomial ring, adding one row at a time.
    n = len(B)
    polys = {0:[one]}
    for i,row in enumerate(B):
        nxt = {}
        for mask,f in polys.items():
            for j,x in enumerate(row):
                if mask & (1 << j):
                    continue
                t = mask | (1 << j)
                g = multiply(f,[minus(zero,x),one if i==j else zero])
                vals = nxt.setdefault(t,[zero]*len(g))
                op = minus if (mask >> (j+1)).bit_count()%2 else plus
                nxt[t] = [op(a,b) for a,b in zip(vals,g)]
        polys = nxt
    return polys[(1<<n)-1]


def block(x):
    a,b = x
    return np.array([[a,-b],[b,a-b]],dtype=np.int64)


def embed(B):
    return np.block([[block(x) for x in row] for row in B])


def inverse_unit(x,q):
    a,b = x
    norm_inverse = pow((a*a-a*b+b*b)%q,-1,q)
    return ((a-b)*norm_inverse%q,-b*norm_inverse%q)


def solve(B,B0,labels,h,bits):
    # Dense reference evaluation of (1). Its columns are the separate vector actions.
    n = len(B)
    s = h*bits
    L = bits+s.bit_length()
    q, target = 2**L, 2**bits
    base, actual = embed(B0)%q, embed(B)%q
    I = np.eye(2*n,dtype=np.int64)
    diag = np.zeros_like(I)
    for i,x in enumerate(labels):
        diag[2*i:2*i+2,2*i:2*i+2] = block(x)
    K = (base-diag)%q
    assert np.all((actual-base)%2==0) and np.all(np.linalg.matrix_power(K,h)%q==0)
    delta = (actual-base)%q
    all_coeff = [one]
    for lam in sorted(set(labels)):
        group = [i for i,x in enumerate(labels) if x==lam]
        assert (len(group)>0)
        ids = [j for i in group for j in (2*i,2*i+1)]
        # Matrices for all terms (t+lambda-B0)^-1 required in the Laurent products.
        jets = {}
        power = I.copy()
        for j in range(h):
            for i,mu in enumerate(labels):
                rows = slice(2*i,2*i+2)
                if mu==lam:
                    jets.setdefault(-j-1,np.zeros_like(I))[rows,:] += power[rows,:]
                    continue
                inv = inverse_unit(minus(lam,mu),q)
                iw = one
                for _ in range(j+1):
                    iw = tuple(t%q for t in times(iw,inv))
                for u in range(2*h*L+1):
                    f = (-1)**u * comb(u+j,j) % q
                    jets.setdefault(u,np.zeros_like(I))[rows,:] += (f*block(iw)@power[rows,:]) % q
                    iw = tuple(t%q for t in times(iw,inv))
            power = power@K%q
        jets = {i:M%q for i,M in jets.items() if (M%q).any()}
        cur = {0:I}
        P = np.zeros_like(I)
        for r in range(L):
            out = {}
            for j,mat in jets.items():
                for t,M in cur.items():
                    if -h*L <= j+t <= h*L:
                        out.setdefault(j+t,np.zeros_like(I))[:] += mat@M%q
            P = (P+out.get(-1,0))%q
            cur = {t:delta@M%q for t,M in out.items() if (delta@M%q).any()}
        assert np.array_equal(P@P%q,P)
        assert np.array_equal(P@actual%q,actual@P%q)
        H = P[np.ix_(ids,ids)]
        Id = np.eye(len(ids),dtype=np.int64)
        assert np.all((H-Id)%2==0)
        Hinv = Id.copy()
        remainder = Id.copy()
        for _ in range(1,L):
            remainder = remainder@(Id-H)%q
            Hinv = (Hinv+remainder)%q
        T = P[:,ids]@Hinv%q
        assert np.array_equal(T[ids,:],Id)
        step = (actual-np.kron(np.eye(n,dtype=np.int64),block(lam)))%q
        Bpower = T
        traces = []
        for j in range(1,min(s,len(group))+1):
            Bpower = step@Bpower%q
            traces.append(tuple(sum(int(Bpower[2*i+part,2*l]) for l,i in enumerate(group))%q
                                for part in range(2)))
        elementary = [one]
        for j in range(1,len(traces)+1):
            t = zero
            for r in range(1,j+1):
                t = minus(t,times(traces[r-1],elementary[j-r]))
            elementary.append(tuple(F(x,j) for x in t))
        elementary += [zero]*(len(group)+1-len(elementary))
        factor = [one]
        for x in elementary[1:]:
            factor = multiply(factor,[minus(zero,lam),one])
            factor[0] = plus(factor[0],x)
        all_coeff = multiply(all_coeff,factor)
    exact = det_polynomial(B)
    def reduce(x):
        v = F(x)
        assert v.denominator%2
        return v.numerator*pow(v.denominator,-1,target)%target
    assert [tuple(map(reduce,x)) for x in all_coeff] == [tuple(t%target for t in x) for x in exact]


def minor(M,I,J,det):
    total = 0
    for perm in permutations(J):
        negative = det and sum(x>y for i,x in enumerate(perm) for y in perm[i+1:])%2
        value = prod(M[i][j] for i,j in zip(I,perm))
        total += -value if negative else value
    return total


if __name__ == '__main__':
    rng = Random(71291)
    cases = 0
    for labels,h in (([zero,zero,one,one],2),
                     ([(0,1),(0,1),one,(-1,-1),(-1,-1)],2),
                     ([(0,1)]*6+[(-1,-1)],1),
                     ([zero,zero,zero,one,one],3)):
        n = len(labels)
        B0 = [[labels[i] if i==j else one if h>1 and j==i+1 and labels[i]==labels[j] else zero
               for j in range(n)] for i in range(n)]
        for bits in (1,2,3):
            B = [[plus(x,(2*rng.randrange(-4,5),2*rng.randrange(-4,5))) for x in row] for row in B0]
            solve(B,B0,labels,h,bits)
            cases += 1
    # Full input->compound->polynomial check, with genuine collisions in characteristic two.
    for diagonal in ((0,0,1,1),(1,1,1,1),(1,1,0,1)):
        n = len(diagonal)
        J = [[diagonal[i] if i==j else int(j==i+1 and diagonal[i]==diagonal[j])
              for j in range(n)] for i in range(n)]
        A = [[x+2*rng.randrange(-2,3) for x in row] for row in J]
        for k in (2,3):
            sets = list(combinations(range(n),k))
            P = [[(minor(A,I,Jj,False),0) for Jj in sets] for I in sets]
            W = [[(minor(J,I,Jj,True),0) for Jj in sets] for I in sets]
            labels = [W[i][i] for i in range(len(sets))]
            nilpotent = embed(W)-np.diag(np.diag(embed(W)))
            h = 1
            while np.linalg.matrix_power(nilpotent,h).any():
                h += 1
            solve(P,W,labels,h,3)
            cases += 1
    print(f'{cases} complete characteristic polynomials checked, including quadratic residue extensions')
