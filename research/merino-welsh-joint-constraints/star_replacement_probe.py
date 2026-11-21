"""Exploratory LP for a three-arm parallel-pair star; no proof certificate.

Tests whether induction on smaller replacement graphs, boundary orientation
monotonicity, and exact three-terminal resistance identities suffice locally.
Floating LP results are only diagnostics.
"""
from itertools import product
import json
import random
import numpy as np
from scipy.optimize import linprog


def instance(resistances, determinant, acyclic_ratios):
    rr = np.array(resistances, dtype=float)
    d = float(determinant)
    a = np.array(acyclic_ratios, dtype=float)
    ay = 4 + sum(a[:3]) + a[3]
    ub, bounds = [], []
    # c0 >= 1, ai ci >= ri^2, a4 c4 >= determinant^2.
    lower = [1] + [rr[i]**2/a[i] for i in range(3)] + [d*d/a[3]]
    for q in product(range(6), repeat=3):
        if not 2 <= sum(q) <= 5:
            continue
        nz = [i for i, x in enumerate(q) if x]
        if len(nz) == 3:
            aq = ay
        elif len(nz) == 2:
            pair = {(0, 1): 0, (0, 2): 1, (1, 2): 2}[tuple(nz)]
            aq = 3 + a[pair]
        else:
            aq = 2
        v = [2**x-1 for x in q]
        cc = [sum(v)-1, v[0]*v[1], v[0]*v[2], v[1]*v[2], v[0]*v[1]*v[2]]
        tt = (sum(q)+q[0]*q[1]*rr[0]+q[0]*q[2]*rr[1]
              +q[1]*q[2]*rr[2]+q[0]*q[1]*q[2]*d)
        ub.append([-aq*x for x in cc]);bounds.append(-tt*tt)
    for q in product(range(6), repeat=3):
        if sum(q) > 5:
            continue
        nz = [i for i, x in enumerate(q) if x]
        aq = 1+sum(a[i] for i in nz)
        if len(nz) == 2:
            aq += a[3]
        elif len(nz) == 3:
            aq += 2*a[3]
        v = [2**x-1 for x in q]
        cc = [1, v[0], v[1], v[2],
              v[0]*v[1]+v[0]*v[2]+v[1]*v[2]+v[0]*v[1]*v[2]]
        tt = (1+sum(q[i]*rr[i] for i in range(3))
              +(q[0]*q[1]+q[0]*q[2]+q[1]*q[2])*d)
        ub.append([-aq*x for x in cc]);bounds.append(-tt*tt)
    for i in range(1, 4):
        row=[0]*5;row[0]=1;row[i]=-1
        ub.append(row);bounds.append(0)
        row=[0]*5;row[i]=1;row[4]=-1
        ub.append(row);bounds.append(0)
    ub.append([-1,1,1,1,-2]);bounds.append(0)
    objective=ay*np.array([8,9,9,9,27],dtype=float)
    result=linprog(objective,A_ub=ub,b_ub=bounds,bounds=[(x,None) for x in lower],method='highs')
    target=(6+4*sum(rr)+8*d)**2
    return result,target


def main():
    best=None
    for r in [Fraction/20 for Fraction in range(14, 47)]:
        for a in [0.1,0.25,0.5,0.75,1]:
            for b in [0.02,0.05,0.1,0.25,0.5,0.75,1]:
                if b>a or b<3*a-2:continue
                z,target=instance([r]*3,3*r*r/4,[a,a,a,b])
                if z.success:
                    ratio=z.fun/target
                    if best is None or ratio<best['ratio']:
                        best={'r':r,'a':a,'b':b,'ratio':ratio,'c':z.x.tolist(),'target':target}
    print(json.dumps({'symmetric_relaxation_minimum':best,'proof_claimed':False},indent=2))


if __name__=='__main__':main()
