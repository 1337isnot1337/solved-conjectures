"""Verify a counterexample to Chen–Khare–Sahi Conjecture 4 using exact arithmetic.

The computation constructs monic Jacks from their Laplace–Beltrami operator.
It evaluates the column-Schur coefficient in the monomial basis, independently
of the Jack hook-content formula. It also enumerates the Schur semiring
products of degree five using all strict dominance differences. No linear
optimization, symbolic algebra package, or floating-point arithmetic is used.
"""

from collections import Counter
from fractions import Fraction
from functools import cache
from itertools import permutations
from math import factorial, prod


def require(condition, message):
    if not condition:
        raise ValueError(message)


def partitions(degree, largest=None):
    if degree == 0:
        yield ()
        return
    for first in range(min(degree, largest or degree), 0, -1):
        for tail in partitions(degree - first, first):
            yield (first,) + tail


def dominates(shape, other):
    return (sum(shape) == sum(other) and
            all(sum(shape[:k]) >= sum(other[:k]) for k in range(1, len(other) + 1)))


@cache
def orbit(shape, rank):
    return set(permutations(shape + (0,) * (rank - len(shape))))


@cache
def interaction(shape, rank):
    """Columns of 2 sum_{i<j}(x_i^2 d_i - x_j^2 d_j)/(x_i-x_j).

    Combine a monomial with its transposition in i,j before division. When
    a>b, the orbit-pair contributes 2a at its two endpoints and 2(a-b) at
    each strictly intermediate exponent. When a=b it contributes 2a once.
    """
    output = Counter()
    for exponents in orbit(shape, rank):
        for i, a in enumerate(exponents):
            for j in range(i + 1, rank):
                b = exponents[j]
                if a < b:
                    continue
                for shift in range(a - b + 1):
                    target = list(exponents)
                    target[i] -= shift
                    target[j] += shift
                    value = 2 * a if shift in (0, a - b) else 2 * (a - b)
                    output[tuple(target)] += value
    for exponents, value in output.items():
        require(output[tuple(sorted(exponents, reverse=True))] == value,
                "The computed interaction column lost symmetry")
    return {tuple(k for k in e if k): v for e, v in output.items()
            if tuple(sorted(e, reverse=True)) == e and v}


def jack(degree, rank, tau):
    """Monomial coefficients of monic triangular eigenfunctions."""
    shapes = list(partitions(degree))
    columns = {p: interaction(p, rank) for p in shapes}
    eigenvalue = {p: sum(a * (a - 1) for a in p) + tau * columns[p].get(p, 0)
                  for p in shapes}
    result = {}
    for i, p in enumerate(shapes):
        coeff = {p: Fraction(1)}
        for q in shapes[i + 1:]:
            numerator = tau * sum(b * columns[r].get(q, 0) for r, b in coeff.items())
            if numerator:
                require(dominates(p, q) and eigenvalue[p] > eigenvalue[q],
                        "Unexpected nontriangular transition")
                coeff[q] = numerator / (eigenvalue[p] - eigenvalue[q])
        result[p] = coeff
    return result


def at_ones(poly, rank):
    """Every m_rho has one term per distinct permutation of its exponents."""
    return sum(a * len(orbit(shape, rank)) for shape, a in poly.items())


def column_schur(poly, degree):
    """[s_(1^degree)] m_rho = (-1)^(degree-len(rho)) len(rho)! / prod m_i!.

    Indeed m_rho(1^N) counts injections modulo permutations of equal parts.
    Evaluate this polynomial identity at N=-1 and multiply by (-1)^degree.
    """
    value = Fraction(0)
    for shape, coefficient in poly.items():
        mult = prod(factorial(k) for k in Counter(shape).values())
        length = len(shape)
        sign = (-1) ** (degree - length)
        value += coefficient * sign * Fraction(factorial(length), mult)
    return value


def schur_products(rank, degree):
    atoms = []
    for k in range(1, degree + 1):
        basis = jack(k, rank, Fraction(1))
        column_value = {}
        for p, poly in basis.items():
            value = column_schur(poly, k)
            require(value == int(p[0] == 1), "Schur sign specialization failed")
            require(poly[p] == 1 and p == max(poly), "Wrong leading term")
            column_value[p] = value / at_ones(poly, rank)
            atoms.append((k, p[0], False, column_value[p]))
        for p in basis:
            for q in basis:
                if p != q and dominates(p, q):
                    require(p > q, "Dominance comparison violates lexicographic order")
                    atoms.append((k, p[0], True, column_value[p] - column_value[q]))

    counts = Counter()

    def visit(degree_left, start, width, differences, value):
        if degree_left == 0:
            counts["all"] += 1
            if differences == 0:
                counts["pure"] += 1
            elif width <= 3:
                counts["admissible"] += 1
                require(differences == 1 and value <= 0, "Sign obstruction failed")
                if value == 0:
                    counts["zero"] += 1
            else:
                counts["too_wide"] += 1
            return
        for index in range(start, len(atoms)):
            size, first_part, is_difference, column = atoms[index]
            if size > degree_left:
                break
            visit(degree_left - size, index, width + first_part,
                  differences + is_difference, value * column)

    visit(degree, 0, 0, 0, Fraction(1))
    return counts


def main():
    degree = rank = 5
    tau = Fraction(3, 2)
    rows = jack(degree, rank, tau)
    target = []
    for shape, expected_norm, expected_value in [
        ((3, 2), Fraction(2261, 10), Fraction(-1, 11305)),
        ((3, 1, 1), Fraction(1938, 13), Fraction(-1, 3230)),
    ]:
        norm = at_ones(rows[shape], rank)
        value = column_schur(rows[shape], degree) / norm
        require((norm, value) == (expected_norm, expected_value), "Jack value mismatch")
        print(f"{shape}: P(1^5)={norm}, normalized column coefficient={value}")
        target.append(value)
    difference = target[0] - target[1]
    require(difference == Fraction(1, 4522), "Wrong target coefficient")
    print(f"Target column coefficient: {difference}")
    counts = schur_products(rank, degree)
    print(f"All degree-five generator products: {counts['all']}")
    print(f"Pure: {counts['pure']}; width above three with differences: {counts['too_wide']}")
    print(f"Eligible: {counts['admissible']}; zero column coefficient: {counts['zero']}; "
          f"negative: {counts['admissible'] - counts['zero']}")


if __name__ == "__main__":
    main()
