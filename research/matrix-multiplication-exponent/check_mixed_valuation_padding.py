"""Exact control: a diagonal smoothing of N_(2,2) plus 3 trivial directions.

This uses the known seven-product Strassen factorization. It proves no new
matrix multiplication rank bound. Dependency: SymPy.
"""

from itertools import combinations
import sympy as s

t = s.symbols("t", nonzero=True)
A = s.Matrix([[1,0,0,1],[0,0,1,1],[1,0,0,0],[0,0,0,1],
              [1,1,0,0],[-1,0,1,0],[0,1,0,-1]])
B = s.Matrix([[1,0,0,1],[1,0,0,0],[0,1,0,-1],[-1,0,1,0],
              [0,0,0,1],[1,1,0,0],[0,0,1,1]])
U = s.Matrix([[1,0,0,1,-1,0,1],[0,0,1,0,1,0,0],
              [0,1,0,1,0,0,0],[1,-1,1,0,0,1,0]])
H = B.row_join(s.eye(7)[:, :3])
assert H.det() == -1
D = s.diag(1,1,1,1,t,t,t)
J = H * D
G = s.BlockMatrix([[s.eye(4), t**-2 * U],
                   [s.zeros(7,4), J.inv()]]).as_explicit()
Ginv = s.BlockMatrix([[s.eye(4), -t**-2 * U * J],
                      [s.zeros(7,4), J]]).as_explicit()
assert s.simplify(G * Ginv) == s.eye(11)

family = []
for index in range(4):
    unit = s.zeros(2)
    unit[index // 2, index % 2] = 1
    L = s.kronecker_product(unit, s.eye(2))
    diagonal = s.diag(*A[:, index])
    assert U * diagonal * B == L
    M = s.BlockMatrix([[s.zeros(4), U * diagonal * J],
                       [s.zeros(7,4), t**2 * J.inv() * diagonal * J]]).as_explicit()
    M = M.applyfunc(s.expand)
    for entry in M:
        s.Poly(entry, t, domain=s.QQ)  # Reject any Laurent pole.
    special = s.zeros(11)
    special[:4, 4:8] = L
    assert M.subs(t, 0) == special
    eigenvalues = s.diag(*([0] * 4 + [t**2 * x for x in A[:, index]]))
    assert s.simplify(M - G * eigenvalues * Ginv) == s.zeros(11)
    family.append(M)

for X, Y in combinations(family, 2):
    assert s.simplify(X * Y - Y * X) == s.zeros(11)

print("Seven-product factorization: exact on all 4 matrix units.")
print("Completion H is integral with determinant -1.")
print("Four 11x11 families have polynomial entries and special tuple N_(2,2) plus 3 zero directions.")
print("All six commutators vanish exactly; one Laurent matrix diagonalizes every generator.")
print("This is a control construction using Strassen rank 7, not a new rank bound.")
