"""Construct a connected simple cubic bipartite graph with a prescribed residue."""

from math import lcm


def even_period(modulus):
    a, b = 0, 1
    steps = 0
    while True:
        a, b = b, (a + b) % modulus
        steps += 1
        if (a, b) == (0, 1):
            return lcm(2, steps)


def path_graph(t, padding):
    # Split a directed graph into its row and column copies. The only
    # nonloop cycle follows the upper track, crosses once, then returns
    # along the lower track to the start.
    size = 2 * t + padding
    rows = [set() for _ in range(size)]
    for i in range(2 * t):
        if i not in (0, 2*t - 1):
            rows[i].add(i)
    for i in range(t):
        rows[i].add(t+i)
        if i + 1 < t:
            rows[i].add(i+1)
            rows[t+i].add(t+i+1)
    rows[2*t-1].add(0)
    for i in range(2*t, size):
        rows[i].add(i)
    return rows


def deficiency_pairs(rows):
    """Reserve one pair of deficient ports per component to join a cycle."""
    n = len(rows)
    cols = [set() for _ in rows]
    for i, neighbors in enumerate(rows):
        for j in neighbors:
            cols[j].add(i)
    seen = set()
    reserved = []
    pairs = []
    for start in range(n):
        if start in seen:
            continue
        left, right = [], []
        stack = [start]
        while stack:
            node = stack.pop()
            if node in seen:
                continue
            seen.add(node)
            if node < n:
                left.extend([node] * (3 - len(rows[node])))
                stack.extend(n + j for j in rows[node])
            else:
                j = node - n
                right.extend([j] * (3 - len(cols[j])))
                stack.extend(cols[j])
        assert left and len(left) == len(right)
        reserved.append((left.pop(), right.pop()))
        pairs.extend(zip(left, right))
    for i, (row, _) in enumerate(reserved):
        pairs.append((row, reserved[(i+1) % len(reserved)][1]))
    return pairs


def insert_ladder(rows, u, v, length):
    # In the 2*length cycle, even vertices are left and odd vertices right.
    # Replace its rail 0--1 by the two connections to the host.
    first = len(rows)
    rows.extend(set() for _ in range(length))
    for i in range(length):
        even = 2*i
        for odd in ((even-1) % (2*length), even+1, (even+length) % (2*length)):
            if (even, odd) != (0, 1):
                rows[first+i].add(first + odd//2)
    rows[u].add(first)
    rows[first].add(v)


def cubic_graph(n, modulus, residue):
    """Return row neighbor sets. All n >= 79*modulus**2 work; some smaller n do too."""
    if modulus < 2:
        raise ValueError("modulus must be at least two")
    t = residue % modulus or modulus
    period = even_period(modulus)
    length = period - 1
    base = 2*t + (t+3)*length
    padding = (base - n) % period
    extra = n - base - padding * (1 + 2*length)
    if extra < 0:
        raise ValueError("order too small for this construction")
    rows = path_graph(t, padding)
    for i, (u, v) in enumerate(deficiency_pairs(rows)):
        insert_ladder(rows, u, v, length + (extra if i == 0 else 0))
    assert len(rows) == n
    return rows
