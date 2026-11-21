#!/usr/bin/env python3
"""Exact restricted two-parameter orthogonal construction; no global claim."""
import argparse
import json
from pathlib import Path
import sympy as s


def run(b, reflect_plus=False, reflect_minus=False):
    u, v = s.symbols('u v')
    one = s.ones(5, 1)
    e = s.Matrix([1, -1, 0, -1, 1])
    f = s.Matrix([1, 1, -4, 1, 1])
    g = s.Matrix([1, 0, 0, 0, -1])
    h = s.Matrix([0, 1, 0, -1, 0])
    R = s.zeros(5)
    P = s.zeros(5)
    for i in range(5):
        R[i, 4-i] = 1
        P[i, (2*i+b) % 5] = 1
    c, z = (1-5*u*u)/(1+5*u*u), 2*u/(1+5*u*u)
    d, t = (1-v*v)/(1+v*v), 2*v/(1+v*v)
    S = (one*one.T/5 + c*(e*e.T/4+f*f.T/20)
         + z*(f*e.T-e*f.T)/4 + d*(g*g.T+h*h.T)/2
         + t*(h*g.T-g*h.T)/2)
    if reflect_plus:
        S = S*(s.eye(5)-e*e.T/2)
    if reflect_minus:
        S = S*(s.eye(5)-g*g.T)
    suffix = ('-plus' if reflect_plus else '') + ('-minus' if reflect_minus else '')
    den = 20*(1+5*u*u)*(1+v*v)
    M = S.applyfunc(lambda x: s.cancel(x*den))
    assert all(s.denom(x) == 1 for x in M)
    assert (M*one-den*one).applyfunc(s.expand) == s.zeros(5, 1)
    assert (M*R-R*M).applyfunc(s.expand) == s.zeros(5)
    assert (M*M.T-den**2*s.eye(5)).applyfunc(s.expand) == s.zeros(5)
    Qn = (M*P*M.T).applyfunc(s.expand)
    assert s.expand(s.trace(Qn)-den**2) == 0
    assert s.expand(s.trace(R*Qn)-den**2) == 0
    diag = s.factor(sum(Qn[i,i]**2 for i in range(5))-den**4)
    anti = s.factor(sum(Qn[i,4-i]**2 for i in range(5))-den**4)
    # Cancel the denominators: they are strictly positive for real u,v.
    fq = s.cancel(diag/den**4)
    gq = s.cancel(anti/den**4)
    fpoly = s.factor(s.fraction(fq)[0])
    gpoly = s.factor(s.fraction(gq)[0])
    common = s.factor(s.gcd(fpoly, gpoly))
    print(json.dumps({'b': b, 'stage': 'constraints',
                      'degrees': [s.Poly(x,u,v).total_degree() for x in (fpoly,gpoly)],
                      'common': str(common)}), flush=True)
    data = {'b': b, 'parameters': ['u','v'],
            'reflect_plus': reflect_plus, 'reflect_minus': reflect_minus,
            'permutation_rows': [(2*i+b)%5 for i in range(5)],
            'diagonal_numerator': str(fpoly),
            'antidiagonal_numerator': str(gpoly),
            'common_factor': str(common),
            'difference_factorization': str(s.factor(fpoly-gpoly)),
            'diagonal_at_u0': str(s.factor(fpoly.subs(u,0))),
            'diagonal_at_v0': str(s.factor(fpoly.subs(v,0))),
            'diagonal_u_leading_coefficient': str(s.factor(s.Poly(fpoly,u).LC())),
            'diagonal_v_leading_coefficient': str(s.factor(s.Poly(fpoly,v).LC())),
            'constraint_factors': [[{'factor':str(a),'power':int(k)}
                                    for a,k in s.factor_list(x)[1]]
                                   for x in (fpoly,gpoly)],
            'status': 'restricted centralizer orbit only'}
    out = Path(__file__).with_name(f'centralizer-b{b}{suffix}.json')
    out.write_text(json.dumps(data,indent=2)+'\n')
    f1, g1 = s.cancel(fpoly/common), s.cancel(gpoly/common)
    result = s.factor(s.resultant(f1,g1,v))
    data['resultant_after_common_factor'] = str(result)
    data['resultant_factors'] = [{'factor':str(a),'power':int(k)}
                                for a,k in s.factor_list(result)[1]]
    data['rational_u_roots'] = {str(a):int(k) for a,k in s.Poly(result,u).ground_roots().items()} if result else None
    out.write_text(json.dumps(data,indent=2)+'\n')
    print(json.dumps({'b':b,'stage':'resultant','factors':data['resultant_factors'],
                      'rational_u_roots':data['rational_u_roots']}),flush=True)


if __name__ == '__main__':
    ap=argparse.ArgumentParser()
    ap.add_argument('b',type=int)
    ap.add_argument('--reflect-plus',action='store_true')
    ap.add_argument('--reflect-minus',action='store_true')
    args=ap.parse_args()
    run(args.b,args.reflect_plus,args.reflect_minus)
