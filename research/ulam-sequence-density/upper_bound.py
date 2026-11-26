"""Two exact replays of the reverse-prefix upper Banach density certificates."""


def ulam_prefix(limit):
    """Scan in increasing order, counting unordered pairs of distinct earlier terms."""
    prefix = []
    counts = [0] * (limit + 1)
    for n in range(1, limit + 1):
        if n > 2 and counts[n] != 1:
            continue
        for u in prefix:
            if u + n > limit:
                break
            counts[u + n] += 1
        prefix.append(n)
    return prefix


def reverse_prefixes(anchors, numerator, denominator, steps, horizon):
    """Offsets increase from the largest term of a hypothetical interval to the left."""
    shifts = sum(1 << f for f in anchors)
    reflected = sum(1 << (horizon - f) for f in anchors)
    all_bits = (1 << (horizon + 1)) - 1
    successors = [(shifts << z) & all_bits for z in range(horizon + 1)]
    limits = [(1 << ((denominator * k - 1) // numerator + 1)) - 1 for k in range(steps + 1)]
    counts = [0] * (steps + 2)

    def visit(size, last, chosen, forbidden):
        counts[size] += 1
        if size == steps + 1:
            raise ValueError("a word escaped all the proposed spacing inequalities")
        candidates = limits[size] & ~((1 << (last + 1)) - 1) & ~forbidden
        while candidates:
            bit = candidates & -candidates
            offset = bit.bit_length() - 1
            # Each of these older offsets acquires its first smaller summand partner.
            parents = chosen & (reflected >> (horizon - offset))
            blocked = forbidden
            while parents:
                parent = parents & -parents
                blocked |= successors[parent.bit_length() - 1]
                parents ^= parent
            visit(size + 1, offset, chosen | bit, blocked)
            candidates ^= bit

    visit(1, 0, 1, 0)
    return counts


def direct_check(numerator, denominator, steps, horizon):
    """Rebuild the anchors by subtraction and test already-used targets at each new site."""
    anchors = {1, 2}
    for n in range(3, horizon + 1):
        if sum(n - a in anchors for a in anchors if 2 * a < n) == 1:
            anchors.add(n)
    targets_at = [sum(1 << (y - a) for a in anchors if a <= y) for y in range(horizon + 1)]
    counts = [0] * (steps + 2)

    def visit(size, last, chosen, used):
        counts[size] += 1
        if size > steps:
            raise ValueError("a dense prefix survived the direct check")
        # Strict inequality is checked by multiplication, independently of the bit cut.
        candidate = last + 1
        while numerator * candidate < denominator * size:
            targets = targets_at[candidate]
            if not targets & used:
                visit(size + 1, candidate, chosen | (1 << candidate), used | (targets & chosen))
            candidate += 1

    visit(1, 0, 1, 0)
    return anchors, counts


def verify(numerator, denominator, steps):
    horizon = (denominator * steps - 1) // numerator
    prefix = ulam_prefix(horizon)
    counts = reverse_prefixes(prefix, numerator, denominator, steps, horizon)
    direct_anchors, direct_counts = direct_check(numerator, denominator, steps, horizon)
    if set(prefix) != direct_anchors or counts != direct_counts:
        raise ValueError("the two enumerations disagree")
    largest = max(k for k, count in enumerate(counts) if count)
    print(f"{numerator}/{denominator}: {len(prefix)} anchors through {horizon}; "
          f"{sum(counts)} prefixes; maximum size {largest}; size {steps + 1}: {counts[-1]}", flush=True)


if __name__ == "__main__":
    verify(7, 29, 290)
    verify(47, 195, 676)
