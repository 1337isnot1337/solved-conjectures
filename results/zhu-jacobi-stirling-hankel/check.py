"""Recompute the exact decisive Jacobi–Stirling Hankel minor."""
from sympy import Matrix, expand, symbols

a, b, x = symbols("a b x")
row, moment = [1], [1]
for n in range(1, 5):
    prev = row + [0]
    row = [
        expand((prev[k - 1] if k else 0) + (a * k**2 + b * k) * prev[k])
        for k in range(n + 1)
    ]
    moment.append(sum(v * x**k for k, v in enumerate(row)))

minor = expand(Matrix(3, 3, lambda i, j: moment[i + j]).det())
assert expand(minor - 2*x**3*(6*a**3 + 11*a**2*b + 6*a*b**2 + b**3 - 2*a**2*x)) == 0
assert minor.coeff(a, 2).coeff(x, 4) == -4
assert minor.subs({a: 1, b: 1, x: 13}) == -4*13**3
print("Exact 3-by-3 minor checked, including the negative coefficient and evaluation.")
