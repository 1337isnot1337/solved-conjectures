"""Exact verification of a two-dimensional, four-outcome matrix moment obstruction."""
from fractions import Fraction


def moments(lower_root, upper_root):
    """Use the sixteenth roots of two endpoints and choose the mean-one law."""
    lower = lower_root**16
    upper = upper_root**16
    upper_mass = (1 - lower) / (upper - lower)
    return tuple(
        upper_mass * upper_root**power + (1 - upper_mass) * lower_root**power
        for power in (1, 15, 16)
    )


def combine(first, second, third):
    """Assign the three scalar laws to Q/2, P/2, and I-(P+Q)/2."""
    off_diagonal = (first - third) / 4
    return (
        ((first + 2 * second + third) / 4, off_diagonal),
        (off_diagonal, (first + 3 * third) / 4),
    )


def check():
    first = moments(Fraction(0), Fraction(2))
    second = moments(Fraction(1, 2), Fraction(2)**16)
    third = moments(Fraction(0), Fraction(2)**16)
    small_power, large_power, mean = [combine(*values) for values in zip(first, second, third)]
    assert mean == ((1, 0), (0, 1))
    # Apply 2MN-I to e2, using only the second column of N.
    target = (large_power[0][1], large_power[1][1])
    first_coordinate, second_coordinate = [
        2 * sum(x * y for x, y in zip(row, target)) for row in small_power
    ]
    second_coordinate -= 1
    assert first_coordinate > Fraction(1, 16)
    assert second_coordinate < -Fraction(99999, 100000)
    assert first_coordinate**2 + second_coordinate**2 > 1 + Fraction(1, 300)
    print("Verified the four-outcome single-compression obstruction at exponent 1/16.")


if __name__ == "__main__":
    check()
