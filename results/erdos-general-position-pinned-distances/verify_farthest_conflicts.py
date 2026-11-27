#!/usr/bin/env python3
"""Check the farthest-cell argument on exact finite examples for Erdős 654.

The fixture includes five collinear points, off-line sites, tied radii and
centered triples. Every subsample with no collinear triple is considered.
Fraction arithmetic checks deletion certificates and strict-radius circle
completions, including pins shared by closed farthest cells. These finite
tests do not establish the asymptotic estimate or compactness argument.
"""

from collections import Counter, defaultdict
from dataclasses import dataclass
from fractions import Fraction
from itertools import combinations, pairwise


FIXTURE = (
    (0, 0), (5, 0), (0, 5), (-4, 3), (1, 0),
    (2, 0), (9, 6), (7, -3), (1, 1), (-1, 0),
)
# Rotate and dilate together to put the subdivision direction in general position.
SITES = tuple((37 * x - 14 * y, 14 * x + 37 * y) for x, y in FIXTURE)
LEFT, RIGHT, BOTTOM, TOP = -701, 809, -631, 743
FRAME = ((LEFT, BOTTOM), (RIGHT, BOTTOM), (RIGHT, TOP), (LEFT, TOP))


def cross(a, b, c):
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def dist2(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def cocircular(a, b, c, d):
    # Translate d to the origin and expand the circle determinant. Four
    # collinear points also yield zero determinant but do not lie on a circle.
    minors = (cross(d, b, c), cross(d, c, a), cross(d, a, b))
    determinant = sum(minor * dist2(d, point) for minor, point in zip(minors, (a, b, c)))
    return any(minors) and determinant == 0


@dataclass(frozen=True)
class Halfplane:
    a: int
    b: int
    c: int
    site: int | None = None

    def value(self, point):
        return self.a * point[0] + self.b * point[1] + self.c


FRAME_SIDES = (
    Halfplane(1, 0, -LEFT),
    Halfplane(-1, 0, RIGHT),
    Halfplane(0, 1, -BOTTOM),
    Halfplane(0, -1, TOP),
)


def farther_halfplane(owner, other):
    """The region where the owner is at least as far away as the other site."""
    x, y = SITES[owner]
    u, v = SITES[other]
    return Halfplane(2 * (u - x), 2 * (v - y), x*x + y*y - u*u - v*v, other)


def edges(polygon):
    return zip(polygon, polygon[1:] + polygon[:1])


def clip(polygon, side):
    result = []
    for a, b in edges(polygon):
        start, end = side.value(a), side.value(b)
        if start >= 0:
            result.append(a)
        if start * end < 0:
            fraction = Fraction(start, start - end)
            x = a[0] + fraction * (b[0] - a[0])
            y = a[1] + fraction * (b[1] - a[1])
            result.append((x, y))
    return tuple(result)


def height_at(edge, x):
    a, b = edge
    fraction = Fraction(x - a[0], b[0] - a[0])
    return a[1] + fraction * (b[1] - a[1])


@dataclass(frozen=True)
class Piece:
    owner: int
    corners: tuple

    def contains(self, point):
        # Counterclockwise corners. A triangular piece repeats one corner.
        return all(cross(a, b, point) >= 0 for a, b in edges(self.corners))


def cell_pieces(owner, sample):
    competitors = [farther_halfplane(owner, j) for j in sample if j != owner]
    polygon = FRAME
    for side in competitors:
        polygon = clip(polygon, side)
    if len(polygon) < 3:
        return

    support = {}
    constraints = (*FRAME_SIDES, *competitors)
    for i, (a, b) in enumerate(edges(polygon)):
        assert cross(polygon[i - 1], a, b) > 0, "degenerate cell in selected frame"
        active = [side for side in constraints if side.value(a) == side.value(b) == 0]
        assert len(active) == 1, "cell edge should have one defining constraint"
        support[a, b] = active[0]

    for left, right in pairwise(sorted({p[0] for p in polygon})):
        mid = Fraction(left + right, 2)
        spanning = [
            (a, b) for a, b in edges(polygon) if min(a[0], b[0]) < mid < max(a[0], b[0])
        ]
        assert len(spanning) == 2, "a vertical slice must meet a top and a bottom edge"
        lower, upper = sorted(spanning, key=lambda edge: height_at(edge, mid))
        corners = (
            (left, height_at(lower, left)), (right, height_at(lower, right)),
            (right, height_at(upper, right)), (left, height_at(upper, left)),
        )
        defining = {owner, support[lower].site, support[upper].site}
        for wall in (left, right):
            if wall in (LEFT, RIGHT):
                continue
            pivots = [i for i, point in enumerate(polygon) if point[0] == wall]
            assert len(pivots) == 1, "choose a generic subdivision direction"
            i = pivots[0]
            prev_edge = (polygon[i - 1], polygon[i])
            next_edge = (polygon[i], polygon[(i + 1) % len(polygon)])
            defining.update((support[prev_edge].site, support[next_edge].site))
        defining.discard(None)  # The four frame sides require no sample site.
        assert len(defining) <= 7, "too many sites needed to define a piece"
        yield Piece(owner, corners), defining


def check_conflicts(piece, counts):
    conflicts = set()
    for j, site in enumerate(SITES):
        if j == piece.owner:
            continue
        # The difference of the two squared distances is affine on the piece.
        # Check its maximum using corners, then independently intersect the
        # competitor's closed half-plane with the piece and measure the area.
        wins_at_corner = any(
            dist2(corner, site) > dist2(corner, SITES[piece.owner]) for corner in piece.corners
        )
        polygon = clip(piece.corners, farther_halfplane(j, piece.owner))
        twice_area = sum(x1 * y2 - x2 * y1 for (x1, y1), (x2, y2) in edges(polygon))
        assert (twice_area > 0) == wins_at_corner, "the conflict tests disagree"
        if wins_at_corner:
            conflicts.add(j)
        counts["exact conflict-set comparisons"] += 1
    return conflicts


def fixture_data():
    assert not any(cocircular(*q) for q in combinations(SITES, 4)), "four cocircular sites"
    assert all(LEFT < x < RIGHT and BOTTOM < y < TOP for x, y in SITES)
    collinear = [
        frozenset((i, j, k)) for i, j, k in combinations(range(len(SITES)), 3)
        if cross(SITES[i], SITES[j], SITES[k]) == 0
    ]
    assert collinear, "fixture must exercise the regular-sample restriction"
    circles = {}
    for i, pin in enumerate(SITES):
        radii = defaultdict(list)
        for j, site in enumerate(SITES):
            if i != j:
                radii[dist2(pin, site)].append(j)
        circles[i] = [(r, bases) for r, bases in radii.items() if len(bases) == 3]
    return collinear, circles


def main():
    if not __debug__:
        raise SystemExit("This verifier requires assertions. Run Python without -O.")

    collinear, circles = fixture_data()
    counts = Counter()
    families = {}
    conflicts = {}
    for size in range(1, len(SITES) + 1):
        for chosen in combinations(range(len(SITES)), size):
            sample = frozenset(chosen)
            if any(triple <= sample for triple in collinear):
                continue
            pieces = {}
            for owner in sample:
                pieces.update(cell_pieces(owner, sample))
            assert pieces, "the frame must contain a farthest cell"
            families[sample] = pieces
            counts["regular samples"] += 1
            counts["cell pieces"] += len(pieces)

            for piece, defining in pieces.items():
                if piece not in conflicts:
                    conflicts[piece] = check_conflicts(piece, counts)
                assert conflicts[piece].isdisjoint(sample), "sample site beats its cell owner"

                # Every subsample containing the defining sites must retain this
                # exact piece and owner. All smaller samples were processed first.
                removable = sorted(sample - defining)
                for number_kept in range(len(removable) + 1):
                    for extra in combinations(removable, number_kept):
                        subsample = frozenset(defining.union(extra))
                        assert piece in families[subsample], "deletion changed the piece"
                        counts["deletion certificates checked"] += 1

            for i, pin in enumerate(SITES):
                covering = [piece for piece in pieces if piece.contains(pin)]
                assert covering, "frame subdivision missed a possible pin"
                farthest = max(dist2(pin, SITES[j]) for j in sample)
                owners = {piece.owner for piece in covering}
                assert all(dist2(pin, SITES[j]) == farthest for j in owners)
                shared_boundary = len(owners) > 1
                counts["pins on shared owner boundaries"] += shared_boundary
                for radius_squared, bases in circles[i]:
                    if radius_squared <= farthest:
                        continue
                    for piece in covering:
                        assert set(bases) <= conflicts[piece], "a circle base escaped the conflict set"
                        counts["strict-radius completions checked"] += 1
                        counts["completions at shared owner boundaries"] += shared_boundary

    assert counts["completions at shared owner boundaries"] > 0
    num_circles = sum(len(items) for items in circles.values())
    print(f"{len(SITES)} sites, {len(collinear)} collinear triples, {num_circles} centered triples")
    for name, value in counts.items():
        print(f"{value:,} {name}")


if __name__ == "__main__":
    main()
