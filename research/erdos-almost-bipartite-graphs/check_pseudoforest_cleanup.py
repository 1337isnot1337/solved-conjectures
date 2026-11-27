"""Replay the bounded-diameter cleanup; no probabilistic existence claim."""
from collections import deque
from random import Random


def make_graph(rng, g):
    adj, labels, roots, cycles = {}, {}, [], []

    def vertex(label):
        v = len(adj)
        adj[v] = set()
        labels[v] = label
        return v

    def edge(v, u):
        adj[v].add(u)
        adj[u].add(v)

    for _ in range(rng.randint(1, 7)):
        length = rng.choice([0, 0, 4, 6, 16, 28, g, g + 2])
        if not length:
            base = [vertex(rng.randrange(g))]
        elif length % 2 == 0:
            start = rng.randrange(g)
            base = [vertex((start + i % 2) % g) for i in range(length)]
        else:
            start = rng.randrange(g)
            base = [vertex((start + i) % g) for i in range(g)]
            if length > g:
                base.extend(vertex((start + (-2 if i % 2 == 0 else -1)) % g)
                            for i in range(length - g))
        if length:
            for x, y in zip(base, base[1:] + base[:1]):
                edge(x, y)
            cycles.append(base)
        else:
            roots.append(base[0])
        current = base.copy()
        last = current[-1]
        for _ in range(rng.randint(0, 70)):
            u = rng.choice(current) if rng.random() < .4 else last
            last = vertex((labels[u] + rng.choice((-1, 1))) % g)
            edge(u, last)
            current.append(last)

    assert all((labels[u] - labels[v]) % g in (1, g - 1) for u in adj for v in adj[u])
    return adj, labels, roots, cycles


def distances(adj, start, avoid=set(), lim=None):
    dist, queue = {start: 0}, deque([start])
    while queue:
        u = queue.popleft()
        depth = dist[u] + 1
        if lim is not None and depth > lim:
            continue
        for v in adj[u]:
            if v not in dist and v not in avoid:
                dist[v] = depth
                queue.append(v)
    return dist


def check(rng, a, g):
    adj, labels, roots, cycles = make_graph(rng, g)
    odd_deleted = {cycle[0] for cycle in cycles if len(cycle) % 2 == 1}
    assert len(odd_deleted) * g <= len(adj)
    retained = set(adj) - odd_deleted
    even = [cycle for cycle in cycles if len(cycle) % 2 == 0]
    cycle_anchors = {u for cycle in even for u in cycle}

    rootset = (cycle_anchors | set(roots)) & retained
    depths, queue = dict.fromkeys(rootset, 0), deque(rootset)
    while True:
        while queue:
            u = queue.popleft()
            for v in adj[u] & retained:
                if v not in depths:
                    depths[v] = depths[u] + 1
                    queue.append(v)
        unseen = retained - depths.keys()
        if not unseen:
            break
        # Removing a point of an odd cycle left only trees in this component.
        u = min(unseen)
        depths[u] = 0
        queue.append(u)

    layers = [{u for u in retained if depths[u] and depths[u] % a == b}
              for b in range(a)]
    cut = min(layers, key=len).copy()
    for cycle in even:
        if len(cycle) >= a:
            cut.update(min((set(cycle[b::a]) for b in range(a)), key=len))
    assert len(cut) * a <= 2 * len(adj)
    avoid = odd_deleted | cut
    unexplored = set(adj) - avoid
    while unexplored:
        start = unexplored.pop()
        comp = distances(adj, start, avoid)
        unexplored.difference_update(comp)
        assert all((d + comp[v]) % 2 == 1 for u, d in comp.items()
                   for v in adj[u] & comp.keys())
        assert all(len(distances(adj, u, avoid, lim=4 * a)) == len(comp)
                   for u in comp)
        markers = [d % 2 for u, d in comp.items() if labels[u] in (1, g - 1)]
        assert len(set(markers)) <= 1
    return len(adj)


def main():
    rng = Random(11175)
    samples = 1000
    vertices = 0
    for _ in range(samples):
        a = rng.randrange(2, 13)
        g = 4 * a + 3 + 2 * rng.randrange(3)
        vertices += check(rng, a, g)
    print(f"{samples} pseudoforests, {vertices} vertices; diameter and parity hold")


if __name__ == "__main__":
    main()
