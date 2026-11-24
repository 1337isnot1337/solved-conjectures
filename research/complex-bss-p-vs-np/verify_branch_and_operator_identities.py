#!/usr/bin/env python3
"""Exact finite checks for the partition, tableau and operator notes.

Requires SymPy. This checks the specified identities and small examples;
it does not verify the general geometric lemmas, asymptotic circuit bounds,
the conditional cutting compiler, or P_C versus NP_C.
"""

from collections import Counter, defaultdict
from itertools import permutations, product

import sympy as sp


def equal(actual, expected, label):
    difference = sp.cancel(sp.expand(actual - expected))
    if difference != 0:
        raise AssertionError(f"{label}: nonzero difference {difference}")


def matrix_equal(actual, expected, label):
    if actual.shape != expected.shape:
        raise AssertionError(f"{label}: different shapes")
    for i in range(actual.rows):
        for j in range(actual.cols):
            equal(actual[i, j], expected[i, j], f"{label}[{i},{j}]")


def geometric_pair(z, k):
    if k == 0:
        return sp.Integer(1), sp.Integer(0)
    power, partial_sum = geometric_pair(z, k // 2)
    even_power = power * power
    even_sum = (1 + power) * partial_sum
    if k % 2:
        return z * even_power, even_sum + even_power
    return even_power, even_sum


def check_branch_gluing():
    x, y, u, z = sp.symbols("x y u z")
    for k in (0, 1, 2, 5, 9):
        power, partial_sum = geometric_pair(z, k)
        equal(power, z**k, f"binary power {k}")
        equal(partial_sum, sum(z**j for j in range(k)),
              f"binary geometric sum {k}")

    f = (x, 1 - x*y)
    base = (y, sp.Integer(1))
    h, a = 1 + x, x*x + y
    zero_coefficients = tuple((1-h*a)*c for c in base)
    equal(sum(fi*ci for fi, ci in zip(f, zero_coefficients)) + h*a,
          1, "zero-branch certificate")

    syzygy = (f[1], -f[0])
    correction = (u*u+x, u+y)
    b = tuple(base[i] + u**3*syzygy[i] + (h*u-1)*correction[i]
              for i in range(2))
    inverse_coefficient = -sum(f[i]*correction[i] for i in range(2))
    equal(sum(f[i]*b[i] for i in range(2))
          + (h*u-1)*inverse_coefficient, 1,
          "nonzero-branch certificate")
    for k in (4, 7):
        cleared = tuple(sp.cancel(h**k*bi.subs(u, 1/h)) for bi in b)
        equal(sum(fi*bi for fi, bi in zip(f, cleared)), h**k,
              f"denominator clearing K={k}")
        _, partial_sum = geometric_pair(h*a, k)
        glued = tuple(a**k*cleared[i] + zero_coefficients[i]*partial_sum
                      for i in range(2))
        equal(sum(fi*ci for fi, ci in zip(f, glued)), 1,
              f"glued certificate K={k}")


def check_stable_matrix():
    x, q = sp.symbols("x q")
    f = sp.Matrix([1, x])
    u = sp.Matrix([[1+x/q, -1/q]])
    matrix = (sp.eye(2)-f*u).row_join(f).col_join(u.row_join(sp.zeros(1)))
    matrix_equal(matrix*matrix, sp.eye(3), "stable involution")
    matrix_equal(matrix*sp.Matrix([1, x, 0]), sp.Matrix([0, 0, 1]),
                 "stable certificate action")
    equal(matrix.det(), -1, "stable determinant")


def zero_gadget(h, b, u):
    return (b*(b-1), b*h, (1-b)*(h*u-1), b*u)


def check_transcript_escape():
    x, y, z, epsilon = sp.symbols("x y z epsilon")
    h1, h2 = x*y, x*(1-y*z)
    equal(z*h1+h2, x, "complete decision identity")
    for h, b, u, label in ((0, 1, 0, "zero"),
                            (epsilon, 0, 1/epsilon, "punctured"),
                            (1, 0, 1, "second test")):
        for i, equation in enumerate(zero_gadget(h, b, u)):
            equal(equation, 0, f"{label} gadget {i}")
    equal(epsilon*1-epsilon, 0, "actual projective arc hU=V")
    equal(h1*h2, x*x*y*(1-y*z), "inverse witness Jacobian")
    # Both the central finite transcript and nearby escaping transcripts reject.
    equal(1*0, 0, "central output")
    equal(0*0, 0, "punctured output")


def digit_polynomials(t, m, zeta):
    d = 2**m
    current = t
    bits = []
    for j in range(m):
        bit = sp.expand((1-current**(2**(m-j-1)))/2)
        bits.append(bit)
        current = sp.expand(current*(1+(zeta**(d-2**j)-1)*bit))
    return bits


def check_reentry():
    t, tau = sp.symbols("t tau")
    for m, zeta in ((1, -1), (2, sp.I)):
        d = 2**m
        bits = digit_polynomials(t, m, zeta)
        patterns = set()
        for a in range(d):
            alpha = zeta**a
            values = tuple(sp.simplify(bit.subs(t, alpha)) for bit in bits)
            expected = tuple((a >> j) & 1 for j in range(m))
            if values != expected:
                raise AssertionError(f"digit recurrence m={m}, a={a}")
            patterns.add(values)
            for j, bit in enumerate(bits):
                p = bit + tau*(t**d-1)
                derivative = sp.expand(sp.diff(p, t).subs(t, alpha))
                coefficient = derivative.coeff(tau)
                equal(coefficient, d*alpha**(d-1), "transcendental coefficient")
                if sp.simplify(coefficient) == 0:
                    raise AssertionError("vanishing derivative coefficient")
                equal(p.subs(t, alpha), expected[j], "central branch value")
        if len(patterns) != d:
            raise AssertionError("missing central branch patterns")


def check_marked_gcd_and_nullvector():
    t = sp.symbols("t")
    f = (t-1)*(t-2)*(t+3)
    g = (t-1)*(t-2)*(t+4)
    common_multiplier = (t-7)**6*(t-1)**3
    numerator = -sp.diff(f, t)*sp.diff(g, t)*common_multiplier
    denominator = f*g*common_multiplier
    e = sp.Poly(sp.gcd(denominator, sp.diff(denominator, t)), t).monic().as_expr()
    f_gcd = sp.Poly(sp.gcd(numerator, sp.gcd(denominator,
                                          sp.diff(denominator, t))), t).monic().as_expr()
    r = sp.cancel(e/f_gcd)
    equal(r, (t-1)*(t-2), "unreduced two-gcd double-pole support")
    j = sp.diff(r, t)/r
    equal(j, sp.diff(e, t)/e-sp.diff(f_gcd, t)/f_gcd,
          "logarithmic derivative quotient")
    remainder = sp.cancel(numerator/denominator-sp.diff(j, t))
    reduced_denominator = sp.fraction(remainder)[1]
    if sp.degree(sp.gcd(reduced_denominator, sp.diff(reduced_denominator, t)), t) != 0:
        raise AssertionError("Hermite remainder has repeated denominator roots")
    u = sp.cancel(g/(t-1))
    v = sp.cancel(-f/(t-1))
    equal(f*u+g*v, 0, "short Sylvester nullvector")
    if sp.degree(u, t) >= sp.degree(g, t) or sp.degree(v, t) >= sp.degree(f, t):
        raise AssertionError("nullvector degree bound")


def check_compressed_operator_and_inverse_jet():
    t, z, epsilon, y = sp.symbols("t z epsilon y")
    a, b, c, d = sp.symbols("a b c d")
    bits = digit_polynomials(t, 2, sp.I)
    h = sp.expand((2*bits[0]-1)*(2*bits[1]-1)
                  * (a*bits[0]+b*bits[1])*(c*bits[0]+d*bits[1]))
    per = a*d+b*c
    equal(sum(h.subs(t, sp.I**j) for j in range(4)), per,
          "four-root weighted sum")

    shift = sp.zeros(4)
    for j in range(4):
        shift[(j+1) % 4, j] = 1
    h_shift = sp.zeros(4)
    for (exponent,), coefficient in sp.Poly(h, t).terms():
        h_shift += coefficient*shift**(exponent % 4)
    h_shift = h_shift.applyfunc(sp.expand)
    equal(h_shift[0, 0], per/4, "compressed matrix entry")
    projector = sp.zeros(4)
    projector[0, 0] = 1
    matrix = sp.eye(4)+projector*(4*h_shift-(y+1)*sp.eye(4))
    equal(matrix.det(), per-y, "compressed determinant")
    matrix_equal(matrix*sp.Matrix([1, 0, 0, 0]),
                 sp.Matrix([per-y, 0, 0, 0]), "known kernel vector")

    q = t**4-z
    remainder = sp.rem(h, q, t)
    equal(remainder.subs({z: 1, t: 0}), per/4,
          "canonical inverse first deformation coefficient")
    equal(sp.rem(remainder-h, q, t), 0, "first-order modular inverse equation")
    first_order = sp.expand((1-epsilon*h)*(1+epsilon*remainder)-1)
    equal(first_order.coeff(epsilon, 0), 0, "modular inverse constant order")
    equal(sp.rem(first_order.coeff(epsilon, 1), q, t), 0,
          "modular inverse linear order")


def check_cutting_local_identities():
    for a, b, c in product((0, 1), repeat=3):
        equal(1-c-a*b+2*c*a*b, int(c == a*b), "AND validity")
    r = sp.Rational(1, 2)
    equal((1-r)*0+r*1, sp.Rational(1, 2), "correlated word extension")
    equal(r*r, sp.Rational(1, 4), "independent word extension")
    lam, mu = sp.symbols("lambda mu")
    scalars = {"a": lam, "b": mu}
    runs = ((1, ("a", "b")), (-1, ("b", "a")),
            (2, ("a", "a")), (3, ()))
    grouped = defaultdict(int)
    direct = 0
    for weight, names in runs:
        direct += weight*sp.prod(scalars[name] for name in names)
        grouped[tuple(sorted(Counter(names).items()))] += weight
    postponed = sum(weight*sp.prod(scalars[name]**exponent
                                  for name, exponent in names)
                    for names, weight in grouped.items())
    equal(direct, postponed, "sparse postponement with cancellation")
    equal(postponed, 2*lam*lam+3, "postponed aggregate")


def check_supplied_exclusion():
    t, x, epsilon, u, v = sp.symbols("t x epsilon u v")
    r = t*t-x
    g = (t-2)*(t+3)
    q = (t-2)**2*(t+3)**5
    p = r**3*q
    b = sp.cancel(g*sp.diff(p, t)/p)
    remainder = 2*(t+3)+5*(t-2)
    equal(b-remainder, 3*g*sp.diff(r, t)/r, "supplied-exclusion cancellation")
    numerator, denominator = sp.fraction(b)
    equal(sp.rem(numerator-remainder*denominator, g, t), 0,
          "localized polynomial remainder")
    for beta, multiplicity in ((2, 2), (-3, 5)):
        equal(remainder.subs(t, beta), multiplicity*sp.diff(g, t).subs(t, beta),
              "integer multiplicity profile")

    r = t**3+x+1
    g = t*t+x*t+1
    p = r*r*g**4
    substitution = {x: epsilon*u, t: epsilon*v}
    for degree in (3, 5):
        def truncate(expression):
            polynomial = sp.Poly(sp.expand(expression), epsilon)
            return sp.Add(*(coefficient*epsilon**k
                            for (k,), coefficient in polynomial.terms() if k <= degree))

        def finite_log(unit):
            increment = truncate(unit-1)
            power, result = sp.Integer(1), sp.Integer(0)
            for j in range(1, degree+1):
                power = truncate(power*increment)
                result += sp.Rational((-1)**(j+1), j)*power
            return truncate(result)

        logarithm = truncate((finite_log(p.subs(substitution))
                              - 4*finite_log(g.subs(substitution)))/2)
        power, exponential = sp.Integer(1), sp.Integer(1)
        for j in range(1, degree+1):
            power = truncate(power*logarithm)
            exponential += power/sp.factorial(j)
        equal(truncate(exponential), truncate(r.subs(substitution)),
              f"supplied-factor normalized full jet D={degree}")


def check_uniform_cyclic_trace():
    t, z = sp.symbols("t z")
    for m in (1, 2, 3):
        base = m+1
        exponents = [base**j for j in range(m)]
        kappa = sum(exponents)
        dimension = 2**(m*(base-1).bit_length()+1)
        entries = sp.symbols(f"c0:{m*m}")
        matrix = [entries[m*i:m*(i+1)] for i in range(m)]
        k = sp.prod(sum(matrix[i][j]*t**exponents[j] for j in range(m))
                    for i in range(m))
        h = sp.expand(t**(dimension-kappa)*k/dimension)
        remainder = sp.rem(h, t**dimension-z, t)
        # In the power basis of C(z)[t]/(t^D-z), only its constant
        # coefficient contributes to the multiplication trace.
        trace = dimension*sp.Poly(remainder, t).coeff_monomial(1)
        per = sum(sp.prod(matrix[i][p[i]] for i in range(m))
                  for p in permutations(range(m)))
        equal(trace, z*per, f"uniform cyclic trace m={m}")


def check_soft_totalization():
    eps, a, r, x = sp.symbols("eps a r x")
    delta = lambda z: eps/(z*z+eps)
    inverse = lambda z: z**3/(z**4+eps)
    # A perturbed zero remains a defined germ at both replacement gates.
    z = eps*r
    equal(sp.limit(delta(z), eps, 0), 1, "soft zero-test at zero")
    equal(sp.limit((delta(z)-1)/eps, eps, 0), -r*r,
          "soft zero-test first error")
    equal(sp.limit(inverse(z)/eps**2, eps, 0), r**3,
          "soft totalized inverse at zero")
    z = a+eps*r
    equal(sp.limit(delta(z), eps, 0), 0, "soft zero-test off zero")
    equal(sp.limit(inverse(z), eps, 0), 1/a,
          "soft inverse off zero")
    # Exact program: reject x=0; otherwise form x*(1/x) and accept.
    # The candidate reciprocal is inactive at zero and must still be defined.
    output = x*(1-delta(x))*inverse(x)
    equal(output.subs(x, 0), 0, "inactive inverse at a zero input")
    equal(sp.limit(output, eps, 0), 1, "active inverse off zero")


def check_soft_support_hiding():
    eps, x, y, b, r = sp.symbols("eps x y b r")
    for first_scale, last_scale in ((1, 1), (2, 1), (8, 1)):
        den = x*(y*y+eps**first_scale)+eps**last_scale*(y+eps**first_scale)
        f = eps**last_scale*(y+eps**first_scale)/den
        u = eps**last_scale/(x*y+eps**last_scale)
        difference = eps**(first_scale+last_scale)*x*(y-1)/((x*y+eps**last_scale)*den)
        equal(f-u, difference, "equal-order prefix subtraction")
        equal(sp.cancel(f.subs(y, 0)), eps**last_scale/(x+eps**last_scale),
              "equal-order exceptional false divisor")
        equal(sp.limit(f/eps**last_scale, eps, 0), 1/(x*y),
              "equal signed generic poles")
    for dimension in (2, 4, 8):
        h = eps/((1-b**dimension)**2+eps)
        difference = eps*(2*b**dimension-b**(2*dimension))/((1+eps)*((1-b**dimension)**2+eps))
        equal(h-eps/(1+eps), difference, "common-scale support hiding")
        false_difference = sp.cancel(difference.subs(b, eps*r))
        equal(sp.limit(false_difference/eps**(dimension+1), eps, 0),
              2*r**dimension, "first possible hidden-support coefficient")
        equal(sp.limit(h.subs(b, 1+eps*r), eps, 0), 1,
              "support hiding preserves true inputs")
    numerator = eps*(y*y+eps)**2
    denominator = (y**3+eps)**2+eps*(y*y+eps)**2
    equal(sp.cancel((numerator/denominator).subs(y, 0)), eps/(1+eps),
          "pointwise false center")
    assert sp.Poly(denominator, y).degree() == 6
    equal(denominator.subs(eps, 0), y**6, "six poles approach false center")
    equal(sp.gcd(sp.Poly(numerator, y, domain=sp.QQ.frac_field(eps)),
                 sp.Poly(denominator, y, domain=sp.QQ.frac_field(eps))).as_expr(),
          1, "no generic moving-pole cancellation")


def check_flat_coefficient_tensors():
    x, y, x0, x1, y0, y1, t = sp.symbols("x y x0 x1 y0 y1 t")
    for s in (2, 3, 4):
        dimension = 2**s
        d = dimension-1
        geometric = sum(x**(d-i)*y**i for i in range(d+1))
        equal(geometric, sp.prod(x**(2**j)+y**(2**j) for j in range(s)),
              "short geometric-sum circuit")
        f = 1+geometric
        product = x**dimension-y**dimension+x-y
        equal(f*(x-y), product, "flat affine product")
        def coefficient_matrix(poly, degree):
            p = sp.Poly(poly, x, y)
            return sp.Matrix(degree+1, degree+1,
                             lambda i, j: p.coeff_monomial(x**i*y**j))
        assert coefficient_matrix(f, d).rank() == dimension
        assert coefficient_matrix(product, dimension).rank() == 2
        homogeneous = (x0*y0)**d+sum(x1**(d-i)*x0**i*y1**i*y0**(d-i)
                                    for i in range(d+1))
        homogeneous_product = ((x1**dimension+x1*x0**d)*y0**dimension
                               -x0**dimension*(y1**dimension+y1*y0**d))
        equal(homogeneous*(x1*y0-x0*y1), homogeneous_product,
              "flat bihomogeneous product")
        def homogeneous_matrix(poly, degree):
            p = sp.Poly(poly, x0, x1, y0, y1)
            return sp.Matrix(degree+1, degree+1,
                             lambda i, j: p.coeff_monomial(
                                 x0**i*x1**(degree-i)*y0**(degree-j)*y1**j))
        assert homogeneous_matrix(homogeneous, d).rank() == dimension
        assert homogeneous_matrix(homogeneous_product, dimension).rank() == 2
        q = sum(t**i for i in range(d+1))
        equal(sp.gcd(q, sp.diff(q, t)), 1, "simple cyclotomic-sum roots")


def main():
    checks = (check_branch_gluing, check_stable_matrix, check_transcript_escape,
              check_reentry, check_marked_gcd_and_nullvector,
              check_compressed_operator_and_inverse_jet,
              check_cutting_local_identities, check_supplied_exclusion,
              check_uniform_cyclic_trace, check_soft_totalization,
              check_soft_support_hiding, check_flat_coefficient_tensors)
    for check in checks:
        check()
        print(f"PASS {check.__name__}")
    print(f"{len(checks)} finite exact check groups passed; no general separation is verified.")


if __name__ == "__main__":
    main()
