"""Check finite certificate mechanics used in the all-orders step."""
from itertools import combinations, product


def arcs(ground, width):
    for row in combinations(range(ground), width + 1):
        yield row[:-1], row[1:]


def window(tup, lower):
    length = len(tup) - lower + 1
    return tuple(tup[i:i+length] for i in range(lower))


def check_windows():
    count = 0
    for ground in range(2, 14):
        for width in range(1, min(8, ground) + 1):
            original = list(combinations(range(ground), width))
            for lower in range(1, width + 1):
                images = {window(t, lower) for t in original}
                assert len(images) == len(original)
                assert all(all(x < y for x, y in zip(w, w[1:])) for w in images)
                for a, b in arcs(ground, width):
                    x, y = window(a, lower), window(b, lower)
                    assert x[1:] == y[:-1] and x[-1] < y[-1]
                    count += 1
    return count


def check_queue():
    count = 0
    for ell in range(1, 16, 2):
        for signs in product((-1, 1), repeat=ell):
            if sum(signs) >= 0:
                continue
            queue = [
                max(
                    [0] + [
                        sum(signs[(i - d) % ell] for d in range(1, j + 1))
                        for j in range(1, ell + 1)
                    ]
                ) for i in range(ell)
            ]
            assert any(q == 0 and s == -1 for q, s in zip(queue, signs))
            assert max(queue) <= signs.count(1)
            for i, s in enumerate(signs):
                assert queue[(i + 1) % ell] == max(0, queue[i] + s)
            count += 1
    return count


if __name__ == "__main__":
    print(f"{check_windows():,} window-edge checks")
    print(f"{check_queue():,} odd-period queue checks")
