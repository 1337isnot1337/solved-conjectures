"""Finite order and membership checks for Erdős 197. Requires python-sat."""

from functools import lru_cache
from itertools import combinations, product

from pysat.solvers import Solver


RULES = ('zero', 'one', 'alternate', 'reverse-alternate', 'trailing-zero', 'trailing-one')
OFFSETS = ((0, 0), (0, 1), (1, 0), (0, 2))


def binary_key(x, block, rule, width):
    def reverse_bits(value):
        return int(f'{value % (1 << width):0{width}b}'[::-1], 2)

    if rule in ('trailing-zero', 'trailing-one'):
        value = x if rule == 'trailing-zero' else x + 1
        count = (value & -value).bit_length() - 1
        tail = value >> (count + 1)
        return -count, reverse_bits(~tail if rule == 'trailing-zero' else tail)
    prefer_one = rule == 'one' or (rule == 'alternate' and block % 2 == 1)
    if rule == 'reverse-alternate':
        prefer_one = block % 2 == 0
    return reverse_bits(~x if prefer_one else x)


@lru_cache(None)
def monotone_triples(n, base, offset, rule):
    """Use [1,b+s), [b+s,b²+s), ... as the ordered blocks."""
    order = []
    lo = 1
    hi = base + offset
    block = 0
    while lo <= n:
        values = range(lo, min(n + 1, hi))
        order.extend(sorted(values, key=lambda x: binary_key(x, block, rule, n.bit_length() + 1)))
        lo, hi = hi, (hi - offset) * base + offset
        block += 1
    rank = {x: index for index, x in enumerate(order)}
    triples = []
    for x in range(1, n + 1):
        for d in range(1, (n - x) // 2 + 1):
            y, z = x + d, x + 2 * d
            if (rank[x] < rank[y]) == (rank[y] < rank[z]):
                triples.append((x, y, z))
    return triples


def colourable(n, first, second):
    a_triples = monotone_triples(n, *first)
    b_triples = monotone_triples(n, *second)
    with Solver(name='cadical195') as solver:
        for x, y, z in a_triples:
            solver.add_clause([-x, -y, -z])
        for x, y, z in b_triples:
            solver.add_clause([x, y, z])
        if not solver.solve():
            return False
        in_a = {i for i in solver.get_model() if i > 0}
        assert all(not {x, y, z} <= in_a for x, y, z in a_triples)
        assert all({x, y, z} & in_a for x, y, z in b_triples)
        return True


def has_bounded_order(n, m, colour, factor):
    """An order on this prescribed colour must put x before each y>factor*x."""
    values = [x for x in range(1, n + 1) if ((x**m).bit_length() - 1) % 2 == colour]
    points = set(values)
    pairs = {pair: index for index, pair in enumerate(combinations(values, 2), 1)}
    with Solver(name='cadical195') as solver:
        for (x, y), xy in pairs.items():
            if y > factor * x:
                solver.add_clause([xy])
            z = 2 * y - x
            if z in points:
                yz = pairs[y, z]
                solver.add_clause([xy, yz])
                solver.add_clause([-xy, -yz])
        for x, y, z in combinations(values, 3):
            xy, yz, xz = pairs[x, y], pairs[y, z], pairs[x, z]
            solver.add_clause([-xy, -yz, xz])
            solver.add_clause([xy, yz, -xz])
        if not solver.solve():
            return False
        model = {i for i in solver.get_model() if i > 0}
        earlier = {x: 0 for x in values}
        for (x, y), xy in pairs.items():
            earlier[y if xy in model else x] += 1
        assert sorted(earlier.values()) == list(range(len(values)))
        for (x, y), xy in pairs.items():
            assert (earlier[x] < earlier[y]) == (xy in model)
            assert y <= factor * x or earlier[x] < earlier[y]
            z = 2 * y - x
            if z in points:
                assert (earlier[x] < earlier[y]) != (earlier[y] < earlier[z])
        return True


def main():
    total = 0
    survive_100 = 0
    survive_200 = 0
    for a, b, offsets, rule_a, rule_b in product(range(2, 6), range(2, 7), OFFSETS, RULES, RULES):
        total += 1
        first = (a, offsets[0], rule_a)
        second = (b, offsets[1], rule_b)
        if colourable(100, first, second):
            survive_100 += 1
            survive_200 += colourable(200, first, second)
    print(f'Prescribed order pairs: {total}; satisfiable at 100: {survive_100}; at 200: {survive_200}')
    assert total == 2880 and survive_200 == 0
    for m, expected in ((3, (False, True)), (5, (False, False)), (7, (False, False))):
        answers = tuple(has_bounded_order(160, m, c, 16) for c in (0, 1))
        print(f'Fine bands m={m}, N=160, factor 16: {answers}')
        assert answers == expected


if __name__ == '__main__':
    main()
