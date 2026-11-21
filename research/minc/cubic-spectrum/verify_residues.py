"""Replay ladder signatures, the exact path counts, and whole constructed graphs."""

from collections import Counter
from functools import cache

from residues import cubic_graph, even_period, path_graph


def count_matchings(rows):
    @cache
    def count(i, used):
        if i == len(rows):
            return 1
        return sum(count(i+1, used | (1 << j)) for j in rows[i] if not used & (1 << j))
    result = count(0, 0)
    count.cache_clear()
    return result


def ladder(length):
    return [{((2*i-1) % (2*length))//2, i, ((2*i+length) % (2*length))//2}
            for i in range(length)]


def structure(rows):
    n = len(rows)
    assert all(len(row) == 3 for row in rows)
    degrees = Counter(j for row in rows for j in row)
    assert set(degrees) == set(range(n)) and set(degrees.values()) == {3}
    cols = [[] for _ in rows]
    for i, row in enumerate(rows):
        for j in row:
            cols[j].append(i)
    seen = {0}
    stack = [0]
    while stack:
        i = stack.pop()
        for j in rows[i]:
            for other in cols[j]:
                if other not in seen:
                    seen.add(other)
                    stack.append(other)
    assert len(seen) == n


if __name__ == "__main__":
    fib = [0, 1]
    for _ in range(19):
        fib.append(fib[-1] + fib[-2])
    for length in range(3, 18, 2):
        rows = ladder(length)
        total = count_matchings(rows)
        rows[0].remove(0)
        avoiding = count_matchings(rows)
        assert (avoiding, total-avoiding) == (fib[length+1]+1, fib[length-1]+1)
    for t in range(1, 17):
        assert count_matchings(path_graph(t, 2)) == t
    for q in range(2, 13):
        n = 79*q*q
        for r in range(q):
            structure(cubic_graph(n+r, q, r))
    for q, r in [(2, 1), (2, 0), (3, 1), (4, 1)]:
        t = r or q
        n = 2*t + (t+3)*(even_period(q)-1)
        graph = cubic_graph(n, q, r)
        structure(graph)
        # Group each terminal region during independent direct enumeration.
        order = list(range(2*t, n)) + list(range(2*t))
        actual = count_matchings([graph[i] for i in order])
        assert actual % q == r
        print(f"order {n}, exact permanent {actual}, residue {r} modulo {q}")
    print("8 ladder signatures, 16 path counts, 77 large connected cubic graphs")
