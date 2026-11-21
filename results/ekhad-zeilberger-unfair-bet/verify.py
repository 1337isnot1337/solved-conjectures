"""Compare all word pairs to the exact extremal formula, without floating point."""
from itertools import combinations, product


def overlap(a, b, q):
    """q**k times the proper suffix-prefix overlap weight."""
    return sum(q**j for j in range(1, len(a)) if a[-j:] == b[:j])


def squared_score(a, b, q):
    """A common scale factor is suppressed for comparisons at fixed q and k."""
    x = overlap(a, a, q)
    y = overlap(b, b, q)
    if x == y:
        return 0, 1
    variance = q**len(a) + x+y - overlap(a, b, q) - overlap(b, a, q)
    assert variance > 0
    return (x-y)**2, variance


def proposed_pair(q, k, full_alphabet):
    if not full_alphabet:
        return (0,)*(k-1)+(1,), (0,)*k
    if q <= k+1:
        return (0,)*(k-q+1)+tuple(range(1, q)), (0,)*k
    period = q-k
    return tuple(range(period, q)), tuple(i % period for i in range(k))


def exhaustive(q, k):
    words = list(product(range(q), repeat=k))
    masks = {w: sum(1 << x for x in set(w)) for w in words}
    self_overlap = {w: overlap(w, w, q) for w in words}
    targets = {full: squared_score(*proposed_pair(q, k, full), q)
               for full in (False, True) if not full or q <= 2*k}
    size = q**k
    checked = 0
    for a, b in combinations(words, 2):
        x, y = self_overlap[a], self_overlap[b]
        num, den = (x-y)**2, 1
        if num:
            den = size+x+y-overlap(a, b, q)-overlap(b, a, q)
            assert den > 0
        for full, (best_num, best_den) in targets.items():
            if full and (masks[a] | masks[b]).bit_count() != q:
                continue
            assert num*best_den <= best_num*den, (q, k, a, b, full)
            if not full and num*best_den == best_num*den:
                loser, winner = (a, b) if x > y else (b, a)
                assert len(set(loser)) == 1
                letter = loser[0]
                assert (winner[:-1] == (letter,)*(k-1)
                        or winner[1:] == (letter,)*(k-1))
        checked += 1
    return checked


if __name__ == '__main__':
    cases = ([(2, k) for k in range(2, 10)] + [(3, k) for k in range(2, 6)]
             + [(4, k) for k in range(2, 5)] + [(5, 3), (6, 3), (7, 4)])
    total = sum(exhaustive(q, k) for q, k in cases)
    print(f'Checked {total:,} unordered word pairs over {len(cases)} alphabet/length choices.')
