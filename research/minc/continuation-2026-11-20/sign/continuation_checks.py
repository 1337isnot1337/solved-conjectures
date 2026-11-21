"""Exact checks for construction obstructions; no new MINC case claimed."""
from itertools import product
from binary_kernels import determinant, permanent
from triangular_one_row import cofactors_top


def main():
    p = cofactors_top(10)
    assert p == [7936,7936,7936,6848,4672,1664,-1664,-4672,-6848,-7936]
    values = {124*a + 107*b + 73*c + 26*d for a,b,c,d in product((-1,0,1), repeat=4)}
    assert not ({-4,4} & values)
    a = [[1,-1,1,-1],[-1,1,1,1],[1,1,1,-1],[1,1,-1,1]]
    assert determinant(a) == -8
    assert permanent(a) == 4
    for row in a[1:]:
        assert sum(x != y for x,y in zip(a[0],row)) % 2 == 1
        assert permanent([a[0],a[0],row,row]) == 0
    b = [[a[i%4][j%4]*(-1 if i>=4 and j>=4 else 1) for j in range(8)] for i in range(8)]
    assert determinant(b) == 1024
    assert permanent(b) == 0
    print("Exact triangular-family and H2-doubling obstruction checks passed.")


if __name__ == "__main__":
    main()
