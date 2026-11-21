"""Exact diagnostics for the written Lyapunov positivity counterexample."""
from fractions import Fraction as F
import sympy as sp

checks = 0

def require(condition):
    global checks
    assert condition
    checks += 1

b = [F(4, 5), F(3, 5)]
h = [F(7, 4), F(1)]
power = [F(1168, 1323), F(3, 17)]
d = [1 / (1 + h[i] ** 2 * power[i]) for i in range(2)]
g = [[F(1), F(1)], [F(53, 40), F(840, 1961)]]
require(d == [F(27, 100), F(17, 20)])
j = [[sum(g[l][i] * g[l][k] * (b[i] * b[k] - d[l]) /
          (1 - b[i] * b[k]) for l in range(2))
      for k in range(2)] for i in range(2)]
require(j == [[F(211, 57600), F(0)], [F(0), F(35289, 246113344)]])
require(j[0][0] > 0 and j[1][1] > 0)
for i in range(2):
    for k in range(2):
        rhs = b[i] * j[i][k] * b[k]
        rhs -= sum(g[l][i] * d[l] * g[l][k] for l in range(2))
        rhs += b[i] * b[k] * sum(g[l][i] * g[l][k] for l in range(2))
        require(rhs == j[i][k])

thresholds = {
    (0, 0): (1 / (b[0] * b[1]) ** 2 - 1) / h[0] ** 2,
    (1, 1): (1 / (b[0] * b[1]) ** 2 - 1) / h[1] ** 2,
    (0, 1): (1 / b[0] ** 2 - 1) / h[0] ** 2 + (1 / b[1] ** 2 - 1) / h[1] ** 2,
    (1, 0): (1 / b[0] ** 2 - 1) / h[1] ** 2 + (1 / b[1] ** 2 - 1) / h[0] ** 2,
}
require(thresholds == {(0, 0): F(481, 441), (1, 1): F(481, 144),
                       (0, 1): F(865, 441), (1, 0): F(8065, 7056)})
require(sum(power) == F(23825, 22491))
require(min(thresholds.values()) - sum(power) == F(706, 22491))
require(all(v > sum(power) for v in thresholds.values()))

u, v, z, x = sp.symbols('u v z x')
m = sp.Matrix([[(a * c - z) / (1 - a * c) for c in (u, v)] for a in (u, v)])
expected = ((u - v) ** 2 * (1 - z) * (u ** 2 * v ** 2 - z) /
            ((1 - u ** 2) * (1 - v ** 2) * (1 - u * v) ** 2))
require(sp.factor(m.det() - expected) == 0)
p0 = sp.Rational(73, 27) / x + sp.Rational(3, 17)
require(sp.factor(sp.Rational(481, 144) / x - p0 -
                  (sp.Rational(275, 432) / x - sp.Rational(3, 17))) == 0)
require(sp.factor(sp.Rational(9, 16) + sp.Rational(16, 9) / x - p0 -
                  (sp.Rational(105, 272) - sp.Rational(25, 27) / x)) == 0)
require(F(1360, 567) < h[0] ** 2 < F(4675, 1296))
require(F(1360, 567) > 1)
print(f'PASS: {checks} exact rational and symbolic checks.')
print('The full four-assignment argument and open parameter family are proved in PROOF.md.')
