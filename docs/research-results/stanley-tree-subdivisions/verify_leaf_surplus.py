"""Exact defect-budget and truncated negative-variation checks."""
from collections import Counter, defaultdict
from itertools import combinations
from math import comb
from verify_marked_visibility import small_trees


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


def check_real_trees():
    cases = 0
    for tree in small_trees(12):
        if any(len(adj) == 2 for adj in tree):
            continue
        w = [len(adj)-2 for adj in tree]
        leaves = w.count(-1)
        for period in range(1, 5):
            mass = Counter()
            for a in range(len(tree)):
                stack = [(a, -1, 0)]
                while stack:
                    u, parent, distance = stack.pop()
                    if u > a:
                        mass[distance] += w[u]*w[a]
                    for v in tree[u]:
                        if v != parent:
                            edge = tuple(sorted((u, v)))
                            stack.append((v, u, distance + 1+(3*edge[0]+5*edge[1])%period))
            loss = leaves*(leaves-2) - sum(max(-x, 0) for x in mass.values())
            for j in range(1, max(w)+1):
                truncated = sum(max(-x-j, 0) for x in mass.values())
                required = leaves * sum(max(z-j, 0) for z in w)
                assert required <= truncated + loss
            cases += 1
    return cases


if __name__ == '__main__':
    a, b = check_signatures()
    print(f'{a} possible degree-signature comparisons through 31 leaves, including {b} single-hub comparisons')
    print(f'{check_real_trees()} actual weighted-tree histograms checked at every positive defect threshold')
