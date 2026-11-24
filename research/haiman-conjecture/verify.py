"""Check the annular trace identity over Z[v, v^-1] for all diagrams through n=8."""

from collections import Counter, deque
from math import comb


def generator(n, i):
    matching = [*range(n, 2 * n), *range(n)]
    for shift in (0, n):
        matching[shift + i] = shift + i + 1
        matching[shift + i + 1] = shift + i
    return tuple(matching)


def glue(n, upper, lower):
    """Multiply matchings and discard components that are wholly internal."""
    result = [-1] * (2 * n)
    for s in range(2 * n):
        if result[s] >= 0:
            continue
        p = s if s < n else s + n
        if p < n:
            p = upper[p]
            use_upper = False
        else:
            p = n + lower[p - n]
            use_upper = True
        while n <= p < 2 * n:
            p = upper[p] if use_upper else n + lower[p - n]
            use_upper = not use_upper
        t = p if p < n else p - n
        result[s], result[t] = t, s
    return tuple(result)


def diagrams(n):
    identity = tuple([*range(n, 2 * n), *range(n)])
    words = {identity: ()}
    queue = deque([identity])
    generators = [generator(n, i) for i in range(n - 1)]
    while queue:
        diagram = queue.popleft()
        for i, elementary in enumerate(generators):
            product = glue(n, diagram, elementary)
            if product not in words:
                words[product] = (*words[diagram], i)
                queue.append(product)
    assert len(words) == comb(2 * n, n) // (n + 1)
    return words


def closed_components(n, matching):
    visited = set()
    contractible = essential = 0
    for start in range(2 * n):
        if start in visited:
            continue
        p, winding = start, 0
        while p not in visited:
            up_to_seam = matching[p]
            visited.update((p, up_to_seam))
            winding += 1 if up_to_seam < n else -1
            p = (up_to_seam + n) % (2 * n)
        assert p == start and abs(winding) <= 1
        essential += abs(winding)
        contractible += winding == 0
    return contractible, essential


def matrix_trace(n, word):
    """Apply the spin matrices, storing (spin word, v-exponent) coefficients."""
    trace = Counter()
    for initial in range(1 << n):
        states = {(initial, 0): 1}
        for i in word:
            following = Counter()
            for (state, exponent), coefficient in states.items():
                pair = (state >> i) & 3
                if pair in (1, 2):
                    shift = 1 if pair == 2 else -1
                    following[state, exponent + shift] += coefficient
                    following[state ^ (3 << i), exponent] += coefficient
            states = following
            if not states:
                break
        for (state, exponent), coefficient in states.items():
            if state == initial:
                trace[state.bit_count(), exponent] += coefficient
    return trace


def check(n, diagram, word, internal=0):
    c, r = closed_components(n, diagram)
    a, remainder = divmod(n - r, 2)
    assert remainder == 0
    c += internal
    expected = {
        (a + j, c - 2 * k): comb(r, j) * comb(c, k)
        for j in range(r + 1)
        for k in range(c + 1)
    }
    assert matrix_trace(n, word) == expected, (n, diagram, word)
    return a, c


def main():
    total = 0
    for n in range(1, 9):
        words = diagrams(n)
        for diagram, word in words.items():
            check(n, diagram, word)
        total += len(words)
        print(f"n={n}: {len(words)} diagrams")

    elementary = generator(2, 0)
    assert check(2, elementary, (0, 0), internal=1) == (1, 2)

    # 3412 = s2 s1 s3 s2. The resulting c_(2,2),3412(q) is q(1+q)^2.
    diamond = (1, 0, 2, 1)
    diagram = generator(4, diamond[0])
    for i in diamond[1:]:
        diagram = glue(4, diagram, generator(4, i))
    assert check(4, diagram, diamond) == (2, 2)
    print(f"{total} basis diagrams and 2 explicit word checks passed.")


if __name__ == "__main__":
    main()
