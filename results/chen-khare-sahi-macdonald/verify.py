"""Exact certificate for Chen--Khare--Sahi Conjecture 5.

Python standard library only. This script does not search or use floating point.
It checks the full homogeneous semiring cone reduction, two Macdonald
eigenpolynomial identities, and the strict separating inequality over Q.
"""
from fractions import Fraction as Q
from itertools import combinations_with_replacement, permutations


def partitions(d):
    return [(a,b,d-a-b)
            for a in range(d,-1,-1)
            for b in range(min(a,d-a),-1,-1)
            if 0<=d-a-b<=b]


def dominates(p,r):
    return sum(p)==sum(r) and p[0]>=r[0] and sum(p[:2])>=sum(r[:2])


def clean(p):
    return {e:v for e,v in p.items() if v}


def plus(p,r):
    out=dict(p)
    for e,v in r.items():out[e]=out.get(e,Q(0))+v
    return clean(out)


def scale(p,c):
    return clean({e:c*v for e,v in p.items()})


def times(p,r):
    out={}
    for e,a in p.items():
        for f,b in r.items():
            g=tuple(u+v for u,v in zip(e,f))
            out[g]=out.get(g,Q(0))+a*b
    return clean(out)


def m(p):
    return {e:Q(1) for e in set(permutations(p))}


def M(p):
    poly=m(p)
    return scale(poly,Q(1,len(poly)))


pp=partitions(6)
assert pp==[(6,0,0),(5,1,0),(4,2,0),(4,1,1),(3,3,0),(3,2,1),(2,2,2)]
weights=dict(zip(pp,(62,28,9,9,2,2,0)))


def L(p):
    assert all(sum(e)==6 for e in p)
    assert all(p.get(f,Q(0))==a for e,a in p.items() for f in set(permutations(e)))
    # Every monomial in an orbit receives the value prescribed on M_nu.
    return sum((v*weights[tuple(sorted(e,reverse=True))] for e,v in p.items()),Q(0))


def label(p):
    return ''.join(map(str,p))


def cover_differences():
    out=[]
    for d in range(2,7):
        parts=partitions(d)
        for p in parts:
            for r in parts:
                if p==r or not dominates(p,r):continue
                if any(s!=p and s!=r and dominates(p,s) and dominates(s,r) for s in parts):continue
                out.append((d,f'{label(p)}-{label(r)}',plus(M(p),scale(M(r),-1))))
    assert [sum(d==k for d,_,_ in out) for k in range(2,7)]==[1,2,3,4,7]
    return out


def cone_certificate():
    basic=cover_differences();rows=[]
    for d,name,p in basic:
        for rho in partitions(6-d):
            rows.append((f'D({name}) M{label(rho)}',L(times(p,M(rho)))))
    assert len(rows)==27
    for (d,name,p),(e,name2,r) in combinations_with_replacement(basic,2):
        if d+e>6:continue
        for rho in partitions(6-d-e):
            rows.append((f'D({name}) D({name2}) M{label(rho)}',L(times(times(p,r),M(rho)))))
    assert len(rows)==37
    d,name,p=basic[0]
    assert d==2
    rows.append((f'D({name})^3',L(times(times(p,p),p))))
    assert len(rows)==38
    assert all(v>=0 for _,v in rows)
    assert all(L(M(p))>=0 for p in pp)
    return rows


def monomial_expansion(coefficients):
    out={}
    for p,c in coefficients.items():out=plus(out,scale(m(p),c))
    return out


P420=monomial_expansion({
    (4,2,0):Q(1),
    (4,1,1):Q(11,91),
    (3,3,0):Q(11,91),
    (3,2,1):Q(1143098,9092629),
    (2,2,2):Q(27053496033,90189787051),
})
P411=monomial_expansion({
    (4,1,1):Q(1),
    (3,2,1):Q(111,991),
    (2,2,2):Q(1221,90181),
})


def variable(i):
    e=tuple(int(i==j) for j in range(3))
    return {e:Q(1)}


def eigen_certificate():
    q,t=Q(1,10),Q(9,10)
    x,y,z=map(variable,range(3))
    xy=plus(x,scale(y,-1));xz=plus(x,scale(z,-1));yz=plus(y,scale(z,-1))
    delta=times(times(xy,xz),yz)
    # W_i = Delta * product_{j!=i}(t*x_i-x_j)/(x_i-x_j).
    W=[times(yz,times(plus(scale(x,t),scale(y,-1)),plus(scale(x,t),scale(z,-1)))),
       scale(times(xz,times(plus(scale(y,t),scale(x,-1)),plus(scale(y,t),scale(z,-1)))),-1),
       times(xy,times(plus(scale(z,t),scale(x,-1)),plus(scale(z,t),scale(y,-1))))]
    eigenvalues={lam:sum((t**(2-i)*q**lam[i] for i in range(3)),Q(0)) for lam in pp}
    assert len(set(eigenvalues.values()))==len(pp)
    for lam,P in [((4,2,0),P420),((4,1,1),P411)]:
        assert P[lam]==1
        assert all(dominates(lam,tuple(sorted(e,reverse=True))) for e in P)
        lhs={}
        for i in range(3):
            shifted={e:v*q**e[i] for e,v in P.items()}
            lhs=plus(lhs,times(W[i],shifted))
        rhs=scale(times(delta,P),eigenvalues[lam])
        assert lhs==rhs,(lam,plus(lhs,scale(rhs,-1)))
    assert eigenvalues[(4,2,0)]==Q(1009081,1000000)
    assert eigenvalues[(4,1,1)]==Q(190081,1000000)
    return eigenvalues


def target_certificate():
    at1_420=sum(P420.values());at1_411=sum(P411.values())
    assert at1_420==Q(701634925737,90189787051)
    assert at1_411==Q(332370,90181)
    value420=L(P420)/at1_420;value411=L(P411)/at1_411
    assert value420==Q(198743600783,25986478731)
    assert value411==Q(284011,36930)
    difference=value420-value411
    assert difference==Q(-4538292661539,106631184392870)<0
    return difference


if __name__=='__main__':
    rows=cone_certificate()
    eigen_certificate()
    value=target_certificate()
    print('PASS: 38 exhaustive product generators and all 7 monomial generators.')
    print('PASS: both Macdonald eigenidentities and distinct degree-six eigenvalues.')
    print('PASS: exact normalized separator value =',value)
    print('\n| Product | L value |\n|---|---:|')
    for name,v in rows:print(f'| {name} | {v} |')
