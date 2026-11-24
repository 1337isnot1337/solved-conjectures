"""Exact coordinate-ring checks for the Bremner square-chain probe.

This script uses Q[u,v]/(v^2-(u-4)(u-3)(u+6)).  No numerical
approximation or finite-point test is used for identities.
"""
import sympy as sp

u = sp.Symbol('u')
ZERO = sp.Poly(0, u, domain=sp.QQ)
ONE = sp.Poly(1, u, domain=sp.QQ)
D = sp.Poly((u-4)*(u-3)*(u+6), u, domain=sp.QQ)


class Pair:
    def __init__(self, a=0, b=0):
        self.a = a if isinstance(a, sp.Poly) else sp.Poly(a, u, domain=sp.QQ)
        self.b = b if isinstance(b, sp.Poly) else sp.Poly(b, u, domain=sp.QQ)

    @staticmethod
    def cast(other):
        return other if isinstance(other, Pair) else Pair(other)

    def __add__(self, other):
        other = self.cast(other)
        return Pair(self.a+other.a, self.b+other.b)

    __radd__ = __add__

    def __neg__(self):
        return Pair(-self.a, -self.b)

    def __sub__(self, other):
        return self + -self.cast(other)

    def __rsub__(self, other):
        return self.cast(other) + -self

    def __mul__(self, other):
        other = self.cast(other)
        return Pair(self.a*other.a+self.b*other.b*D,
                    self.a*other.b+self.b*other.a)

    __rmul__ = __mul__

    def __pow__(self, exponent):
        assert isinstance(exponent, int) and exponent >= 0
        result, base = Pair(1), self
        while exponent:
            if exponent & 1:
                result = result*base
            exponent >>= 1
            if exponent:
                base = base*base
        return result

    def conjugate(self):
        return Pair(self.a, -self.b)

    def is_zero(self):
        return self.a.is_zero and self.b.is_zero


def coefficients(a, b, c):
    """P,Q,R,S polynomially, using F^2=2P-E^2 and H^2=2P-G^2."""
    A = a*a*b-a*b*b+3*a*c*c-7*b*c*c
    B = c*(a*a+2*a*b-b*b+10*c*c)
    C = a*a*b-a*b*b+7*a*c*c-3*b*c*c
    E = -c*(a*a+b*b+2*a*c+2*b*c-10*c*c)
    G = -c*(a*a+b*b-2*a*c-2*b*c-10*c*c)
    P = (A*A+B*B)*sp.Rational(1, 2)
    Q = ((A*A-P)**2+(C*C-P)**2)*sp.Rational(1, 2)
    r1 = ((A*A-P)**2-(C*C-P)**2)*sp.Rational(1, 2)
    r2 = ((E*E-P)**2-(G*G-P)**2)*sp.Rational(1, 2)
    R = (r1*r1+r2*r2)*sp.Rational(1, 2)
    S = (r1*r1-r2*r2)*sp.Rational(1, 2)
    return P, Q, R, S


def family():
    U, V = Pair(u), Pair(0, 1)
    a = (-21+4*U)*(3-10*U+2*U*U+V)
    b = 171+102*U-44*U*U-69*V-4*U*V
    c = (-21+4*U)*(-15+5*U+2*V)
    return U, V, (a, b, c), coefficients(a, b, c)


def reduced_fraction(numerator, denominator):
    """Return a+b*v over scalar polynomial d, cancelling common factors."""
    top = numerator*denominator.conjugate()
    bottom_pair = denominator*denominator.conjugate()
    assert bottom_pair.b.is_zero
    bottom = bottom_pair.a
    common = sp.gcd(sp.gcd(top.a, top.b), bottom)
    a, b, d = (x.exquo(common) for x in (top.a, top.b, bottom))
    leading = d.LC()
    return Pair(a.mul_ground(1/leading), b.mul_ground(1/leading)), d.monic()


def check_involution():
    U, V, abc, (P, Q, R, S) = family()
    ell = U-2
    Un = (V-4)**2-(U+1)*ell**2
    Vn = V*ell**3-(V-4)*(U*ell**2-Un)
    aa = (-21*ell**2+4*Un)*(3*ell**4-10*Un*ell**2+2*Un**2+Vn*ell)
    bb = ell*(171*ell**5+102*Un*ell**3-44*Un**2*ell-69*Vn*ell**2-4*Un*Vn)
    cc = ell*(-21*ell**2+4*Un)*(-15*ell**3+5*Un*ell+2*Vn)
    p, q, r, s = coefficients(aa, bb, cc)
    assert (q*P**2+Q*p**2-P**2*p**2).is_zero()
    assert (r*P**4-R*p**4).is_zero()
    assert (s*s*P**8-S*S*p**8).is_zero()
    return 3


def quotient_coordinate():
    """x coordinate after a 2-isogeny and rational translation."""
    U, V = Pair(u), Pair(0, 1)
    t = U-3
    xn = (U+6)*(U-4)
    numerator = 5*(xn*xn-7*xn*t+100*t*t-6*V*(t*t+9))
    denominator = sp.Poly((u*u-3*u-9)**2, u, domain=sp.QQ)
    return numerator, denominator


def fit_quotient_function(numerator, denominator, degree):
    """Solve the exact coordinate-ring identity f=N(w)/D(w)."""
    wn, wd = quotient_coordinate()
    basis = [wn**i*Pair(wd**(degree-i)) for i in range(degree+1)]
    columns = [b*Pair(denominator) for b in basis]
    columns += [-b*numerator for b in basis]
    bound = max(max(c.a.degree(), c.b.degree()) for c in columns)
    matrix = sp.Matrix([[c.a.nth(j) for c in columns] for j in range(bound+1)]
                       + [[c.b.nth(j) for c in columns] for j in range(bound+1)])
    kernel = matrix.nullspace()
    if not kernel:
        return None
    w = sp.Symbol('w')
    vector = kernel[0]
    top = sum(vector[i]*w**i for i in range(degree+1))
    bottom = sum(vector[i+degree+1]*w**i for i in range(degree+1))
    return sp.factor(sp.cancel(top/bottom))


def quotient_functions():
    w = sp.Symbol('w')
    qn = 5*(w*w-10*w+40)*(w**3-20*w*w+1700*w+2000)
    qd = 9*(w+10)*(w*w+100)**2
    rn = 3200*w*(w-20)**2*(w-5)**2*(
        3*w**6-478*w**5+28220*w**4-435600*w**3
        +2822000*w*w-4780000*w+3000000)
    rd = 81*(w+10)**4*(w*w+100)**4
    zn = 51200000*w*w*(w-50)**2*(w-20)**4*(w-10)**2*(w-5)**4*(w-2)**2*(
        w*w-160*w+100)**2*(w*w-16*w+100)
    zd = 6561*(w+10)**8*(w*w+100)**8
    return w, [(qn, qd), (rn, rd), (zn, zd)]


def homogeneous_evaluation(poly, numerator, denominator, degree):
    w = sp.Symbol('w')
    p = sp.Poly(poly, w, domain=sp.QQ)
    return sum((numerator**i*Pair(denominator**(degree-i))*p.nth(i)
                for i in range(degree+1)), Pair())


def check_quotient():
    _, _, _, (P, Q, R, S) = family()
    wn, wd = quotient_coordinate()
    w, functions = quotient_functions()
    source_pairs = [(Q, P**2), (R, P**4), (S*S, P**8)]
    checks = 0
    for (top, bottom), (source_top, source_bottom) in zip(functions, source_pairs):
        degree = max(sp.degree(top, w), sp.degree(bottom, w))
        top_value = homogeneous_evaluation(top, wn, wd, degree)
        bottom_value = homogeneous_evaluation(bottom, wn, wd, degree)
        assert (source_top*bottom_value-source_bottom*top_value).is_zero()
        assert sp.gcd(top, bottom) == 1
        checks += 1
    q, r, z = (sp.cancel(a/b) for a, b in functions)
    assert sp.cancel(q.subs(w, 100/w)+q-1) == 0
    assert sp.cancel(r.subs(w, 100/w)-r) == 0
    assert sp.cancel(z.subs(w, 100/w)-z) == 0
    return checks+3


def resultant_certificate():
    from math import isqrt
    w, functions = quotient_functions()
    v = sp.Symbol('v')
    (qn, qd), (rn, rd), _ = functions
    first = sp.cancel((qn*qd.subs(w, v)-qn.subs(w, v)*qd)/(w-v))
    second = sp.cancel((rn*rd.subs(w, v)-rn.subs(w, v)*rd)/(w-v))
    resultant = sp.Poly(sp.resultant(first, second, v), w, domain=sp.QQ)
    content, primitive = resultant.primitive()
    if primitive.LC() < 0:
        content, primitive = -content, -primitive
    quadratics = [
        w*w-340*w+100, w*w-280*w+2500, w*w-180*w+500,
        w*w-120*w+400, w*w-64*w+484, w*w-40*w+100,
        w*w-36*w+20, w*w-30*w+25, 5*w*w-56*w+20,
        121*w*w-1600*w+2500]
    prefactor = sp.Poly((w+10)**8*(w*w+100)**18*sp.prod(quadratics), w)
    remaining = primitive.exquo(prefactor)
    assert remaining.degree() == 24
    assert remaining.LC() == 734930659
    assert primitive == prefactor*remaining
    discriminants = [int(sp.discriminant(f, w)) for f in quadratics]
    assert all(a < 0 or isqrt(a)**2 != a for a in discriminants)
    assert int(remaining.LC()) % 13 != 0
    residues = [int(remaining.eval(i)) % 13 for i in range(13)]
    assert all(residues)
    return {
        'sympy_version': sp.__version__,
        'resultant_degree': int(resultant.degree()),
        'resultant_content': str(content),
        'excluded_pole_factors': [[10, 1], [100, 0, 1]],
        'excluded_pole_exponents': [8, 18],
        'quadratics_low_degree_first': [list(reversed([int(c) for c in sp.Poly(f, w).all_coeffs()]))
                                        for f in quadratics],
        'quadratic_discriminants': discriminants,
        'remaining_coefficients_low_degree_first': list(reversed([int(c) for c in remaining.all_coeffs()])),
        'remaining_values_mod_13': residues,
    }


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('--involution', action='store_true')
    parser.add_argument('--quotient', action='store_true')
    parser.add_argument('--verify', action='store_true')
    parser.add_argument('--certificate')
    args = parser.parse_args()
    if args.involution:
        print({'exact_involution_identities': check_involution()})
    elif args.verify or args.certificate:
        import json
        certificate = resultant_certificate()
        certificate['involution_identities'] = check_involution()
        certificate['quotient_and_hadamard_identities'] = check_quotient()
        if args.certificate:
            with open(args.certificate, 'w') as file:
                json.dump(certificate, file, indent=2)
                file.write('\n')
        print({'verified': True,
               'involution_identities': certificate['involution_identities'],
               'quotient_and_hadamard_identities': certificate['quotient_and_hadamard_identities'],
               'resultant_degree': certificate['resultant_degree'],
               'remaining_values_mod_13': certificate['remaining_values_mod_13']})
    elif args.quotient:
        _, _, _, (P, Q, R, S) = family()
        for name, top, bottom, degree in [('q', Q, P**2, 5), ('r', R, P**4, 12),
                                           ('z', S*S, P**8, 24)]:
            num, den = reduced_fraction(top, bottom)
            result = fit_quotient_function(num, den, degree)
            print(name, result, flush=True)
    else:
        _, _, _, (P, Q, R, S) = family()
        for name, top, bottom in [('q', Q, P**2), ('r', R, P**4), ('z', S*S, P**8)]:
            num, den = reduced_fraction(top, bottom)
            print(name, num.a.degree(), num.b.degree(), den.degree())
            print('denominator factors:', sp.factor(den.as_expr()))
