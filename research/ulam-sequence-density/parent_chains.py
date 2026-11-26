"""Enumerate the allowed words of smaller summands along a larger-parent chain."""

from upper_bound import ulam_prefix


def check_words(steps, horizon, max_length):
    anchors = ulam_prefix(horizon)
    if not set(steps).issubset(anchors):
        raise ValueError("a proposed step is not an Ulam number")
    anchor_bits = sum(1 << a for a in anchors)
    mask = (1 << (horizon + 1)) - 1
    tests = [(s, anchor_bits >> s) for s in steps]
    counts = [0] * (max_length + 1)
    endpoints = set()

    def suffixes(history, length, endpoint):
        if length > max_length:
            raise ValueError("the proposed maximum chain length was exceeded")
        counts[length] += 1
        endpoints.add(endpoint)
        for s, conflicted_distances in tests:
            if not history & conflicted_distances:
                # Record distances from the new endpoint to all preceding vertices.
                suffixes(((history | 1) << s) & mask, length + 1, endpoint + s)

    suffixes(0, 0, 0)

    # A second enumeration keeps absolute forbidden endpoints. A one-step
    # edge from the current vertex is allowed, so add its shifts only after moving.
    other_counts = [0] * (max_length + 1)
    other_endpoints = set()
    shifted = [anchor_bits << j for j in range(max_length * max(steps) + 1)]

    def extend(blocked, length, endpoint):
        if length > max_length:
            raise ValueError("a longer word survived the absolute-position test")
        other_counts[length] += 1
        other_endpoints.add(endpoint)
        next_blocked = blocked | shifted[endpoint]
        for s in steps:
            y = endpoint + s
            if not (blocked >> y) & 1:
                extend(next_blocked, length + 1, y)

    extend(0, 0, 0)
    if counts != other_counts or endpoints != other_endpoints:
        raise ValueError("the two word enumerations disagree")
    print(f"steps {steps}, anchors through {horizon}: {sum(counts)} words, "
          f"length {max(i for i, n in enumerate(counts) if n)}, "
          f"span {max(endpoints)}, {len(endpoints)} endpoints", flush=True)


if __name__ == "__main__":
    check_words(ulam_prefix(18), 500, 25)
    check_words(ulam_prefix(26), 900, 36)
    check_words([2, 3, 47, 69], 4600, 97)
