"""Exact certificates for both clauses of HKM Conjecture 4.10.
Python standard library only. Coefficients are in increasing degree order.
"""
from fractions import Fraction as F
from math import comb, factorial, lcm

def count(partition,m):
    # Count signed vectors by total positive/negative mass, discarding
    # parts whose L1 norm exceeds m and totals exceeding m.
    table={(0,0):1}
    for a in partition:
        assert a in (1,2)
        local={}
        for p in range(m+1):
            for q in range(m+1-p):
                if a==1: weight=int(p==0 or q==0)
                elif p==0 or q==0: weight=p+q+1
                else: weight=2
                if weight:local[p,q]=weight
        nxt={}
        for (p,q),c in table.items():
            for (u,v),w in local.items():
                if p+u<=m and q+v<=m:
                    k=(p+u,q+v);nxt[k]=nxt.get(k,0)+c*w
        table=nxt
    return sum(table.get((p,p),0) for p in range(m+1))

def value(c,x):return sum(a*x**j for j,a in enumerate(c))
def diff(c):return [j*c[j] for j in range(1,len(c))]
def ehrhart_from_rotated(f,scale,m):
    d=len(f)-1
    return F(scale,2**d*factorial(d))*sum(
        (-1)**((d-j)//2)*a*(2*m+1)**j for j,a in enumerate(f) if (d-j)%2==0)

f=[0,-3575490705,0,4596049711,0,-1819237530,0,219501678,0,-8333765,0,87411]
g=[-13307175,0,50109481,0,-33055190,0,6387458,0,-354835,0,5061]
for parts,p,scale in [((2,)*6,f,8),((1,)+(2,)*5,g,36)]:
    n=sum(parts)
    vals=[count(parts,m) for m in range(n)]
    assert all(ehrhart_from_rotated(p,scale,m)==v for m,v in enumerate(vals))
    print(parts,vals)
    print('h*:',[sum((-1)**i*comb(n,i)*vals[j-i] for i in range(j+1)) for j in range(n)])

# f(x)=x*h(x^2). The fifth-degree h is strictly negative on [0,2].
h=f[1::2]
def transform(a,b):
    c=[F(0)]*6
    for k,v in enumerate(h):
        for j in range(k+1):
            for i in range(6-k):
                c[j+i]+=v*comb(k,j)*a**(k-j)*b**j*comb(5-k,i)
    scale=lcm(*(x.denominator for x in c))
    return [int(x*scale) for x in c]
knots=[F(0),F(1),F(3,2),F(7,4),F(2)]
for a,b in zip(knots,knots[1:]):
    c=transform(a,b)
    assert max(c)<0
    print('interval',a,b,c)
shift=[sum(h[k]*comb(k,j)*2**(k-j) for k in range(j,6)) for j in range(6)]
assert shift==[-34871067,-306567873,-695244942,156327998,-7459655,87411]
# Descartes gives at most three roots on (2,infinity), with multiplicity.
assert sum(a*b<0 for a,b in zip(shift,shift[1:]))==3
assert all(h[j]*(-1)**j<0 for j in range(6)) # h<0 on (-infinity,0]
print('shifted coefficients:',shift)
# Optional signs certify exactly three real roots of h.
assert value(h,8)<0<value(h,9)
assert value(h,25)>0>value(h,26)
assert value(h,57)<0<value(h,58)
# Independent interlacing obstruction: real-rooted interlacing pair
# f,g with positive leading coefficients must have f'g-fg' >= 0 everywhere.
z=F(3,2)
W=value(diff(f),z)*value(g,z)-value(f,z)*value(diff(g),z)
assert W==F(-63255230703736979625,1048576)<0
print('Wronskian at 3/2:',W)
print('Both claims refuted by exact certificates.')
