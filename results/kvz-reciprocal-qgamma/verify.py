"""Exact diagnostic checks for the reciprocal q-gamma proof.

Uses rational arithmetic only.  The infinite-product checks have rigorous
geometric tail intervals.  These finite checks are not the all-parameter proof.
"""

from fractions import Fraction as F
from itertools import combinations, permutations
from math import prod


def determinant(matrix):
    n = len(matrix)
    a = [list(map(F, row)) for row in matrix]
    answer = F(1)
    for j in range(n):
        pivot = next((i for i in range(j, n) if a[i][j]), None)
        if pivot is None:
            return F(0)
        if pivot != j:
            a[j], a[pivot] = a[pivot], a[j]
            answer = -answer
        p = a[j][j]
        answer *= p
        for i in range(j + 1, n):
            ratio = a[i][j] / p
            for k in range(j + 1, n):
                a[i][k] -= ratio * a[j][k]
    return answer


def minor(matrix, rows, columns):
    return [[matrix[i][j] for j in columns] for i in rows]


def pochhammer(a, q, k):
    return prod((1 - a * q**j for j in range(k)), start=F(1))


def qfactorials(q, n):
    out = [F(1)]
    for k in range(1, n + 1):
        out.append(out[-1] * (1 - q**k))
    return out


def check_pochhammer_minors():
    count = 0
    for base in (F(1, 2), F(2, 3), F(3, 4)):
        q = base**2
        # y_j=(j+1)/2, so q**y_j is the rational base**(j+1).
        matrix = [[pochhammer(base**(j + 1), q, k) for j in range(6)]
                  for k in range(6)]
        for r in range(1, 4):
            for rows in combinations(range(6), r):
                for columns in combinations(range(6), r):
                    assert determinant(minor(matrix, rows, columns)) > 0
                    count += 1
    return count


def check_cauchy_binet():
    count = 0
    bound_count = 0
    for base in (F(1, 2), F(2, 3), F(3, 4)):
        q = base**2
        qf = qfactorials(q, 6)
        for xindices, yindices in (((1, 2, 4, 7), (1, 3, 5, 6)),
                                  ((2, 3, 6, 8), (2, 4, 5, 9))):
            for r in range(1, 5):
                t = [base**i for i in xindices[:r]]
                s = [base**j for j in yindices[:r]]
                signature = (-1) ** (r * (r - 1) // 2)
                powers_t = [[x**k for k in range(7)] for x in t]
                powers_s = [[y**k for k in range(7)] for y in s]
                h = [[sum((t[i] * s[j])**k / qf[k]
                          for k in range(7)) for j in range(r)]
                     for i in range(r)]
                h_rhs = F(0)
                b = [[pochhammer(y, q, k) for y in s] for k in range(7)]
                jmatrix = [[sum(t[i]**k * b[k][j] / qf[k]
                                for k in range(7)) for j in range(r)]
                           for i in range(r)]
                j_rhs = F(0)
                for ks in combinations(range(7), r):
                    d1 = determinant(minor(powers_t, range(r), ks))
                    d2 = determinant(minor(powers_s, range(r), ks))
                    db = determinant(minor(b, ks, range(r)))
                    weight = prod((qf[k] for k in ks), start=F(1))
                    assert signature * d1 > 0
                    assert signature * d2 > 0
                    assert db > 0
                    h_rhs += d1 * d2 / weight
                    j_rhs += d1 * db / weight
                assert determinant(h) == h_rhs > 0
                assert determinant(jmatrix) == j_rhs
                assert signature * j_rhs > 0
                count += 2

                vand_t = prod((t[i] - t[j] for i in range(r)
                               for j in range(i + 1, r)), start=F(1))
                vand_s = prod((s[i] - s[j] for i in range(r)
                               for j in range(i + 1, r)), start=F(1))
                first_term = (q**(r * (r - 1) * (r - 2) // 6)
                              * vand_t * vand_s
                              / prod(qf[:r], start=F(1)))
                assert signature * determinant(jmatrix) >= first_term > 0
                bound_count += 1
    return count, bound_count


def product_interval(z, q, n):
    """Bounds (z;q)_infinity via product(1-u)>=1-sum(u)."""
    prefix = pochhammer(z, q, n)
    tail_sum = z * q**n / (1 - q)
    assert 0 <= tail_sum < 1
    return prefix * (1 - tail_sum), prefix


def determinant_interval(matrix):
    """All entries are positive intervals; Leibniz gives exact enclosures."""
    n = len(matrix)
    lower = upper = F(0)
    for p in permutations(range(n)):
        inversions = sum(p[i] > p[j] for i in range(n)
                         for j in range(i + 1, n))
        lo = prod((matrix[i][p[i]][0] for i in range(n)), start=F(1))
        hi = prod((matrix[i][p[i]][1] for i in range(n)), start=F(1))
        if inversions % 2:
            lower -= hi
            upper -= lo
        else:
            lower += lo
            upper += hi
    return lower, upper


def check_infinite_products():
    count = 0
    for base in (F(1, 2), F(2, 3), F(3, 4)):
        q = base**2
        qf = qfactorials(q, 4)
        for r in range(1, 5):
            # Positive half-integer x,y, with nonconsecutive entries.
            t = [base**i for i in (1, 2, 4, 7)[:r]]
            s = [base**j for j in (1, 3, 5, 6)[:r]]
            sigma = (-1) ** (r * (r - 1) // 2)
            matrix = [[product_interval(x * y, q, 80) for y in s] for x in t]
            lo, hi = determinant_interval(matrix)
            signed_lower = lo if sigma == 1 else -hi
            assert signed_lower > 0
            # The full gamma determinant differs by positive row/column
            # factors from det[(q**(x_i+y_j);q)_infinity].
            vand_t = prod((t[i] - t[j] for i in range(r)
                           for j in range(i + 1, r)), start=F(1))
            vand_s = prod((s[i] - s[j] for i in range(r)
                           for j in range(i + 1, r)), start=F(1))
            rhs_upper = (prod((product_interval(x, q, 80)[1] for x in t),
                              start=F(1))
                         * q**(r * (r - 1) * (r - 2) // 6)
                         * vand_t * vand_s
                         / prod(qf[:r], start=F(1)))
            assert signed_lower >= rhs_upper > 0
            count += 1
    return count


def main():
    minors = check_pochhammer_minors()
    identities, bounds = check_cauchy_binet()
    certificates = check_infinite_products()
    print(f"PASS: {minors} exact q-Pochhammer minors, including index zero")
    print(f"PASS: {identities} exact finite Cauchy-Binet identities and {bounds} lower bounds")
    print(f"PASS: {certificates} rigorous rational infinite-product minor certificates")
    print("The all-order, all-parameter proof is in PROOF.md; finite checks are diagnostic only.")


if __name__ == "__main__":
    main()
