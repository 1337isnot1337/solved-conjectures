"""Check every small folded interval split and every aligned replacement score."""

from functools import lru_cache
from itertools import combinations, product


def path(size, target):
    lo, hi = 0, size
    while True:
        pivot = (lo + hi) // 2
        yield lo, pivot, hi
        if pivot == target:
            return
        if target < pivot:
            hi = pivot
        else:
            lo = pivot + 1


def check(n):
    union = tuple(range(n + 1))
    calendars = {}
    paths = [tuple(path(2 * n, i)) for i in range(2 * n)]
    for missing in union:
        keys = [x for x in union if x != missing]
        cycle = tuple((x, d) for d in (0, 1) for x in (keys if d == 0 else keys[::-1]))
        calendars[missing] = cycle
    comparisons = inactive = largest = 0
    for gains in product((-1, 1), repeat=n + 1):
        @lru_cache(None)
        def options(keys, pivot_index):
            def score(part, through=None):
                ordered = sorted(set(part))
                values = [0]
                for i in range(len(ordered)):
                    for j in range(i, len(ordered)):
                        if through is None or ordered[i] <= through <= ordered[j]:
                            values.append(sum(gains[x] for x in ordered[i:j + 1]))
                return max(values)
            answers = (score(keys[:pivot_index]), score(keys, keys[pivot_index]),
                       score(keys[pivot_index + 1:]))
            assert score(keys) == max(answers)
            return answers

        for a, b in combinations(union, 2):
            left, right = calendars[b], calendars[a]
            for anchor in set(left) & set(right):
                start_a, start_b = left.index(anchor), right.index(anchor)
                for target, nodes in enumerate(paths):
                    x = tuple(left[(start_a - target + j) % (2 * n)][0] for j in range(2 * n))
                    y = tuple(right[(start_b - target + j) % (2 * n)][0] for j in range(2 * n))
                    for lo, pivot, hi in nodes:
                        local_x, local_y = x[lo:hi], y[lo:hi]
                        s, t = options(local_x, pivot - lo), options(local_y, pivot - lo)
                        difference = max(abs(i - j) for i, j in zip(s, t))
                        assert difference <= 6
                        largest = max(largest, difference)
                        comparisons += 1
                        if a not in local_x and b not in local_y:
                            assert local_x == local_y and s == t
                            inactive += 1
        options.cache_clear()
    return comparisons, inactive, largest


if __name__ == "__main__":
    data = [check(n) for n in range(1, 6)]
    print(f"{sum(r[0] for r in data)} aligned comparisons; "
          f"{sum(r[1] for r in data)} inactive nodes; largest score change {max(r[2] for r in data)}")
