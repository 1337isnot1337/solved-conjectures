"""Exact proof-method diagnostics for Marcus C9, not conjecture counterexamples.

Run with Python 3 and SymPy. No network access and no random or floating search.
"""
from itertools import combinations, permutations
from math import factorial
import sympy as s

x, y = s.symbols('x y', real=True)
r, c = s.symbols('r c', real=True)


def permanent(matrix):
    n = matrix.rows
    return s.expand(sum(s.prod(matrix[i, perm[i]] for i in range(n))
                        for perm in permutations(range(n))))


def inner(f, g):
    fp = s.Poly(s.expand(f), x, y)
    gp = dict(s.Poly(s.expand(g), x, y).terms())
    return s.expand(sum(coef * s.conjugate(gp.get(alpha, 0))
                        * factorial(alpha[0]) * factorial(alpha[1])
                        for alpha, coef in fp.terms()))


def adjoint(f, g):
    return s.expand(sum(s.conjugate(coef) * s.diff(g, x, alpha[0], y, alpha[1])
                        for alpha, coef in s.Poly(f, x, y).terms()))


def commutator(fi, fj, g):
    return s.expand(adjoint(fi, fj*g) - fj*adjoint(fi, g))


# Instability of the principal-permanent polynomial.
z1, z2 = s.symbols('z1 z2')
unstable = 1 + z1 + z2 + 2*z1*z2
assert s.simplify(unstable.subs({z1: s.I, z2: (-3+s.I)/5})) == 0

# A negative commutator compression, computed by differentiation.
packets = [x*x, x*y]
vectors = [y*y, -x*y]
quadratic_form = s.expand(sum(inner(commutator(packets[i], packets[j], vectors[j]),
                                    vectors[i]) for i in range(2) for j in range(2)))
assert quadratic_form == -1
print('Natural commutator block quadratic form:', quadratic_form)

# Gaussian replacement expansion for three squared linear forms.
B = s.Matrix(3, 3, lambda i, j: 1 if i == j else r)
G = 2*B.applyfunc(lambda z: z*z)


def moment(rows, cols):
    rr = [i for i in rows for _ in range(2)]
    cc = [j for j in cols for _ in range(2)]
    return permanent(B.extract(rr, cc))


base = permanent(G)
full = moment(range(3), range(3))
S4 = 0
for rows in combinations(range(3), 2):
    for cols in combinations(range(3), 2):
        i = next(a for a in range(3) if a not in rows)
        j = next(a for a in range(3) if a not in cols)
        S4 += (moment(rows, cols) - permanent(G.extract(rows, cols)))*G[i, j]
S4 = s.expand(S4)
K6 = s.expand(full - base - S4)
assert s.expand(base - (8+24*r**4+16*r**6)) == 0
assert s.expand(S4 - 96*r*r*(1+2*r**3)) == 0
assert s.expand(K6 - 64*r**3*(r**3+3*r+2)) == 0
assert K6.subs(r, s.Rational(-1, 2)) == -3
assert s.expand(2*S4+3*K6 - 192*r*r*(r*r+r+1)**2) == 0
print('Sixth balanced cumulant at r=-1/2:', K6.subs(r, s.Rational(-1, 2)))
print('Gaussian replacement derivative at t=1:', s.factor(2*S4+3*K6))

# The duplicated Tran seed. All formulas are polynomial identities.
omega = [s.I, -1, -s.I, 1, 0]
H = s.Matrix(5, 5, lambda i, j: 1+c*omega[i]*s.conjugate(omega[j]))
q = permanent(H.applyfunc(lambda z: z*z))
assert s.expand(q - 8*(3*c**8+86*c**4+15)) == 0
# Product of the ten linear forms after duplicating each packet.
F = (x**5-c*c*x*y**4)**2
p = inner(F, F)
gap = s.expand(p-32*q)
assert s.expand(gap-2048*(39*c**8+23*c**4+1770)) == 0
assert [p.subs(c,2), 32*q.subs(c,2)] == [25378560,552704]
print('Duplicated Tran-family gap:', s.factor(gap))
print('Exact permanents at c=2:', p.subs(c,2), 32*q.subs(c,2))
print('All exact certificates passed. No counterexample to Marcus C9 is asserted.')
