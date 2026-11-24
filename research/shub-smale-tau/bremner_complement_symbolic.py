"""Bounded exact complementary-prefix computation, using unordered pairs.

This computation is separate from the certified ordinary self-fiber
exclusion.  Its rational fibers must be checked before any conclusion.
"""
import json
import sympy as sp
from bremner_second_symbolic import second_family_functions
from bremner_symbolic import u as X

T, S, P = sp.symbols('T S P')


def symmetric_coordinates(expression):
    poly = sp.Poly(expression, X, T, domain=sp.QQ)
    degree = max(poly.degree(X), poly.degree(T))
    C = [sp.Poly(2, S, P, domain=sp.QQ), sp.Poly(S, S, P, domain=sp.QQ)]
    for k in range(2, degree+1):
        C.append(C[-1]*sp.Poly(S, S, P)-C[-2]*sp.Poly(P, S, P))
    result = sp.Poly(0, S, P, domain=sp.QQ)
    coefficients = poly.as_dict()
    for (i, j), coefficient in coefficients.items():
        assert coefficient == coefficients.get((j, i), 0)
        if i == j:
            result += sp.Poly(coefficient*P**i, S, P, domain=sp.QQ)
        elif i > j:
            result += C[i-j]*sp.Poly(coefficient*P**j, S, P, domain=sp.QQ)
    assert result.total_degree() <= degree
    # Coefficient-wise reconstruction is an exact identity check.
    assert sp.Poly(result.as_expr().subs({S: X+T, P: X*T})-expression, X, T).is_zero
    return result


def equations():
    functions = second_family_functions()
    qn, qd = (poly.as_expr() for poly in functions[0])
    rn, rd = (poly.as_expr() for poly in functions[1])
    first = qn*qd.subs(X, T)+qn.subs(X, T)*qd-qd*qd.subs(X, T)
    second = sp.cancel((rn*rd.subs(X, T)-rn.subs(X, T)*rd)/(X-T))
    fs, gs = symmetric_coordinates(first), symmetric_coordinates(second)
    _, fs = fs.clear_denoms(convert=True)
    _, gs = gs.clear_denoms(convert=True)
    _, fs = fs.primitive()
    _, gs = gs.primitive()
    return fs, gs


def run(output, factor=False):
    fs, gs = equations()
    print({'total_degrees': [fs.total_degree(), gs.total_degree()],
           'P_degrees': [fs.degree(P), gs.degree(P)],
           'S_degrees': [fs.degree(S), gs.degree(S)],
           'terms': [len(fs.terms()), len(gs.terms())]}, flush=True)
    with open(output+'.equations', 'w') as file:
        json.dump({'F': [[list(m), str(c)] for m,c in fs.terms()],
                   'G': [[list(m), str(c)] for m,c in gs.terms()]}, file)
        file.write('\n')
    result = sp.Poly(sp.resultant(fs.as_expr(), gs.as_expr(), P), S, domain=sp.QQ)
    assert not result.is_zero
    assert result.degree() <= 378
    _, result = result.clear_denoms(convert=True)
    content, primitive = result.primitive()
    if primitive.LC() < 0:
        content, primitive = -content, -primitive
    print('symmetric resultant degree', primitive.degree(), flush=True)
    data = {'degree': int(primitive.degree()),
            'resultant_content': str(content),
            'coefficients': [str(c) for c in primitive.all_coeffs()]}
    with open(output, 'w') as file:
        json.dump(data, file, indent=2)
        file.write('\n')
    if factor:
        constant, factors = sp.factor_list(primitive.as_expr(), S)
        print('factor degrees', [(sp.degree(f,S),m) for f,m in factors], flush=True)
        data['factor_content'] = str(constant)
        data['factors'] = [{'degree': int(sp.degree(f,S)), 'exponent': int(m),
                            'coefficients': [str(c) for c in sp.Poly(f,S).all_coeffs()]}
                           for f,m in factors]
        with open(output, 'w') as file:
            json.dump(data, file, indent=2)
            file.write('\n')
    return data


if __name__ == '__main__':
    import argparse
    parser=argparse.ArgumentParser()
    parser.add_argument('--output', default='bremner_complement_certificate.json')
    parser.add_argument('--factor', action='store_true')
    parser.add_argument('--equations-only', action='store_true')
    args=parser.parse_args()
    if args.equations_only:
        f,g=equations()
        print({'total_degrees': [f.total_degree(),g.total_degree()],
               'P_degrees': [f.degree(P),g.degree(P)],
               'S_degrees': [f.degree(S),g.degree(S)],
               'terms': [len(f.terms()),len(g.terms())]})
    else:
        run(args.output,args.factor)
