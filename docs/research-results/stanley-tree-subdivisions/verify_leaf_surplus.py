"""Exact defect-budget and truncated negative-variation checks."""
from collections import Counter, defaultdict
from itertools import combinations
from math import comb
from verify_marked_visibility import normal_forms, small_trees


def parts(total, ceiling):
    if total == 0:
        yield ()
    for head in range(1, min(total, ceiling) + 1):
        for rest in parts(total - head, head):
            yield (head, *rest)


def tails(signature):
    return tuple(sum(max(w - j, 0) for w in signature) for j in range(1, 32))


def check_signatures():
    by_budget = defaultdict(list)
    for total in range(0, 30):
        for sig in parts(total, total):
            kappa = sum(comb(w, 2) for w in sig)
            by_budget[total+2, kappa].append((sig, tails(sig)))
    comparisons = 0
    single = 0
    for (leaves, kt), records in by_budget.items():
        for sig, target in records:
            high = [w for w in sig if w > 1]
            if not high:
                continue
            d = high[0]
            for c in range(1, min(5, kt) + 1):
                omega = c * (2*leaves+c-2)
                for rival, other in by_budget.get((leaves+c, kt-c), ()):
                    delta = 2*c + target[0] - other[0]
                    if delta <= 0:
                        continue
                    if any((leaves+c)*y > leaves*x + omega for x, y in zip(target, other)):
                        continue
                    comparisons += 1
                    assert max(rival) <= d+2*c-1
                    assert delta <= 3*c + (d-2)*(2*c-1) + c*(2*c-1)
                    if len(high) == 1 and d >= 3:
                        single += 1
                        assert max(rival) < d
                        curve = [d-j-other[j-1] for j in range(1, d)]
                        assert curve[-1] == 1 and sum(curve) == c
                        assert all(curve[j-1]+curve[j+1] <= 2*curve[j]
                                   for j in range(1, len(curve)-1))
                        assert delta <= 2*c-1 + 2*c//(d-1)
    return comparisons, single


def check_negative_classes(classes, edges, w):
    leaves = [u for u, weight in enumerate(w) if weight == -1]
    hubs = [u for u, weight in enumerate(w) if weight > 0]
    if not hubs:
        return
    rows = []
    group = {u: u for u in leaves}
    seen = defaultdict(set)
    for distance, paths in classes.items():
        leaf0, ref = paths[0]
        for leaf, mask in paths:
            old = group[leaf]
            new = group[leaf0]
            group = {u: new if tag == old else tag for u, tag in group.items()}
            seen[leaf].add(distance)
            if mask != ref:
                rows.append([((mask >> k) & 1)-((ref >> k) & 1) for k in range(len(edges))])
    pendant = [i for i, (u,v) in enumerate(edges) if min(w[u],w[v]) == -1]
    _, full_rank = normal_forms(rows, len(edges))
    _, pendant_rank = normal_forms([[row[k] for k in pendant] for row in rows], len(pendant))
    internal_rank = full_rank - pendant_rank
    assert len(set(group.values())) == len(leaves) - pendant_rank
    assert all(len(seen[u]) >= len(hubs) - internal_rank for u in leaves)
    assert len(classes) >= (len(leaves)-pendant_rank) * (len(hubs)-internal_rank)


def check_real_trees():
    cases = 0
    for tree in small_trees(12):
        if any(len(adj) == 2 for adj in tree):
            continue
        w = [len(adj)-2 for adj in tree]
        leaves = w.count(-1)
        edges = [(u,v) for u in range(len(tree)) for v in tree[u] if u < v]
        bits = {e: 1 << i for i, e in enumerate(edges)}
        for period in range(1, 5):
            mass = Counter()
            negative = defaultdict(list)
            for a in range(len(tree)):
                stack = [(a, -1, 0, 0)]
                while stack:
                    u, parent, distance, mask = stack.pop()
                    if u > a:
                        mass[distance] += w[u]*w[a]
                        if w[u]*w[a] < 0:
                            negative[distance].append((a if w[a] < 0 else u, mask))
                    for v in tree[u]:
                        if v != parent:
                            edge = tuple(sorted((u, v)))
                            stack.append((v, u, distance + 1+(3*edge[0]+5*edge[1])%period, mask | bits[edge]))
            loss = leaves*(leaves-2) - sum(max(-x, 0) for x in mass.values())
            for j in range(1, max(w)+1):
                truncated = sum(max(-x-j, 0) for x in mass.values())
                required = leaves * sum(max(z-j, 0) for z in w)
                assert required <= truncated + loss
            check_negative_classes(negative, edges, w)
            cases += 1
    return cases


if __name__ == '__main__':
    a, b = check_signatures()
    print(f'{a} possible degree-signature comparisons through 31 leaves, including {b} single-hub comparisons')
    print(f'{check_real_trees()} actual weighted-tree histograms checked for defect tails and negative-path row ranks')
