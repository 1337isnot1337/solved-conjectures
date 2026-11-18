"""Finite checks of the packing and recovery argument for rectangle partitions."""
from collections import Counter
from itertools import product


def choices(lower, upper, budget):
    """All nondecreasing tuples of allowed widths with total at most budget."""
    yield ()
    for width in range(lower, min(upper, budget) + 1):
        for rest in choices(width, upper, budget - width):
            yield (width, *rest)


def audit(height, width, reservations, cap):
    # Each reservation gives (tile height, x, y, strip count, strip width).
    families = [list(choices(a, cap, count * (span - cap)))
                for a, _, _, count, span in reservations]
    seen = set()
    for family in product(*families):
        cells = set()
        blocks = []
        for (a, x, y, count, span), parts in zip(reservations, family):
            row = used = 0
            for b in parts:
                if used + b > span:
                    row += 1
                    used = 0
                assert row < count
                for i in range(x + used, x + used + b):
                    for j in range(y + row*a, y + (row+1)*a):
                        assert 0 <= i < width and 0 <= j < height
                        assert (i, j) not in cells
                        cells.add((i, j))
                used += b
                blocks.append(tuple(sorted((a, b))))
        types = Counter(blocks)
        types[1, 1] = height*width - len(cells)
        assert sum(a*b*n for (a, b), n in types.items()) == height*width
        recovered = tuple(tuple(sorted(b for (a, b), n in types.items()
                                       if a == target for _ in range(n)))
                          for target, *_ in reservations)
        assert recovered == family
        signature = tuple(sorted(types.items()))
        assert signature not in seen
        seen.add(signature)
    return len(seen)


if __name__ == '__main__':
    rows = audit(7, 8, [(2, 0, 0, 2, 8), (3, 0, 4, 1, 8)], 4)
    columns = audit(8, 16, [(2, 0, 0, 4, 8), (3, 8, 0, 2, 8)], 4)
    print(f'Checked {rows} full-width strip families and {columns} column families.')
