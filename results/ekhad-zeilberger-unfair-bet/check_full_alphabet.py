"""Check all full-alphabet maxima for lengths 2 through 5, up to relabeling."""


def restricted_growth_strings(length):
    """Give each partition of the positions labels in order of first appearance."""
    def extend(prefix, next_label):
        if len(prefix) == length:
            yield prefix
            return
        for label in range(next_label + 1):
            yield from extend(prefix + (label,), max(next_label, label + 1))

    yield from extend((0,), 1)


def overlap(first, second, q):
    """Integer weight of proper suffixes of first that are prefixes of second."""
    return sum(q**size for size in range(1, len(first))
               if first[-size:] == second[:size])


def pair_score(first, second, q):
    """Squared normalized advantage times q**k, as an integer ratio."""
    first_self = overlap(first, first, q)
    second_self = overlap(second, second, q)
    difference = first_self - second_self
    if difference == 0:
        return 0, 1
    covariance_factor = (q**len(first) + first_self + second_self
                         - overlap(first, second, q) - overlap(second, first, q))
    if covariance_factor <= 0:
        raise ValueError(f"Nonpositive covariance factor for {first}, {second}, q={q}")
    return difference**2, covariance_factor


def predicted_score(k, q):
    """The full-alphabet formula on the same q**k scale as pair_score."""
    if q <= k + 1:
        constant_self = sum(q**size for size in range(1, k))
        end_run = sum(q**size for size in range(1, k - q + 2))
        return constant_self**2, q**k + constant_self - end_run

    period = q - k
    periodic_self = sum(q**size for size in range(k - period, 0, -period))
    return periodic_self**2, q**k + periodic_self


def check_length(k):
    predictions = {q: predicted_score(k, q) for q in range(2, 2 * k + 1)}
    attained = set()
    checked = 0
    for labels in restricted_growth_strings(2 * k):
        first, second = labels[:k], labels[k:]
        if first == second:
            continue
        # The labels are consecutive, and both words together use all of them.
        q = max(labels) + 1
        numerator, denominator = pair_score(first, second, q)
        target_numerator, target_denominator = predictions[q]
        comparison = numerator * target_denominator - target_numerator * denominator
        if comparison > 0:
            raise ValueError(f"Score above prediction for k={k}, q={q}, {first}, {second}")
        if comparison == 0:
            attained.add(q)
        checked += 1
    missing = predictions.keys() - attained
    if missing:
        raise ValueError(f"Unattained predicted maxima for k={k}, alphabets {sorted(missing)}")
    return checked, len(attained)


def main():
    total = regimes = 0
    # Bell(2k) partitions minus Bell(k) partitions whose two halves coincide.
    expected_counts = {2: 13, 3: 198, 4: 4125, 5: 115923}
    for k, expected in expected_counts.items():
        checked, attained = check_length(k)
        if checked != expected:
            raise ValueError(f"Expected {expected} distinct-pair classes for k={k}, got {checked}")
        print(f"k={k}: {checked:,} ordered-pair classes, {attained} full-alphabet maxima attained")
        total += checked
        regimes += attained
    print(f"Checked {total:,} ordered-pair classes across {regimes} full-alphabet regimes.")


if __name__ == "__main__":
    main()
