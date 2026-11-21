"""Check the repeated-row formula and derivative in exact arithmetic."""
from fractions import Fraction
from math import factorial

from verify_hall_bound import permanent


def check(vector, scale):
    n = len(vector)
    y = [scale * value for value in vector]
    assert sum(y) == 0 and all(value != 1 for value in y)
    rows = [[(1 - value) / n for value in y] for _ in range(n)]
    rows[0] = [(1 + (n - 1) * value) / n for value in y]
    normalization = Fraction(factorial(n), n**n)
    actual = permanent(rows) / normalization
    tangent = [(1 - value) for value in y]
    product = Fraction(1)
    for value in tangent:
        product *= value
    v = [value / (1 - value) for value in y]
    total = sum(v)
    assert total == sum(value * weight for value, weight in zip(y, v))
    assert actual == product * (1 + total)
    radial = 0
    for i in range(n):
        updated = rows.copy()
        updated[i] = [value - Fraction(1, n) for value in rows[i]]
        radial += permanent(updated) / normalization
    assert radial == product * (sum(weight**2 for weight in v) - total**2)
    if 0 < Fraction(n-1, n)*sum(value**2 for value in y) < 1:
        assert actual > 1 and radial > 0


if __name__ == "__main__":
    count = 0
    for n in range(2, 9):
        for direction in ([1, -1] + [0]*(n-2), [n-1] + [-1]*(n-1),
                          [1-n] + [1]*(n-1), [2*j+1-n for j in range(n)]):
            for scale in [Fraction(1, 2*n), Fraction(-1, 3*n), Fraction(2, 2*n+1)]:
                check(direction, scale)
                count += 1
    print(f"Passed {count} exact permanent and radial derivative checks.")
