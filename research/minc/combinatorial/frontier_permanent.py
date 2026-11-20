"""Exact permanent by a row frontier; uses arbitrary-precision Python integers.

This standard transfer computation is only a verifier for exploratory constructions.
It is not a claimed new algorithm for Minc's list.
"""
from pathlib import Path
import argparse
import json


def permanent(a, diagnostic=False):
    n=len(a)
    nonzero=[[(j,int(x)) for j,x in enumerate(row) if x] for row in a]
    last=[max((i for i in range(n) if a[i][j]),default=-1) for j in range(n)]
    if -1 in last:return (0,0) if diagnostic else 0
    forget=[sum(1<<j for j in range(n) if last[j]==i) for i in range(n)]
    states={0:1};max_states=1
    for i,row in enumerate(nonzero):
        nxt={};f=forget[i]
        for mask,value in states.items():
            for j,x in row:
                bit=1<<j
                if mask&bit:continue
                new=mask|bit
                if new&f != f:continue
                new ^= f
                nxt[new]=nxt.get(new,0)+x*value
        states=nxt;max_states=max(max_states,len(states))
    ans=states.get(0,0)
    return (ans,max_states) if diagnostic else ans


def switches(a):
    n=len(a);p=permanent(a);best=None;count=0;nonincreasing=0;witness=None
    for i in range(n):
        for r in range(i+1,n):
            for j in range(n):
                if not a[i][j]:continue
                for s in range(n):
                    if j==s or not a[r][s]:continue
                    dc=2-a[i][j]-a[r][s]+a[i][s]+a[r][j]
                    if dc>=0:continue
                    count+=1
                    a[i][j]-=1;a[r][s]-=1;a[i][s]+=1;a[r][j]+=1
                    q=permanent(a)
                    a[i][j]+=1;a[r][s]+=1;a[i][s]-=1;a[r][j]-=1
                    nonincreasing+=q<=p
                    if best is None or q<best:best=q;witness=[i,j,r,s]
    return {'n':n,'permanent':p,'candidate_switches':count,'nonincreasing':nonincreasing,
            'best':best,'delta':None if best is None else best-p,'witness':witness}


if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('matrix');parser.add_argument('--switches',action='store_true');args=parser.parse_args()
    values=list(map(int,Path(args.matrix).read_text().split()));n=values[0]
    assert len(values)==1+n*n
    a=[values[1+i*n:1+(i+1)*n] for i in range(n)]
    print(json.dumps(switches(a) if args.switches else {'permanent_and_max_states':permanent(a,True)}))
