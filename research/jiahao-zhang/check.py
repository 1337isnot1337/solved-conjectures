"""Exact exploration of Zhang's full gamma-difference conjecture.

Positive finite checks are not resolutions. A reported failure needs a second
source-faithful computation and an exact algebraic certificate.
"""
import argparse
import json
import time
from math import comb, gcd
import sympy as sp


def trim(p):
    while len(p)>1 and p[-1]==0:
        p.pop()
    return p


def add(*pairs):
    out=[0]*max(len(p) for _,p in pairs)
    for c,p in pairs:
        for j,v in enumerate(p):out[j]+=c*v
    return trim(out)


def shift(p):return [0]+p


def gamma_array(N):
    f=[[1],[1]]
    for n in range(2,N+1):f.append(add((1,f[-1]),(-1,shift(f[-2]))))
    G={(a,0):[1] for a in range(N+1)}
    G.update({(0,b):[1] for b in range(N+1)})
    for a in range(1,N+1):
        G[a,1]=[1,a-1] if a>1 else [1]
        for b in range(2,N+1):
            if a==1:G[a,b]=[1,b-1]
            else:
                G[a,b]=add((1,G[a-1,b]),(1,G[a,b-1]),
                    (1,shift(G[a-1,b-1])),(-1,G[a-1,b-1]))
                if a==b:G[a,b]=add((1,G[a,b]),(-1,shift(f[a-1])))
    for n in range(1,N+1):
        # Independent diagonal convolution from generating function (37).
        d=[comb(n,j)**2 for j in range(n+1)]
        for j in range(n):
            P=f[j];Q=[comb(n-1-j,k)**2 for k in range(n-j)]
            for u,x in enumerate(P):
                for v,y in enumerate(Q):d[1+u+v]-=x*y
        assert trim(d)==G[n,n],n
    return G


def variation(signs):
    signs=[v for v in signs if v]
    return sum(a!=b for a,b in zip(signs,signs[1:]))


def real_count(p):
    x=sp.Symbol('x')
    f=sp.Poly.from_list(list(reversed(p)),x,domain=sp.ZZ)
    return int(f.count_roots(-sp.oo,sp.oo))


def primitive(p):
    p=trim(p)
    content=0
    for x in p:content=gcd(content,x)
    return [x//content for x in p] if content else p


def negative_remainder(a,b):
    """Positive scaling of -rem(a,b), assuming b has positive leading term."""
    r=a[:]
    while len(r)>=len(b) and r!=[0]:
        k=len(r)-len(b)
        lc=r[-1];bc=b[-1]
        r=[bc*x for x in r]
        for j,x in enumerate(b):r[k+j]-=lc*x
        r=primitive(r)
    return [-x for x in r]


def proper_position(p,g):
    """Exact strict interlacing via positive-leading signed remainder chain.

    Since g(0)=0 and p has positive coefficients, the required orientation is
    forced. Returns None on success, or a diagnostic for independent review.
    """
    if len(p)==len(g):
        r=primitive(add((g[-1],p),(-p[-1],g)))
    elif len(p)+1==len(g):r=primitive(p)
    else:return {'stage':'initial degree','pdegree':len(p)-1,'gdegree':len(g)-1}
    a=primitive(g);steps=0
    while len(a)>1:
        if len(r)!=len(a)-1 or r[-1]<=0:
            return {'stage':'signed remainder','step':steps,'degree':len(r)-1,
                    'expected_degree':len(a)-2,'leading_sign':(r[-1]>0)-(r[-1]<0)}
        if len(r)==1:return None
        a,r=r,negative_remainder(a,r);steps+=1
    return None


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--N',type=int,default=40)
    ap.add_argument('--width',type=int,default=2)
    ap.add_argument('--method',choices=['roots','proper'],default='proper')
    ap.add_argument('--full',action='store_true')
    args=ap.parse_args()
    G=gamma_array(args.N)
    checks=0;t=time.time()
    for n in range(2,args.N+1):
        pairs=({(n,b) for b in range(1,n+1)}|{(a,n) for a in range(1,n)}) if args.full else {(n,n),(n,min(args.N,n+1)),(min(args.N,n+1),n)}
        for a,b in sorted(pairs):
            if not args.full and abs(a-b)>args.width:continue
            delta=add((1,G[a,b]),(-1,G[a,b-1]))
            if min(delta)<0:raise RuntimeError(('negative',a,b,delta))
            # Strip the forced root at zero before exact root counting.
            q=delta[1:]
            checks+=1
            if args.method=='roots':
                count=real_count(q)
                failure=None if count==len(q)-1 else {'real_roots':count}
            else:failure=proper_position(G[a,b-1],delta)
            if failure:
                print(json.dumps({'failure':failure,'a':a,'b':b,
                    'p':G[a,b-1],'g':delta}),flush=True)
                return
        print(json.dumps({'n':n,'checks':checks,'seconds':round(time.time()-t,3)}),flush=True)


if __name__=='__main__':main()
