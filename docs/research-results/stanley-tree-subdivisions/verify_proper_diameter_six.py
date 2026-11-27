"""Exact core-subset extraction and independent radius-two factor reconstruction."""
from collections import Counter
from fractions import Fraction
from itertools import combinations, product
from math import comb, isqrt, prod


def edge_list(branch_leaf_counts, center_leaves):
    edges = []
    next_vertex = 1 + len(branch_leaf_counts)
    for child, count in enumerate(branch_leaf_counts, 1):
        edges.append((0, child))
        edges.extend((child, v) for v in range(next_vertex, next_vertex + count))
        next_vertex += count
    edges.extend((0, v) for v in range(next_vertex, next_vertex + center_leaves))
    return edges


def weighted_subsets(edges, weights):
    s = len(weights)
    data = Counter()
    for mask in range(1 << s):
        red = {v for v in range(s) if mask >> v & 1}
        e1 = sum(u in red and v in red for u, v in edges)
        e2 = sum(u not in red and v not in red for u, v in edges)
        data[len(red), sum(weights[v] for v in red), e1, e2] += 1
    return data


def raw_U(tree_edges, values):
    """Evaluate the ordinary *unexpanded* cut polynomial by rooting at vertex 0."""
    s = 1 + len(tree_edges)
    adj = [[] for _ in range(s)]
    for v, w in tree_edges:
        adj[v].append(w)
        adj[w].append(v)

    def visit(v, parent):
        profile = {1: 1}
        for w in adj[v]:
            if w == parent:
                continue
            child = visit(w, v)
            detached = sum(values[j] * count for j, count in child.items())
            new = Counter()
            for k, number in profile.items():
                new[k] += number * detached
                for j, count in child.items():
                    new[k + j] += number * count
            profile = new
        return profile
    return sum(values[j] * count for j, count in visit(0, None).items())


def check_transform(edges, weights, data):
    s, n = len(weights), sum(weights)
    ordinary = list(edges)
    u = s
    for v, weight in enumerate(weights):
        for _ in range(weight - 1):
            ordinary.append((v, u))
            u += 1
    assert u == n
    for t, z, A, B in [(2, 4, 2, 3), (3, -3, 1, 2), (2, -1, 3, 4)]:
        used = [None, -z] + [A * t ** d + B for d in range(2, n + 1)]
        values = [None] + [sum(comb(d-1, l) * z**l * used[d-l]
                                for l in range(d)) for d in range(1, n + 1)]
        direct = raw_U(ordinary, values)
        from_egdp = sum(
            count * A**(k-e1) * B**(s-k-e2) * t**(w-e1)
            * (A*t+t+z)**e1 * (B+1+z)**e2
            for (k, w, e1, e2), count in data.items())
        assert direct == from_egdp


def moments(edges, weights):
    # Each edge can be cut, or retained: label resulting connected blocks red/blue.
    s = len(weights)
    totals = Counter()
    for kept in range(1 << len(edges)):
        parts = [{i} for i in range(s)]
        for i, (v, w) in enumerate(edges):
            if not kept >> i & 1:
                continue
            a = next(p for p in parts if v in p)
            b = next(p for p in parts if w in p)
            a.update(b)
            parts.remove(b)
        tagged = [(len(p), sum(weights[v] for v in p)) for p in parts]
        for mask in range(1 << len(parts)):
            picked = [p for j, p in enumerate(tagged) if mask >> j & 1]
            k = sum(a for a, _ in picked)
            w = sum(b for _, b in picked)
            totals[k, w, k-len(picked), s-k-(len(parts)-len(picked))] += 1
    return totals


def invert(values):
    result = Counter()
    for (k, w, a, b), count in values.items():
        for e1 in range(a + 1):
            for e2 in range(b + 1):
                result[k, w, e1, e2] += count * (-1)**(a+b-e1-e2)*comb(a,e1)*comb(b,e2)
    return +result


def prime_order(f):
    def order(n):
        assert n
        out = 0
        while n % 11 == 0:
            n //= 11
            out += 1
        return out
    return order(f.numerator) - order(f.denominator)


def rational_sqrt(q):
    a, b = isqrt(q.numerator), isqrt(q.denominator)
    assert a*a == q.numerator and b*b == q.denominator
    return Fraction(a, b)


def divide_factor(poly, j, R):
    work = list(poly)
    quot = [0] * (len(work) - j)
    for k in range(len(quot)):
        quot[k] = work[k]
        work[k+j] -= quot[k] * R
    return quot if not any(work[len(quot):]) else None


def recover(data, s):
    # x=11 and v=2 preserve Eisenstein's exact order-one test at 11.
    x, v = 11, 2
    singleton = [(w, s-1-e2) for (k,w,e1,e2), count in data.items()
                 if k==1 for _ in range(count)]
    leaves = sorted(w for w,d in singleton if d==1)
    hubs = sorted((w,d-1) for w,d in singleton if d>1)
    m = len(hubs) - 1
    P = prod(1+x*v**w for w in leaves)
    Rall = Fraction(x**len(hubs)*v**sum(w for w,t in hubs), P)
    T = sum(t for w,t in hubs)
    raw = Counter()
    for (k,w,e1,e2), count in data.items():
        if e1==0:
            raw[s-1-e2-k] += count * x**k * v**w
    D = max(raw)
    leading = Fraction(raw[D], P)
    if 2*D == T:
        delta = rational_sqrt(leading**2 - 4*Rall)
        roots = [(leading+delta)/2, (leading-delta)/2]
        center_R, = [r for r in roots if prime_order(r)==1]
        center_t, case = D, 'tie'
    elif prime_order(leading) == 1:
        center_t, center_R, case = D, leading, 'center'
    else:
        assert prime_order(leading) == m
        center_t, center_R, case = T-D, Rall/leading, 'children'

    profiles = {}
    for w,t in set(hubs):
        for num in {t, t + 1 - m}:
            if num < 0:
                continue
            for leaf_weights in set(combinations(leaves, num)):
                r = Fraction(x*v**w, prod(1+x*v**b for b in leaf_weights))
                key = (t,r)
                value = (w,leaf_weights)
                assert key not in profiles or profiles[key] == value
                profiles[key] = value
    center = profiles[center_t,center_R]
    coeffs = [Fraction(raw[j], P) for j in range(D+1)]
    coeffs[center_t] -= center_R
    while not coeffs[-1]:
        coeffs.pop()
    children = []
    for (t,r), profile in profiles.items():
        if len(profile[1]) != t:
            continue
        while len(coeffs) > t:
            short = divide_factor(coeffs,t,r)
            if short is None:
                break
            children.append(profile)
            coeffs = short
    assert coeffs == [1] and len(children) == m
    return center, sorted(children), case


def main():
    cases = Counter()
    for m in range(2, 5):
        for counts in product(range(1, 5), repeat=m):
            if tuple(sorted(counts)) != counts:
                continue
            for direct in range(5):
                edges = edge_list(counts, direct)
                s = len(edges)+1
                if s > 12:
                    continue
                for mode in range(3):
                    w = ([2]*s if mode == 0 else
                         [2+(i % 3) for i in range(s)] if mode == 1 else
                         [4 if i <= m else 2+(i % 3) for i in range(s)])
                    data = weighted_subsets(edges, w)
                    center, children, case = recover(data, s)
                    def actual(i):
                        leafweights = sorted(w[v] for u,v in edges if u==i and v>m)
                        return w[i], tuple(leafweights)
                    assert center == actual(0)
                    assert children == sorted(actual(i) for i in range(1,m+1))
                    cases[case] += 1
                    if s <= 9:
                        check_transform(edges, w, data)
                        assert invert(moments(edges,w)) == data
                        cases['exact cut and moment inversions'] += 1
    assert all(cases[c] for c in ['center','tie','children'])
    for k in sorted(cases):
        print(k, cases[k])


if __name__ == '__main__':
    main()
