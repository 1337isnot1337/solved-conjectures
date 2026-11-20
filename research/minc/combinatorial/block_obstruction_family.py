"""Structured one-collision regular matrices for testing switch descent."""
import json
from pathlib import Path
from frontier_permanent import switches,permanent


def core(k):
    n=2*k;a=[[0]*n for _ in range(n)]
    for i in range(k):
        for j in range(k-1):a[i][j]=1
    for i in range(k,2*k-1):
        for j in range(k-1,2*k-1):a[i][j]=1
    for i in range(k-2):a[i][-1]=1
    a[k-2][k-1]=1;a[k-1][k]=1
    for j in range(k+1,2*k-1):a[-1][j]=1
    a[-1][-1]=2
    return a


def splice_complete(a,u,v,k):
    n=len(a);assert a[u][v]==1
    b=[r+[0]*k for r in a]+[[0]*(n+k) for _ in range(k)]
    for i in range(n,n+k):
        for j in range(n,n+k):b[i][j]=1
    b[u][v]=0;b[n][n]=0;b[u][n]=1;b[n][v]=1
    return b,n


if __name__=='__main__':
    for k in range(3,9):
        a=core(k);result=switches(a);result['family']='core';result['k']=k
        print(json.dumps(result),flush=True)
    for m in range(1,9):
        a=core(4)
        for u,v in [(2,3),(3,4)]:
            for _ in range(m):a,v=splice_complete(a,u,v,4)
        result=switches(a);result['family']='two_spliced_wires';result['k']=4;result['m']=m
        print(json.dumps(result),flush=True)
