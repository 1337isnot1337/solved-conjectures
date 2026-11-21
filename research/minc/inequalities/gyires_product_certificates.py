"""Exact obstructions to two auxiliary Gyires proof steps; no conjecture resolution."""

from itertools import permutations

import sympy as s


def permanent(matrix):
    n = matrix.rows
    assert matrix.cols == n
    return s.expand(sum(s.prod(matrix[i, p[i]] for i in range(n))
                        for p in permutations(range(n))))


def check_doubly_stochastic(matrix):
    assert all(value >= 0 for value in matrix)
    assert all(sum(matrix[i, :]) == 1 for i in range(matrix.rows))
    assert all(sum(matrix[:, j]) == 1 for j in range(matrix.cols))


x = s.symbols("x1:5")
A = s.Matrix([[1, 1, 0, 0], [1, 1, 0, 0],
              [0, 0, 1, 1], [0, 0, 1, 1]]) / 2
B = s.Matrix([[1, 0, 1, 0], [0, 1, 0, 1],
              [1, 0, 1, 0], [0, 1, 0, 1]]) / 2
check_doubly_stochastic(A)
check_doubly_stochastic(B)
assert A * B == s.ones(4) / 4
F = permanent(A * s.diag(*x) * B)
expected = (x[0]**2*x[3]**2 + 4*s.prod(x) + x[1]**2*x[2]**2) / 64
assert s.expand(F - expected) == 0
c = 2 + s.sqrt(3)
upper_half_plane_point = [c*(-1+s.I), 1+s.I, 1+s.I, -1+s.I]
assert all(s.im(z) > 0 for z in upper_half_plane_point)
assert s.simplify(F.subs(dict(zip(x, upper_half_plane_point)))) == 0
assert permanent(A) == permanent(B) == s.Rational(1, 4)
assert permanent(A*B) == s.Rational(3, 32)

y = s.symbols("y1:4")
A = s.Matrix([[s.Rational(1, 2), s.Rational(1, 2), 0],
              [s.Rational(1, 4), 0, s.Rational(3, 4)],
              [s.Rational(1, 4), s.Rational(1, 2), s.Rational(1, 4)]])
check_doubly_stochastic(A)
F = permanent(A * s.diag(*y) * A.T)
expected = (3*y[0]**3 + 9*y[0]**2*y[1] + 16*y[0]**2*y[2]
            + 4*y[0]*y[1]**2 + 50*s.prod(y) + 9*y[0]*y[2]**2
            + 36*y[1]**2*y[2] + 9*y[1]*y[2]**2) / 512
assert s.expand(F - expected) == 0
one = dict.fromkeys(y, 1)
gradient = [s.diff(F, z).subs(one) for z in y]
assert permanent(A) == s.Rational(5, 16)
assert F.subs(one) == s.Rational(17, 64)
assert gradient == [s.Rational(61, 256), s.Rational(74, 256), s.Rational(69, 256)]
assert gradient[0] - gradient[1] == -s.Rational(13, 256)

print("PASS: exact nonstability and capacity obstructions.")
print("Both examples satisfy the proposed scalar product inequality; neither refutes Gyires.")
