"""Floating LP diagnostic using every admissible <=5-edge gadget.

This is a search over an algebraic relaxation, not over counterexample graphs.
"""
from itertools import combinations, combinations_with_replacement
import json
import numpy as np
from scipy.optimize import linprog
from check_all_small_gadgets import allowed, coefficients


def gadgets():
    result=set()
    for n in range(3,8):
        pairs=list(combinations(range(n),2))
        for m in range(6):
            if n-3>m:continue
            for ee in combinations_with_replacement(pairs,m):
                edges=list(ee)
                if allowed(n,edges):
                    result.add(tuple(map(tuple,coefficients(n,edges))))
    return sorted(result)


def instance(data,r,a,b):
    d=3*r*r/4
    aa=np.array([1,a,a,a,b],dtype=float)
    tt=np.array([1,r,r,r,d],dtype=float)
    rows,rhs=[],[]
    for ac,cy,tr in data:
        av=np.dot(ac,aa);tv=np.dot(tr,tt)
        rows.append(-av*np.array(cy,dtype=float));rhs.append(-tv*tv)
    for i in range(1,4):
        row=np.zeros(5);row[0]=1;row[i]=-1
        rows.append(row);rhs.append(0)
        row=np.zeros(5);row[i]=1;row[4]=-1
        rows.append(row);rhs.append(0)
    rows.append(np.array([-1,1,1,1,-2],dtype=float));rhs.append(0)
    target=(6+12*r+8*d)**2
    objective=(4+3*a+b)*np.array([8,9,9,9,27],dtype=float)
    bounds=[(1,None)]+[(r*r/a,None)]*3+[(d*d/b,None)]
    z=linprog(objective,A_ub=rows,b_ub=rhs,bounds=bounds,method='highs')
    return z,target


def main():
    data=gadgets()
    best=None
    for r in [i/40 for i in range(27,94)]:
        for a in [0.1,0.25,0.5,0.75,0.9,0.99,1]:
            for b in [0.02,0.05,0.1,0.25,0.5,0.75,0.9,0.98,1]:
                if b>a or b<3*a-2:continue
                z,target=instance(data,r,a,b)
                if z.success:
                    ratio=z.fun/target
                    if best is None or ratio<best['ratio']:
                        best={'r':r,'a':a,'b':b,'ratio':ratio,'c':z.x.tolist(),'target':target}
    print(json.dumps({'boundary_types':len(data),'best_relaxation':best,
                      'proof_of_Merino_Welsh_claimed':False},indent=2))


if __name__=='__main__':main()
