"""Exact spot checks of the scope and formula comparisons in the catalogue audit."""
from collections import defaultdict
from fractions import Fraction
from itertools import product
from math import comb, factorial


def colored_partitions(n, r):
    # Insert the next label into an existing or new block, once per set partition.
    partitions = [()]
    for i in range(n):
        partitions = [new for blocks in partitions for new in
                      [blocks + ((i,),)] + [blocks[:j] + (b + (i,),) + blocks[j + 1:]
                                              for j, b in enumerate(blocks)]]
    def weights(total, colors):
        if colors == 1:
            yield (total,)
        else:
            for i in range(total + 1):
                for tail in weights(total - i, colors - 1):
                    yield (i,) + tail
    states = [(blocks, w) for blocks in partitions
              for w in product(*(weights(len(b)-1, r) for b in blocks))]
    return sorted(states, key=lambda x: -len(x[0]))


def below(lower, upper):
    lb, lw = lower
    ub, uw = upper
    for b, w in zip(ub, uw):
        pieces = [(c, t) for c, t in zip(lb, lw) if set(c) <= set(b)]
        if sum(len(c) for c, _ in pieces) != len(b):
            return False
        if any(sum(t[i] for _, t in pieces) > w[i] for i in range(len(w))):
            return False
    return True


def check_weighted_graphs():
    # Compare the literal bottom Möbius sum with the external coefficient extraction.
    # Evaluate at n distinct markers: both sides have degree at most n-1.
    for n in range(1, 5):
        for r in (3, 4):
            mobius = {}
            for state in colored_partitions(n, r):
                mobius[state] = 1 if len(state[0]) == n else -sum(
                    mu for prev, mu in mobius.items() if below(prev, state))
            for t in range(n):
                direct = sum(mu * t**(n-len(blocks)) for (blocks, _), mu in mobius.items())
                factor = [Fraction(comb(r-2, i) * t**i, factorial(i+1)) for i in range(r-1)]
                denominator = [Fraction(1)] + [Fraction(0)] * (n-1)
                for _ in range(n):
                    denominator = [sum(a * denominator[k-i] for i, a in enumerate(factor[:k+1]))
                                   for k in range(n)]
                quot = []
                for k in range(n):
                    quot.append(Fraction((1-n*t)**k, factorial(k))
                                - sum(denominator[i] * quot[k-i] for i in range(1, k+1)))
                assert direct == factorial(n-1) * quot[-1], (n, r, t, direct)


def check_rank_eight():
    # For an exponential-polynomial base, retain the highest surviving polynomial degree.
    # Keys encode 2-adic exponent, 3-adic exponent and the exponent of the index n.
    terms = {(0,0,0):1, (1,0,0):1, (0,1,0):1, (1,1,0):-1, (0,3,1):1, (1,3,1):1}
    power = {(0,0,0):1}
    for m in range(1, 31):
        nxt = defaultdict(int)
        for (a,b,c), x in power.items():
            for (u,v,w), y in terms.items():
                nxt[a+u,b+v,c+w] += x*y
        power = {key:x for key,x in nxt.items() if x}
        degree = {}
        for a,b,c in power:
            degree[a,b] = max(c, degree.get((a,b), -1))
        rank = sum(d+1 for d in degree.values())
        if m == 1:
            assert rank == 8
        if m >= 5:
            expected = (m+1)*(3*m*m+3*m+2)//2
            expected -= 3*(m-1)*(m%2 == 0) + 6*(m-2)*(m in {9,16,25})
            assert rank == expected, (m, rank, expected)


if __name__ == '__main__':
    check_weighted_graphs()
    check_rank_eight()
    print('Passed literal weighted partitions for n=1..4 and r=3,4, and the rank-eight formula for M=5..30.')
