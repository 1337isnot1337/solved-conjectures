"""Check the rational arrowhead certificate and the two local crossing slopes."""

from itertools import combinations, permutations
from math import prod
from warnings import catch_warnings, simplefilter

from sympy import Matrix, Poly, diff, simplify, sqrt, symbols
from sympy.utilities.exceptions import SymPyDeprecationWarning


def compound(matrix, k):
    subsets = list(combinations(range(matrix.rows), k))
    return Matrix([
        [sum(prod(matrix[i, j] for i, j in zip(rows, perm))
             for perm in permutations(cols)) for cols in subsets]
        for rows in subsets
    ])


def factor_degrees(polynomial, prime):
    factors = polynomial.set_modulus(prime).factor_list()[1]
    assert all(multiplicity == 1 for _, multiplicity in factors)
    return tuple(sorted(factor.degree() for factor, _ in factors))


def check_crossings():
    s = symbols("s")
    low, gap = symbols("low gap", positive=True)
    high = low + gap
    root = sqrt(gap**2 + 4*s)
    upper = (high + low + root) / 2
    lower = (high + low - root) / 2
    slopes = [diff(ratio, s).subs(s, 0) for ratio in (upper, (high*low + s)/lower)]
    assert simplify(slopes[0] - 1/gap) == 0
    assert simplify(slopes[1] - slopes[0] - 2/low) == 0


def main():
    matrix = Matrix([[23, 2, 3, 5], [2, 7, 0, 0], [3, 0, 11, 0], [5, 0, 0, 17]])
    polynomials = [Poly(compound(matrix, k).charpoly().as_expr()) for k in (1, 2, 3)]
    primes = (5, 11, 13, 17, 31, 367, 487, 613)
    with catch_warnings():
        simplefilter("ignore", SymPyDeprecationWarning)
        patterns = {
            p: tuple(factor_degrees(f, p) for f in polynomials) for p in primes
        }

    for k, (full, fixing_one, isolated) in enumerate(
        [(11, 5, 367), (17, 13, 613), (31, 13, 487)]
    ):
        degree = polynomials[k].degree()
        assert patterns[full][k] == (degree,)
        assert patterns[fixing_one][k] == (1, degree - 1)
        even_cycles = [(j, length) for j, cycles in enumerate(patterns[isolated])
                       for length in cycles if length % 2 == 0]
        assert even_cycles == [(k, 2)]

    check_crossings()
    for p, cycles in patterns.items():
        print(f"{p:3d}  {cycles}")
    print("Verified S4 x S6 x S4 and the two crossing slopes.")


if __name__ == "__main__":
    main()
