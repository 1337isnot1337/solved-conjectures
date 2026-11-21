#!/usr/bin/env python3
"""Independent polynomial certificate for six bracket coordinates.

This checks a classical Segre-cubic identity and normalization. It does not
prove permanental dominance or claim surjectivity onto the cubic.
"""

from collections import defaultdict
from itertools import combinations


def matchings(vertices):
    if not vertices:
        yield ()
        return
    first = vertices[0]
    for second in vertices[1:]:
        for rest in matchings(tuple(x for x in vertices[1:] if x != second)):
            yield ((first, second),) + rest


def pfaffian_sign(matching):
    flat = sum(matching, ())
    return (-1) ** sum(flat[i] > flat[j] for i in range(6) for j in range(i + 1, 6))


def multiply(a, b):
    # Each variable exponent remains at most three. Base-four encoding
    # therefore turns multiplication of monomials into integer addition.
    out = defaultdict(int)
    for i, x in a.items():
        for j, y in b.items():
            out[i + j] += x * y
    return {i: x for i, x in out.items() if x}


def main():
    all_matchings = list(matchings(tuple(range(6))))
    assert len(all_matchings) == 15
    factorizations = [f for f in combinations(range(15), 5)
                      if len({edge for j in f for edge in all_matchings[j]}) == 15]
    assert len(factorizations) == 6
    polynomials = []
    for f in factorizations:
        out = defaultdict(int)
        for j in f:
            p = {0: pfaffian_sign(all_matchings[j])}
            for a, b in all_matchings[j]:
                # [a,b]=z_b-z_a when the spinors are (1,z_i).
                p = multiply(p, {4 ** a: -1, 4 ** b: 1})
            for monomial, coefficient in p.items():
                out[monomial] += coefficient
        polynomials.append({k: v for k, v in out.items() if v})
    assert all(len(p) == 20 and set(p.values()) == {-2, 2} for p in polynomials)
    monomials = set().union(*(set(p) for p in polynomials))
    assert all(sum(p.get(k, 0) for p in polynomials) == 0 for k in monomials)
    cube = defaultdict(int)
    for p in polynomials:
        for k, v in multiply(multiply(p, p), p).items():
            cube[k] += v
    assert not any(cube.values())
    gram = [[sum(p.get(k, 0) * q.get(k, 0) for k in monomials)
             for q in polynomials] for p in polynomials]
    assert all(gram[i][j] == (80 if i == j else -16)
               for i in range(6) for j in range(6))
    print('Six 1-factorization bracket polynomials constructed from all 15 perfect matchings.')
    print('Each polynomial has 20 squarefree cubic coefficients, all plus or minus two.')
    print('Sum F_i=0 and sum F_i^3=0 verified as exact polynomial identities.')
    print('Tensor coefficient Gram matrix: diagonal80, offdiagonal−16.')
    print('Thus p_i=F_i/2 has coefficient norm²20 and offdiagonal inner products−4.')


if __name__ == '__main__':
    main()
