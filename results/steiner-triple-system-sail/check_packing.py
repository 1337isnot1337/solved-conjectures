"""Enumerate four-block sails directly and check single-color packings."""
from collections import Counter
from itertools import combinations, product
from random import Random


def projective(order):
    return list({tuple(sorted((x, y, x ^ y))) for x, y in combinations(range(1, order + 1), 2)})


def affine_plane_three():
    points = list(product(range(3), repeat=2))
    lines = set()
    for a, b in combinations(points, 2):
        c = tuple(-(x + y) % 3 for x, y in zip(a, b))
        lines.add(tuple(sorted((points.index(a), points.index(b), points.index(c)))))
    return sorted(lines)


def product_system():
    points = list(product(range(3), range(1, 8)))
    blocks = set()
    for a, b in combinations(points, 2):
        c = (-(a[0]+b[0]) % 3, a[1] if a[1] == b[1] else a[1] ^ b[1])
        blocks.add(tuple(sorted((points.index(a), points.index(b), points.index(c)))))
    return sorted(blocks)


def catalogue(blocks):
    blocks = [frozenset(b) for b in blocks]
    points = set.union(*(set(b) for b in blocks))
    n = len(points)
    candidates = []
    vertices = Counter()
    names = set()
    for four in combinations(range(len(blocks)), 4):
        degrees = Counter(v for i in four for v in blocks[i])
        if sorted(degrees.values()) != [1, 1, 1, 2, 2, 2, 3]:
            continue
        center, = (v for v, count in degrees.items() if count == 3)
        trans, = (i for i in four if center not in blocks[i])
        assert all(len(blocks[trans] & blocks[i]) == 1 for i in four if i != trans)
        assert (center, trans) not in names
        names.add((center, trans))
        support = frozenset(degrees)
        vertices.update(support)
        candidates.append((sum(1 << i for i in four), support))
    assert names == {(v, i) for i, block in enumerate(blocks) for v in points - block}
    assert 6 * len(names) == n * (n-1) * (n-3)
    assert all(6 * vertices[v] == 7 * (n-1) * (n-3) for v in points)
    return n, candidates


def check_colorings(n, candidates, masks):
    count = 0
    largest = 0
    for red in masks:
        blue_sails = [support for b, support in candidates if not b & red]
        red_sails = [support for b, support in candidates if b & red == b]
        mono = len(blue_sails) + len(red_sails)
        used = set()
        chosen = 0
        for support in max((blue_sails, red_sails), key=len):
            if used.isdisjoint(support):
                used.update(support)
                chosen += 1
        assert len(used) == 7 * chosen
        assert 3 * mono <= 49 * (n-1) * (n-3) * chosen
        largest = max(largest, chosen)
        count += 1
    return count, largest


if __name__ == '__main__':
    rng = Random(813)
    totals = [0, 0]
    for blocks in (sorted(projective(7)), affine_plane_three(), sorted(projective(15)), product_system()):
        n, sails = catalogue(blocks)
        masks = range(1 << len(blocks)) if n < 15 else [0, (1 << len(blocks))-1] + [
            rng.getrandbits(len(blocks)) for _ in range(62)]
        count, largest = check_colorings(n, sails, masks)
        if n == 21:
            assert largest >= 2
        totals[0] += len(sails)
        totals[1] += count
        print(f'Order {n}: {len(sails)} distinct four-block sails, {count} colorings, largest packing found {largest}.')
    print(f'Checked {totals[0]} distinct sails and {totals[1]} colorings.')
