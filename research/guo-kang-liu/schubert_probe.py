"""Exact Schubert-basis diagnostic for Guo--Kang--Liu Conjecture 1.12.

A bounded positive search is not a proof. This script uses integer sparse
polynomials and the Lascoux--Schuetzenberger transition recurrence.
"""
from functools import lru_cache
from itertools import combinations
from collections import defaultdict
import argparse, random, time


def trim(a):
    a=tuple(a)
    while a and not a[-1]: a=a[:-1]
    return a


def norm(w):
    w=tuple(w)
    while w and w[-1]==len(w):w=w[:-1]
    return w


def code(w):
    return trim(sum(w[j]<v for j in range(i+1,len(w))) for i,v in enumerate(w))


def from_code(c):
    c=trim(c)
    n=max([len(c)]+[i+a+1 for i,a in enumerate(c)])
    remaining=list(range(1,n+1)); w=[]
    for a in c+(0,)*(n-len(c)):w.append(remaining.pop(a))
    return norm(w)


def swap(w,i,j):
    a=list(w);a[i],a[j]=a[j],a[i]
    return norm(a)


def add_to(dst,src,scalar=1):
    for e,v in src.items():
        dst[e]=dst.get(e,0)+scalar*v
        if not dst[e]:del dst[e]


def mul(a,b):
    r={}
    for ea,va in a.items():
        for eb,vb in b.items():
            n=max(len(ea),len(eb));e=trim(tuple((ea[i] if i<len(ea) else 0)+(eb[i] if i<len(eb) else 0) for i in range(n)))
            r[e]=r.get(e,0)+va*vb
    return {e:v for e,v in r.items() if v}


@lru_cache(maxsize=50000)
def schubert(w):
    w=norm(w)
    desc=[i for i in range(len(w)-1) if w[i]>w[i+1]]
    if not desc:return {():1}
    r=desc[-1]
    s=max(j for j in range(r+1,len(w)) if w[j]<w[r])
    v=list(w);v[r],v[s]=v[s],v[r]
    out={}
    for e,a in schubert(norm(v)).items():
        f=list(e)+[0]*max(0,r+1-len(e));f[r]+=1;out[trim(f)]=a
    for q in range(r):
        if v[q]<v[r] and not any(v[q]<v[j]<v[r] for j in range(q+1,r)):
            add_to(out,schubert(swap(v,q,r)))
    return out


def decomposition(p,stop_negative=True):
    p=dict(p);out={}
    while p:
        n=max(map(len,p))
        e=max(p,key=lambda e:tuple(reversed(e+(0,)*(n-len(e)))))
        a=p[e];w=from_code(e)
        if stop_negative and a<0:return out,(e,a)
        q=schubert(w)
        assert q.get(e)==1,(w,e,q)
        add_to(p,q,-a);out[e]=a
    return out,None


def flag(w):
    return tuple(sorted(min(j for j in range(i+1,len(w)) if w[j]<v) for i,v in enumerate(w) if any(w[j]<v for j in range(i+1,len(w)))))


def vexillary(w):
    return not any(w[j]<w[i]<w[l]<w[k] for i,j,k,l in combinations(range(len(w)),4))


def difference(u,v):
    cu,cv=code(u),code(v);n=max(len(cu),len(cv));cu+= (0,)*(n-len(cu));cv+=(0,)*(n-len(cv))
    jo=from_code(tuple(max(a,b) for a,b in zip(cu,cv)))
    me=from_code(tuple(min(a,b) for a,b in zip(cu,cv)))
    p=mul(schubert(jo),schubert(me));add_to(p,mul(schubert(u),schubert(v)),-1)
    return p,jo,me


def self_check():
    assert schubert((1,3,2))=={(1,):1,(0,1):1}
    assert schubert((2,3,1))=={(1,1):1}
    assert schubert((3,1,2))=={(2,):1}
    u=(5,7,1,2,3,6,4);v=(3,5,1,4,6,7,2)
    assert flag(u)==(2,2,6) and flag(v)==(2,2,6,6,6)
    assert vexillary(u) and vexillary(v)
    p,jo,me=difference(u,v)
    assert jo==(5,7,1,3,4,6,2) and me==(3,5,1,2,4,7,6)
    d,bad=decomposition(p,False)
    assert bad is None and d=={(7,8,0,1,1,1):2,(6,9,0,1,1,1):1},d
    print('Primary-source example and elementary transition checks passed.',flush=True)


def probe(n,attempts,degree,seed):
    rng=random.Random(seed);groups=defaultdict(list);pairs=checked=0;t0=time.time()
    for it in range(attempts):
        # Generate low-length permutations, with position gaps retained.
        c=[0]*(n-1)
        for _ in range(rng.randrange(2,degree+1)):
            j=rng.randrange(n-1)
            if c[j]<n-j-1:c[j]+=1
        w=from_code(c)
        if len(w)<n or not vexillary(w):continue
        fw=flag(w)
        candidates=[]
        for f,g in groups.items():
            if f==fw[:len(f)] or fw==f[:len(fw)]: candidates.extend(g)
        rng.shuffle(candidates)
        for v in candidates[:3]:
            cw,cv=code(w),code(v);nn=max(len(cw),len(cv));cw+=(0,)*(nn-len(cw));cv+=(0,)*(nn-len(cv))
            if all(a<=b for a,b in zip(cw,cv)) or all(b<=a for a,b in zip(cw,cv)):continue
            pairs+=1;p,jo,me=difference(w,v)
            if not p:continue
            checked+=1;d,bad=decomposition(p)
            if bad:
                print('NEGATIVE',{'u':w,'v':v,'flag_u':fw,'flag_v':flag(v),'join':jo,'meet':me,'coefficient':bad},flush=True)
                return
        if w not in groups[fw]:groups[fw].append(w)
        if it and it%1000==0:print('progress',it,len(groups),pairs,checked,round(time.time()-t0,2),flush=True)
    print('completed',{'n':n,'attempts':attempts,'max_length':degree,'valid_groups':len(groups),'pairs':pairs,'nonzero_differences':checked,'seconds':time.time()-t0},flush=True)


if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('--n',type=int,default=10);ap.add_argument('--attempts',type=int,default=10000);ap.add_argument('--degree',type=int,default=10);ap.add_argument('--seed',type=int,default=20261121);ap.add_argument('--self-check-only',action='store_true');a=ap.parse_args()
    self_check()
    if not a.self_check_only:probe(a.n,a.attempts,a.degree,a.seed)
