"""Deterministic proper threshold learner on an ordered rational sample."""

from collections import Counter, defaultdict
from fractions import Fraction
from math import isqrt

from efficient import integer_scale


def threshold_distribution(sample):
    """Compute the symmetric proper learner law, and its output losses in counts."""
    if not sample:
        raise ValueError("the sample must be nonempty")
    if any(y not in (0, 1) for _, y in sample):
        raise ValueError("labels must be binary")
    if any(not isinstance(x, (int, Fraction)) for x, _ in sample):
        raise TypeError("use int or Fraction for an exact feature")

    ordered = sorted(sample, key=lambda row: (row[0], -row[1]))
    n = len(ordered)
    costs = [sum(y == 0 for _, y in ordered)]
    for _, y in ordered:
        costs.append(costs[-1] + 2 * y - 1)

    sentinel = ordered[-1][0] + 1
    output = []
    losses = {sentinel: costs[n]}
    start = 0
    while start < n:
        x = ordered[start][0]
        end = start + 1
        while end < n and ordered[end][0] == x:
            end += 1
        successor = ordered[end][0] if end < n else sentinel
        chosen = x if costs[start] <= costs[end] else successor
        output.extend([chosen] * (end - start))
        losses[x] = costs[start]
        start = end
    output.append(sentinel)

    folded = list(range(n + 1)) + list(reversed(range(n + 1)))
    size = len(folded)
    scales = [integer_scale(n, depth) for depth in range((size - 1).bit_length())]
    law = defaultdict(Fraction)

    def visit(cuts, lo, hi, depth, mass):
        if hi - lo == 1:
            law[output[cuts[lo]]] += mass
            return
        mid = (lo + hi) // 2
        left = min(costs[cut] for cut in cuts[lo:mid])
        right = min(costs[cut] for cut in cuts[mid:hi])
        scale = scales[depth]
        worse = Fraction(scale, 2 * (scale + abs(left - right)))
        left_mass = mass * (worse if left > right else 1 - worse)
        visit(cuts, lo, mid, depth + 1, left_mass)
        visit(cuts, mid, hi, depth + 1, mass - left_mass)

    for shift in range(size):
        cuts = folded[shift:] + folded[:shift]
        visit(cuts, 0, size, 0, Fraction(1, size))
    return dict(law), losses


def choose_from_law(sample, law, losses, cutoff):
    """Apportion accurate output masses to rows and decode the winning row."""
    counts = Counter(x for x, _ in sample)
    largest = max(counts)
    optimum = min(losses.values())
    mass = defaultdict(Fraction)
    for parameter, weight in law.items():
        if losses[parameter] <= optimum + cutoff:
            feature = largest if parameter == largest + 1 else parameter
            mass[feature] += weight / counts[feature]
    if not mass:
        raise ValueError("the cutoff excludes the entire law")
    winner = max(enumerate(sample, 1), key=lambda entry: mass[entry[1][0]] / entry[0])
    feature = winner[1][0]
    if feature == largest and losses[largest + 1] < losses[largest]:
        return largest + 1
    return feature


def learn_threshold(sample):
    """Return the finite parameter of the deterministic classifier x >= parameter."""
    law, losses = threshold_distribution(sample)
    ceil_sqrt = isqrt(len(sample) - 1) + 1
    return choose_from_law(sample, law, losses, 2048 * ceil_sqrt)
