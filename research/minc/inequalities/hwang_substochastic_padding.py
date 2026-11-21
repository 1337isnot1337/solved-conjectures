"""Exact consistency checks for substochastic-core padding.

These checks verify the finite counting formula, not Hwang's conjecture.
"""
from fractions import Fraction as Q
from itertools import combinations, permutations
from math import factorial, prod


def per(A):
    n = len(A)
    return sum((prod(A[i][p[i]] for i in range(n))
                for p in permutations(range(n))), Q(0))


def core_completion(B,M):
    m = len(B)
    row = list(map(sum,B))
    col = [sum(B[i][j] for i in range(m)) for j in range(m)]
    q = m - sum(row)
    A = [[Q(0) for _ in range(m+M)] for _ in range(m+M)]
    for i in range(m+M):
        for j in range(m+M):
            if i<m and j<m:
                A[i][j] = B[i][j]
            elif i<m:
                A[i][j] = (1-row[i])/M
            elif j<m:
                A[i][j] = (1-col[j])/M
            else:
                A[i][j] = (M-q)/M**2
    assert all(min(r)>=0 and sum(r)==1 for r in A)
    assert all(sum(A[i][j] for i in range(m+M))==1
               for j in range(m+M))
    return A,row,col,q


def count_formula(B,M,t):
    m = len(B)
    A,row,col,q = core_completion(B,M)
    N = m+M
    a = (1-t)/N
    C = [[t*B[i][j]+a for j in range(m)] for i in range(m)]
    ell = [a+t*(1-r)/M for r in row]
    rho = [a+t*(1-c)/M for c in col]
    b = a+t*(M-q)/M**2
    total = Q(0)
    for k in range(m+1):
        h = m-k
        for S in combinations(range(m),k):
            for T in combinations(range(m),k):
                minor = [[C[i][j] for j in T] for i in S]
                total += (per(minor)*Q(factorial(M)**2,factorial(M-h))
                          *b**(M-h)
                          *prod(ell[i] for i in range(m) if i not in S)
                          *prod(rho[j] for j in range(m) if j not in T))
    radial = [[a+t*x for x in row] for row in A]
    assert total == per(radial)
    return total


def hub_formula(N,z):
    d = Q(N-1,N)
    X = 1+d*z
    alpha = d*z
    beta = z/N
    counted = ((1+alpha)**N+2*N*beta*(1+alpha)**(N-1)
               +N*beta**2*(1+alpha)**(N-1)
               +N*(N-1)*beta**2*(1+alpha)**(N-2))
    compact = X**(N-2)*((X+z)**2+d*z**3/N)
    assert counted == compact
    deleted = X**(N-1)*(X+z)
    if N==4 and z==2:
        assert compact == Q(2175,16)
        assert deleted == Q(1125,16)
        assert deleted/compact == Q(15,29)


if __name__ == "__main__":
    cores = [
        [[Q(1,2),Q(1,4)],[Q(0),Q(1,4)]],
        [[Q(1,2),Q(0),Q(1,4)],
         [Q(0),Q(1,3),Q(1,6)],
         [Q(1,4),Q(1,4),Q(0)]],
    ]
    checks = 0
    for B in cores:
        for M in [len(B),len(B)+1]:
            for t in [Q(0),Q(1,3),Q(1,2)]:
                count_formula(B,M,t)
                checks += 1
    for N in [2,4,6]:
        for z in [Q(1,2),Q(2)]:
            hub_formula(N,z)
    print(f"Exact doubly stochastic completion and full permanent count: {checks} checks.")
    print("Hub partition formulas and 15/29 vertexwise obstruction: exact.")

