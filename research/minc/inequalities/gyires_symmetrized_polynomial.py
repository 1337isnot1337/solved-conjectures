"""Exact check of a Gyires proof-method obstruction, not the conjecture."""

from itertools import permutations
import sympy as s


def permanent(matrix):
    return s.expand(sum(s.prod(matrix[i, p[i]] for i in range(matrix.rows))
                        for p in permutations(range(matrix.rows))))


A = s.Matrix([[0, 1, 0, 0], [1, 0, 1, 1], [1, 0, 1, 1], [1, 0, 1, 1]])
A[0, 1] = 3
A /= 3
assert all(sum(A.row(i)) == sum(A.col(i)) == 1 for i in range(4))
x = s.symbols('x1:5')
t, y = s.symbols('t y')
p = s.prod(sum(A[i, j] * x[j] for j in range(4)) for i in range(4))
pt = s.prod(sum(A[j, i] * x[j] for j in range(4)) for i in range(4))
q = s.Poly(s.expand(p + pt), *x)
G = s.expand(27*q.as_expr().subs(dict(zip(x, (t, y, y, y)))))
assert G == t**3*y + 6*t**2*y**2 + 39*t*y**3 + 8*y**4
assert s.diff(G.subs(y, 1), t) == 3*t**2 + 12*t + 39
H = s.hessian(s.diff(G, t, y), (t, y))
assert H == s.Matrix([[6, 24], [24, 234]]) and H.det() == 828
pA, gram_left, gram_right, square = map(permanent, (A, A*A.T, A.T*A, A*A))
assert (pA, gram_left, gram_right, square) == (s.Rational(2,9), s.Rational(2,9), s.Rational(2,9), s.Rational(8,81))
fischer_norm = sum(s.prod(s.factorial(v) for v in alpha)*coefficient**2
                   for alpha, coefficient in q.terms())
assert fischer_norm == gram_left+gram_right+2*square == s.Rational(52,81)
assert q.coeff_monomial(s.prod(x)) == 2*pA
assert 4*pA**2/fischer_norm == s.Rational(4,13) > s.Rational(3,32)
print('Exact symmetrized-row polynomial obstruction verified.')
print('Gyires holds at the witness: ratio 4/13 > 3/32.')
