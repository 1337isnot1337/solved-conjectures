"""Exact tests for the two-sided active-bisector condition and circle-slot sampling."""
from collections import Counter, defaultdict
from itertools import combinations, permutations, product
from math import gcd


def require(test, message):
    if not test:
        raise ValueError(message)


def norm2(a, b):
    return sum((u - v) ** 2 for u, v in zip(a, b))


def bisector(a, b):
    dx, dy = 2 * (b[0] - a[0]), 2 * (b[1] - a[1])
    c = norm2(b, (0, 0)) - norm2(a, (0, 0))
    factor = gcd(gcd(dx, dy), c)
    if (dx, dy) < (0, 0):
        factor *= -1
    return dx // factor, dy // factor, c // factor


def hull_size(points):
    if len(points) <= 2:
        return len(points)

    def chain(seq):
        out = []
        for x, y in seq:
            while len(out) > 1:
                (a, b), (c, d) = out[-2:]
                if (c - a) * (y - b) > (d - b) * (x - a):
                    break
                out.pop()
            out.append((x, y))
        return out

    points = sorted(points)
    return len(chain(points)) + len(chain(reversed(points))) - 2


def slots():
    count = 48
    marginal = Counter()
    pairs = Counter()
    for u in range(count):
        for noise in product(range(5), repeat=3):
            sites = [(u + i * (count // 3) + v) % count for i, v in enumerate(noise)]
            for a, b, c in permutations(sites):
                require(12 <= abs(a - b) <= 36, "arc separation")
                marginal[a] += 1
                pairs[a, b] += 1
    require(len(set(marginal.values())) == 1, "first arc marginal")
    total = sum(marginal.values())
    require(max(pairs.values()) * count**2 <= 12 * total, "pair density bound")
    return total


def main():
    grid = list(product(range(3), repeat=2))
    sets = 0
    nonregular = 0
    subgraphs = 0
    active_classes = 0
    residuals = 0
    for size in range(3, len(grid) + 1):
        for sites in combinations(grid, size):
            groups = []
            for x in sites:
                radii = defaultdict(list)
                for y in sites:
                    if x != y:
                        radii[norm2(x, y)].append(y)
                groups.append(radii)
            if any(len(ys) > 3 for g in groups for ys in g.values()):
                continue
            sets += 1
            if all(z in sites for z in ((0, 0), (0, 1), (1, 0), (1, 1))):
                nonregular += 1  # The four corners share an off-site center.
            active = Counter()
            for g in groups:
                for ys in g.values():
                    if len(ys) == 3:
                        active_classes += 1
                        active.update(combinations(sorted(ys), 2))
            axes = defaultdict(list)
            for e in combinations(sites, 2):
                axes[bisector(*e)].append(e)
            for K, B in product(range(3), repeat=2):
                for line, es in axes.items():
                    dx, dy, c = line
                    r = sum(dx*x + dy*y == c for x, y in sites)
                    require(all(active[e] <= r for e in es), "axis capacity")
                    counts = sorted((active[e] for e in es), reverse=True)
                    residual = sum(max(a - K, 0) for a in counts[B:])
                    brute = min(sum(max(active[e] - K, 0) for e in es if e not in selected)
                                for selected in combinations(es, min(len(es), B)))
                    require(residual == brute, "best axis nominations")
                    require(sum(counts) <= K * len(es) + B * r + residual, "incidence budget")
                    residuals += 1
            for k in range(2, size + 1):
                for sample in combinations(sites, k):
                    edges = set()
                    for x in sites:
                        furthest = max(norm2(x, y) for y in sample)
                        tied = [y for y in sample if norm2(x, y) == furthest]
                        edges.update(combinations(tied, 2))
                    h = hull_size(sample)
                    cap = 1 if h == 2 else 3*h - 6
                    require(len(edges) <= cap, (sample, edges, "site-witnessed planar bound"))
                    subgraphs += 1
    require(nonregular > 0 and active_classes > 0, "off-site cocircular fixtures")
    print(f"{sets} locally capped sets, {nonregular} containing the prescribed cocircular square")
    print(f"{active_classes} full radius classes, {residuals:,} exact axis nomination checks")
    print(f"{subgraphs:,} sample graphs tested, {slots():,} exact ordered arc triples")


if __name__ == "__main__":
    main()
