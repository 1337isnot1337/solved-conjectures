"""Exact checks for the nonsplit-torus congruence in the second Paley construction."""
from itertools import permutations
from math import isqrt, prod


def double(c):
    n = len(c)
    return [[c[i % n][j % n] * (-1 if i >= n and j >= n else 1)
             + (i % n == j % n) * (1 if i < n and j < n else -1)
             for j in range(2*n)] for i in range(2*n)]


def ryser_signs(matrix):
    n = len(matrix)
    masks = [sum((v == 1) << j for j, v in enumerate(row)) for row in matrix]
    result = 0
    for mask in range(1 << n):
        size = mask.bit_count()
        term = prod(2*(mask & row).bit_count()-size for row in masks)
        result += -term if (n-size) % 2 else term
    return result


def paley_nine():
    # Elements a+b*i modulo 3, with i^2=-1.
    field = [(a,b) for a in range(3) for b in range(3)]
    squares = {((a*a-b*b) % 3, 2*a*b % 3) for a,b in field if (a,b) != (0,0)}
    conference = [[0]+[1]*9]
    for x,y in field:
        row = [1]
        for u,v in field:
            delta = (u-x) % 3, (v-y) % 3
            row.append(0 if delta == (0,0) else 1 if delta in squares else -1)
        conference.append(row)
    return double(conference)


def main():
    # Both polynomials have degree at most four in each variable.
    for a in range(5):
        for b in range(5):
            matrix = double([[a,b],[b,-a]])
            direct = sum(prod(matrix[i][j] for i,j in enumerate(order))
                         for order in permutations(range(4)))
            assert direct == 8*(a*a*b*b-2*a*a+b*b)
    matrix = paley_nine()
    for i,row in enumerate(matrix):
        for j,other in enumerate(matrix):
            assert sum(x*y for x,y in zip(row,other)) == 20*(i == j)
    full = ryser_signs(matrix)
    assert full % 5 == (-8) % 5
    q = 3**16
    ell = (q+1)//2
    assert ell == 21_523_361 and all(ell % k for k in range(2,isqrt(ell)+1))
    assert 2*(q+1) == 86_093_444 and bin(2*(q+1))[2:].count('0') == 16
    print(f'Quartic verified. Order 20 permanent {full}, residue {full % 5} mod 5.')
    print(f'Order {2*(q+1)} certified residue {-8 % ell} mod {ell}.')


if __name__ == '__main__':
    main()
