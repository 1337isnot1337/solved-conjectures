"""Exact obstruction to fractional-density transfer of the weighted certificate."""
from fractions import Fraction
from check import B, S, n

def pivot_signs(t):
    a = [[Fraction(B[i][j] - (t if i == j else 0))
          for j in range(n)] for i in range(n)]
    signs = []
    for k in range(n):
        p = a[k][k]
        assert p != 0
        signs.append('+' if p > 0 else '-')
        for i in range(k + 1, n):
            for j in range(k + 1, n):
                a[i][j] -= a[i][k] * a[k][j] / p
    return ''.join(signs)

for t, expected in ((339, '----------'),
                    (193, '-----+----'),
                    (188, '-----+---+')):
    actual = pivot_signs(t)
    assert actual == expected
    print(t, actual, 'positive pivots:', actual.count('+'))

assert (B[0][4], B[1][6], B[1][4], B[0][6]) == (15, 4, 100, 102)
assert 782**2 < 15*4*100*102
density_cost_lower = S + 2*(2*782 - 15**2 - 4**2)
f3_upper = 339**2 + 193**2 + 188**2
assert (density_cost_lower, f3_upper) == (281528, 187514)
gap = 2*density_cost_lower - 3*f3_upper
assert gap == 514 > 0
print('density cost lower bound:', density_cost_lower)
print('F3 upper bound:', f3_upper)
print('integer separation gap:', gap)
print('fractional-density transfer obstruction verified')
