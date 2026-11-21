"""Exploratory exact recurrence for Kursungoz Conjecture 4. No proof claim."""
from functools import lru_cache

def qintmul(p, n):
    if n < 1:
        raise ValueError(n)
    out = [0]*(len(p)+n-1)
    v=0
    for i in range(len(out)):
        if i<len(p):v+=p[i]
        if 0<=i-n<len(p):v-=p[i-n]
        out[i]=v
    return tuple(out)

@lru_cache(None)
def B(ns):
    if not ns or not any(ns):return (1,)
    if ns[-1]==0:return B(ns[:-1])
    total=sum((i+1)*n for i,n in enumerate(ns))
    out=[]
    for i,n in enumerate(ns):
        if not n:continue
        nxt=list(ns);nxt[i]-=1
        p=B(tuple(nxt))
        for r in range(1,i+1):p=qintmul(p,total-r)
        sh=sum((j-i)*ns[j] for j in range(i+1,len(ns)))
        if len(out)<sh+len(p):out.extend([0]*(sh+len(p)-len(out)))
        for a,c in enumerate(p):out[a+sh]+=c
    return tuple(out)

def parts(n,lo=1):
    if n==0:yield ()
    for x in range(lo,n+1):
        for t in parts(n-x,x):yield (x,)+t

if __name__=='__main__':
    lc_fail=0
    for total in range(1,31):
        num=0
        for lam in parts(total):
            ns=tuple(lam.count(j) for j in range(1,max(lam)+1))
            p=B(ns);num+=1
            falling=False
            for i in range(len(p)-1):
                if p[i]>p[i+1]:falling=True
                if falling and p[i]<p[i+1]:
                    print('UNIMODALITY FAIL',lam,p,flush=True)
                    raise SystemExit
            if any(p[i]*p[i]<p[i-1]*p[i+1] for i in range(1,len(p)-1)):
                lc_fail+=1
                if lc_fail<=5:print('LOGCONCAVITY FAIL',lam,p,flush=True)
        print('total',total,'states',num,'logconcavity failures',lc_fail,flush=True)
