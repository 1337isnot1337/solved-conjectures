"""Exact superlevel-cut exclusion of the doubly adjacent exceptional-anchor form."""

from fractions import Fraction


def dandelion_upper(n):
    def polynomial(t):
        return t**3 - (n + 2)*t**2 + (3*n - 2)*t - n

    def isolate(low, high):
        low, high = Fraction(low), Fraction(high)
        assert polynomial(low) < 0 < polynomial(high)
        for _ in range(20):
            middle = (low + high)/2
            if polynomial(middle) < 0:
                low = middle
            else:
                high = middle
        return low, high

    return isolate(0, 1)[1] + n - isolate(n-1, n)[0]


def exclusion(n):
    # Necessary: x(2-x)^2 <= (n-x)(3x-1-x^2).
    # Right minus left simplifies to -(n-1)x^2 + (3n-3)x - n.
    # Its derivative is (n-1)(3-2x)>0 on [0,1].
    upper = dandelion_upper(n) - 1
    assert 0 < upper < 1
    margin = (n - 1)*(3*upper - upper**2) - n
    assert margin < 0
    return margin


if __name__ == "__main__":
    for n in range(11, 21):
        margin = exclusion(n)
        print(f"n={n} exact upper of cut polynomial = {margin} < 0")
