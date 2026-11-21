"""Symbolic diagnostic for HLTV Conjecture 8.1, not a complete proof.

Source: arXiv:2607.15503, Theorem 3.5 and Lemma 5.1.
Compute the complete parameter polynomials in each requested dimension.
"""
import sys
import time
import sympy as s


def sum_powers(expr, r, upper):
    out = 0
    for (degree,), coefficient in s.Poly(expr, r).terms():
        power_sum = (s.bernoulli(degree + 1, upper + 1)
                     - s.bernoulli(degree + 1, 1)) / (degree + 1)
        out += coefficient * power_sum
    return s.expand(out)


def next_lattice(previous, n):
    b = s.symbols('b1:' + str(n + 1))
    old = b[:-1]
    r = s.Symbol('r')

    def at(values):
        return previous.xreplace(dict(zip(old, values)))

    out = b[0] * at((b[0] + b[1],) + b[2:])
    for ell in range(1, n - 1):
        values = (b[:ell - 1] + (b[ell - 1] + b[ell] - r,
                  b[ell + 1] + r) + b[ell + 2:])
        out += sum_powers(at(values), r, b[ell])
    out += sum_powers(at(b[:-2] + (b[-2] + b[-1] - r,)), r, b[-1])
    return s.expand(out)


def magic_coefficients(lattice, n):
    b = s.symbols('b1:' + str(n + 1))
    x = s.symbols('x1:' + str(n + 1))
    t = s.Symbol('t')
    substitutions = {b[0]: 1 + t*x[0]}
    substitutions.update({b[i]: t*(1+x[i]) for i in range(1,n)})
    e = s.Poly(s.expand(lattice.xreplace(substitutions)), t)
    return [s.Poly(s.expand(sum((-1)**(j-i)*s.binomial(n-i,j-i)
                *e.nth(i) for i in range(j+1))), *x) for j in range(n+1)]


if __name__ == '__main__':
    upto = int(sys.argv[1]) if len(sys.argv)>1 else 5
    start = time.monotonic()
    lattice = s.Symbol('b1')
    for n in range(2, upto+1):
        lattice = next_lattice(lattice, n)
        magic = magic_coefficients(lattice, n)
        bad = [(j, monomial, str(coefficient)) for j, p in enumerate(magic)
               for monomial, coefficient in p.terms() if coefficient < 0]
        print({'n':n,'lattice_terms':len(s.Poly(lattice).terms()),
               'magic_terms':sum(len(p.terms()) for p in magic),
               'negative_coefficients':bad[:15],
               'negative_count':len(bad),
               'seconds':round(time.monotonic()-start,2)},flush=True)
        if n<=3:
            print('lattice:',lattice,flush=True)
            print('magic:',[p.as_expr() for p in magic],flush=True)
