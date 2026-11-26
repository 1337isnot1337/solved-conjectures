"""Reconstruct the finite witness by inserting vertices and taking unions of supports."""
from collections import Counter
from fractions import Fraction
from itertools import product
from math import factorial
import check as candidate

def bit(j):
    return (1<<(j-1)) if j else 0

def hub(n, order):
    result=Counter()
    for gap in range(3):
        tri=order[:gap]+['h']+order[gap:]
        base=[v for v in tri if v!='v']
        positions=[base[:j]+['p']+base[j:] for j in range(3)]
        steps=[(int(t.index('p')<t.index('h')),t.index('u')<t.index('p')) for t in positions]
        states=Counter({(gap,False):1})
        for _ in range(n):
            temp=Counter()
            for (indegree,one),weight in states.items():
                for inc,flag in steps:
                    temp[indegree+inc,one or flag]+=weight
            states=temp
        for (deg,flag),num in states.items():
            result[bit(deg)|int(flag)]+=num
    return result

def coefficients(n,size,extra):
    core=Counter()
    for seq in (['u','v'],['v','u']):
        groups=hub(n,seq)
        for (a,wa),(b,wb) in product(groups.items(),repeat=2):
            core[a|b|int(seq[0]=='u')]+=wa*wb
    pad=Counter({0:1})
    for maximum in [*range(1,size),*[size]*extra]:
        new=Counter()
        for mask,w in pad.items():
            for gap in range(maximum+1):
                new[mask|bit(gap)]+=w
        pad=new
    coeff=[0]*(size+3)
    for (a,wa),(b,wb) in product(core.items(),pad.items()):
        coeff[(a|b).bit_count()]+=wa*wb
    return coeff

def negative(p):
    q=[Fraction(c,sum(p)) for c in reversed(p)]
    x=Fraction(-7,10)
    a=sum(q[j]*x**j for j in range(len(q)))
    b=sum(j*q[j]*x**(j-1) for j in range(1,len(q)))
    c=sum(j*(j-1)*q[j]*x**(j-2) for j in range(2,len(q)))
    return b*b-a*c

for n,size,extra in ((1,2,1),(2,2,0),(1,3,1),(2,3,0),(20,10,18)):
    p=coefficients(n,size,extra)
    assert p==candidate.polynomial(n,size,extra)
    assert sum(p)==2*3**(2*n+2)*factorial(size)*(size+1)**extra
    if n<20:
        assert p==candidate.literal(n,size,extra)
    else:
        assert negative(p)<-Fraction(1,40000)
        print('71-vertex witness, reproduced every coefficient via direct support unions:',p)
        print('Normalized reciprocal Laguerre difference:',negative(p))
