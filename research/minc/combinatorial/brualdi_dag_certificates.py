"""Exact witnesses for brualdi_dag_attempts.md; neither is a minimizing matrix."""

from itertools import combinations, permutations

import sympy as s


def permanent(matrix):
    assert matrix.rows == matrix.cols
    return sum(s.prod(matrix[i, p[i]] for i in range(matrix.rows))
               for p in permutations(range(matrix.rows)))


R = s.Matrix([[0, 0, s.Rational(1, 2), s.Rational(1, 2)],
              [s.Rational(1, 2), 0, s.Rational(1, 4), s.Rational(1, 4)],
              [s.Rational(1, 3), s.Rational(1, 2), 0, s.Rational(1, 6)]])
assert all(sum(R[i, :]) == 1 for i in range(3))
assert all(permanent(R[:, [k for k in range(4) if k != j]]) == s.Rational(1, 8)
           for j in range(4))
v = s.Matrix([[1-sum(R[:, j]) for j in range(4)]])
assert list(v) == [s.Rational(1, 6), s.Rational(1, 2), s.Rational(1, 4), s.Rational(1, 12)]
A = R.col_join(v)
assert permanent(A) == s.Rational(1, 8) > s.Rational(1, 9)
assert all(sum(A[:, j]) == 1 for j in range(4))

R = s.Matrix([[20, 0, 4, 402, 2], [139, 29, 0, 2, 107], [1, 54, 2, 0, 2]])
H = s.zeros(5)
for i, j in combinations(range(5), 2):
    H[i, j] = H[j, i] = permanent(R[:, [k for k in range(5) if k not in (i, j)]])
assert H == s.Matrix([[0, 86052, 2346288, 23460, 23748],
                      [86052, 0, 154854, 6376, 111844],
                      [2346288, 154854, 0, 131790, 3031230],
                      [23460, 6376, 131790, 0, 31300],
                      [23748, 111844, 3031230, 31300, 0]])
for size in range(1, 4):
    for rows in combinations(range(3), size):
        zero_columns = [j for j in range(5) if all(R[i, j] == 0 for i in rows)]
        if zero_columns:
            assert size + len(zero_columns) <= 3
assert H.inv()[0, 2] == -s.Rational(162181587284677, 1314230065622332596912)

print("PASS: equal maximal minors, positive completion, and strict-AF inverse-sign obstruction.")
print("No Brualdi conjecture resolution is asserted.")
