#!/usr/bin/env python3
"""Exercise the path-cover and Hall construction; no solver dependencies."""
from itertools import product
from random import Random


def arrange(end):
    """Return (path index, reversal flag) pairs in the lemma's order."""
    s = len(end)
    chosen = None
    for i, labels in enumerate(end):
        for flip, a in enumerate(labels):
            options = [(j, f, b) for j, other in enumerate(end) if j != i
                       for f, b in enumerate(other) if a == 0 or b != a]
            if len({j for j, _, _ in options}) >= 2:
                chosen = i, flip, options
                break
        if chosen is not None:
            break
    assert chosen is not None
    i, flip, opt = chosen
    first = (i, flip)
    j, bj, b = opt[0]
    k, ck, c = next(z for z in opt if z[0] != j)
    # B exposes b on its right and C exposes c on its left.
    pair = [(j, 1-bj), (k, ck)]
    if b and c and b != c:
        h = next(t for t in range(s) if t not in (i, j, k))
        d = end[i][1-flip]
        target = {b, c}
        for hf, e in enumerate(end[h]):
            if ({d, e} - {0}) != target:
                pair.insert(0, (h, hf))
                break
        else:
            e = end[h][0]
            assert end[h][1] == e
            pair = [(h, 0), (j, bj) if b == e else (k, ck)]
    selected = [first] + pair
    used = {i for i, _ in selected}
    selected.extend((i, 0) for i in range(s) if i not in used)
    assert len(selected) == s
    return selected


def matching(end):
    order = arrange(end)
    labels = set(range(1, len(order)+1))
    first, direction = order[0]
    bans = [{end[first][direction]} - {0}]
    for (i, fi), (j, fj) in zip(order, order[1:]):
        bans.append({end[i][1-fi], end[j][fj]} - {0})
    assert not bans[0] or not (bans[0] & set.intersection(*bans[1:]))
    assert len(set.intersection(*bans[1:])) <= 1
    mate = {}
    def assign(slot, visited):
        for label in labels - bans[slot] - visited:
            visited.add(label)
            if label not in mate or assign(mate[label], visited):
                mate[label] = slot
                return True
        return False
    assert all(assign(i, set()) for i in range(len(order)))
    by_slot = {i: label for label, i in mate.items()}
    return order, [by_slot[i] for i in range(len(order))]


def stitch(s, g, types):
    p = [[v] for v in range(len(g))]
    while True:
        join = next(((i, u, j, v) for i, a in enumerate(p)
                     for j, b in enumerate(p[:i])
                     for u in (0, -1) for v in (0, -1)
                     if b[v] in g[a[u]]), None)
        if join is None:
            break
        i, u, j, v = join
        a, b = p.pop(i), p.pop(j)
        p.append((a[::-1] if u == 0 else a) +
                 (b[::-1] if v == -1 else b))
    assert len(p) <= s
    tails = {types[v] for a in p for v in (a[0], a[-1])}
    if len(tails) == 1 and 0 not in tails:
        l = next(iter(tails))
        i, k = next((i, k) for i, a in enumerate(p)
                    for k, v in enumerate(a) if types[v] != l)
        assert 0 < k < len(p[i])-1 and len(p) < s
        a = p.pop(i)
        p.extend((a[:k], a[k:]))
    while len(p) < s:
        i = next(i for i, a in enumerate(p) if len(a) > 1)
        a = p.pop(i)
        p.extend((a[:1], a[1:]))
    end = [(types[a[0]], types[a[-1]]) for a in p]
    order, connector = matching(end)
    path = []
    n = len(g)
    for (i, flip), label in zip(order, connector):
        path.append(n + label - 1)
        path.extend(p[i][::-1] if flip else p[i])
    assert set(path) == set(range(n+s)) and len(path) == n+s
    for u, v in zip(path, path[1:]):
        u, v = min(u, v), max(u, v)
        assert (v in g[u] if v < n else types[u] != v-n+1)


def main():
    checked = 0
    for flat in product(range(5), repeat=8):
        if 0 not in flat and len(set(flat)) == 1:
            continue
        matching(tuple(zip(flat[::2], flat[1::2])))
        checked += 1
    assert checked == 5**8-4
    print(f"Matched all {checked:,} four-path label patterns.", flush=True)
    rng = Random(1002)
    random_checks = 0
    for s in range(4, 16):
        for _ in range(250):
            groups = [[i+1] for i in range(s)]
            # Every label is present, but for each nonzero label there
            # is at least one group disjoint from it. The groups are cliques.
            for i, group in enumerate(groups):
                other = (i+1)%s+1
                choices = [l for l in range(s+1) if l != other]
                group.extend(rng.choices(choices, k=rng.randrange(5)))
            types = [l for row in groups for l in row]
            grp = [i for i, row in enumerate(groups) for _ in row]
            g = [set() for _ in types]
            probability = rng.choice((0, 0.05, 0.12, 0.35))
            for x in range(len(g)):
                for y in range(x):
                    if grp[x] == grp[y] or rng.random() < probability:
                        g[x].add(y); g[y].add(x)
            stitch(s, g, types)
            random_checks += 1
    print(f"Built and checked {random_checks:,} near-join Hamilton paths.", flush=True)

if __name__ == "__main__":
    main()
