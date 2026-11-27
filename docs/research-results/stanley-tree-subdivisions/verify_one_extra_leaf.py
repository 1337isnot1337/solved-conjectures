"""Check every possible terminal degree profile in the one-extra-leaf proof."""
from collections import defaultdict
from math import comb


def partitions(total, cap):
    """Yield descending positive parts, representing the excesses of high hubs."""
    if total == 0:
        yield ()
        return
    for head in range(min(total, cap), 0, -1):
        for rest in partitions(total - head, head):
            yield (head,) + rest


def signatures(max_excess):
    for excess in range(max_excess + 1):
        yield from partitions(excess, excess)


def budget(profile):
    return sum(comb(part + 1, 2) for part in profile)


def tail(profile, threshold):
    return sum(max(part + 1 - threshold, 0) for part in profile)


def compatible_dimensions(leaves, rival_hubs, target_hubs, delta):
    cancellation = 2 * leaves - 3
    for internal in range(min(rival_hubs - 1, delta - 1) + 1):
        for projected in range(min(leaves - 1, delta - 1 - internal) + 1):
            other = delta - internal - projected
            if leaves > 2 * projected + 4 * other - 1:
                continue
            negative_lengths = (leaves - projected) * (rival_hubs - internal)
            if negative_lengths <= (leaves - 1) * target_hubs + cancellation:
                yield internal, projected


def surviving_records():
    targets = defaultdict(list)
    for target in signatures(25):
        if len(target) >= 2:
            targets[budget(target)].append(target)

    for rival in signatures(12):
        for target in targets[budget(rival) + 1]:
            delta = 2 + sum(target) - sum(rival)
            if not 1 <= delta <= max(target) + 3:
                continue
            # A profile with h high hubs needs at least h total hubs.
            lower = max(sum(rival) + len(rival) + 2, sum(target) + len(target) + 3)
            upper = min(59, 4 * delta - 1)
            for leaves in range(lower, upper + 1):
                rival_hubs = leaves - 2 - sum(rival)
                target_hubs = leaves - 3 - sum(target)
                cancellation = 2 * leaves - 3
                if any(leaves * tail(rival, j) > (leaves - 1) * tail(target, j) + cancellation
                       for j in range(1, max(rival, default=0) + 1)):
                    continue
                dimensions = compatible_dimensions(leaves, rival_hubs, target_hubs, delta)
                for internal, projected in dimensions:
                    yield leaves, target, target_hubs, rival, rival_hubs, delta, internal, projected


if __name__ == "__main__":
    records = sorted(surviving_records())
    expected = [(7, (1, 1), 2, (1,), 4, 3, 0, 2), (7, (1, 1), 2, (1,), 4, 3, 1, 0)]
    if records != expected:
        raise AssertionError(f"Unexpected terminal profiles: {records}")
    print("Exhaustive one-extra-leaf screen passed. One degree profile, two rank pairs.")
