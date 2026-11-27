"""Finite checks for the symmetric-shift construction, not cardinal verification."""
from collections import Counter, defaultdict, deque
from itertools import combinations, permutations, product
from random import Random
from check_shift_orientation import kth_floor


def forward(a, b):
    return a[1:] == b[:-1] and b[-1] not in a


def adjacent(a, b):
    return forward(a, b) or forward(b, a)


def orient(vertices, k, stats):
    if k == 1:
        return dict.fromkeys(vertices, 0), list(combinations(sorted(vertices), 2))
    n = len(vertices)
    inc, out = defaultdict(list), defaultdict(list)
    for a in vertices:
        inc[a[1:]].append(a)
        out[a[:-1]].append(a)
    centers = set(inc) | set(out)
    t = kth_floor(n, k)
    heavy = {u for u in centers if min(len(inc[u]), len(out[u])) > t}
    base_color, base_orientation = orient(heavy, k - 1, stats)
    losers = {frozenset((x, y)): x for x, y in base_orientation}
    fail, colors = defaultdict(set), {}
    for a in vertices:
        x, y = a[:-1], a[1:]
        if x in heavy and y in heavy and base_color[x] == base_color[y]:
            loser = losers[frozenset((x, y))]
            fail[loser].add(a)
            colors[a] = base_color[y] if loser == x else 1 - base_color[x]
        elif y in heavy:
            colors[a] = base_color[y]
        elif x in heavy:
            colors[a] = 1 - base_color[x]
        else:
            colors[a] = 0

    cap = 2 * 4 ** (k - 2)
    for failed in fail.values():
        assert len(failed) ** k <= cap ** k * n
        if k == 2:
            stats["reversed_failures"] += sum(a[::-1] in failed for a in failed)

    directed = {}
    for u in centers:
        for a, b in product(inc[u], out[u]):
            if b[-1] in a or colors[a] != colors[b]:
                continue
            if u in heavy:
                assert a in fail[u] or b in fail[u]
                edge = (a, b) if b in fail[u] else (b, a)
            else:
                assert min(len(inc[u]), len(out[u])) <= t
                edge = (a, b) if len(out[u]) <= t else (b, a)
            directed.setdefault(frozenset((a, b)), edge)
    return colors, list(directed.values())


def check(vertices, k, stats):
    colors, directed = orient(vertices, k, stats)
    expected = {frozenset((a, b)) for a, b in combinations(vertices, 2)
                if adjacent(a, b) and colors[a] == colors[b]}
    assert len(directed) == len(expected)
    assert {frozenset(e) for e in directed} == expected
    largest = max(Counter(a for a, _ in directed).values(), default=0)
    assert largest ** k <= 4 ** ((k - 1) * k) * len(vertices)
    stats["colorings"] += 1


def check_geometry(stats):
    for k in range(2, 7):
        alphabet = tuple(range(k + 1))
        rows = list(permutations(alphabet, k))
        windows = {
            width: {row: tuple(row[i:i + k - width + 1] for i in range(width))
                    for row in rows}
            for width in range(1, k + 1)
        }
        assert all(len(set(mapping.values())) == len(rows) for mapping in windows.values())
        def neighbors(a):
            for x in alphabet:
                if x not in a:
                    yield a[1:] + (x,)
                    yield (x,) + a[:-1]
        for a in rows:
            for b in neighbors(a):
                for mapping in windows.values():
                    assert adjacent(mapping[a], mapping[b])
                    stats["window_edges"] += 1
            seen, queue = {(a, 0)}, deque([(a, 0, 0)])
            while queue:
                b, parity, distance = queue.popleft()
                assert b != a or parity == 0
                if distance + 1 < k:
                    for c in neighbors(b):
                        state = (c, 1 - parity)
                        if state not in seen:
                            queue.append((*state, distance + 1))
                            seen.add(state)
            stats["odd_girth_starts"] += 1


def main():
    stats = Counter()
    for k, n in ((1, 6), (2, 3), (3, 3)):
        all_rows = tuple(permutations(range(n), k))
        for mask in range(1 << len(all_rows)):
            check({row for i, row in enumerate(all_rows) if mask >> i & 1}, k, stats)
    # Force two heavy centers joined in both orientations in the base.
    check({(a, b) for a, b in permutations(range(12), 2) if min(a, b) < 2}, 2, stats)
    assert stats["reversed_failures"] > 0
    rng = Random(1015)
    for k in range(2, 8):
        rows = tuple(permutations(range(k + 1), k))
        for _ in range(100):
            check(set(rng.sample(rows, rng.randrange(0, min(110, len(rows)) + 1))), k, stats)
    check_geometry(stats)
    print(dict(stats))


if __name__ == "__main__":
    main()
