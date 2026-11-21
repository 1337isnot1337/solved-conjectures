"""Exact coefficient and determinant checks for ordered tournament blowups."""
from functools import cache
from itertools import combinations, permutations, product
from math import comb, factorial, prod

from paley_ii_torus_check import ryser_signs


def determinant(a):
    total = 0
    for p in permutations(range(len(a))):
        inversions = sum(x > y for i,x in enumerate(p) for y in p[i+1:])
        total += (-1)**inversions * prod(row[j] for row,j in zip(a,p))
    return total


def ordered(i, j, d):
    return d if i==j else 1 if i<j else -1


def test_border():
    b = [[1,-1,1],[1,1,-1],[-1,-1,1]]
    u,v = [1,1,-1],[-1,1,-1]
    minors=[]
    for j in range(4):
        c=0
        for I in combinations(range(3),j):
            for J in combinations(range(3),j):
                a=[[x for k,x in enumerate(row) if k not in J] for h,row in enumerate(b) if h not in I]
                c+=ryser_signs(a)*prod(u[h] for h in I)*prod(v[k] for k in J)
        minors.append(factorial(j)*c)
    for d in (1,-1):
        poly=[a+b0*d for a,b0 in zip(minors+[0],[0]+minors)]
        cdet=determinant([[x-d*u[i]*v[j] for j,x in enumerate(row)] for i,row in enumerate(b)])
        for l in range(7):
            a=[row+[u[i]]*l for i,row in enumerate(b)]+[v+[ordered(i,j,d) for j in range(l)] for i in range(l)]
            assert ryser_signs(a)==poly[0]
            if 0<l<=4: assert determinant(a)==2**(l-1)*d**l*cdet
            deriv=[k*poly[k] for k in range(1,len(poly))]
            poly=[x-y for x,y in zip(deriv+[0,0],[0,0]+deriv)]


def test_tournament():
    s=[[0,1,1,1],[-1,0,1,-1],[-1,-1,0,1],[-1,1,-1,0]]
    d=[1,-1,1,-1]
    @cache
    def coefficient(ls):
        ans=prod(x**k for x,k in zip(d,ls))
        for a in product(*(range(l+1) for l in ls)):
            if not any(a): continue
            odd=[i for i,k in enumerate(a) if k%2]
            denom=determinant([[-s[i][j] for j in odd] for i in odd])
            if denom: ans-=denom*prod(comb(l,k) for l,k in zip(ls,a))*coefficient(tuple(l-k for l,k in zip(ls,a)))
        return ans
    core=[[s[i][j] if i!=j else d[i] for j in range(4)] for i in range(4)]
    for ls in product(range(3),repeat=4):
        labels=[(i,v) for i,l in enumerate(ls) for v in range(l)]
        a=[[ordered(v,w,d[i]) if i==j else s[i][j] for j,w in labels] for i,v in labels]
        assert coefficient(ls)==ryser_signs(a)
        if all(ls) and sum(ls)<=7:
            assert determinant(a)==2**(sum(ls)-4)*prod(x**(l-1) for x,l in zip(d,ls))*determinant(core)


if __name__=='__main__':
    test_border()
    test_tournament()
    print('Both exponential generating functions and determinant reductions verified on exact examples.')
