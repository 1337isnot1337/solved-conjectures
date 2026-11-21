"""Compare the fixed-divisor and Euler formulas with a signed subset permanent."""

from fractions import Fraction
from itertools import combinations_with_replacement
from math import comb, factorial
from random import Random


def permanent(matrix):
    n = len(matrix)
    values = [0] * (1 << n)
    values[0] = 1
    for mask in range(1, 1 << n):
        row = matrix[mask.bit_count() - 1]
        bits = mask
        while bits:
            bit = bits & -bits
            values[mask] += row[bit.bit_length() - 1] * values[mask ^ bit]
            bits ^= bit
    return values[-1]


def sign_board(heights):
    return [[1 - 2 * (i < height) for height in heights] for i in range(len(heights))]


def width(heights):
    roots = [height - i for i, height in enumerate(heights)]
    return max(roots) - min(roots)


def odd_factorial(k):
    value = factorial(max(k, 0))
    return value // (value & -value)


def euler_value(heights):
    n = len(heights)
    diffs = []
    for t in range(n + 1):
        value = 1
        for i, height in enumerate(heights):
            value *= t + height - i
        diffs.append(value)
    value = 0
    for k in range(n + 1):
        value += (-2) ** (n - k) * diffs[0]
        diffs = [b - a for a, b in zip(diffs, diffs[1:])]
    return value


def main():
    cases = 0
    changes = 0
    random = Random(641117)
    for n in range(1, 8):
        minimum = 2 ** (n - ((n + 1).bit_length() - 1))
        for heights in combinations_with_replacement(range(n + 1), n):
            matrix = sign_board(heights)
            actual = permanent(matrix)
            span = width(heights)
            assert actual == euler_value(heights)
            assert actual % odd_factorial(span + 1) == 0
            if n >= 6:
                assert abs(actual) != minimum
            if n >= 2:
                row = random.randrange(n)
                col = random.randrange(n)
                subheights = [h - (row < h) for j, h in enumerate(heights) if j != col]
                assert width(subheights) >= span - 2
                for k in range(n):
                    if random.randrange(2):
                        matrix[row][k] *= -1
                    if random.randrange(2):
                        matrix[k][col] *= -1
                assert permanent(matrix) % odd_factorial(span - 3) == 0
                changes += 1
            cases += 1

    moments = [Fraction(1)]
    for n in range(1, 101):
        moments.append(-sum(comb(n, j) * moments[j] for j in range(n)) / 2)
        row = [sum(comb(n - a, j) * moments[a + j] for j in range(n - a + 1))
               for a in range(n + 1)]
        if n >= 6:
            low = Fraction(1, 4 if n % 2 else 2)
            assert min(abs(v) for v in row if v) >= low
    print(f"{cases} Ferrers boards, {changes} row-column perturbations, 100 Euler rows")


if __name__ == "__main__":
    main()
