"""Exact degree, crossing, and occupancy checks for the integer-density transition."""
from fractions import Fraction
from itertools import combinations, permutations
from math import factorial, prod


def circular(rows, degree):
    return [[int((j-i) % rows < degree) for j in range(rows)] for i in range(rows)]


def residual(t, s, k):
    small = (2*k-t*s)//2
    large = 2*k-t*s-small
    degree = k-small
    cross = circular(large,degree)[:small]
    return ([[1]*small + line for line in cross] +
            [[cross[i][j] for i in range(small)] +
             [int(j != l or large == small or sum(cross[i][j] for i in range(small)) < degree)
              for l in range(large)] for j in range(large)])


def rook_counts(A):
    rows, cols = len(A), len(A[0])
    result = [0]*(min(rows,cols)+1)
    for k in range(len(result)):
        for I in combinations(range(rows), k):
            for J in permutations(range(cols), k):
                result[k] += prod(A[i][j] for i,j in zip(I,J))
    return result


def permanent(A):
    counts = {0: 1}
    for row in A:
        nxt = {}
        for mask,value in counts.items():
            for j,edge in enumerate(row):
                if edge and not mask & (1<<j):
                    key = mask | (1<<j)
                    nxt[key] = nxt.get(key,0) + value
        counts = nxt
    return counts[(1<<len(A))-1]


def main():
    checked = 0
    for t in range(3,10):
        for s in range(1,6):
            for k in [t*s+1,t*s+3]:
                A = residual(t,s,k)
                u = len(A)//2
                assert all(sum(row)==k for row in A)
                assert all(sum(col)==k for col in zip(*A))
                assert sum(sum(row[u:]) for row in A[:u]) == u*((t*s+1)//2)
                checked += 1
    # For complete within-class blocks, condition exactly on the two equal
    # cross counts; compare the matching expansion against subset DP.
    identities = 0
    for m in range(2,8):
        for s in range(1,min(m,3)+1):
            cross = circular(m,s)
            A = [[1]*m + row for row in cross] + [row+[1]*m for row in cross]
            r = rook_counts(cross)
            assert sum(v*v*factorial(m-j)**2 for j,v in enumerate(r)) == permanent(A)
            identities += 1
    # Rigorous rational series checks for the short Bessel comparison.
    partial = sum(Fraction(1,factorial(j)**2) for j in range(6))
    assert partial + Fraction(1,factorial(6)**2)*Fraction(49,48) < Fraction(23,10)
    assert sum(Fraction(4**j,factorial(j)**2) for j in range(6)) > 11
    assert sum(Fraction(2**j,factorial(j)) for j in range(6)) > 7
    e4sum = sum(Fraction(4**j,factorial(j)) for j in range(20))
    assert e4sum + Fraction(4**20,factorial(20))*Fraction(21,17) < 55
    print(f'{checked} residual graphs, {identities} exact two-class permanents, four rational series bounds passed')


if __name__ == '__main__':
    main()
