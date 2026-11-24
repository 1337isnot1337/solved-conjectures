"""Finite checks for the written estimates. Run with standard Python 3."""

from fractions import Fraction
from itertools import combinations, product


def graph_check():
    n = 8
    edges = [(a, a ^ (1 << bit)) for a in range(n) for bit in range(3)
             if a < (a ^ (1 << bit))]
    cuts = [set(s) for k in (3, 4, 5) for s in combinations(range(n), k)]
    representatives = cuts[::31]
    signs = []
    for a, b in edges:
        signs.append([1 if a in s else -1 if b in s else 1
                      for s in representatives])
    for s in cuts:
        crossing = sum((a in s) != (b in s) for a, b in edges)
        assert crossing >= 3
        # Each edge has its own sign at the two ends of the tail coordinate.
        imbalance = [0] * n
        for a, b in edges:
            imbalance[a] += int(a in s) - int(b in s)
        assert sum(map(abs, imbalance)) == crossing
        assert n * sum(x*x for x in imbalance) >= crossing**2
        if s in representatives:
            j = representatives.index(s)
            assert sum(direction[j] * (int(a in s) - int(b in s))
                       for direction, (a, b) in zip(signs, edges)) == crossing

    # Sampling identity on all prefix sizes, without floating-point norms.
    for k in range(1, n):
        samples = list(combinations(range(n), k))
        expected_total = 0
        for j in range(len(representatives)):
            bvec = [0] * n
            for direction, (a, b) in zip(signs, edges):
                bvec[a] += direction[j]
                bvec[b] -= direction[j]
            observed = sum(sum(bvec[a] for a in s)**2 for s in samples)
            expected_total += observed
            assert observed * n * (n-1) == (
                len(samples) * k * (n-k) * sum(x*x for x in bvec))
        assert expected_total > 0
    return len(cuts), len(representatives)


def exact_rank(columns):
    basis = {}
    for column in columns.values():
        vector = dict.fromkeys(column, Fraction(1))
        while vector:
            pivot = min(vector)
            scale = vector[pivot]
            if pivot not in basis:
                basis[pivot] = {r: x/scale for r, x in vector.items()}
                break
            for row, x in basis[pivot].items():
                value = vector.get(row, 0) - scale*x
                if value:
                    vector[row] = value
                else:
                    vector.pop(row, None)
    return len(basis)


def shared_matrix_check():
    ranks = []
    for n, width in [(4, 3), (8, 2)]:
        k = n // 2
        while k:
            columns = {}
            for interior in product(range(width), repeat=n-1):
                path = (0,) + interior + (0,)
                word = tuple(zip(path, path[1:]))
                columns.setdefault(word[k:], set()).add(word[:k])
            rank = exact_rank(columns)
            assert rank == width
            ranks.append(rank)
            k //= 2
    return ranks


def logsum_upper(exponents):
    # Integer upper bound on log2(sum(2**e)), without forming these numbers.
    return max(exponents) + (len(exponents)-1).bit_length()


def cut_check(base_log, alpha):
    """Dyadic version of J.3 with upward-rounded resource bounds."""
    H, a0, C = 272, 192, 3
    divisor = 128 * H
    T = 2 * H * alpha * base_log  # all time/size/counts here are binary logs
    target = H * base_log
    time, size = T, T-48*base_log
    stages = []
    while True:
        # Round the adaptive base down to a power of two. This changes
        # log(w) by less than one and preserves the contraction estimate.
        w = max(base_log, time // divisor)
        loss = C * (w+1).bit_length()
        assert a0*w <= time and 4*(time+1) <= (w+1)**2
        assert size <= time
        k = min(63*w, time+loss-target)
        assert 1 <= k <= 64*w
        child_time = time+loss-k
        child_size = logsum_upper([size-k, time-256*w]) + loss
        count = k+loss
        listing = logsum_upper([size, time+k-256*w]) + loss
        stages.append((count, listing, a0*w))
        size, time = child_size, child_time
        if time == target:
            break
        assert time > target
    assert size <= target - 32*base_log
    pieces, cost, code = stages[-1]
    for p, x, g in reversed(stages[:-1]):
        # x + p*(suffix_time + 62*suffix_count + 110) + 100
        cost = logsum_upper([x, p+cost, p+6+pieces, p+7, 7])
        code = logsum_upper([g, 2+code, 12])
        pieces += p
    assert pieces <= T - target + 2*base_log
    assert cost <= T - 24*base_log
    assert code <= (H//16)*alpha*base_log
    return len(stages)


if __name__ == "__main__":
    print("Cube balanced cuts and representative cuts:", graph_check())
    print("Shared matrix-product prefix ranks:", shared_matrix_check())
    for exponent in (5, 12, 30, 55):
        alpha = 2**exponent
        depth = cut_check(2**50, alpha)
        print(f"Adaptive cut depth at alpha=2^{exponent}: {depth}")
