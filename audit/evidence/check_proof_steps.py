"""Independent finite tests of three specific steps in the audited manuscripts."""
from collections import Counter
from fractions import Fraction
from itertools import combinations, permutations


def positive_cycle(edges, size, weight):
    # A walk of at least size edges improves an optimum only via a positive cycle.
    best = [0] * size
    for _ in range(size):
        nxt = best.copy()
        for u, v, added in edges:
            nxt[v] = max(nxt[v], best[u] + weight(added))
        if nxt == best:
            return False
        best = nxt
    return True


def check_three_differences(differences):
    width = max(differences)
    states = [m for m in range(1 << width) if all(not (m & (m >> d)) for d in differences)]
    index = {m: pos for pos, m in enumerate(states)}
    edges = []
    for state in states:
        for bit in range(2):
            if bit and any(state & (1 << (d - 1)) for d in differences):
                continue
            target = ((state << 1) | bit) & ((1 << width) - 1)
            edges.append((index[state], index[target], bit))
    lower = max(
        Fraction(min(min((d * u) % q, (-d * u) % q) for d in differences), q)
        for a, b in combinations(differences, 2) for q in [a + b] for u in range(q)
    )
    h, q = lower.as_integer_ratio()
    count = len(states)
    assert not positive_cycle(edges, count, lambda bit: q * bit - h), differences
    # Cycle length is at most count for an optimal simple cycle. Adding one to
    # each edge distinguishes equality from a negative integer cycle sum.
    assert positive_cycle(edges, count, lambda bit: (q * bit - h) * (count + 1) + 1), differences


def check_circulants(p):
    for allowed in range(1 << p):
        # Count perfect matchings by a column-subset DP, with no orbit reduction.
        counts = {0: 1}
        for row in range(p):
            nxt = Counter()
            for columns, ways in counts.items():
                for j in range(p):
                    bit = 1 << j
                    if allowed & (1 << ((j - row) % p)) and not columns & bit:
                        nxt[columns | bit] += ways
            counts = nxt
        permanent = counts.get((1 << p) - 1, 0)
        assert permanent % p == allowed.bit_count() % p, (p, allowed, permanent)


def compose(a, b):
    return tuple(a[x] for x in b)


def inverse(a):
    return tuple(a.index(x) for x in range(len(a)))


def power(a, exponent):
    if exponent < 0:
        return power(inverse(a), -exponent)
    result = tuple(range(len(a)))
    for _ in range(exponent):
        result = compose(result, a)
    return result


def cycle_type(a):
    seen = set()
    cycles = []
    for start in a:
        if start in seen:
            continue
        x, size = start, 0
        while x not in seen:
            seen.add(x)
            x, size = a[x], size + 1
        cycles.append(size)
    return tuple(sorted(cycles))


def check_conjugate_powers():
    group = list(permutations(range(5)))
    for a, b in [(2, 3), (-1, 2), (3, -2)]:
        tables = {}
        for x in group:
            table = tables.setdefault(cycle_type(x), Counter())
            left, right = power(x, a), power(x, b)
            for y in group:
                table[left, compose(inverse(y), compose(right, y))] += 1
        for table in tables.values():
            row_sums, col_sums = Counter(), Counter()
            for (x, y), n in table.items():
                row_sums[x] += n
                col_sums[y] += n
            total = table.total()
            assert all(table[x, y] * total == row * col
                       for x, row in row_sums.items() for y, col in col_sums.items())


if __name__ == "__main__":
    triples = list(combinations(range(1, 13), 3))
    for triple in triples:
        check_three_differences(triple)
    for prime in (2, 3, 5, 7):
        check_circulants(prime)
    check_conjugate_powers()
    print(f"Passed {len(triples)} exact maximum-density comparisons, all binary circulants "
          "at primes 2, 3, 5, 7, and three signed-power pairs on every cycle class of S5.")
