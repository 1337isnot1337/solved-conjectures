#!/usr/bin/env python3
"""Exact algebra behind trace C_(3,3)(A) <= 2 per(A)-9 prod a_ii.

Scope: rank-two PSD matrices of order six.  This is auxiliary and does not
resolve MINC Conjecture42 or Problem2.  SymPy is used only for identities;
all nonnegativity arguments are displayed in the companion proof.
"""

import sympy as s
from fractions import Fraction
from itertools import combinations, permutations
import json
from pathlib import Path

import f20_transfer_check as f


def symbolic_checks():
    L, a, b, c, d, u, t2, t3 = s.symbols("L a b c d u t2 t3")
    # Gaussian expectations of the eleven power-sum products in 720 e6.
    expectations = [
        15*L**3,
        18*L**2+12*L*a,
        L*(36+2*t2)+24*a+8*b,
        216+36*t2+8*t3,
        9*L**2+6*c,
        6*a+18*L+6*d,
        9*L+6*u,
        18*L+12*a,
        108+12*t2,
        15*L,
        90,
    ]
    coefficients = [1,-15,45,-15,40,-120,40,-90,90,144,-120]
    S3 = s.expand(sum(k*v for k,v in zip(coefficients,expectations))/720)
    expected_S3 = (-6 + L/2 + L**2/8 + L**3/48 - a - L*a/4
                   + L*t2/8 + 3*t2/4 - t3/6 + b/2 + c/3 - d + u/3)
    assert s.expand(S3-expected_S3) == 0
    S1 = L/2-3
    S2 = L**2/8-L/2+t2/4-a/2
    E = s.expand(195+73*S1+13*S2+3*S3)
    Vnorm = s.Rational(3,4)*L*t2+s.Rational(3,2)*b-s.Rational(3,2)*L*a+L**3/4
    Mnorm = u-3*d+c+Vnorm
    remainder = (-42+s.Rational(63,2)*L+2*L**2-s.Rational(3,16)*L**3
                 +(-s.Rational(19,2)+3*L/4)*a
                 +(s.Rational(11,2)-3*L/8)*t2-t3/2)
    assert s.expand(E-Mnorm-remainder) == 0
    trace_M_norm = b-(L-4)*a+(L/2-2)**2*L
    R = s.expand(remainder+s.Rational(3,5)*trace_M_norm)
    expected_R = (-42+s.Rational(339,10)*L+s.Rational(4,5)*L**2
                  -s.Rational(3,80)*L**3+(-s.Rational(71,10)+3*L/20)*a
                  +(s.Rational(11,2)-3*L/8)*t2-t3/2+s.Rational(3,5)*b)
    assert s.expand(R-expected_R) == 0
    x,y,z,v = s.symbols("x y z v")
    Rxyz = R.subs({a:L*x,b:L*x*x,t2:x*x+y*y+z*z,t3:x**3+y**3+z**3})
    F0 = s.expand(Rxyz.subs({y:0,z:6-x}))
    Fb = s.expand(Rxyz.subs({y:(6-x)/2,z:(6-x)/2}))
    # Holding y+z fixed leaves an affine polynomial in yz, so endpoints
    # are yz=0 and yz=(6-x)^2/4.
    affine = s.expand(Rxyz.subs(z,6-x-y))
    slope = s.expand((-2+3*L/4-3*x/2))
    assert s.expand(affine-F0-slope*y*(6-x-y)) == 0
    summaries = {}
    for label,F,a0,a1 in [
        ("one_zero_eigenvalue",F0,30+2*(x-3)**2,
         (1632-208*x-12*x*x)/80),
        ("two_equal_eigenvalues",Fb,12+s.Rational(3,8)*(12-x)*(x-2)**2,
         (2172-388*x+3*x*x)/80),
    ]:
        a2=s.Rational(4,5)+3*x/20
        assert s.expand(F-(a0+a1*L+a2*L**2-s.Rational(3,80)*L**3)) == 0
        B=[a0,s.expand(a0+12*a1),s.expand(a0+24*a1+432*a2),s.expand(F.subs(L,36))]
        t=s.symbols("t")
        assert s.expand(F.subs(L,36*t)-sum(s.binomial(3,j)*B[j]*t**j*(1-t)**(3-j) for j in range(4))) == 0
        if label == "one_zero_eigenvalue":
            assert s.expand(a1+s.Rational(3,5)-(6-x)*(3*x+70)/20) == 0
            assert s.expand(B[1]-s.Rational(204,5)-(6-x)*(210-x)/5) == 0
            assert s.expand(B[3]-s.Rational(348,5)-x*(342+17*(6-x))/5) == 0
        else:
            assert s.expand(a1+s.Rational(3,5)-(6-x)*(370-3*x)/80) == 0
            assert s.expand(B[1]-s.Rational(204,5)-(6-x)*(15*x*x+168*(6-x)+1092)/40) == 0
            assert s.expand(B[3]-s.Rational(1473,5)-x*(s.Rational(3,10)+x*(s.Rational(51,10)+3*(6-x)/8))) == 0
        # a0>=12, a1>=-3/5, a2>=4/5 imply B2>=1716/5.
        assert 12+24*(-s.Rational(3,5))+432*s.Rational(4,5) == s.Rational(1716,5)
        summaries[label] = {"polynomial":str(F), "Bernstein_coefficients":[str(q) for q in B]}
    return summaries


def matchings(items):
    if not items:
        yield ()
        return
    i=items[0]
    for j in items[1:]:
        rest=tuple(k for k in items if k not in (i,j))
        for M in matchings(rest):
            yield ((i,j),)+M


def exact_core_check(raw):
    W=[[f.gauss(z) for z in row] for row in raw]
    A=f.gram(raw)
    h=1
    norms=[f.real(A[i][i]) for i in range(6)]
    for ni in norms:
        assert ni>0
        h*=ni
    P=f.real(f.gsum(f.gprod(A[i][p[i]] for i in range(6)) for p in permutations(range(6))))
    # Unit Bloch vectors are rational even when normalization of the
    # underlying Gaussian-integer spinors involves square roots.
    spin=[]
    for i in range(6):
        alpha,beta=W[0][i],W[1][i]
        ab=f.mul(f.conj(alpha),beta)
        aa=f.real(f.mul(f.conj(alpha),alpha))
        bb=f.real(f.mul(f.conj(beta),beta))
        spin.append((Fraction(2*ab[0],norms[i]),Fraction(2*ab[1],norms[i]),Fraction(aa-bb,norms[i])))
    dot=lambda x,y:sum(a*b for a,b in zip(x,y))
    G=[[dot(x,y) for y in spin] for x in spin]
    assert all(G[i][i]==1 for i in range(6))
    pairs=tuple(combinations(range(6),2))
    S1=sum(G[i][j] for i,j in pairs)
    S2=sum(G[i][j]*G[k][l] for (i,j),(k,l) in combinations(pairs,2) if len({i,j,k,l})==4)
    Ms=tuple(matchings(tuple(range(6))))
    assert len(Ms)==15
    S3=sum(G[i][j]*G[k][l]*G[m][n] for ((i,j),(k,l),(m,n)) in Ms)
    P_unit=Fraction(3,4)*(105+35*S1+7*S2+S3)
    lam=Fraction(3,4)*(15-3*S1+S2-S3)
    haf=sum((1-G[i][j])*(1-G[k][l])*(1-G[m][n])/8 for ((i,j),(k,l),(m,n)) in Ms)
    assert P_unit==Fraction(P,h) and lam==6*haf
    assert lam<=2*P_unit-9
    return {"permanent_over_h":str(P_unit),"trace_33_over_h":str(lam),
            "refined_gap":str(2*P_unit-9-lam)}


def main():
    algebra=symbolic_checks()
    cases={
        "octahedral": [[1,0,1,1,1,1],[0,1,1,-1,1j,-1j]],
        "collinear": [[1,1,1,1,0,0],[0,0,0,0,1,1]],
        "generic": [[1+2j,2-1j,-1+3j,4-2j,2+2j,-3+1j],
                    [3-1j,-2+2j,1+1j,-1-2j,4+1j,2-3j]],
    }
    evaluations={name:exact_core_check(W) for name,W in cases.items()}
    assert evaluations["octahedral"]["refined_gap"]=="0"
    out={"status":"auxiliary rank-two order-six inequality, not a full MINC resolution",
         "algebra_checks":"all symbolic identities passed",
         "Bernstein_data":algebra,"exact_cross_checks":evaluations}
    Path(__file__).with_name("rank_two_six_bound_certificate.json").write_text(json.dumps(out,indent=2)+"\n")
    print(json.dumps({"algebra_checks":out["algebra_checks"],"exact_cross_checks":evaluations},indent=2))


if __name__=="__main__":
    main()
