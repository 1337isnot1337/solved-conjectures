"""Integer and rational controls for COVERAGE-DUAL-OBSTRUCTION.md."""
from fractions import Fraction as Q
from itertools import combinations

def folded(d):
    old=[v for v in range(1<<d) if v.bit_count()%2==0]
    edge=[(i,j) for i,j in combinations(range(len(old)),2)
          if (old[i]^old[j]).bit_count() == d-1]
    return old,edge

def verify_clebsch():
    old,edges=folded(5)
    n=len(old)
    masks=[sum(1<<i for i,v in enumerate(old) if v>>j&1) for j in range(5)]
    alpha=max(s.bit_count() for s in range(1<<n)
              if not any(s>>i & s>>j & 1 for i,j in edges))
    cut=[sum(((s>>i)^(s>>j))&1==0 for i,j in edges) for s in range(1<<n)]
    assert alpha==5 and len(edges)==40 and min(cut)==8
    assert set(i for i,c in enumerate(cut) if c==8)==set(
        masks+[((1<<n)-1)^s for s in masks])
    assert Q(93,128)-Q(1,1)*Q(125,64)*Q(5,16)==Q(119,1024)
    assert Q(3,64)>Q(1,25)>Q(1,32)

def verify_lower_bound():
    tests=0
    for l in (Q(1),Q(2),Q(8,3),Q(3),Q(4),Q(7),Q(34)):
        c=(1-1/l)/2
        def intervals(p):
            if l==1:
                return 0,1
            if p<c:
                return 1,1
            if p>1-c:
                return 0,0
            if p<=Q(1,2):
                return (l-1)*(Q(1,2)-p)/p,1
            return 0,1-(l-1)*(p-Q(1,2))/(1-p)
        grid=set(Q(i,32) for i in range(33))|{c,1-c}
        for p in grid:
            for s in grid:
                q=1-p-s
                if q<0:
                    continue
                u,v=intervals(p)
                z,w=intervals(s)
                J=p*max(0,u+w-1)+s*max(0,z+v-1)+q*min(v,w)
                h=min(1-c,max(c,p))+min(1-c,max(c,s))-p-s
                assert h>=max(0,q-1/l) and J>=l*(q-h)
                tests+=1
        a=l/(l+2)
        val=Q(5,2)*(1-a)+2*a*Q(3,8)+3*a*max(0,Q(3,8)-1/l)
        assert val>=Q(3,2)
        assert (val==Q(3,2))==(l==Q(8,3))
    return tests

def verify_attachment():
    for d in range(5,26,2):
        n=2**(d-1)
        t=Q(1,2*n*n)
        k=Q(d-2,8*d)
        B=Q(1,2*n)
        exact=B*(1-t)**2+t*(1-t)*k
        assert B < exact < (B+Q(1,n*n))*(1-t)**2

if __name__=='__main__':
    verify_clebsch()
    n=verify_lower_bound()
    verify_attachment()
    print(f"Clebsch optimum cuts, {n} exact pair controls and folded-cube perturbation comparisons pass.")
