"""Construct adversarial marked trees sharing exactly the required signed root profile."""

from collections import Counter
from dataclasses import dataclass
from itertools import combinations
from random import Random


@dataclass(frozen=True)
class Vertex:
    name: str
    height: int
    tag: int
    children: int
    parent: int

    @property
    def weight(self):
        return self.children - 1


class MarkedTree:
    def __init__(self):
        self.vertices = [Vertex('mark', 0, 0, 2, -1)]
        self.sockets = [0, 0]

    def level(self, entries, height, rng):
        if len(entries) > len(self.sockets):
            return False
        parents = [self.sockets.pop(i) for i in sorted(
            rng.sample(range(len(self.sockets)), len(entries)), reverse=True)]
        rng.shuffle(parents)
        for (name, tag, children), parent in zip(entries, parents):
            self.sockets.extend([len(self.vertices)] * children)
            self.vertices.append(Vertex(name, height, tag, children, parent))
        return True

    def ancestors(self, i):
        while i >= 0:
            yield i
            i = self.vertices[i].parent

    def lca(self, i, j):
        seen = set(self.ancestors(i))
        return next(z for z in self.ancestors(j) if z in seen)

    def profile(self):
        p = Counter()
        for x in self.vertices[1:]:
            p[x.height] += x.weight
        return clean(p)

    def pair_records(self):
        for i, j in combinations(range(1, len(self.vertices)), 2):
            a, b, c = (self.vertices[k] for k in (i, j, self.lca(i, j)))
            yield a, b, c, a.weight * b.weight


def clean(counter):
    return {x: w for x, w in counter.items() if w}


def census(tree):
    actual, projected, exceptional = Counter(), Counter(), Counter()
    for a, b, c, w in tree.pair_records():
        actual[a.height + b.height - 2 * c.height] += w
        projected[a.tag + b.tag - 2 * c.tag] += w
        if c.name == 'q':
            exceptional[a.tag + b.tag] += w
    return actual, projected, exceptional


def grow(rng, extra_hubs, mode):
    events = [3] + [2] * extra_hubs + [0] * (4 + extra_hubs)
    rng.shuffle(events)
    sockets = 2
    for arity in events[:-1]:
        sockets += arity - 1
        if sockets <= 0:
            return None
    leaves = [i for i, arity in enumerate(events) if not arity]
    hubs = [i for i, arity in enumerate(events) if arity]
    tags = {i: 16 ** (j + 1) for j, i in enumerate(leaves)}
    heights = [16 ** (2 * i + 2) for i in range(len(events))]
    if mode == 'hub':
        hidden_height = heights[rng.choice(hubs)]
        tag = 0
    elif mode == 'leaf':
        i = rng.choice(leaves)
        hidden_height, tag = heights[i], tags[i]
    elif mode == 'before-leaf':
        candidates = [(i, j) for i in leaves for j in hubs if j < i]
        if not candidates:
            return None
        i, j = rng.choice(candidates)
        hidden_height, tag = heights[i] - heights[j], tags[i]
    else:
        slot = rng.randrange(len(events))
        hidden_height, tag = heights[slot] // 16, 16 ** (len(leaves) + 2)
    target, rival = MarkedTree(), MarkedTree()
    levels = {h: i for i, h in enumerate(heights)}
    for h in sorted(set(heights) | {hidden_height}):
        original = []
        competing = []
        if h in levels:
            i = levels[h]
            name = 'b' if events[i] == 3 else str(i)
            original.append((name, tags.get(i, 0), events[i]))
            if events[i] == 3:
                competing.extend([('b1', 0, 2), ('b2', 0, 2)])
            else:
                competing.extend(original)
        if h == hidden_height:
            competing.extend([('q', tag, 2), ('hidden leaf', tag, 0)])
        assert target.level(original, h, rng)
        if not rival.level(competing, h, rng):
            return None
    assert not target.sockets and not rival.sockets
    return target, rival, tag


def verify(target, rival, tag):
    assert target.profile() == rival.profile()
    old, target_tags, _ = census(target)
    new, rival_tags, c = census(rival)
    assert clean(old) != clean(new)
    observed = rival_tags.copy()
    observed.subtract(target_tags)
    predicted = Counter({0: 1})
    predicted[2 * tag] -= 1
    for exponent, coeff in c.items():
        predicted[exponent - 2 * tag] += coeff
        predicted[exponent] -= coeff
    assert clean(observed) == clean(predicted)
    if tag and not clean(observed):
        b = next(v for v in target.vertices if v.name == 'b')
        for i, j in enumerate(rival.vertices):
            if j.children or not j.tag or j.tag == tag or j.name == 'hidden leaf':
                continue
            if any(rival.vertices[k].name in ('b1', 'b2') for k in rival.ancestors(i)):
                assert new[j.height - b.height] == -1
                assert old[j.height - b.height] in (0, -2)
                return 'single ancestor'
        raise AssertionError('no nonexceptional descendant leaf')
    if tag:
        return 'tagged pair discrepancy'
    by_name = {v.name: v for v in target.vertices[1:] if not v.children}
    for leaf1, leaf2 in combinations(by_name, 2):
        tag_sum = by_name[leaf1].tag + by_name[leaf2].tag
        for tree in (target, rival):
            matches = [(a.name, b.name) for a, b, c, _ in tree.pair_records()
                       if a.tag + b.tag - 2 * c.tag == tag_sum]
            assert len(matches) == 1 and set(matches[0]) == {leaf1, leaf2}
    return 'labelled leaf quartet'


def main():
    rng = Random(315)
    counts = Counter()
    for mode in ('hub', 'leaf', 'before-leaf', 'independent'):
        admitted = 0
        while admitted < 180:
            case = grow(rng, rng.randrange(7), mode)
            if case is not None:
                counts[verify(*case)] += 1
                admitted += 1
    assert set(counts) == {'single ancestor', 'tagged pair discrepancy', 'labelled leaf quartet'}
    print('720 equal-profile target/competitor pairs, all distinguished by actual distances')
    for name, count in sorted(counts.items()):
        print(f'{name}: {count}')


if __name__ == '__main__':
    main()
