"""Exact degree/rank screen for unmarked two-extra-leaf rivals at the upper boundary."""
from functools import cache
from math import comb


def rival_profiles(room, largest):
    """Descending positive excesses, with any unused room permitted."""
    yield ()
    for part in range(min(room, largest), 0, -1):
        for rest in rival_profiles(room - part, part):
            yield (part, *rest)


@cache
def target_profiles(moment, largest, weight_budget):
    """Exact triangular-cost partitions with an upper bound on total hub weight."""
    if moment == 0:
        return ((),)
    candidates = []
    for part in range(min(largest, weight_budget - 1), 0, -1):
        weight = part + 1
        cost = comb(weight, 2)
        if cost <= moment:
            for rest in target_profiles(moment - cost, part, weight_budget - weight):
                candidates.append((part, *rest))
    return tuple(candidates)


def truncated(profile, level):
    # Each part equals w-1; unlisted trivalent hubs contribute zero at level >= 1.
    return sum(max(part + 1 - level, 0) for part in profile)


def candidate_dimensions(leaves, target_excess, rival_excess):
    delta = 4 + target_excess - rival_excess
    target_hubs = leaves - 4 - target_excess
    rival_hubs = leaves - 2 - rival_excess
    variation = 4 * leaves - 8
    distance_budget = (leaves - 2) * target_hubs + variation
    for projected in range(min(leaves, delta)):
        # (leaves-projected)*(rival_hubs-internal) <= distance_budget.
        lower = max(0, rival_hubs - distance_budget // (leaves - projected))
        # At least one mixed row remains. The support bound also gives
        # internal <= delta - ceil((leaves+2*projected+1)/4).
        upper = min(rival_hubs - 1, delta - projected - 1,
                    delta - (leaves + 2 * projected + 4) // 4)
        for internal in range(lower, upper + 1):
            remaining = delta - internal - projected
            if remaining > 1 or leaves <= 2 * projected + 1:
                yield internal, projected


def screen():
    survivors = []
    for rival in rival_profiles(20, 20):
        rival_excess = sum(rival)
        rival_moment = sum(comb(part + 1, 2) for part in rival)
        maximum_leaves = 275
        if rival_excess > 16:
            maximum_leaves = min(maximum_leaves,
                                 (7 * rival_excess - 32) // (rival_excess - 16))
        if maximum_leaves < 29:
            continue
        for target in target_profiles(rival_moment + 2, 20, maximum_leaves - 4):
            target_excess = sum(target)
            delta = 4 + target_excess - rival_excess
            low = max(29, 2 + rival_excess + len(rival),
                      4 + target_excess + len(target))
            high = min(maximum_leaves, 4 * delta - 1)
            if low > high:
                continue
            for level in range(1, max(rival, default=0) + 1):
                target_tail = truncated(target, level)
                rival_tail = truncated(rival, level)
                # leaves*(4+target_tail-rival_tail) >= 8+2*target_tail.
                factor = 4 + target_tail - rival_tail
                if factor <= 0:
                    low = high + 1
                    break
                low = max(low, (8 + 2 * target_tail + factor - 1) // factor)
            for leaves in range(low, high + 1):
                for internal, projected in candidate_dimensions(
                    leaves, target_excess, rival_excess
                ):
                    survivors.append((leaves, target, rival, internal, projected))
    return survivors


if __name__ == '__main__':
    boundary = screen()
    expected_targets = {
        (4, 2, 2, 1, 1, 1, 1, 1, 1, 1),
        (3, 3, 2, 2, 1, 1, 1, 1, 1),
        (3, 2, 2, 2, 2, 2, 1, 1),
    }
    expected = {(29, t, (6,), 0, 11) for t in expected_targets}
    expected.add((29, (2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1), (5,), 0, 11))
    assert set(boundary) == expected, boundary
    print("No feasible degree/rank profile at 30 through 275 rival leaves.")
    print("At 29 rival leaves four profiles satisfy these necessary inequalities.")
