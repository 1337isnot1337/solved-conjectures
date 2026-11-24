from itertools import combinations
from math import comb
from random import Random


def determinant(rows):
    if not rows:
        return 1
    result=0
    for j,a in enumerate(rows[0]):
        if a:
            result+=(-1)**j*a*determinant([row[:j]+row[j+1:] for row in rows[1:]])
    return result


def pfaffian(a):
    if not a:
        return 1
    ans=0
    for j in range(1,len(a)):
        if a[0][j]:
            drop={0,j}
            ans+=(-1)**(j+1)*a[0][j]*pfaffian(
                [[v for i,v in enumerate(row) if i not in drop]
                 for k,row in enumerate(a) if k not in drop])
    return ans


def path(a,b):
    dx,dy=b[0]-a[0],b[1]-a[1]
    return comb(dx+dy,dx) if min(dx,dy)>=0 else 0


def path_formulas(lam,mu,t):
    r,m=len(lam),len(mu)
    if not r:return (1,1)
    E=[(l,t+i) for i,l in enumerate(lam)]
    A=[[path((l,i+1),e) for e in E] for i,l in enumerate(mu)]
    B=[[path((1,h),e) for e in E] for h in range(m+1,t+r)]
    d=r-m
    direct=sum(determinant(A+list(rows)) for rows in combinations(B,d))
    C=[[0]*r for _ in range(r)]
    for i in range(r):
        for j in range(i+1,r):
            C[i][j]=sum(x[i]*y[j]-x[j]*y[i] for x,y in combinations(B,2))
            C[j][i]=-C[i][j]
    if d%2:
        A.append([sum(row[i] for row in B) for i in range(r)])
        m+=1
    matrix=[C[i]+[a[i] for a in A] for i in range(r)]
    matrix+=[[-v for v in a]+[0]*m for a in A]
    return direct,(-1)**(m*(m-1)//2)*pfaffian(matrix)


def ideals(lam,mu):
    mu=mu+(0,)*(len(lam)-len(mu))
    def extend(v):
        i=len(v)
        if i==len(lam):
            yield v
        else:
            maxlen=min(lam[i],v[-1]-1) if i and v[-1]>0 else lam[i] if not i else 0
            for a in range(mu[i],maxlen+1):yield from extend(v+(a,))
    return tuple(extend(tuple()))


def count_ideal_chains(lam,mu,t):
    I=ideals(lam,mu)
    starts=[1]*len(I)
    le=[[j for j,y in enumerate(I) if all(u<=v for u,v in zip(y,x))]
        for x in I]
    for _ in range(1,t):
        starts=[sum(starts[j] for j in terms) for terms in le]
    return starts[-1]


if __name__=='__main__':
    rng=Random(73)
    fixtures=[((7,5,2,1),(3,1)),((6,5,4,3),(6,4)),((4,3,2,1),()),((5,3,1),(5,3,1))]
    for _ in range(200):
        r=rng.randrange(1,6)
        lam=tuple(sorted(rng.sample(range(1,10),r),reverse=True))
        mu=[]
        for l in lam:
            if mu and mu[-1]==1:break
            cap=min(l,mu[-1]-1) if mu else l
            b=rng.randrange(cap+1)
            if not b:break
            mu.append(b)
        fixtures.append((lam,tuple(mu)))
    for lam,mu in fixtures:
        for t in range(1,6):
            expected=count_ideal_chains(lam,mu,t)
            actual=path_formulas(lam,mu,t)
            assert actual==(expected,expected),(lam,mu,t,actual,expected)
    print(f'PASS: determinant and Pfaffian agree with direct ideal chains for {5*len(fixtures)} evaluations.')
