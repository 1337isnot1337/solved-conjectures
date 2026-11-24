"""Independent direct enumeration and extremal-order check."""
from collections import Counter
from itertools import combinations, permutations

T = {(0, 3), (1, 0), (2, 0), (2, 1), (3, 1), (3, 2)}


def words(multiplicities, prefix=()):
    if not any(multiplicities):
        yield prefix
    else:
        for a, count in enumerate(multiplicities):
            if count:
                yield from words(multiplicities[:a] + (count - 1,) + multiplicities[a+1:], prefix + (a,))


def major(word, arcs):
    result = 0
    for a, b in combinations(range(4), 2):
        binary = [c for c in word if c in (a, b)]
        result += sum(
            k for k, (x,y) in enumerate(zip(binary, binary[1:]), 1)
            if (y,x) in arcs
        )
    return result


def minimal_orders(A, arcs):
    costs = []
    for order in permutations(range(4)):
        position = {a:i for i,a in enumerate(order)}
        costs.append((sum(A[b] for a,b in arcs if position[a] < position[b]), order))
    smallest = min(c for c,p in costs)
    return smallest, [p for c,p in costs if c == smallest]


def check():
    for m in range(2,10):
        A = (1,1,1,m)
        totals = Counter(major(w,T) for w in words(A))
        lo, options = minimal_orders(A,T)
        rev_lo, rev_options = minimal_orders(A,{(b,a) for a,b in T})
        cap = 3*m+3
        assert (lo, rev_lo) == (2,1)
        assert min(totals) == lo and max(totals) == cap-rev_lo
        assert totals[lo] == len(options) and totals[cap-rev_lo] == len(rev_options)
        assert totals[lo] > totals[cap-rev_lo] == 1
        if m == 2:
            assert [totals[i] for i in range(10)] == [0,0,4,11,16,15,9,4,1,0]
            print("m=2, coefficient list:", [totals[i] for i in range(10)])
    print("Exact direct-word and extremal-order checks passed m=2 through 9.")

check()

