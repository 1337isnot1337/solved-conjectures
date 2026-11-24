#!/usr/bin/env python3
"""Exact checks for the stationary-weight obstruction and circulant examples.

The general fractional-cover proposition is proved in README.md; these
finite checks are not a proof of the conjecture.
"""


def stationary_example():
    out = [{3, 6}, {0, 3}, {0, 1}, {4, 6}, {2, 7}, {1, 3}, {4, 7}, {2, 5}]
    q = [76, 65, 87, 92, 88, 43, 84, 86]
    n = len(out)
    assert all(len(s) == 2 and i not in s for i, s in enumerate(out))
    assert all(i not in out[j] for i in range(n) for j in out[i])
    assert all(i not in out[k] for i in range(n) for j in out[i] for k in out[j])

    for i in range(n):
        reached = {i}
        todo = [i]
        while todo:
            v = todo.pop()
            for w in out[v] - reached:
                reached.add(w)
                todo.append(w)
        assert len(reached) == n

    assert sum(q) == 621 and all(x > 0 for x in q)
    second = [set().union(*(out[j] for j in out[i])) - out[i] - {i} for i in range(n)]
    assert [sum(q[i] for i in range(n) if j in out[i]) for j in range(n)] == [2*x for x in q]
    vals = [
        sum(q[i] * (int(j in second[i]) - int(j in out[i])) for i in range(n))
        for j in range(n)
    ]
    assert vals == [65, 44, 2, -11, 8, 86, 27, -4]
    print("stationary example verified:", vals)


def circulant_examples():
    # Finite smoke check; the unrestricted family is established in writing.
    for r in range(3, 25):
        n = 3*r
        for t in range(2, r):
            out = [{(i+j) % n for j in range(1, r+1)} for i in range(n)]
            out[0].difference_update(range(1, t+1))
            out[0].update(range(r+1, r+t+1))
            assert all(len(s) == r and i not in s for i, s in enumerate(out))
            assert all(i not in out[j] for i in range(n) for j in out[i])
            indegree = [sum(j in s for s in out) for j in range(n)]
            assert [j for j in range(n) if indegree[j] == r-1] == list(range(1, t+1))
            assert all(x >= r-1 for x in indegree)
            assert all(t+1 in out[j] for j in range(1, t+1))
            s = [2*r+x for x in indegree]
            assert sorted(s)[:2] == [n-1, n-1]
    print("circulant smoke checks passed for 3 <= r <= 24")


if __name__ == "__main__":
    stationary_example()
    circulant_examples()
