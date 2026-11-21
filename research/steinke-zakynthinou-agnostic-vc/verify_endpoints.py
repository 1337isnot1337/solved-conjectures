"""Exhaustively verify the two-endpoint reduction on three-point concept classes."""
from itertools import permutations, product


def vc_at_most_one(concepts):
    return all(len({(h[i], h[j]) for h in concepts}) < 4
               for i in range(3) for j in range(i))


def interval_order(concepts):
    base, *rest = concepts
    for order in permutations(rest):
        extended = (base,) + order + (base,)
        cuts = []
        for x in range(3):
            differing = [j for j, h in enumerate(extended) if h[x] != base[x]]
            if differing and len(differing) != max(differing) - min(differing) + 1:
                break
            cuts.append((min(differing), max(differing) + 1) if differing else (1, 1))
        else:
            return extended, cuts
    raise AssertionError("no interval order")


def main():
    universal = list(product((0, 1), repeat=3))
    classes = identities = traces = 0
    for mask in range(1, 1 << len(universal)):
        concepts = [h for j, h in enumerate(universal) if mask & (1 << j)]
        if not vc_at_most_one(concepts):
            continue
        classes += 1
        ordered, cuts = interval_order(concepts)
        for x, y, j in product(range(3), range(2), range(len(ordered))):
            a, b = cuts[x]
            base_loss = int(ordered[0][x] != y)
            surrogate = ((j >= a) != base_loss) + ((j >= b) != (1 - base_loss))
            assert surrogate == 1 + (ordered[j][x] != y) - base_loss
            identities += 1
        for endpoints in product(*cuts):
            for doubled_position in range(-1, 2 * len(ordered) + 3):
                selected = [c for c in endpoints if 2 * c <= doubled_position]
                remaining = [c for c in endpoints if 2 * c > doubled_position]
                lo, hi = max(selected, default=0), min(remaining, default=len(ordered))
                assert lo < hi
                for candidate in range(lo, hi):
                    assert all((candidate >= c) == (2 * c <= doubled_position) for c in endpoints)
                traces += 1
    print(f"{classes} classes, {identities} pointwise loss identities, {traces} decoded traces")


if __name__ == "__main__":
    main()
