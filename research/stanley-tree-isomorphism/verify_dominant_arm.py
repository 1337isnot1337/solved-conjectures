"""Exact finite checks of the one-long-arm residual and stem exchange."""
from collections import Counter
from fractions import Fraction
from itertools import combinations, product
from math import gcd, prod


def add_vertex(graph, parent=None):
    v = len(graph)
    graph.append([])
    if parent is not None:
        graph[parent].append(v)
        graph[v].append(parent)
    return v


LEAF = ()
CHERRY = (LEAF, LEAF)
FORK = (LEAF, CHERRY)


def size(cap):
    return 1 + sum(size(child) for child in cap)


def attach_cap(graph, parent, cap):
    root = add_vertex(graph, parent)
    for child in cap:
        attach_cap(graph, root, child)


def attach_arm(graph, parent, length, cap):
    assert length >= size(cap)
    for _ in range(length - size(cap)):
        parent = add_vertex(graph, parent)
    attach_cap(graph, parent, cap)


def double_hub(left, right, h):
    graph = [[]]
    end = 0
    for _ in range(h):
        end = add_vertex(graph, end)
    for s, cap in left:
        attach_arm(graph, 0, s, cap)
    for s, cap in right:
        attach_arm(graph, end, s, cap)
    return graph


def oriented_counts(graph):
    n = len(graph)
    counts = Counter()
    def visit(v, previous):
        order = 1
        for w in graph[v]:
            if w != previous:
                k = visit(w, v)
                counts[k] += 1
                counts[n-k] += 1
                order += k
        return order
    assert visit(0, -1) == n
    return counts


def residual(b, h, a, far):
    coef = Counter()
    for i in (b, h+far, b+h+a):
        coef[i] += 1
    for i in (b+a, h+far+a, far):
        coef[i] -= 1
    return {i: k for i, k in coef.items() if k}


def check_signed_deck():
    cases = 0
    # Actual edge removals also test the twice-counted midpoint.
    for short in product(range(1, 5), repeat=3):
        near, far = short[0], sum(short[1:])
        for b in range(max(short), 14):
            for h in range(1, 9):
                graph = double_hub([(near, LEAF), (b, LEAF)],
                                   [(s, LEAF) for s in short[1:]], h)
                count = oriented_counts(graph)
                n = len(graph)
                diff = {i: count[i] - count[i+1] for i in range(1, n-1)}
                for s in short:
                    diff[s] -= 1
                    diff[n-1-s] += 1
                actual = {i: k for i, k in diff.items() if k}
                assert actual == residual(b, h, near, far)
                if b < far:
                    assert actual[min(actual)] > 0 and min(actual) == b
                    assert actual[max(actual)] < 0 and max(actual) > sum(short)
                elif b > far:
                    assert actual[min(actual)] < 0 and min(actual) == far
                    assert actual == residual(h+far, b-far, near, far)
                else:
                    collapsed = Counter({b+h: 1})
                    collapsed[sum(short)] -= 1
                    assert actual == {i:k for i,k in collapsed.items() if k}
                cases += 1
    return cases


def rooted_value(cap, x, y):
    return y + x*prod(rooted_value(child, x, y) for child in cap)


def connected_value(graph, x, y):
    # Each nonempty connected set has a unique vertex nearest vertex 0.
    total = 0
    def visit(v, parent):
        nonlocal total
        choices = x*prod(visit(w, v) for w in graph[v] if w != parent)
        total += choices if parent == -1 else y*choices
        return y + choices
    visit(0, -1)
    return total


def check_transpositions():
    forms = [(LEAF, CHERRY), (CHERRY, FORK), (CHERRY, CHERRY)]
    checks = 0
    for (first, second), s, t, x, y in product(forms, (5, 7, 9), (6, 7, 10), (2, 3), (2, 5)):
        graphs = []
        for first_len, second_len in ((s,t), (t,s)):
            graph = [[]]
            for length, cap in ((first_len,first), (second_len,second), (3,CHERRY)):
                attach_arm(graph, 0, length, cap)
            graphs.append(graph)
        Y = Fraction(y, 1-x)
        d1 = (rooted_value(first, x, y)-Y) / x**size(first)
        d2 = (rooted_value(second, x, y)-Y) / x**size(second)
        predicted = x*Y*(rooted_value(CHERRY,x,y)-1)*(x**s-x**t)*(d1-d2)
        assert predicted == connected_value(graphs[0],x,y) - connected_value(graphs[1],x,y)
        if first != second and s != t:
            assert predicted != 0
        checks += 1
    return checks


def check_regrouping():
    # Distinct allocations have the same far order 8: 3+5=4+4.
    shorts = ((3, CHERRY), (4, LEAF), (4, CHERRY), (5, FORK))
    total = sum(s for s,_ in shorts)
    sides = [set(indices) for indices in combinations(range(4),2)
             if sum(shorts[i][0] for i in indices) == 8]
    def construct(b, h, far):
        return double_hub([shorts[i] for i in range(4) if i not in far] + [(b, CHERRY)],
                          [shorts[i] for i in range(4) if i in far], h)
    checks = forced = 0
    for b, h, alloc, other in product((10, 16, 44, 49, 57), (2, 5, 10, 17, 39, 49), sides, sides):
        h2, b2 = b-8, h+8
        if h == h2:
            continue
        old = construct(b,h,alloc)
        swapped = construct(b2,h2,alloc)
        shuffled = construct(b2,h2,other)
        for x in (2, 3):
            y = 3
            # (1-x^h2)/(1-x) is the multiplier of a fixed-length regrouping.
            assert (connected_value(swapped,x,y)-connected_value(shuffled,x,y)) % ((x**h2-1)//(x-1)) == 0
            if max(h,h2)-gcd(h,h2) > total+2:
                assert connected_value(old,x,y) != connected_value(shuffled,x,y)
                forced += 1
            checks += 1
    assert forced > 0
    return checks, forced


if __name__ == '__main__':
    signed = check_signed_deck()
    swaps = check_transpositions()
    regs, forced = check_regrouping()
    print(f'{signed} oriented-cut profiles, {swaps} exact decorated stem exchanges, '
          f'{regs} central regrouping checks including {forced} separated-period comparisons')
