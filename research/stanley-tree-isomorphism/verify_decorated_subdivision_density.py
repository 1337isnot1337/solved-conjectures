"""Exact tests for the cut impulses and the highest connected-subset windows."""
from bisect import bisect_left
from collections import Counter
from fractions import Fraction
from itertools import combinations

# Rooted caps, including two different shapes with two rooted leaves.
LEAF = ()
CAPS = (LEAF, (LEAF, LEAF), (LEAF, (LEAF,)), (LEAF, LEAF, LEAF))


def vertices(cap):
    return 1 + sum(vertices(child) for child in cap)


def rooted_factor(cap, x, y):
    product = x
    for child in cap:
        product *= rooted_factor(child, x, y)
    return y + product


def canonical(tree):
    def branch(v, parent):
        return '(' + ''.join(sorted(branch(w, v) for w in tree[v] if w != parent)) + ')'
    return min(branch(v, -1) for v in range(len(tree)))


def enlarge(trees):
    layer = {}
    for tree in trees:
        for u in range(len(tree)):
            one = [list(neighbors) for neighbors in tree] + [[u]]
            one[u].append(len(tree))
            layer.setdefault(canonical(one), one)
    return list(layer.values())


def encode(tree, internal_mask, wide):
    edges = [(u, v) for u in range(len(tree)) for v in tree[u] if u < v]
    inners = [edge for edge in edges if all(len(tree[v]) > 1 for v in edge)]
    retained_inners = {edge for i, edge in enumerate(inners) if internal_mask >> i & 1}
    active = [e for e in edges if e not in inners or e in retained_inners]
    labels = {e: 1 << i for i, e in enumerate(active)}
    if wide:
        offset = 1 << (len(active) + 1) if wide == 2 else 0
        params = {e: 256 * (offset + (1 << (len(active)-1-i if wide == 3 else i)))
                  for i, e in enumerate(active)}
    else:
        params = {e: 6 + i % 3 for i, e in enumerate(active)}
    leaf_cap = {v: CAPS[i % len(CAPS)] for i, v in enumerate(v for v in range(len(tree)) if len(tree[v]) == 1)}
    physical = {}
    records = {}
    hubs = [u for u in range(len(tree)) if len(tree[u]) > 1]

    def link(u, v, length, label, kind):
        physical.setdefault(u, {})[v] = length
        physical.setdefault(v, {})[u] = length
        records[u, v] = length, label, kind

    for i, edge in enumerate(edges):
        u, v = edge
        if edge in inners:
            link(u, v, params.get(edge, 1 + i % 3), labels.get(edge, 0), 'core')
        else:
            leaf = u if u in leaf_cap else v
            link(u, v, params[edge] - vertices(leaf_cap[leaf]) + 1, labels[edge], 'arm')
    index = len(tree)
    for leaf, cap in leaf_cap.items():
        queue = [(leaf, cap)]
        for u, branch in queue:
            for child in branch:
                v, index = index, index + 1
                link(u, v, 1, 0, 'cap')
                queue.append((v, child))
    return edges, inners, labels, params, physical, records, hubs, leaf_cap


def cut_data(tree, internal_mask, stats, length_model):
    edges, inners, labels, params, graph, records, _, leaf_cap = encode(tree, internal_mask, length_model)
    total = 1 + sum(length for length, _, _ in records.values())
    full = sum(labels.values())
    sums = [sum(length for edge, length in params.items() if labels[edge] & mask)
            for mask in range(full + 1)]
    windows = sorted((val, i) for i, val in enumerate(sums))

    def bucket(position):
        index = bisect_left(windows, (position, -1))
        nearby = windows[max(index - 1, 0):index + 1]
        value, mask = min(nearby, key=lambda item: abs(item[0] - position))
        assert abs(value - position) < 64
        return mask

    # Compute each side directly in the expanded metric tree without materializing
    # its possibly very long strings of unit edges.
    events, ordinary, short_counts = Counter(), [], Counter()
    recovered_candidates = []
    for (u, v), (length, positive, kind) in records.items():
        for a, b in ((u, v), (v, u)):
            queue = [(a, b)]
            min_order, mask = 1, 0
            for curr, parent in queue:
                for child, edge_len in graph[curr].items():
                    if child == parent:
                        continue
                    min_order += edge_len
                    key = (min(curr, child), max(curr, child))
                    mask |= records[key][1]
                    queue.append((child, curr))
            end = min_order + length - 1
            assert bucket(min_order - 1) == mask and bucket(end) == mask | positive
            events[min_order - 1] -= 1
            events[end] += 1
            ordinary.append((min_order, end, kind, positive))
            if kind == 'core' and not positive:
                assert mask not in (0, full)
                short_counts[mask] += length
            if kind == 'core' and positive:
                recovered_candidates.append((positive, mask, mask | positive, length))
    groups = {}
    for position, signed in events.items():
        if signed:
            groups.setdefault(bucket(position), []).append((position, signed))
    for label, min_mask, max_mask, actual in recovered_candidates:
        lo, hi = groups[min_mask], groups[max_mask]
        assert len(lo) == len(hi) == 1 and lo[0][1] == -1 and hi[0][1] == 1
        assert hi[0][0] - lo[0][0] == actual
    for edge in edges:
        if edge in inners:
            continue
        assert groups[labels[edge]] == [(params[edge], 1)]
    remaining = Counter()
    for first, last, kind, label in ordinary:
        if kind == 'core' and not label:
            for size in range(first, last + 1):
                remaining[bucket(size)] += 1
    assert remaining == short_counts
    stats['localized skeleton assignments'] += 1
    stats['exact retained interval recoveries'] += len(recovered_candidates)
    stats['collapsed oriented unit cuts'] += sum(short_counts.values())
    stats['dominant exterior arms'] += any(params[e] > total / 2 for e in edges if e not in inners)
    stats['all exterior arms below half'] += all(params[e] < total / 2 for e in edges if e not in inners)
    if 0 < internal_mask < 2 ** len(inners) - 1:
        stats['mixed core assignments'] += 1


def connected_value(physical, root, x, y):
    # Independent direct DP on every vertex of the actual unit tree.
    expanded = {v: [] for v in physical}
    new = max(expanded) + 1
    for u in physical:
        for v, length in physical[u].items():
            if u >= v:
                continue
            chain = [u] + list(range(new, new + length - 1)) + [v]
            new += length - 1
            for a, b in zip(chain, chain[1:]):
                expanded.setdefault(a, []).append(b)
                expanded.setdefault(b, []).append(a)
    parents = {root: None}
    traversal = [root]
    for v in traversal:
        for u in expanded[v]:
            if u != parents[v]:
                parents[u] = v
                traversal.append(u)
    factors = {}
    total = 0
    for v in reversed(traversal):
        value = x
        for u in expanded[v]:
            if parents.get(u) == v:
                value *= factors[u]
        factors[v] = y + value
        total += value if v == root else y * value
    return total


def coefficient_data(tree, internal_mask, stats):
    edges, inners, labels, params, graph, records, hubs, cap_at = encode(tree, internal_mask, False)
    x, y = Fraction(2), Fraction(5)
    Y = y / (1 - x)
    full = sum(labels.values())
    packed = Counter()

    def multiply(poly, additions):
        out = Counter()
        for mask, value in poly.items():
            for label, factor in additions:
                assert not mask & label
                out[mask | label] += value * factor
        return out

    for k in range(1, len(hubs) + 1):
        for seq in combinations(hubs, k):
            U = set(seq)
            inner = [edge for edge in inners if set(edge) <= U]
            if len(inner) != len(U) - 1:
                continue
            F = {0: x ** k}
            for e in inner:
                length = records[e][0]
                factor = x ** (length - 1) if e not in labels else 1 / x
                F = multiply(F, [(labels.get(e, 0), factor)])
            for e in inners:
                if len(set(e) & U) != 1:
                    continue
                if e in labels:
                    F = multiply(F, [(0, Y), (labels[e], -Y)])
                else:
                    F = multiply(F, [(0, Y * (1 - x ** records[e][0]))])
            for e in edges:
                if e in inners or not set(e) & U:
                    continue
                cap = cap_at[next(v for v in e if v in cap_at)]
                N = (rooted_factor(cap, x, y) - Y) / x ** vertices(cap)
                F = multiply(F, [(0, Y), (labels[e], N)])
            packed.update(F)

    # Add hub-free subsets directly, using a separate DP and no high exterior mask.
    weighted_total = 0
    for mask, val in packed.items():
        weighted_total += val * x ** sum(a for e, a in params.items() if mask & labels[e])
    zin = lambda n: sum((n + 1 - j) * x ** j for j in range(1, n + 1))
    for e in inners:
        weighted_total += y ** 2 * zin(records[e][0] - 1)
    for e in edges:
        if e in inners:
            continue
        cap = cap_at[next(v for v in e if v in cap_at)]
        stem = records[e][0] - 1
        deep = list(cap)
        for child in deep:
            weighted_total += y * (rooted_factor(child, x, y) - y)
            deep.extend(child)
        weighted_total += y ** 2 * zin(stem) + y * (rooted_factor(cap, x, y) - y) * sum(x ** j for j in range(stem + 1))
        N = (rooted_factor(cap, x, y) - Y) / x ** vertices(cap)
        assert Y * packed[full] / packed[full ^ labels[e]] == N
        stats['arbitrary cap-factor recoveries'] += 1
    assert weighted_total == connected_value(graph, hubs[0], x, y)
    stats['complete connected-set evaluations'] += 1


def main():
    layer = [[[1], [0]]]
    stats = Counter()
    for n in range(3, 12):
        layer = enlarge(layer)
        for tree in layer:
            hubs = [i for i, adj in enumerate(tree) if len(adj) >= 3]
            if len(hubs) < 2 or any(len(adj) == 2 for adj in tree):
                continue
            stats['reduced fixed skeletons'] += 1
            for mask in range(2 ** (len(hubs) - 1)):
                for model in (1, 2, 3):
                    cut_data(tree, mask, stats, model)
                coefficient_data(tree, mask, stats)
    assert stats['mixed core assignments'] and stats['dominant exterior arms']
    for key, value in sorted(stats.items()):
        print(f'{key}: {value}')


if __name__ == '__main__':
    main()
