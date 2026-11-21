"""Independent deletion-permanent and mod-nine checks for Wang's problem."""
from random import Random

from wang_hadamard_characteristic_three import (
    eye, multiply, permanent, reflection, transpose,
)


def orthogonal(n, rng):
    matrix = eye(n)
    for _ in range(2*n):
        vector = [rng.randrange(3) for _ in range(n)]
        if sum(v*v for v in vector) % 3:
            matrix = multiply(matrix, reflection(vector))
    return matrix


def anti(n, rng):
    blocks = [[0]*n for _ in range(n)]
    for k in range(0, n, 2):
        blocks[k][k:k+2] = [1, 1]
        blocks[k+1][k:k+2] = [1, 2]
    return multiply(orthogonal(n, rng), blocks)


def check(matrix, expected_square, rng):
    n = len(matrix)
    p = permanent(matrix)
    assert p*p % 3 == expected_square
    for i in range(n):
        for j in range(n):
            minor = [row[:j] + row[j+1:] for k, row in enumerate(matrix) if k != i]
            assert permanent(minor) == p*matrix[i][j] % 3
    lift = [[rng.randrange(-4, 5) for _ in range(n)] for _ in range(n)]
    changed = [[a+3*x for a, x in zip(row, delta)] for row, delta in zip(matrix, lift)]
    derivative = sum(a*x for row, delta in zip(matrix,lift) for a,x in zip(row,delta))
    assert permanent(changed, 9) == permanent(matrix, 9)*(1+3*derivative) % 9
    return n*n


def main():
    rng = Random(314164)
    examples = [(orthogonal(n, rng), 1) for n in range(2, 9) for _ in range(8)]
    examples.extend((anti(n, rng), 0) for n in (4, 6, 8) for _ in range(8))
    for r in (4, 6):
        left = transpose([row+a for row, a in zip(eye(r), anti(r, rng))])
        right = [row+b for row, b in zip(eye(r), anti(r, rng))]
        examples.append((multiply(left, right), 0))
        right[-1] = [0]*(2*r)
        examples.append((multiply(left, right), 0))

    for n in (4, 8):
        walsh = [[(-1)**((i & j).bit_count()) for j in range(n)] for i in range(n)]
        examples.append((walsh, int(n % 3 == 1)))
    q = 11
    squares = {x*x % q for x in range(1, q)}
    paley = [[1]*(q+1)] + [[1] + [1 if (j-i) % q in squares else -1
                                     for j in range(q)] for i in range(q)]
    assert all(sum(a*b for a,b in zip(row, col)) == 12*int(i == j)
               for i,row in enumerate(paley) for j,col in enumerate(paley))
    examples.append((paley, 0))
    total = sum(check(a, unit, rng) for a, unit in examples)
    print(f"{len(examples)} full permanents and lifts, {total} deletion permanents")


if __name__ == "__main__":
    main()
