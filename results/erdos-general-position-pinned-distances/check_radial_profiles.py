"""Exact radial-rank and subsampling tests for the profile reduction."""

from collections import Counter, defaultdict
from itertools import combinations, product


def require(value, message):
    if not value:
        raise ValueError(message)


def squared(a, b):
    return (a[0] - b[0])**2 + (a[1] - b[1])**2


def check_rank_intervals():
    sites = [(16*i, 16*j) for i in range(5) for j in range(5)]
    triples = []
    for x in sites:
        shells = defaultdict(list)
        for y in sites:
            if y != x:
                shells[squared(x, y)].append(y)
        for shell in shells.values():
            for triple in combinations(shell, 3):
                triples.append((x, triple))
    count = 0
    noncentral = 0
    bins_checked = 0
    for origin in [*sites, *((x+1, y+1) for x,y in sites), (-2, 1), (-1, 7), (-12, -12)]:
        radii = {y: squared(origin, y) for y in sites}
        ordered = sorted(sites, key=lambda y: (radii[y], y))
        ranks = {y: rank for rank, y in enumerate(ordered)}
        intervals = {}
        bins = {y: (r2.bit_length()-1)//2 for y, r2 in radii.items() if r2}
        for y, r2 in radii.items():
            if not r2:
                continue
            band = {z for z in sites if r2 <= 64*radii[z] and radii[z] <= 64*r2}
            intervals[y] = band
            require(all(abs(bins[z]-bins[y]) <= 3 for z in band), "annulus exceeds seven bins")
            masses = Counter(bins[z] for z in band)
            require(len(band) <= 7*max(masses.values()), "no heavy bin in radial neighborhood")
            bins_checked += 1
        for pin, triple in triples:
            for y in triple:
                if not radii[y] or 64*radii[pin] > radii[y]:
                    continue
                band = intervals[y]
                require(all(z in band for z in triple), "radius companions outside the annulus")
                diameter = max(ranks[z] for z in triple)-min(ranks[z] for z in triple)
                require(diameter < len(band), "rank spread exceeds interval mass")
                count += 1
                if origin != pin:
                    noncentral += 1
    require(noncentral > 0, "missing off-center control")
    return count, bins_checked, noncentral


def hull_vertices(points):
    ordered = sorted(set(points))
    if len(ordered) <= 2:
        return set(ordered)
    def turn(a, b, c):
        return (b[0]-a[0])*(c[1]-a[1])-(b[1]-a[1])*(c[0]-a[0])
    def chain(points):
        result = []
        for point in points:
            while len(result) >= 2 and turn(result[-2], result[-1], point) <= 0:
                result.pop()
            result.append(point)
        return result
    return set(chain(ordered) + chain(reversed(ordered)))


def check_subsampling():
    sites = [(0, 0), (4, 0), (0, 4), (4, 4), (2, 2)]
    tested = 0
    for sample in product(sites, repeat=5):
        original = hull_vertices(sample)
        selected = set()
        for i, value in enumerate(sample):
            if value in original and value not in sample[:i]:
                selected.add(i)
        for picked in combinations(range(5), 3):
            surviving = {sample[i] for i in picked if i in selected}
            require(surviving <= hull_vertices([sample[i] for i in picked]), "lost extreme representative")
            tested += 1
    return tested


if __name__ == "__main__":
    triples, bins, off_center = check_rank_intervals()
    print(f"{triples} pin-base annular rank tests ({off_center} off-center) and {bins} seven-bin checks")
    print(f"{check_subsampling()} representative subsamples, including repeated or collinear sites")
