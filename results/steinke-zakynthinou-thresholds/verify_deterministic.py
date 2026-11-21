"""Independent finite checks for the written deterministic threshold construction."""

from collections import Counter, defaultdict
from fractions import Fraction
from itertools import combinations_with_replacement, permutations, product
from math import e, exp, factorial

from deterministic import choose_from_law, learn_threshold, threshold_distribution


def direct_loss(sample, t):
    return sum((x >= t) != y for x, y in sample)


def leaf_enumeration(sample):
    """Compute each leaf probability from scratch along its own ancestor path."""
    ordered = sorted(sample, key=lambda row: (row[0], 1 - row[1]))
    n = len(ordered)
    parameters = sorted({x for x, _ in sample}) + [max(x for x, _ in sample) + 1]
    losses = {t: direct_loss(sample, t) for t in parameters}
    size = 2 * (n + 1)
    result = defaultdict(Fraction)
    for shift in range(size):
        cuts = []
        for position in range(size):
            offset = (shift + position) % size
            cuts.append(min(offset, size - offset - 1))
        virtual = [sum((j >= cut) != y for j, (_, y) in enumerate(ordered)) for cut in cuts]
        for position, cut in enumerate(cuts):
            lo, hi, depth = 0, size, 0
            prob = Fraction(1, size)
            while hi > lo + 1:
                mid = (hi + lo) // 2
                left, right = min(virtual[lo:mid]), min(virtual[mid:hi])
                scale = 1
                # Exact binary search on the defining fourth-power inequality.
                upper = 128 * n
                while scale < upper:
                    trial = (scale + upper) // 2
                    if trial**4 * 2**depth >= 128**4 * n**2:
                        upper = trial
                    else:
                        scale = trial + 1
                worse = Fraction(scale, 2 * (scale + abs(left - right)))
                chosen_worse = (position < mid and left > right) or (position >= mid and right > left)
                prob *= worse if chosen_worse else 1 - worse
                if position < mid:
                    hi = mid
                else:
                    lo = mid
                depth += 1
            if cut == n:
                parameter = parameters[-1]
            else:
                x = ordered[cut][0]
                later = next(t for t in parameters if t > x)
                parameter = min((x, later), key=lambda t: losses[t])
            assert losses[parameter] <= virtual[position]
            result[parameter] += prob
    return result, losses


def test_learners():
    alphabet = tuple(product((Fraction(-1, 2), Fraction(3, 4)), (0, 1)))
    kernels = orderings = filtered = 0
    for n in range(1, 6):
        for sample in combinations_with_replacement(alphabet, n):
            law, losses = threshold_distribution(sample)
            baseline, direct = leaf_enumeration(sample)
            assert law == baseline and losses == direct and sum(law.values()) == 1
            kernels += 1
            for ordered in set(permutations(sample)):
                orderings += 1
                maximum = max(x for x, _ in ordered)
                for cutoff in (0, 1, n):
                    scores = [Fraction(0)] * n
                    for t, weight in baseline.items():
                        if direct[t] > min(direct.values()) + cutoff:
                            filtered += 1
                            continue
                        eligible = [i for i, (x, _) in enumerate(ordered) if x == min(t, maximum)]
                        for i in eligible:
                            scores[i] += weight / (len(eligible) * (i + 1))
                    selected = ordered[scores.index(max(scores))][0]
                    choices = [selected] + ([maximum + 1] if selected == maximum else [])
                    answer = min(choices, key=lambda t: direct_loss(ordered, t))
                    assert choose_from_law(ordered, law, losses, cutoff) == answer
                    assert direct[answer] <= min(direct.values()) + cutoff
                    if cutoff == n:
                        assert learn_threshold(ordered) == answer
    assert filtered > 0
    return kernels, orderings, filtered


def test_priorities():
    cases = 0
    for n in range(1, 7):
        rankings = tuple(permutations(range(1, n + 1)))
        for weights in combinations_with_replacement((0, 1, 3, 11), n):
            total = sum(weights)
            if total == 0:
                continue
            wins, times = Counter(), Counter()
            for ranks in rankings:
                first, _, chosen = min((Fraction(ranks[i] * total, n * w), ranks[i], i)
                                       for i, w in enumerate(weights) if w)
                wins[chosen] += 1
                times[first] += 1
            count = factorial(n)
            assert sum(t * freq for t, freq in times.items()) <= 2 * count
            assert all(wins[i] / count <= 2 * e**2 * w / total for i, w in enumerate(weights))
            # Check just below every jump, where a decreasing tail bound is tightest.
            remaining = count
            for t, freq in sorted(times.items()):
                assert remaining / count <= min(1, exp(1 - float(t))) + 1e-12
                remaining -= freq
            cases += 1
    return cases


if __name__ == "__main__":
    kernels, orderings, filtered = test_learners()
    weights = test_priorities()
    print(f"{kernels} exact kernels; {orderings} ordered samples; "
          f"{filtered} filtered output comparisons; {weights} priority weight vectors")
