"""Independent matching counts for the transfer certificate and full intervals."""

from itertools import permutations

from intervals import CUBE, PACKET, graph, interval
from verify_residues import count_matchings, structure


def joint(rows, row, col, inputs, outputs):
    counts = [[0]*3 for _ in range(3)]
    for p in permutations(range(len(rows))):
        if all(j in rows[i] for i, j in enumerate(p)):
            counts[outputs.index(p[row])][inputs.index(p.index(col))] += 1
    return counts


if __name__ == "__main__":
    assert joint(PACKET, 2, 6, [3, 4, 6], [2, 0, 5]) == [[4,2,2], [3,3,2], [1,3,4]]
    assert joint(CUBE, 0, 3, [1, 2, 0], [2, 1, 3]) == [[2,1,0], [1,2,0], [0,0,3]]
    checks = 0
    for n in range(9, 34):
        low, high = interval(n)
        assert high-low+1 == 2**((n-9)//6)
        for value in range(low, high+1):
            rows = graph(n, value)
            assert len(rows) == n
            structure(rows)
            assert count_matchings(rows) == value
            checks += 1
    print(f"two complete transfer tables, {checks} full cubic graph permanents")
    for n in (15, 32, 69):
        print(f"order {n}, interval {interval(n)}")
