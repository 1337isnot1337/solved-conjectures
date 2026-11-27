"""Exercise the constructive shift defect proof; does not check infinite cardinal claims."""
from collections import defaultdict
from itertools import combinations, product
import random


def kth_floor(n, k):
    lo, hi = 0, n + 1
    while hi - lo > 1:
        mid = (hi + lo) // 2
        if mid ** k <= n:
            lo = mid
        else:
            hi = mid
    return lo


def defect(vertices, k):
    """Return two-coloring and orientation of exactly its monochromatic edges."""
    n = len(vertices)
    if not vertices:
        return {}, []
    if k == 1:
        return dict.fromkeys(vertices, 0), list(combinations(sorted(vertices), 2))
    inc, out = defaultdict(list), defaultdict(list)
    for arc in vertices:
        inc[arc[1:]].append(arc)
        out[arc[:-1]].append(arc)
    centers = set(inc) | set(out)
    T = kth_floor(n, k)
    heavy = {v for v in centers if min(len(inc[v]), len(out[v])) > T}
    assert len(heavy) * T <= n
    base_color, base_defect = defect(heavy, k - 1)
    failed_at = {frozenset((a, b)): a for a, b in base_defect}

    color, fail = {}, defaultdict(set)
    for e in vertices:
        u, v = e[:-1], e[1:]
        if u in heavy and v in heavy:
            if base_color[u] != base_color[v]:
                color[e] = base_color[v]
            else:
                lose = failed_at[frozenset((u, v))]
                fail[lose].add(e)
                color[e] = base_color[v] if lose == u else 1 - base_color[u]
        elif u in heavy:
            color[e] = 1 - base_color[u]
        elif v in heavy:
            color[e] = base_color[v]
        else:
            color[e] = 0

    directed = []
    for v in centers:
        for a, b in product(inc[v], out[v]):
            if color[a] != color[b]:
                continue
            if v in heavy:
                assert a in fail[v] or b in fail[v]
                directed.append((a, b) if b in fail[v] else (b, a))
            else:
                directed.append((a, b) if len(out[v]) <= T else (b, a))
    local_out = defaultdict(int)
    for a, _ in directed:
        local_out[a] += 1
    assert max(local_out.values(), default=0) ** k <= (2 ** ((k - 1) * k)) * n
    return color, directed


def independently_check(vertices, k, color, oriented):
    assert set(vertices) == set(color) and set(color.values()) <= {0, 1}
    monochrom = {
        frozenset((a, b))
        for a, b in combinations(vertices, 2)
        if (a[1:] == b[:-1] or b[1:] == a[:-1]) and color[a] == color[b]
    }
    assert len(oriented) == len(monochrom)
    assert {frozenset(e) for e in oriented} == monochrom
    loads = defaultdict(int)
    for a, b in oriented:
        loads[a] += 1
    n = len(vertices)
    assert max(loads.values(), default=0)**k <= 2**((k-1)*k)*n


def main():
    rng = random.Random(111)
    total = 0
    for k, ground in ((1, 7), (2, 5), (3, 5), (4, 6)):
        all_vertices = tuple(combinations(range(ground), k))
        for mask in range(1 << len(all_vertices)):
            example = {v for i, v in enumerate(all_vertices) if (mask >> i) & 1}
            independently_check(example, k, *defect(example, k))
            total += 1
    for k in range(2, 9):
        universe = tuple(combinations(range(k + 7), k))
        for _ in range(100):
            example = set(rng.sample(universe, rng.randint(0, min(250, len(universe)))))
            independently_check(example, k, *defect(example, k))
            total += 1
    print(f"{total:,} examples; all edge sets and orientations agree (seed 111)")


if __name__ == "__main__":
    main()
