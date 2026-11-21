"""Exact normalization and constant checks for eventual subpermanent convexity.

The universal argument is in kopotun_convexity_review.md.  The finite tensor
examples here check conventions; they do not supply a proof by tested orders.
Only the Python standard library is required.
"""

from fractions import Fraction as F
from itertools import combinations, permutations, product
from math import factorial, prod


def falling(a, j):
    return prod(a - i for i in range(j))


def sigma(matrix, j):
    n = len(matrix)
    total = F(0)
    for rows in combinations(range(n), j):
        for cols in combinations(range(n), j):
            for perm in permutations(cols):
                total += prod(matrix[r][c] for r, c in zip(rows, perm))
    return total


def direct_hessian(matrix, direction, j):
    n = len(matrix)
    total = F(0)
    for rows in combinations(range(n), j):
        for cols in combinations(range(n), j):
            for perm in permutations(cols):
                for chosen in combinations(range(j), 2):
                    total += 2 * prod(
                        direction[r][c] if position in chosen else matrix[r][c]
                        for position, (r, c) in enumerate(zip(rows, perm))
                    )
    return total


def apply_one_slot(tensor, matrix, slot, n, j):
    result = {}
    for output in product(range(n), repeat=j):
        total = F(0)
        for a in range(n):
            source = output[:slot] + (a,) + output[slot + 1 :]
            total += matrix[output[slot]][a] * tensor[source]
        result[output] = total
    return result


def tensor_certificates():
    n = 4
    q = [[F(int(i == j)) - F(1, n) for j in range(n)] for i in range(n)]
    shift = [[F(int(j == (i + 1) % n)) for j in range(n)] for i in range(n)]
    x = [[shift[i][j] - F(1, n) for j in range(n)] for i in range(n)]
    # A nonsymmetric, zero-margin direction.  X=P-J is a contraction on 1^perp.
    d = [[shift[i][j] - F(int(i == j)) for j in range(n)] for i in range(n)]
    norm_d_sq = sum(entry * entry for row in d for entry in row)
    assert d != list(map(list, zip(*d)))
    assert all(sum(row) == 0 for row in d)
    assert all(sum(d[i][j] for i in range(n)) == 0 for j in range(n))

    for j in (2, 3, 4):
        # z=sqrt(j!)*w avoids irrational coordinates.
        z = {
            index: F(int(len(set(index)) == j))
            for index in product(range(n), repeat=j)
        }
        for slot in range(j):
            z = apply_one_slot(z, q, slot, n, j)
        norm_w_sq = sum(value * value for value in z.values()) / factorial(j)
        q_nj = sigma(q, j)
        assert norm_w_sq == q_nj

        reduced = [[F(0) for _ in range(n)] for _ in range(n)]
        for a in range(n):
            for b in range(n):
                reduced[a][b] = sum(
                    z[(a,) + tail] * z[(b,) + tail]
                    for tail in product(range(n), repeat=j - 1)
                ) / factorial(j)
                assert reduced[a][b] == q_nj * q[a][b] / (n - 1)

        applied = z
        for slot in range(j):
            applied = apply_one_slot(applied, d if slot < 2 else x, slot, n, j)
        inner = sum(z[index] * applied[index] for index in z) / factorial(j)
        tensor_hessian = j * (j - 1) * inner
        literal_hessian = direct_hessian(x, d, j)
        assert tensor_hessian == literal_hessian
        bound = j * (j - 1) * q_nj * norm_d_sq / (n - 1)
        assert abs(tensor_hessian) <= bound
        print(
            f"tensor j={j}: sigma_j(Q)={q_nj}; "
            f"Hessian={tensor_hessian}; bound={bound}"
        )


def exponential_coefficients(n):
    # If E=exp(h), then m*[t^m]E=sum_{ell=1}^m ell*h_ell*E_{m-ell}.
    h = [F(0)] + [
        F(0) if ell == 1 else F(n * (ell - 1), ell)
        for ell in range(1, n + 1)
    ]
    e = [F(1)]
    for degree in range(1, n + 1):
        e.append(
            sum(ell * h[ell] * e[degree - ell] for ell in range(1, degree + 1))
            / degree
        )
    return e


def permanent_line_coefficients(n):
    # (1-t)^n sum_{ell=0}^n (nt/(1-t))^ell / ell!.
    coeffs = [F(0) for _ in range(n + 1)]
    for ell in range(n + 1):
        for power in range(n - ell + 1):
            binomial = factorial(n - ell) // (
                factorial(power) * factorial(n - ell - power)
            )
            coeffs[ell + power] += F(
                n**ell * (-1) ** power * binomial, factorial(ell)
            )
    return coeffs


def coefficient_certificates():
    # These identities check two independent coefficient constructions.
    for n in (3, 4, 7, 11):
        e = exponential_coefficients(n)
        literal = permanent_line_coefficients(n)
        assert e == literal
        assert e[0] == 1 and e[1] == 0 and e[2] == F(n, 2)
        assert all(value >= 0 for value in e)
        if n <= 4:
            q = [[F(int(i == j)) - F(1, n) for j in range(n)] for i in range(n)]
            for j in range(n + 1):
                assert e[j] == F(n**j, falling(n, j)) * sigma(q, j)
    print("Exact centered coefficient and generating-function identities passed.")


def constant_certificates():
    u = F(1, 48)
    ng_upper = F(1, 16) / (2 * (1 - u) ** 2)
    second_upper = (1 + u) / (1 - u) ** 3
    squared_first_upper = F(1, 16) / (1 - u) ** 4
    assert ng_upper == F(72, 2209)
    assert ng_upper < F(1, 16)
    assert F(1) / (1 - ng_upper) < F(16, 15)
    assert second_upper == F(112896, 103823)
    assert second_upper < F(9, 8)
    assert squared_first_upper < F(1, 8)
    assert F(16, 15) * (F(9, 8) + F(1, 8)) == F(4, 3)

    # Symbolic comparison after setting k=3+a, n=16k^2+b:
    # 3n(k-1)-2k(n-1)=(k-3)n+2k
    # =a*(16a^2+96a+144+b)+2a+6, all coefficients nonnegative.
    # Verify the polynomial identity as coefficient dictionaries in a,b.
    n_poly = {(2, 0): 16, (1, 0): 96, (0, 0): 144, (0, 1): 1}

    def add(*polys):
        out = {}
        for poly in polys:
            for degree, coeff in poly.items():
                out[degree] = out.get(degree, 0) + coeff
        return {degree: coeff for degree, coeff in out.items() if coeff}

    def multiply(a, b):
        out = {}
        for (i, j), x in a.items():
            for (h, ell), y in b.items():
                out[(i + h, j + ell)] = out.get((i + h, j + ell), 0) + x * y
        return {degree: coeff for degree, coeff in out.items() if coeff}

    def scale(poly, scalar):
        return {degree: scalar * coeff for degree, coeff in poly.items()}

    k_poly = {(1, 0): 1, (0, 0): 3}
    lhs = add(
        scale(multiply(n_poly, add(k_poly, {(0, 0): -1})), 3),
        scale(multiply(k_poly, add(n_poly, {(0, 0): -1})), -2),
    )
    rhs = {(3, 0): 16, (2, 0): 96, (1, 0): 146, (1, 1): 1, (0, 0): 6}
    assert lhs == rhs
    assert all(value > 0 for value in rhs.values())
    print("Exact rational Hessian constants and positive polynomial certificate passed.")


if __name__ == "__main__":
    tensor_certificates()
    coefficient_certificates()
    constant_certificates()
