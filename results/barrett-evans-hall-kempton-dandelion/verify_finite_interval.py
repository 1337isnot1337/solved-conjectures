"""Exact certificate for each complementary connected pair of orders 21 through 64."""
from collections import Counter
from fractions import Fraction as Q
from functools import lru_cache, partial
import sys

from verify_effective_interval import close_branch, root_bounds, star


def target_upper(n):
    """Enclose the two outside roots in Lemma 4.2 of the source paper."""
    def cubic(t):
        return ((t - n - 2) * t + 3*n - 2) * t - n

    def isolate(left, right):
        left, right = Q(left), Q(right)
        assert cubic(left) < 0 < cubic(right)
        for _ in range(24):
            mid = (left + right) / 2
            if cubic(mid) <= 0:
                left = mid
            else:
                right = mid
        return left, right

    return isolate(0, 1)[1] + n - isolate(n-1, n)[0]


@lru_cache(maxsize=32768)
def norm_factor(n, d, upper):
    # Bound the squared norm spent on v, its neighbors and its nonneighbors.
    if d <= upper:
        return Q(1)
    return 1 + (d-upper)**2/d + (1+d-upper)**2/(n-1-d)


@lru_cache(maxsize=32768)
def degree(n, magnitude, upper):
    # Connectedness of both graphs excludes degree n-1.
    lo, hi = 0, n-1
    while hi-lo > 1:
        mid = (lo+hi)//2
        if magnitude**2 * norm_factor(n, mid, upper) <= 1:
            lo = mid
        else:
            hi = mid
    return lo


@lru_cache(maxsize=32768)
def opposite(n, missing, upper):
    if not missing:
        return Q(0)
    return min(1, root_bounds(1 / norm_factor(n, n-1-missing, upper))[1])


def cross_edge_possible(n, first, second, first_upper, second_upper):
    """Check a necessary condition for a first-graph edge across signed extrema."""
    d = degree(n, second, second_upper)
    if not d:
        return False
    near = degree(n, (1-second_upper)*second, second_upper)
    bound = min(opposite(n, d, first_upper),
                d*opposite(n, near, first_upper)/(n-d-first_upper))
    return (1-first_upper)*first <= bound


def matching_possible(n, x, y, a, b):
    # a and b give positive and negative extremal magnitudes, both as lower bounds.
    for c, d in (b, b[::-1]):
        if (cross_edge_possible(n, a[0], c, x, y)
                and cross_edge_possible(n, a[1], d, x, y)
                and cross_edge_possible(n, c, a[1], y, x)
                and cross_edge_possible(n, d, a[0], y, x)):
            return True
    return False


def classify(n, D, box, p):
    (xl, xu), (hl, hu), (ml, mu) = box
    yu = D-xl
    if 4*(xu*hu**2 + yu*mu**2) < 1:
        return 'complete pair'

    if yu < 1:
        # The unnormalized sum of squares is one, hence U times |min| is >= 1/n.
        def negative_bound(own_high, own_upper, other_high, other_upper):
            range_sq = max(Q(0), 1-4*own_upper*other_high**2)/other_upper
            return max(1/(n*own_high), root_bounds(range_sq)[0]-own_high)

        negative_a = negative_bound(mu, xu, hu, yu)
        negative_b = negative_bound(hu, yu, mu, xu)
        if not matching_possible(n, xu, yu, (ml, negative_a), (hl, negative_b)):
            return 'extremal matching'

    e = degree(n, hl, yu)
    d = degree(n, ml, xu)
    if not e or d < p or (p == 1 and e == 1):
        return 'initial degrees'
    if p == 1:
        d = 1

    m = max(ml, root_bounds((1-xu)/star(n, e))[0])
    if m > mu:
        return 'first maximum'
    d = min(d, degree(n, m, xu))
    if d < p:
        return 'localized first degree'
    j = degree(n, (1-xu/p)*m, xu)
    if not j:
        return 'first neighbor degree'

    h_sq = max(Q(0), (2-yu)/(star(n,d)+star(n,j)), (1-yu)/star(n,d))
    h = max(hl, root_bounds(h_sq)[0])
    if h > hu:
        return 'second maximum'
    e = min(e, degree(n, h, yu))
    return close_branch(n, D, xl, xu, yu, m, h, e, d, p,
                        partial(degree, n), opposite)


def check(n):
    D = target_upper(n)
    assert 1 < D < 2
    low = root_bounds(Q(1,n))[0]
    high = root_bounds(Q(n-1,n))[1]
    initial = ((Q(0), D/2), (low,high), (low,high))
    closed = Counter()
    def visit(box, depth):
        reasons = [classify(n, D, box, p) for p in (1, 2)]
        if all(reasons):
            closed.update(reasons)
            return
        if depth == 18:
            raise AssertionError(f'unclosed box at order {n}: {box}')
        i = max(range(3), key=lambda j: box[j][1]-box[j][0])
        a, b = box[i]
        mid = (a+b)/2
        for interval in ((a,mid),(mid,b)):
            visit(box[:i] + (interval,) + box[i+1:], depth+1)

    visit(initial, 0)
    return closed


if __name__ == '__main__':
    orders = [int(arg) for arg in sys.argv[1:]] or range(21,65)
    all_reasons = Counter()
    for n in orders:
        reasons = check(n)
        all_reasons.update(reasons)
        print(f'n={n}: {sum(reasons.values())//2} boxes closed', flush=True)
    print('Closed branches:', sum(all_reasons.values()))
    print('Reasons:', dict(sorted(all_reasons.items())))
