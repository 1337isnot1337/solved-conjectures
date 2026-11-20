"""Build cubic graphs with an edge approaching probability one, then insert a parallel-edge gadget.

Exact permanent verification is delegated to the companion standalone checker.
These are candidate obstructions to a proposed proof route, not counterexamples to Minc.
"""
import argparse
import json
from pathlib import Path


def splice_k33(a, u, v):
    n=len(a)
    assert a[u][v]==1
    b=[r+[0]*3 for r in a]+[[0]*(n+3) for _ in range(3)]
    for i in range(n,n+3):
        for j in range(n,n+3): b[i][j]=1
    b[u][v]=0; b[n][n]=0; b[u][n]=1; b[n][v]=1
    return b,n


def parallel_gadget(a,u,v):
    n=len(a)
    b=[r+[0] for r in a]+[[0]*(n+1)]
    assert b[u][v]==1
    b[u][v]=0; b[u][n]=1; b[n][v]=1; b[n][n]=2
    return b


def construct(m):
    a=[[1]*3 for _ in range(3)]
    for original_col in [1,2]:
        v=original_col
        for _ in range(m): a,v=splice_k33(a,0,v)
    return parallel_gadget(a,0,0)


if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('m',type=int);args=parser.parse_args()
    a=construct(args.m);n=len(a)
    assert all(sum(r)==3 for r in a)
    assert all(sum(a[i][j] for i in range(n))==3 for j in range(n))
    path=Path(__file__).with_name(f'rare_edge_m{args.m}.txt')
    path.write_text(str(n)+'\n'+'\n'.join(' '.join(map(str,r)) for r in a)+'\n')
    print(json.dumps({'n':n,'path':str(path),'predicted_permanent':4**(2*args.m)*(2+8/2**args.m)}))
