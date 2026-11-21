"""Finite diagnostics for a necessary spectral-jet convex-hull condition.

This is not a proof of MDO and does not certify a counterexample. Base
matrices and gradients are exact rationals; scipy only tests feasibility
of the finite convex hull. Any negative output needs an exact separator.
"""
from itertools import permutations
from fractions import Fraction
import json
import random
import sympy as s
import numpy as np
from scipy.optimize import linprog


def reflection(v):
    v=s.Matrix(v)
    return s.eye(len(v))-2*v*v.T/(v.dot(v))


def data(a,b,u):
    n=len(a)
    c=s.diag(*a)+u*s.diag(*b)*u.T
    det=c.det()
    adj=c.adjugate()
    adjb=u.T*adj*u
    target=[det]+[adj[i,i]for i in range(n)]+[adjb[j,j]for j in range(n)]
    verts=[]
    for p in permutations(range(n)):
        factors=[a[i]+b[p[i]]for i in range(n)]
        prod=s.prod(factors)
        da=[s.prod(factors[j]for j in range(n)if i!=j)for i in range(n)]
        db=[da[p.index(j)]for j in range(n)]
        verts.append([prod]+da+db)
    return target,verts


def main():
    rng=random.Random(20261121)
    results=[]
    for n in [4,5]:
        for index in range(24):
            positive=index<12
            a=[s.Integer(rng.randrange(1,9) if positive else rng.randrange(-7,8))for _ in range(n)]
            b=[s.Integer(rng.randrange(1,9) if positive else rng.randrange(-7,8))for _ in range(n)]
            vectors=[[rng.randrange(-3,4)for _ in range(n)]for _ in range(3)]
            if any(not any(v)for v in vectors):continue
            u=s.eye(n)
            for v in vectors:u=u*reflection(v)
            target,verts=data(a,b,u)
            if target[0]==0:continue
            arr=np.asarray([[float(x)for x in v]for v in verts]).T
            rhs=np.asarray([float(x)for x in target])
            scales=np.maximum(1,np.max(abs(arr),axis=1))
            mat=np.vstack([np.ones(len(verts)),arr/scales[:,None]])
            rr=np.concatenate([[1],rhs/scales])
            lp=linprog(np.zeros(len(verts)),A_eq=mat,b_eq=rr,bounds=(0,None),method='highs')
            item={'n':n,'index':index,'positive':positive,'status':int(lp.status)}
            if lp.success:item['residual']=float(np.max(abs(mat@lp.x-rr)))
            else:
                item.update(a=list(map(str,a)),b=list(map(str,b)),reflection_vectors=vectors,
                            target=list(map(str,target)),vertices=[list(map(str,v))for v in verts])
            results.append(item)
    out={'scope':'finite numerical convex-hull diagnostic on exact rational base data',
         'universal_statement_proved':False,'instances':results}
    with open('tangent-output.json','w')as f:json.dump(out,f,indent=2)
    print(json.dumps({'count':len(results),'status_counts':{str(k):sum(r['status']==k for r in results)for k in {r['status']for r in results}},
                      'largest_feasible_residual':max((r.get('residual',0)for r in results),default=0)}))


if __name__=='__main__':main()
