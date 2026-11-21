"""Exact diagnostics for the reciprocal q-gamma kernel proof.

These finite checks do not prove the all-order theorem. PROOF.md supplies
the determinant factorization, convergence, and strictness argument.
Uses only the Python standard library.
"""

from fractions import Fraction as F
from itertools import combinations


def det(rows):
    a = [list(map(F, row)) for row in rows]
    n = len(a)
    answer = F(1)
    for k in range(n):
        pivot = next((i for i in range(k, n) if a[i][k]), None)
        if pivot is None:
            return F(0)
        if pivot != k:
            a[k], a[pivot] = a[pivot], a[k]
            answer = -answer
        value = a[k][k]
        answer *= value
        for i in range(k + 1, n):
            multiplier = a[i][k] / value
            for j in range(k + 1, n):
                a[i][j] -= multiplier * a[k][j]
    return answer


def factorials(q, n):
    d = [F(1)]
    for k in range(1, n + 1):
        d.append(d[-1] * (1 - q**k))
    return d


def main():
    coefficient_checks = 0
    gamma_checks = 0
    composition_checks = 0
    for q in [F(1, 3), F(1, 2), F(2, 3), F(3, 4)]:
        d = factorials(q, 40)
        # Independently expand the numerator using Euler's second sum.
        # The double-series coefficients in PROOF.md must result.
        for k in range(7):
            for n in range(7):
                coefficient = sum(
                    (-1)**j * q**(j * (j - 1) // 2)
                    / (d[j] * d[k - j] * d[n - j])
                    for j in range(min(k, n) + 1)
                )
                assert coefficient == q**(k * n) / (d[k] * d[n])
                coefficient_checks += 1
        # At positive integer arguments reciprocal Gamma_q is rational.
        for r in range(1, 7):
            sign = (-1)**(r * (r - 1) // 2)
            for offset in [1, 2, 4]:
                x = [offset + 2*i for i in range(r)]
                y = [1 + 3*j for j in range(r)]
                matrix = [[(1-q)**(s+t-1) / d[s+t-1] for t in y] for s in x]
                assert sign * det(matrix) > 0
                gamma_checks += 1
        # Direct finite determinant versus the two Cauchy--Binet sums.
        N = 4
        for r in range(1, 5):
            sign = (-1)**(r * (r - 1) // 2)
            u = [F(i+1, r+2) for i in range(r)]
            v = [F(i+2, r+3) for i in range(r)]
            matrix = [[sum(q**(k*n)*s**k*t**n/(d[k]*d[n])
                           for k in range(N+1) for n in range(N+1))
                       for t in v] for s in u]
            total = F(0)
            fixed = None
            for I in combinations(range(N+1), r):
                for J in combinations(range(N+1), r):
                    left = det([[s**k/d[k] for k in I] for s in u])
                    middle = det([[q**(k*n) for n in J] for k in I])
                    right = det([[t**n/d[n] for t in v] for n in J])
                    assert left > 0 and right > 0 and sign*middle > 0
                    term = left*middle*right
                    total += term
                    if I == J == tuple(range(r)):
                        fixed = term
            assert det(matrix) == total
            assert fixed is not None and sign*total >= sign*fixed > 0
            composition_checks += 1
    print(f'Passed {coefficient_checks} exact coefficient identities, '
          f'{gamma_checks} reciprocal-gamma minor signs, and '
          f'{composition_checks} finite Cauchy--Binet identities.')


if __name__ == '__main__':
    main()
