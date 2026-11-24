"""Exact cross-family probe for Bremner's two degree-16 constructions.

Research computation only.  No asymptotic root or circuit claim follows
from a finite point search or from either fixed-degree family.
"""
import sympy as sp
import bremner_symbolic as first


def second_family_functions():
    """Return normalized coefficients, with exact coordinate-ring checks."""
    u = first.u
    old_discriminant = first.D
    first.D = sp.Poly(u**3-u*u-8*u+112, u, domain=sp.QQ)
    try:
        U, V = first.Pair(u), first.Pair(0, 1)
        a = U*V-2*U*U-2*U-8
        b = (V-10)*(U+4)
        c = (2-U)*(U+4)
        curve = (3*a*a*b-4*a*b*b+b**3
                 +(a*a-14*a*b+9*b*b)*c+10*(a+b)*c*c)
        assert curve.is_zero()
        A = a*a*b-a*b*b+(3*a-7*b)*c*c
        B = c*(a*a+2*a*b-b*b+10*c*c)
        C = a*a*b-a*b*b+(7*a-3*b)*c*c
        D = -c*(a*a-2*a*b-b*b-10*c*c)
        E = -c*(a*a+b*b+2*(a+b)*c-10*c*c)
        F = -2*a*a*b+3*a*b*b-b**3-(a*a-8*a*b+7*b*b)*c-(a+3*b)*c*c
        G = -c*(a*a+b*b-2*(a+b)*c-10*c*c)
        H = -a*a*b+a*b*b+(6*a*b-2*b*b)*c+(3*a-11*b)*c*c
        assert (A*A+B*B-C*C-D*D).is_zero()
        assert (A*A+B*B-E*E-F*F).is_zero()
        assert (A*A+B*B-G*G-H*H).is_zero()
        assert (A*A*B*B+C*C*D*D-E*E*F*F-G*G*H*H).is_zero()
        P, Q, R, S = first.coefficients(a, b, c)
        result = []
        for top, bottom in [(Q, P**2), (R, P**4), (S*S, P**8)]:
            num, den = first.reduced_fraction(top, bottom)
            assert num.b.is_zero
            ratio = sp.cancel(num.a.as_expr()/den.as_expr())
            top, bottom = sp.fraction(ratio)
            result.append((sp.Poly(top, u), sp.Poly(bottom, u)))
        return result
    finally:
        first.D = old_discriminant


def cross_resultant():
    X = first.u
    w, fun_first = first.quotient_functions()
    fun_second = second_family_functions()
    f = fun_first[0][0]*fun_second[0][1].as_expr()-fun_second[0][0].as_expr()*fun_first[0][1]
    g = fun_first[1][0]*fun_second[1][1].as_expr()-fun_second[1][0].as_expr()*fun_first[1][1]
    print('cross bidegrees', sp.degree(f, w), sp.degree(f, X),
          sp.degree(g, w), sp.degree(g, X), flush=True)
    result = sp.Poly(sp.resultant(f, g, X), w, domain=sp.QQ)
    print('resultant degree', result.degree(), flush=True)
    constant, factors = sp.factor_list(result.as_expr(), w)
    print('factor degrees', [(sp.degree(p, w), k) for p, k in factors], flush=True)
    return result, constant, factors


def self_resultant(raw_output=None):
    X = first.u
    T = sp.Symbol('T')
    functions = second_family_functions()
    q = functions[0][0].as_expr()/functions[0][1].as_expr()
    r = functions[1][0].as_expr()/functions[1][1].as_expr()
    h = sp.cancel(r-sp.Rational(25, 9)*q*q)
    hn, hd = sp.fraction(h)
    assert max(sp.degree(hn, X), sp.degree(hd, X)) == 25
    qn, qd = functions[0][0].as_expr(), functions[0][1].as_expr()
    f = sp.cancel((qn*qd.subs(X, T)-qn.subs(X, T)*qd)/(X-T))
    g = sp.cancel((hn*hd.subs(X, T)-hn.subs(X, T)*hd)/(X-T))
    print('self bidegrees', sp.degree(f, X), sp.degree(f, T),
          sp.degree(g, X), sp.degree(g, T), flush=True)
    result = sp.Poly(sp.resultant(f, g, T), X, domain=sp.QQ)
    print('self resultant degree', result.degree(), flush=True)
    if raw_output:
        import json
        _, primitive = result.primitive()
        with open(raw_output, 'w') as file:
            json.dump({'degree': int(primitive.degree()),
                       'coefficients': [str(c) for c in primitive.all_coeffs()]}, file)
            file.write('\n')
    return result


def self_reduction(result):
    """Exact removal certificate; a full degree-624 factorization is unnecessary."""
    X = first.u
    factors = [
        (X-12, 2), (X-2, 4), (X+4, 2), (X+8, 38),
        (X*X-8*X+32, 48), (X*X-4*X-16, 2), (X*X-24, 1),
        (X*X+16, 38), (X*X+4*X+8, 46),
        (X**3-X*X-8*X+112, 1), (X**3+4*X*X+72*X+32, 1)]
    functions = second_family_functions()
    _, primitive = result.clear_denoms(convert=True)
    _, primitive = primitive.primitive()
    if primitive.LC() < 0:
        primitive = -primitive
    support = sp.Poly(1, X, domain=sp.ZZ)
    entries = []
    for expression, exponent in factors:
        factor = sp.Poly(expression, X, domain=sp.ZZ)
        witnesses = []
        for name, (numerator, denominator) in zip(('q', 'r', 'z'), functions):
            for part, polynomial in [('numerator', numerator), ('denominator', denominator)]:
                if sp.rem(polynomial, factor).is_zero:
                    witnesses.append(name+'_'+part)
        assert witnesses
        support *= factor**exponent
        entries.append({'degree': int(factor.degree()), 'exponent': exponent,
                        'coefficients': [str(c) for c in factor.all_coeffs()],
                        'zero_or_pole_witnesses': witnesses})
    remaining = primitive.exquo(support)
    assert support.degree() == 322 and remaining.degree() == 302
    assert support*remaining == primitive
    assert remaining.LC() % 11 == 8
    values = [int(remaining.eval(a)) % 11 for a in range(11)]
    assert values == [8, 2, 9, 3, 5, 6, 1, 3, 3, 7, 5]
    q = functions[0][0].as_expr()/functions[0][1].as_expr()
    r = functions[1][0].as_expr()/functions[1][1].as_expr()
    hn, _ = sp.fraction(sp.cancel(r-sp.Rational(25, 9)*q*q))
    return {'raw_degree': 624, 'remaining_degree': 302,
            'coefficients': [str(c) for c in remaining.all_coeffs()],
            'inadmissible_factors': entries, 'raw_normalization': '1',
            'h_numerator': [str(c) for c in sp.Poly(hn, X).all_coeffs()],
            'prime': 11, 'values': values}


def annotate_root_exclusions(data):
    """A root-free prime certifies each nonlinear factor has no Q root."""
    X = sp.Symbol('w')
    for factor in data['factors']:
        if factor['degree'] < 2:
            continue
        poly = sp.Poly.from_list([int(c) for c in factor['coefficients']], X)
        for prime in sp.primerange(2, 500):
            if poly.LC() % prime == 0:
                continue
            values = [int(poly.eval(a)) % prime for a in range(prime)]
            if all(values):
                factor['root_free_prime'] = int(prime)
                factor['values_mod_prime'] = values
                break
        else:
            raise AssertionError('No root-free prime found for this factor')
    return data


if __name__ == '__main__':
    import argparse, json
    parser = argparse.ArgumentParser()
    parser.add_argument('--cross', action='store_true')
    parser.add_argument('--self', action='store_true')
    parser.add_argument('--output')
    parser.add_argument('--raw-output')
    parser.add_argument('--annotate')
    parser.add_argument('--reduce-self')
    args = parser.parse_args()
    if args.reduce_self:
        with open(args.reduce_self) as file:
            raw = json.load(file)
        result = sp.Poly.from_list([sp.Rational(c) for c in raw['coefficients']], first.u)
        data = self_reduction(result)
        if args.output:
            with open(args.output, 'w') as file:
                json.dump(data, file, indent=2)
                file.write('\n')
        print({'exact_self_reduction': True, 'remaining_degree': 302, 'prime': 11})
    elif args.annotate:
        with open(args.annotate) as file:
            data = annotate_root_exclusions(json.load(file))
        with open(args.annotate, 'w') as file:
            json.dump(data, file, indent=2)
            file.write('\n')
        print({'rational_root_exclusions': len(data['factors'])-3})
    elif args.self:
        result = self_resultant(args.raw_output or (args.output+'.raw' if args.output else None))
        data = self_reduction(result)
        if args.output:
            with open(args.output, 'w') as file:
                json.dump(data, file, indent=2)
                file.write('\n')
        print({'exact_self_reduction': True, 'remaining_degree': 302, 'prime': 11})
    elif args.cross:
        resultant, constant, factors = cross_resultant()
        w = sp.Symbol('w')
        data = {
            'constant': str(constant),
            'degree': int(resultant.degree()),
            'factors': [{'degree': int(sp.degree(p, w)), 'exponent': int(k),
                         'coefficients': [str(c) for c in sp.Poly(p, w).all_coeffs()]}
                        for p, k in factors],
        }
        data = annotate_root_exclusions(data)
        if args.output:
            with open(args.output, 'w') as file:
                json.dump(data, file, indent=2)
                file.write('\n')
    else:
        for label, (top, bottom) in zip(('q', 'r', 'z'), second_family_functions()):
            print(label, 'degrees', top.degree(), bottom.degree())
            print(sp.factor(top.as_expr()/bottom.as_expr()))
