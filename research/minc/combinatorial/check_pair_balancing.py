"""Test the stronger proposed route that each row pair may be balanced safely."""
from itertools import product
import json
import random
from frontier_permanent import permanent


def random_matrix(n,k,rng):
    a=[[0]*n for _ in range(n)]
    for _ in range(k):
        p=list(range(n));rng.shuffle(p)
        for i,j in enumerate(p):a[i][j]+=1
    return a


def pair_test(a,i,r):
    n=len(a);k=sum(a[i]);c=[a[i][j]+a[r][j] for j in range(n)]
    old=permanent(a)
    options=[list(set([v//2,(v+1)//2])) for v in c]
    best=None;bestrows=None
    for x in product(*options):
        if sum(x)!=k:continue
        b=[row[:] for row in a];b[i]=list(x);b[r]=[c[j]-x[j] for j in range(n)]
        q=permanent(b)
        if best is None or q<best:best=q;bestrows=[b[i],b[r]]
    return old,best,bestrows


if __name__=='__main__':
    rng=random.Random(20261120)
    for n,k,trials in [(4,3,1000),(6,3,1000),(8,4,1000),(10,5,1000)]:
        for t in range(trials):
            a=random_matrix(n,k,rng)
            for i in range(n):
                for r in range(i+1,n):
                    if all(abs(a[i][j]-a[r][j])<=1 for j in range(n)):continue
                    old,best,rows=pair_test(a,i,r)
                    if best>old:
                        print(json.dumps({'n':n,'k':k,'trial':t,'pair':[i,r],'permanent':old,'best_balanced':best,'balanced_rows':rows,'matrix':a}));raise SystemExit
        print(json.dumps({'n':n,'k':k,'trials':trials,'obstruction':False}),flush=True)
