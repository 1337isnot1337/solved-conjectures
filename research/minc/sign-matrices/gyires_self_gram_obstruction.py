"""Exact certificate for the self-Gram stability/Lorentzian obstruction.

This is not a counterexample to Gyires's inequality.
"""

from itertools import permutations
import sympy as s


def permanent(matrix):
    n = matrix.rows
    return s.expand(sum(
        s.prod(matrix[i, permutation[i]] for i in range(n))
        for permutation in permutations(range(n))
    ))


x = s.symbols("x1:5")
t, y = s.symbols("t y")
A = s.zeros(4)
for i in range(4):
    A[i, i] = s.Rational(1, 2)
    A[i, (i + 1) % 4] = s.Rational(1, 2)

F = permanent(A * s.diag(*x) * A.T)
collapse = s.factor(F.subs(dict(zip(x, (t, y, y, y)))))
assert collapse == y**2 * (5*t**2 + 8*t*y + 5*y**2) / 128
assert s.discriminant(128 * collapse.subs(y, 1), t) == -36

quadratic = s.expand(s.diff(128 * collapse, y, 2))
hessian = s.hessian(quadratic, (t, y))
assert quadratic == 10*t**2 + 48*t*y + 60*y**2
assert hessian == s.Matrix([[20, 48], [48, 120]])
assert hessian.det() == 96 and s.trace(hessian) > 0

central = s.Poly(F, *x).coeff_monomial(s.prod(x))
p = permanent(A)
gram = permanent(A * A.T)
beta = s.factorial(4) / s.Integer(4)**4
assert p == s.Rational(1, 8)
assert central == p*p == s.Rational(1, 64)
assert gram == F.subs(dict.fromkeys(x, 1)) == s.Rational(9, 64)
assert p*p - beta*gram == s.Rational(5, 2048)
print("Exact self-Gram stability and Lorentzian obstructions verified.")
print("The Gyires Gram gap is positive: 5/2048.")
