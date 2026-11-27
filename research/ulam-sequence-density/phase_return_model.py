"""Verify the long return-word certificate for the cutoff-102 phase model."""

from fractions import Fraction
from math import lcm

from verify import ulam_shift_mask


P = 350477575
Q = 856371966
ALPHA = 3 * P - Q
SLOPE_RADIUS_DENOMINATOR = 10**13
MEMORY = 102
LENGTH = 400_000
ANCHOR = Fraction(3, 542)
SHIFTS = [s for s in range(1, MEMORY + 1) if (ulam_shift_mask(MEMORY + 1) >> s) & 1]
SHIFT_MASK = sum(1 << (s - 1) for s in SHIFTS)
STATE_MASK = (1 << MEMORY) - 1


def number(endpoint):
    constant, coefficient = endpoint
    return constant * Q + coefficient * ALPHA


def subtract(left, right):
    return left[0] - right[0], left[1] - right[1]


def nonnegative(endpoint):
    # The variation of alpha is at most three times that of theta.
    return number(endpoint) * SLOPE_RADIUS_DENOMINATOR >= 3 * Q * abs(endpoint[1])


def cut(t):
    endpoint = (-(-t * ALPHA // Q), -t)
    assert nonnegative(endpoint) and nonnegative(subtract((1, 0), endpoint))
    return endpoint


def check_cuts(first, last, low, high):
    for t in range(first, last):
        endpoint = cut(t)
        assert nonnegative(subtract(low, endpoint)) or nonnegative(subtract(endpoint, high))


def gate_at(base):
    denominator = lcm(Q, base.denominator)
    start = base.numerator * (denominator // base.denominator)
    step = P * (denominator // Q)

    def gate(t):
        phase = 3 * ((start + t * step) % denominator)
        return denominator < phase < 2 * denominator

    return gate


def advance(state, bit):
    return ((state << 1) | bit) & STATE_MASK


def check_image(color, expected_live_count, expected_memory):
    gate = gate_at((ANCHOR + color) / 3)
    live = [
        j for j in range(1, MEMORY + 1)
        if gate(-j) and any(s >= j and gate(s - j) for s in SHIFTS)
    ]
    assert len(live) == expected_live_count
    states = {0}
    for j in live:
        states |= {state | (1 << (j - 1)) for state in states}
    for t in range(LENGTH):
        if gate(t):
            states = {advance(state, (state & SHIFT_MASK).bit_count() == 1) for state in states}
        else:
            states = {advance(state, 0) for state in states}
    assert states == {0, expected_memory}
    print(f"Color {color}: {1 << len(live)} input histories give zero and one positive memory.")


def check_return(low, high, steps, offset, counts, memories):
    check_cuts(LENGTH, LENGTH + steps, low, high)
    phase = Fraction(number(low) + number(high), 2 * Q)
    for color, expected_count in enumerate(counts):
        gate = gate_at((phase + color) / 3)
        state = memories[color]
        count = 0
        for t in range(LENGTH, LENGTH + steps):
            bit = gate(t) and (state & SHIFT_MASK).bit_count() == 1
            state = advance(state, bit)
            count += bit
        target = (color + steps - offset[0]) % 3
        assert target == (color + 1) % 3
        assert state == memories[target] and count == expected_count
    print(f"Return {steps}: positive memories rotate through colors, with counts {counts}.")


def main():
    low, middle, high = map(cut, (29_990, 403_647, 343_645))
    assert number(low) < ANCHOR * Q < number(high)
    check_cuts(-MEMORY, LENGTH + 1, low, high)
    positive_steps, negative_steps = 60_002, 373_657
    positive = subtract(high, middle)
    negative = subtract(low, middle)
    assert positive[1] == positive_steps and negative[1] == negative_steps
    assert number(positive) > 0 > number(negative)
    assert nonnegative(positive) and nonnegative(subtract((0, 0), negative))
    width = subtract(high, low)
    for steps in range(1, negative_steps):
        residue = (-(steps * ALPHA // Q), steps)
        assert nonnegative(residue) and nonnegative(subtract((1, 0), residue))
        # No earlier negative displacement returns. Once the positive
        # return is available, later positive displacements only serve
        # a subset of its domain until the negative return takes over.
        assert nonnegative(subtract(subtract((1, 0), residue), width))
        threshold = width if steps < positive_steps else positive
        assert nonnegative(subtract(residue, threshold))
    memories = (5725472681694927751940669440,
                1466069224373964393491462619136,
                396141417034254013285812667648)
    for color, live_count in enumerate((11, 17, 15)):
        check_image(color, live_count, memories[color])
    positive_counts = (5578, 5578, 5557)
    negative_counts = (34685, 34685, 34664)
    check_return(low, middle, positive_steps, positive, positive_counts, memories)
    check_return(middle, high, negative_steps, negative, negative_counts, memories)
    lengths = (subtract(middle, low), subtract(high, middle))
    formula = tuple(
        sum(counts * length[i] for counts, length in zip(map(sum, (positive_counts, negative_counts)), lengths))
        for i in range(2)
    )
    assert formula == (610752, -2681373)
    print("Positive density is (610752 - 2681373*alpha)/3.")


if __name__ == "__main__":
    main()
