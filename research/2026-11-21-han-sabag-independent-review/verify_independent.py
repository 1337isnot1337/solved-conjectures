"""Independent exact audit of the Han--Sabag--Kostina--Hassibi witness.

No code is imported from the result package. The Lyapunov equation is
assembled as a four-variable linear system and solved by rational Gaussian
elimination. The mathematical audit proves the complete sparse-case bound.
"""

from fractions import Fraction as Q
from itertools import product
import json
from pathlib import Path
import sympy as sp


def transpose(a):
    return [list(row) for row in zip(*a)]


def multiply(a, b):
    return [[sum(a[i][k] * b[k][j] for k in range(len(b)))
             for j in range(len(b[0]))] for i in range(len(a))]


def add(a, b, sign=1):
    return [[a[i][j] + sign*b[i][j] for j in range(len(a[0]))]
            for i in range(len(a))]


def diag(values):
    return [[v if i == j else Q(0) for j in range(len(values))]
            for i, v in enumerate(values)]


def inverse2(a):
    determinant = a[0][0]*a[1][1] - a[0][1]*a[1][0]
    return [[a[1][1]/determinant, -a[0][1]/determinant],
            [-a[1][0]/determinant, a[0][0]/determinant]]


def solve(a, b):
    rows = [list(row)+[value] for row, value in zip(a, b)]
    n = len(rows)
    for i in range(n):
        pivot = next(j for j in range(i, n) if rows[j][i])
        rows[i], rows[pivot] = rows[pivot], rows[i]
        divisor = rows[i][i]
        rows[i] = [x/divisor for x in rows[i]]
        for j in range(n):
            if j != i:
                factor = rows[j][i]
                rows[j] = [x-factor*y for x, y in zip(rows[j], rows[i])]
    return [row[-1] for row in rows]


def main():
    bs = (Q(4, 5), Q(3, 5))
    hs = (Q(7, 4), Q(1))
    ps = (Q(1168, 1323), Q(3, 17))
    B, H, Pi = diag(bs), diag(hs), diag(ps)
    G = [[Q(1), Q(1)], [Q(53, 40), Q(840, 1961)]]
    D = inverse2(add(diag((Q(1), Q(1))), multiply(multiply(H, Pi), H)))
    rhs = add(multiply(multiply(multiply(B, transpose(G)), G), B),
              multiply(multiply(transpose(G), D), G), sign=-1)
    indices = list(product(range(2), repeat=2))
    operator = [[Q(i == k and j == l)-B[i][k]*B[l][j]
                 for k, l in indices] for i, j in indices]
    solution = solve(operator, [rhs[i][j] for i, j in indices])
    J = [solution[:2], solution[2:]]
    expected = diag((Q(211, 57600), Q(35289, 246113344)))
    assert J == expected
    residual = add(add(J, multiply(multiply(B, J), B), sign=-1), rhs, sign=-1)
    assert residual == [[0, 0], [0, 0]]
    assert J[0][0] > 0 and J[1][1] > 0

    sparse = {}
    for assignment in product(range(2), repeat=2):
        i, j = assignment
        if i == j:
            threshold = ((bs[0]*bs[1])**-2 - 1)/hs[i]**2
        else:
            threshold = (bs[0]**-2 - 1)/hs[i]**2 + (bs[1]**-2 - 1)/hs[j]**2
        sparse[str(tuple(k+1 for k in assignment))] = threshold
    power = sum(ps)
    gap = min(sparse.values()) - power
    assert power == Q(23825, 22491)
    assert min(sparse.values()) == Q(481, 441)
    assert gap == Q(706, 22491) and gap > 0

    b, c, d = sp.symbols('b c d')
    single_channel = sp.Matrix([
        [(b*b-d)/(1-b*b), (b*c-d)/(1-b*c)],
        [(b*c-d)/(1-b*c), (c*c-d)/(1-c*c)]])
    determinant = sp.factor(single_channel.det())
    claimed = ((b-c)**2*(1-d)*(b*b*c*c-d)
               / ((1-b*b)*(1-c*c)*(1-b*c)**2))
    assert sp.cancel(determinant-claimed) == 0

    x = sp.symbols('x', positive=True)
    power_x = sp.Rational(73, 27)/x + sp.Rational(3, 17)
    p11 = sp.Rational(481, 144)/x
    p22 = sp.Rational(481, 144)
    p12 = sp.Rational(9, 16)/x + sp.Rational(16, 9)
    p21 = sp.Rational(9, 16) + sp.Rational(16, 9)/x
    assert sp.cancel((p12-p21) - sp.Rational(175, 144)*(1-1/x)) == 0
    assert sp.cancel((p22-p11) - sp.Rational(481, 144)*(1-1/x)) == 0
    assert sp.cancel((p11-power_x) - (sp.Rational(275, 432)/x-sp.Rational(3, 17))) == 0
    assert sp.cancel((p21-power_x) - (sp.Rational(105, 272)-sp.Rational(25, 27)/x)) == 0
    lower = Q(1360, 567)
    upper = Q(4675, 1296)
    assert Q(1) < lower < Q(49, 16) < upper
    assert lower == Q(25, 27)/Q(105, 272)
    assert upper == Q(275, 432)/Q(3, 17)

    output = {
        'status': 'passed',
        'method': 'fresh rational linear-system solution; no result-package imports',
        'D': [[str(v) for v in row] for row in D],
        'J': [[str(v) for v in row] for row in J],
        'lyapunov_residual': [[str(v) for v in row] for row in residual],
        'sparse_infima': {k: str(v) for k, v in sparse.items()},
        'witness_power': str(power),
        'strict_gap': str(gap),
        'same_channel_symbolic_identity': 'passed',
        'open_family_symbolic_identities': 'passed',
        'open_interval_for_h_squared': [str(lower), str(upper)],
        'scope': 'Exact diagnostics supplement the independent all-sparse-assignment argument.'
    }
    Path(__file__).with_name('verification.json').write_text(json.dumps(output, indent=2)+'\n')
    print(json.dumps(output, indent=2))


if __name__ == '__main__':
    main()
