"""Integer checks for the cut-rank permanent transfer and the fixed-weight contraction."""
from collections import defaultdict
from functools import cache
from itertools import permutations
from math import prod
from random import Random


def bit(mask, site):
    return mask >> site & 1


def masks(n, k):
    return [m for m in range(1 << n) if m.bit_count() == k]


def full_action(n, k, vector, entry):
    return {row: sum(entry(row, col) * weight for col, weight in vector.items())
            for row in masks(n, k)}


def cyclic_action(n, k, vector, transitions, bonds):
    holes = k > n // 2
    h = min(k, n - k)
    flip = (1 << n) - 1 if holes else 0
    result = {mask: 0 for mask in vector}
    for cut in range(n):
        for start_bond in bonds[cut]:
            state = {(word ^ flip, start_bond): weight for word, weight in vector.items() if weight}
            for step in range(n):
                i = (cut + step) % n
                boundary = (i + 1) % n
                bound = h - (boundary < cut)
                after = defaultdict(int)
                for (word, bond), value in state.items():
                    for symbol in (0, 1):
                        new_word = (word & ~(1 << i)) | (symbol << i)
                        if new_word.bit_count() > bound:
                            continue
                        for new_bond, coeff in transitions(i, symbol ^ holes, bit(word, i) ^ holes, bond):
                            after[new_word, new_bond] += value * coeff
                state = after
            for word in result:
                result[word] += state.get((word ^ flip, start_bond), 0)
    return result


def direct_entry(A, I, J):
    rows = [i for i in range(len(A)) if bit(I, i)]
    cols = [i for i in range(len(A)) if bit(J, i)]
    return sum(prod(A[i][j] for i, j in zip(rows, perm)) for perm in permutations(cols))


def split_generators(n, rank, rng):
    vec = lambda: tuple(rng.randrange(-2, 3) for _ in range(rank))
    return [(vec(), vec(), tuple(vec() for _ in range(rank))) for _ in range(n)]


def advance(v, matrix):
    return tuple(sum(x * row[j] for x, row in zip(v, matrix)) for j in range(len(v)))


def entries(gens, i, j):
    v = gens[i][0]
    for t in range(i + 1, j):
        v = advance(v, gens[t][2])
    return sum(x*y for x, y in zip(v, gens[j][1]))


def options(monomial, endpoint, hit):
    if not hit:
        return [(monomial, 1)]
    out = []
    for i, exponent in enumerate(monomial):
        if exponent and endpoint[i]:
            powers = list(monomial)
            powers[i] -= 1
            out.append((tuple(powers), exponent * endpoint[i]))
    return out


def add_linear(poly, linear):
    result = defaultdict(int)
    for powers, value in poly.items():
        for i, coeff in enumerate(linear):
            if coeff:
                dest = list(powers)
                dest[i] += 1
                result[tuple(dest)] += value * coeff
    return result


def side(monomial, gens, send, hit):
    outgoing, endpoint, transport = gens
    result = defaultdict(int)
    for base, coeff in options(monomial, endpoint, hit):
        partial = {(0,)*len(monomial): coeff}
        for i, exp in enumerate(base):
            for _ in range(exp):
                partial = add_linear(partial, transport[i])
        if send:
            partial = add_linear(partial, outgoing)
        for dest, value in partial.items():
            result[dest] += value
    return result


def example(n, rank, limit, rng):
    upper, lower = (split_generators(n, rank, rng) for _ in range(2))
    diagonal = [rng.randrange(-3, 4) for _ in range(n)]
    A = [[diagonal[i] if i == j else entries(upper, i, j) if i < j else entries(lower, j, i)
          for j in range(n)] for i in range(n)]
    zero = ((0,)*rank, (0,)*rank)

    @cache
    def transitions(i, row, col, state):
        x, y = state
        terms = [(row-a, col-b, b, a, 1) for a in range(row+1) for b in range(col+1)]
        if row and col:
            terms.append((0, 0, 0, 0, diagonal[i]))
        out = defaultdict(int)
        for sx, sy, dx, dy, scale in terms:
            left = side(x, upper[i], sx, dx)
            right = side(y, lower[i], sy, dy)
            for xl, wl in left.items():
                for yr, wr in right.items():
                    if sum(xl) <= limit and sum(yr) <= limit:
                        out[xl, yr] += scale * wl * wr
        return tuple((dest, w) for dest, w in out.items() if w and (i+1 != n or dest == zero))

    def entry(I, J):
        state = {zero: 1}
        for i in range(n):
            after = defaultdict(int)
            for s, coeff in state.items():
                for dest, w in transitions(i, bit(I, i), bit(J, i), s):
                    after[dest] += coeff * w
            state = after
        return state.get(zero, 0)

    return A, zero, transitions, entry


def main():
    rng = Random(17018)
    tensor_checks = permanent_checks = integrated = 0
    for n in range(1, 9):
        local = [[[[[rng.randrange(-2, 3) for _ in range(2)] for _ in range(2)]
                   for _ in range(2)] for _ in range(2)] for _ in range(n)]

        def transitions(i, a, b, old):
            return enumerate(local[i][a][b][old])

        def entry(I, J):
            total = 0
            for first in range(2):
                state = [int(j == first) for j in range(2)]
                for i in range(n):
                    matrix = local[i][bit(I, i)][bit(J, i)]
                    state = [sum(state[j]*matrix[j][l] for j in range(2)) for l in range(2)]
                total += state[first]
            return total

        for k in range(n+1):
            vector = {m: rng.randrange(-5, 6) for m in masks(n, k)}
            assert cyclic_action(n, k, vector, transitions, [range(2)]*n) == full_action(n, k, vector, entry)
            tensor_checks += 1
    for n, rank in [(4, 1), (5, 2), (6, 1), (7, 2)]:
        A, zero, tr, entry = example(n, rank, n, rng)
        for k in range(n+1):
            words = masks(n, k)
            for _ in range(15):
                I, J = rng.choice(words), rng.choice(words)
                assert entry(I, J) == direct_entry(A, I, J)
                permanent_checks += 1
            if n == 4:
                A, zero, tr, entry = example(n, rank, k, rng)
                bonds = [[zero]] + [[((u,), (v,)) for u in range(k+1) for v in range(k+1)]]*(n-1)
                vector = {m: rng.randrange(-5, 6) for m in words}
                assert cyclic_action(n, k, vector, tr, bonds) == full_action(n, k, vector, lambda I,J: direct_entry(A,I,J))
                integrated += 1
                A, zero, tr, entry = example(n, rank, n, rng)
    print(f'{tensor_checks} exact cyclic contractions, {permanent_checks} quasiseparable minors, {integrated} integrated actions passed')


if __name__ == '__main__':
    main()
