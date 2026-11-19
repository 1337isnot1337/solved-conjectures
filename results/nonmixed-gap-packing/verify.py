"""Finite independent checks of the packing theorem and the two-count lemma."""

from fractions import Fraction
from math import gcd


def parameters(a, b, k, m):
    size = k + m + 1
    d, r = divmod(a - b, size)
    if r == 0:
        return 1, size
    if r <= m:
        return b + k * d, k * a + (m + 1) * b
    return a - m * (d + 1), (k + 1) * a + m * b


def tile(a, b, k, m):
    return [i * a for i in range(k + 1)] + [k * a + j * b for j in range(1, m + 1)]


def differences(points):
    return {y - x for x in points for y in points if y > x}


def anchored_sets(a, b, k, m):
    """Visit every allowed subset containing 0 in the longer interval."""
    short = k * a + (m + 1) * b
    long = (k + 1) * a + m * b
    assert a > b
    h, period = parameters(a, b, k, m)
    forbidden = sum(1 << d for d in differences(tile(a, b, k, m)))

    def visit(available, small_count, count):
        # Integer z exists iff ceil((J-b)/k) <= floor((a-C)/m).
        assert -((b - small_count) // k) <= (a - count) // m
        assert small_count * period <= short * h or count * period <= long * h
        visited = 1
        while available:
            bit = available & -available
            available ^= bit
            x = bit.bit_length() - 1
            visited += visit(available & ~(forbidden << x), small_count + (x < short), count + 1)
        return visited

    return visit(((1 << long) - 1) & ~forbidden & ~1, 1, 1)


def periodic_example(a, b, k, m):
    h, period = parameters(a, b, k, m)
    assert Fraction(h, period) == Fraction(*parameters(b, a, m, k))
    points = tile(a, b, k, m)
    forbidden = differences(points)

    # Find a multiplier directly from the distances, without the Bezout formula.
    for p in range(1, period):
        if all(h <= p * d % period <= period - h for d in forbidden):
            break
    else:
        raise AssertionError((a, b, k, m, h, period))

    # Replay one full period of the center set and count every covered site.
    divisor = gcd(p, period)
    reduced_period = period // divisor
    assert h % divisor == 0
    starts = [x for x in range(reduced_period) if p * x % period < h]
    assert len(starts) * period == h * reduced_period
    covered = [(x + y) % reduced_period for x in starts for y in points]
    assert len(covered) == len(set(covered))


def main():
    examples = cases = sets = 0
    for a in range(1, 19):
        for b in range(1, a + 1):
            if gcd(a, b) != 1:
                continue
            for k in range(1, 7):
                for m in range(1, 7):
                    periodic_example(a, b, k, m)
                    examples += 1
                    if b < a <= 9 and k <= 4 and m <= 4:
                        sets += anchored_sets(a, b, k, m)
                        cases += 1
    print(f"Checked {sets} anchored packings across {cases} parameter sets.")
    print(f"Checked character and periodic packing constructions for {examples} parameter sets.")


if __name__ == "__main__":
    main()
