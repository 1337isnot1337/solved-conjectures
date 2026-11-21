"""Finite-coin proper threshold learner. Exact rational features are supported."""

from fractions import Fraction
from math import isqrt
from secrets import randbits


def integer_scale(n, depth):
    """Ceiling of 128 sqrt(n) 2^(-depth/4), using integer arithmetic."""
    power = 1 << depth
    target = (128**4 * n * n + power - 1) // power
    floor = isqrt(isqrt(target))
    return floor + (floor**4 != target)


def learn_threshold(sample, random_bits=randbits):
    """Return t for the classifier x >= t; coins are independent fair bits."""
    n = len(sample)
    if not n:
        raise ValueError("the sample must be nonempty")
    if any(y not in (0, 1) for _, y in sample):
        raise ValueError("labels must be binary")
    if any(not isinstance(x, (int, Fraction)) for x, _ in sample):
        raise TypeError("use int or Fraction for an exact feature")
    bits = 8 + 6 * n.bit_length()  # ceil(log2(n+1)) = bit_length(n)
    grid = 1 << bits
    tagged = sorted((x, random_bits(bits), y) for x, y in sample)
    if any(a[:2] == b[:2] for a, b in zip(tagged, tagged[1:])):
        return 0

    total_loss = sum(y == 0 for _, _, y in tagged)
    costs = [total_loss]
    for _, _, y in tagged:
        total_loss += 2 * y - 1
        costs.append(total_loss)
    folded = costs + costs[::-1]
    size = len(folded)
    shift = size * random_bits(bits) // grid
    shifted = folded[shift:] + folded[:shift]

    lo, hi, depth = 0, size, 0
    while hi - lo > 1:
        mid = (lo + hi) // 2
        left, right = min(shifted[lo:mid]), min(shifted[mid:hi])
        scale = integer_scale(n, depth)
        denominator = 2 * (scale + abs(left - right))
        numerator = scale if left > right else denominator - scale
        if random_bits(bits) * denominator < grid * numerator:
            hi = mid
        else:
            lo = mid
        depth += 1

    position = (lo + shift) % size
    cut = min(position, size - 1 - position)
    if cut == n:
        return tagged[-1][0] + 1
    w, tag, _ = tagged[cut]
    if 2 * tag < grid:
        return w
    return next((x for x, _, _ in tagged[cut + 1:] if x > w), w + 1)
