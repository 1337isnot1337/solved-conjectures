"""Finite predicate checks for the tail-coordinate preservation proof."""
from itertools import combinations


def merge(lower, upper):
    if set(lower).intersection(upper):
        return None
    return ''.join(str(bit) for _, bit in sorted(
        [(x, 0) for x in lower] + [(x, 1) for x in upper]))


def violates(prefix, next_point, vertex, markers, cutoff, threshold,
             bound, partial_word):
    return (vertex <= bound and next_point > threshold
            and prefix[-1] < cutoff and merge(prefix, markers) == partial_word)


def clip(flag, delta, infinity):
    markers, cutoff, threshold, bound, word = flag
    if threshold >= delta:
        return None
    return markers, cutoff, threshold, infinity if bound >= delta else bound, word


def check():
    totals = [0, 0, 0, 0]
    for n in range(1, 5):
        universe = range(2*n + 2)
        for lower in combinations(universe, n):
            for upper in combinations(universe, n):
                if set(lower).intersection(upper):
                    continue
                word = merge(lower, upper)
                if not word.endswith('1'):
                    continue
                d = word[:word.rfind('0')].count('1')
                cutoff = upper[d]
                markers = upper[:d]
                eta = max(upper[-1] + 1, cutoff)
                for next_point in range(lower[-1]+1, 2*n+5):
                    for vertex in range(next_point+1, 2*n+6):
                        for bound in (eta+1, eta+2, 2*n+7):
                            flag = (markers, cutoff, eta, bound, word[:n+d])
                            actual = violates(lower, next_point, vertex, *flag)
                            expected = merge(lower, upper) == word and next_point > eta and vertex <= bound
                            assert actual == expected
                            totals[0] += 1
                            for delta in range(next_point+1, 2*n+7):
                                clipped = clip(flag, delta, 2*n+10)
                                if vertex < delta:
                                    new = False if clipped is None else violates(lower, next_point, vertex, *clipped)
                                    assert actual == new
                                    totals[1] += 1
                                if vertex == delta:
                                    copy = delta - 1
                                    if cutoff < copy and next_point < copy and (bound >= delta or bound < copy):
                                        new = False if clipped is None else violates(lower, next_point, copy, *clipped)
                                        assert actual == new
                                        totals[2] += 1
                                if clipped and lower[-1] >= delta:
                                    assert not violates(lower, next_point, vertex, *clipped)
                                    totals[3] += 1
                assert not violates(upper, upper[-1]+2, eta+3,
                                    markers, cutoff, eta, eta+3, word[:n+d])
    for n in range(1, 4):
        words = [''.join('1' if j in positions else '0' for j in range(2*n))
                 for positions in combinations(range(2*n), n) if 2*n-1 in positions]
        for lower in combinations(range(2*n+1), n):
            for upper in combinations(range(2*n+1), n):
                for word in words:
                    depth = word[:word.rfind('0')].count('1')
                    cut = upper[depth]
                    flag = (upper[:depth], cut, cut, 2*n+5, word[:n+depth])
                    tail = max(lower[-1]+1, cut+1)
                    vertex = tail + 1
                    assert violates(lower, tail, vertex, *flag) == (merge(lower, upper) == word)
                    totals[0] += 1
                    for delta in range(cut+1, lower[-1]+1):
                        clipped = clip(flag, delta, 2*n+10)
                        assert clipped is not None
                        assert not violates(lower, tail, vertex, *clipped)
                        totals[3] += 1
    return totals


if __name__ == "__main__":
    a, b, c, d = check()
    print(f'{a:,} exact flag, {b:,} inner clipping, {c:,} boundary proxy, {d:,} outer marker checks')
