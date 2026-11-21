"""Exact certificate for A189281. Run with Python 3 and SymPy."""
from collections import Counter
from fractions import Fraction
from itertools import permutations, product
from pathlib import Path

from sympy import QQ
from sympy.polys.rings import ring


def shifted_sums(offset):
    """The 16 numerator monomials, combined by total degree and cutoff."""
    p, q = (offset + 1) // 2, offset // 2
    terms = Counter()
    for a, b, c, d in product(range(2), repeat=4):
        m = offset + 1 - a - b - c - d
        cutoff = min(p-a-b, q-c-d, p-a-c, q-b-d)
        terms[m, cutoff] += 1
    return terms


def direct_count(n):
    """Evaluate the Schur sum directly, including the empty permutation."""
    derangements = [1]
    for k in range(1, n + 2):
        derangements.append(k * derangements[-1] + (-1)**k)
    count = Fraction(0)
    for (m, cutoff), multiplicity in shifted_sums(n).items():
        for j in range(cutoff + 1):
            k = m - j
            term = (-1)**j * derangements[k] - (-1)**k * derangements[j]
            count += multiplicity * Fraction(term, k-j)
    assert count.denominator == 1
    return count.numerator


def polynomial_counts(max_offset):
    """Represent A(2h+t) over Q[h] with arbitrary initial state."""
    field, h, even_t, odd_t, first_d, first_u, first_e, one = ring(
        'h,T0,T1,D,U,E,B', QQ)
    derangements = [first_d]
    alternating_sums = [first_u]
    half_derangements = [first_e]
    full_sums = [even_t, odd_t]

    for k in range(max_offset + 1):
        derangements.append((2*h+k+1)*derangements[k] + (-1)**(k+1)*one)
        alternating_sums.append(derangements[k+1] - alternating_sums[k])
        half_derangements.append(-(h+k+1)*half_derangements[k] + one)
    for k in range(max_offset):
        center = half_derangements[k//2] if k % 2 == 0 else 0
        full_sums.append(derangements[k+1] + QQ(1, 2) * (
            -(2*h+k+2)*full_sums[k] - alternating_sums[k] + center))

    counts = {}
    for t in range(4, max_offset+1):
        total = field.zero
        for (s, cutoff), multiplicity in shifted_sums(t).items():
            partial = full_sums[s]
            for j in range(cutoff+1, (s+1)//2):
                partial -= QQ((-1)**s, s-2*j) * (
                    half_derangements[s-j] - half_derangements[j])
            total += multiplicity * partial
        counts[t] = total
    return h, counts


def original_residual(n, values, coefficients):
    result = 0
    for value, coeffs in zip(values, coefficients, strict=True):
        polynomial = 0
        for coefficient in reversed(coeffs):
            polynomial = polynomial*n + coefficient
        result += polynomial * value
    return result


def zeilberger_residual(n, values, rational):
    # Mark van Hoeij's factorization of the order-13 recurrence in A189281.
    b = []
    for i in range(11):
        k = n+i
        b.append(values[i+3] + values[i+2] + rational(1, 2) * (
            (k+4)*values[i+1] + (k-1)*values[i]))
    c = []
    for i in range(7):
        k = n+i
        c.append(b[i+4] + rational(1, 2)*((k+4)*b[i+2]-b[i+1]+(1-k)*b[i]))
    return (4*c[6]-4*(n+11)*c[5]-(8*n+75)*c[4]+(3-n)*c[3]
            -2*c[2]-(7*n+22)*c[1]-4*n*c[0])


def main():
    path = Path(__file__).with_name('operator.txt')
    coeffs = [[int(x) for x in line.split()] for line in path.read_text().splitlines()]
    assert len(coeffs) == 9 and max(map(len, coeffs)) == 12
    for n in range(9):
        brute = sum(all(p[i+2]-p[i] != 2 for i in range(n-2))
                    for p in permutations(range(n)))
        assert direct_count(n) == brute, n

    initial = [direct_count(n) for n in range(17)]
    for n in range(4):
        assert original_residual(n, initial[n:n+9], coeffs) == 0
        assert zeilberger_residual(n, initial[n:n+14], Fraction) == 0

    h, counts = polynomial_counts(18)
    for t in (4, 5):
        n = 2*h+t
        values = [counts[t+i] for i in range(14)]
        assert original_residual(n, values[:9], coeffs) == 0
        assert zeilberger_residual(n, values, QQ) == 0
    print('Both polynomial residuals vanish for both parities and all four initial indices.')
    print('The direct Schur count agrees with exhaustive permutations for n = 0 through 8.')


if __name__ == '__main__':
    main()
