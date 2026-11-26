#!/usr/bin/env python3
"""Exact integer regression for the three-walk identity and planted parity cuts."""
from itertools import permutations
from random import Random


def factor(edges, n, t, rng):
    """Split an even regular graph by orienting Euler tours then finding matchings."""
    todo = [set() for _ in range(n)]
    for x, y in edges:
        todo[x].add(y)
        todo[y].add(x)
    arcs = [set() for _ in range(n)]
    for x in range(n):
        stack = [x]
        while stack:
            a = stack[-1]
            if not todo[a]:
                stack.pop()
                continue
            b = rng.choice(sorted(todo[a]))
            arcs[a].add(b)
            todo[a].remove(b)
            todo[b].remove(a)
            stack.append(b)
    assert all(len(row) == 3 * t // 2 for row in arcs)
    out = [set(), set(), set()]
    for k in range(3 * t // 2):
        match = {}

        def augment(x, seen):
            for y in sorted(arcs[x]):
                if y not in seen:
                    seen.add(y)
                    if y not in match or augment(match[y], seen):
                        match[y] = x
                        return True
            return False

        for x in range(n):
            assert augment(x, set())
        for y, x in match.items():
            arcs[x].remove(y)
            out[k // (t // 2)].add(tuple(sorted((x, y))))
    return out


def plant(t, rng):
    n = 6 * t + 1
    X, Y = range(3 * t), list(range(3 * t, n))
    rng.shuffle(Y)
    crossing_errors = set(zip(X, Y))
    within_errors = {tuple(sorted((Y[i], Y[i + 1]))) for i in range(0, 3 * t, 2)}
    A = ({(x, y) for x in X for y in Y} - crossing_errors) | within_errors
    B = {(x, y) for x in range(n) for y in range(x + 1, n)} - A
    return factor(A, n, t, rng) + factor(B, n, t, rng), crossing_errors | within_errors


def check_identity(adj, n, t, palette, side, cut):
    good = set(side)
    other = set(range(n)) - good
    mask = (lambda x, y: (x in good) != (y in good)) if cut else (
        lambda x, y: x in good and y in good
    )
    P = [[{y for y in adj[x][i] if mask(x, y)} for x in range(n)] for i in palette]
    checked = 0
    for x in range(n):
        counts = [[0 for _ in range(n)] for _ in range(4)]
        repeated_pair_sum = [0] * n
        for i in range(3):
            for y in P[i][x]:
                for j in range(3):
                    for z in P[j][y]:
                        for k in range(3):
                            for w in P[k][z]:
                                counts[len({i, j, k})][w] += 1
                                repeated_pair_sum[w] += (i == j) + (i == k) + (j == k)
        mixed = [0] * n
        for i, j, k in permutations(range(3)):
            for y in P[i][x]:
                for z in P[j][y]:
                    for w in P[k][z]:
                        mixed[w] += 1
        rhs = [sum(c) - r + 2 * c[1]
               for c, r in zip(zip(*counts), repeated_pair_sum)]
        assert mixed == counts[3] == rhs
        assert sum(abs(r - 2*m) for r, m in zip(counts[3], counts[1])) <= 500*t*t
        checked += n
    return checked


def main():
    rng = Random(811)
    exceptions = entries = 0
    for t in (2, 4, 6, 8, 10):
        for _ in range(4):
            n = 6 * t + 1
            colors, errors = plant(t, rng)
            adj = [[set() for _ in range(6)] for _ in range(n)]
            lookup = {}
            for i, edges in enumerate(colors):
                for x, y in edges:
                    adj[x][i].add(y)
                    adj[y][i].add(x)
                    assert (x, y) not in lookup
                    lookup[x, y] = i
            assert all(len(nb) == t for row in adj for nb in row)
            assert len(lookup) == n * (n - 1) // 2
            for x, y in errors:
                i = lookup[x, y]

                def extends(z, forbidden, available):
                    if available & (available - 1) == 0:
                        return y in adj[z][available.bit_length() - 1]
                    return any(extends(w, forbidden | {w}, available ^ (1 << c))
                               for c in range(6) if available >> c & 1
                               for w in adj[z][c] - forbidden)

                assert extends(x, {x, y}, 63 ^ (1 << i))
                exceptions += 1
            entries += check_identity(adj, n, t, range(3), range(3*t), True)
            entries += check_identity(adj, n, t, range(3, 6), range(3*t), False)
            entries += check_identity(adj, n, t, range(3, 6), range(3*t, n), False)
    print(f"Checked {entries:,} three-walk entries and all {exceptions:,} misplaced edges.")


if __name__ == "__main__":
    main()
