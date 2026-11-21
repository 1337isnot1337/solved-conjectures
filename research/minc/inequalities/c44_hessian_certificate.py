"""Exact certificate for the auxiliary C44 Hessian obstruction.

No floating-point computation, numerical search, or claim about the full
conjecture is used. Run with Python 3; only the standard library is required.
"""

from fractions import Fraction as F
from itertools import permutations


def multiply(p, q):
    result = [F(0)] * (len(p) + len(q) - 1)
    for i, a in enumerate(p):
        for j, b in enumerate(q):
            result[i + j] += a * b
    return result


n = 5
u = [[F(i != j, 4) for j in range(n)] for i in range(n)]
a = [
    [F(0) if i == j else F(1 if j == (i + 1) % n else 13, 40)
     for j in range(n)]
    for i in range(n)
]
d = [
    [0, 8, 0, -6, -2],
    [3, 0, -7, 2, 2],
    [1, -2, 0, 3, -2],
    [2, -5, 1, 0, 2],
    [-6, -1, 6, 1, 0],
]

assert all(a[i][i] == d[i][i] == 0 for i in range(n))
assert all(sum(row) == 1 for row in a)
assert all(sum(a[i][j] for i in range(n)) == 1 for j in range(n))
assert all(sum(row) == 0 for row in d)
assert all(sum(d[i][j] for i in range(n)) == 0 for j in range(n))
assert min(a[i][j] for i in range(n) for j in range(n) if i != j) == F(1, 40)
assert max(abs(x) for row in d for x in row) == 8

distance_squared = sum((a[i][j] - u[i][j]) ** 2
                       for i in range(n) for j in range(n))
assert distance_squared == F(27, 80)
assert F(81, 6400) < distance_squared < F(5, 14)

coefficients = [F(0)] * (n + 1)
for pi in permutations(range(n)):
    term = [F(1)]
    for i in range(n):
        term = multiply(term, [a[i][pi[i]], F(d[i][pi[i]])])
    coefficients = [x + y for x, y in zip(coefficients, term)]

expected = [F(131951, 2560000), -F(3159, 160000), -F(271, 3200),
            F(2367, 800), F(16489, 20), F(3444)]
assert coefficients == expected
assert 2 * coefficients[2] == -F(271, 1600)
assert coefficients[0] - F(11, 256) == F(21951, 2560000) > 0

c = [
    [0, 40, -1, -28, -11],
    [14, 0, -35, 9, 12],
    [7, -11, 0, 15, -11],
    [9, -23, 4, 0, 10],
    [-30, -6, 32, 4, 0],
]
assert all(c[i][i] == 0 for i in range(n))
assert all(sum(row) == 0 for row in c)
assert all(sum(c[i][j] for i in range(n)) == 0 for j in range(n))
assert all(c[i][j] == 5*d[i][j] - sum(d[(i+r) % n][(j+r) % n]
                                     for r in range(n))
           for i in range(n) for j in range(n))

c_coefficients = [F(0)] * (n + 1)
for pi in permutations(range(n)):
    term = [F(1)]
    for i in range(n):
        term = multiply(term, [a[i][pi[i]], F(c[i][pi[i]])])
    c_coefficients = [x+y for x, y in zip(c_coefficients, term)]

assert c_coefficients == [F(131951, 2560000), F(0), -F(6413, 1600),
                          -F(103, 80), F(520326), F(12638280)]
expected_differences = {
    1: -F(100075946293, 2500000000000000000),
    -1: -F(100070140707, 2500000000000000000),
}
for sign in (1, -1):
    h = F(sign, 10000)
    endpoint = [[a[i][j] + h*c[i][j] for j in range(n)] for i in range(n)]
    assert all(endpoint[i][j] > 0
               for i in range(n) for j in range(n) if i != j)
    endpoint_distance = sum((endpoint[i][j] - u[i][j])**2
                            for i in range(n) for j in range(n))
    assert endpoint_distance == F(3375737, 10000000) < F(5, 14)
    difference = sum(c_coefficients[k]*h**k for k in range(1, n+1))
    assert difference == expected_differences[sign] < 0
    assert c_coefficients[0] + difference > F(11, 256)

print("All exact C44 Hessian obstruction identities verified.")
print("Squared distance:", distance_squared)
print("Tangent Hessian value:", 2 * coefficients[2])
print("Permanent excess above U_5:", coefficients[0] - F(11, 256))
