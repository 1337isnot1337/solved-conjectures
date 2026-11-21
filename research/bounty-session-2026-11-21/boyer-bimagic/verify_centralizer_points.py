#!/usr/bin/env python3
"""Exact Fraction verification of the complete surviving parameter list.

Completeness comes from centralizer-exclusion.md, not from this finite replay.
"""
from fractions import Fraction as F
from itertools import product
import json

N=5

def zeros(): return [[F(0) for _ in range(N)] for _ in range(N)]
def eye(): return [[F(i==j) for j in range(N)] for i in range(N)]
def transpose(A): return [list(a) for a in zip(*A)]
def mul(A,B):
    return [[sum(A[i][k]*B[k][j] for k in range(N))
             for j in range(N)] for i in range(N)]
def outer(a,b): return [[F(x*y) for y in b] for x in a]
def accum(A,B,c=F(1)):
    return [[x+c*y for x,y in zip(ar,br)] for ar,br in zip(A,B)]
def angle(q,k):
    if q is None:return F(-1),F(0)
    return (1-k*q*q)/(1+k*q*q),2*q/(1+k*q*q)

e=[1,-1,0,-1,1];f=[1,1,-4,1,1]
g=[1,0,0,0,-1];h=[0,1,0,-1,0]
P=zeros()
for i,j in enumerate([0,2,4,1,3]):P[i][j]=F(1)

records=[]
seen=set()
for rp,rm in product([False,True],repeat=2):
    vs=[F(-1),F(1)] if rp else [F(0),None]
    for u,v in product([F(0),None],vs):
        c,z=angle(u,F(5));d,t=angle(v,F(1))
        S=[[F(1,5) for _ in range(N)] for _ in range(N)]
        for a,b,coef in [(e,e,c/4),(f,f,c/20),(f,e,z/4),(e,f,-z/4),
                         (g,g,d/2),(h,h,d/2),(h,g,t/2),(g,h,-t/2)]:
            S=accum(S,outer(a,b),coef)
        if rp:S=mul(S,accum(eye(),outer(e,e),F(-1,2)))
        if rm:S=mul(S,accum(eye(),outer(g,g),F(-1)))
        assert mul(S,transpose(S))==eye()
        assert all(sum(row)==1 for row in S)
        assert all(S[i][j]==S[4-i][4-j] for i in range(N) for j in range(N))
        Q=mul(mul(S,P),transpose(S))
        assert all(x in (0,1) for row in Q for x in row)
        assert all(sum(row)==1 for row in Q+transpose(Q))
        assert sum(Q[i][i] for i in range(N))==1
        assert sum(Q[i][4-i] for i in range(N))==1
        A=[[5*x-1 for x in row] for row in Q]
        lines=A+transpose(A)+[[A[i][i] for i in range(N)],
                              [A[i][4-i] for i in range(N)]]
        assert all(sum(row)==0 for row in lines)
        assert all(sum(x*x for x in row)==20 for row in lines)
        values=set(x for row in A for x in row)
        assert len(values)==2
        permutation=tuple(next(j for j in range(N) if Q[i][j]==1) for i in range(N))
        seen.add(permutation)
        records.append({'reflect_plus':rp,'reflect_minus':rm,
                        'u':'infinity' if u is None else str(u),
                        'v':'infinity' if v is None else str(v),
                        'permutation_rows':list(permutation),
                        'centered_integer_values':sorted(int(x) for x in values),
                        'distinct_entry_count':len(values),
                        'qualifies':False})
print(json.dumps({'candidate_parameter_points':len(records),
                  'unique_matrices':len(seen),
                  'qualifying_bimagic_squares':0,
                  'verification_arithmetic':'Python fractions.Fraction',
                  'records':records},indent=2))
