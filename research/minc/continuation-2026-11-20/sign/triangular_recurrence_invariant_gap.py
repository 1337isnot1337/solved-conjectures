"""Exact checks for triangular_recurrence_invariant_gap.md.

No new order of Wang's problem or universal induction is claimed.
"""

from itertools import product

from bordered_partition_checks import border, column_replacements
from p7_skeleton_lifts_checks import determinant, permanent


SEED = [
    [1,0,0,0,0,0,0,0],
    [1,1,0,0,0,0,0,0],
    [1,1,1,0,0,0,0,0],
    [1,1,0,1,0,0,0,0],
    [1,0,1,0,1,0,0,0],
    [1,0,1,1,0,1,0,0],
    [0,1,1,1,0,0,1,0],
    [1,1,0,1,0,0,1,1],
]


def check_seed():
    a = border(SEED)
    assert permanent(a) == determinant(a) == 256
    replacements = [permanent([[1 if k == j else x for k,x in enumerate(row)]
                               for row in a]) for j in range(1,9)]
    reduced = [8,22,68,14,0,5,-11,8]
    assert replacements == [64*x for x in reduced]
    assert all(abs(sum(c*w for c,w in zip(reduced, signs))) != 8
               for signs in product((-1,1), repeat=8))

    # Check each implication in the short modular proof independently.
    for a,b,c,d,f,g,h in product((-1,1), repeat=7):
        value = 8*a+22*b+68*c+14*d+5*f-11*g+8*h
        if value % 4 == 0:
            assert g == -f
            if value % 16 == 8:
                assert b == c == d
                assert abs(value) >= 72

    # Published admissibility certificate for the next order.
    offsets = {1,2,3,4,5,8,9}
    known = [[-1 if j-i in offsets else 1 for j in range(10)] for i in range(10)]
    assert abs(permanent(known)) == abs(determinant(known)) == 512


def append(b, signs):
    return [row+[0] for row in b]+[[(1-x)//2 for x in signs]+[1]]


def check_two_step_identity():
    b = [[1,0,0], [1,1,0], [0,1,1]]
    a = border(b)
    coefficients = column_replacements(a)
    P = coefficients[0]
    n = len(b)
    single = [coefficients[1<<j] for j in range(n)]
    pair = {(j,k):coefficients[(1<<j)|(1<<k)]
            for j in range(n) for k in range(j+1,n)}
    for w in product((-1,1), repeat=n):
        for u in product((-1,1), repeat=n):
            for epsilon in (-1,1):
                enlarged = border(append(append(b,w), u+(epsilon,)))
                direct = permanent(enlarged)
                formula = (2*epsilon*P
                           +sum((u[j]+epsilon*w[j])*single[j] for j in range(n))
                           +sum((u[j]*w[k]+u[k]*w[j])*value for (j,k),value in pair.items()))
                assert direct == formula
                assert determinant(enlarged) == 4*determinant(a)
                S = {j for j in range(n) if u[j] == epsilon*w[j]}
                T = set(range(n))-S
                split = (P+sum(w[j]*single[j] for j in S)
                         +sum(w[j]*w[k]*value for (j,k),value in pair.items() if j in S and k in S)
                         -sum(w[j]*w[k]*value for (j,k),value in pair.items() if j in T and k in T))
                assert direct == 2*epsilon*split
    assert sum((-1)**mask.bit_count()*value
               for mask,value in enumerate(coefficients)) == (-2)**n


if __name__ == '__main__':
    check_seed()
    check_two_step_identity()
    print('Unextendable order-nine seed, eight replacement values, and modular obstruction checked.')
    print('Published order-ten admissibility certificate checked independently.')
    print('Two-step and split-quadratic identities checked against direct permanents.')
    print('Replacement-polynomial corner identity checked exactly.')
