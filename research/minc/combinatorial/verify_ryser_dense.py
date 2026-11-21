"""Exact checks for the graph comparison on dense design supports."""
from itertools import islice
from math import factorial, isqrt

from verify_ryser_complementary import design, switches
from verify_prime_identities import rook_coefficients


def transpose(X):
    return list(zip(*X))


def multiply(A,B):
    return [[sum(x*y for x,y in zip(row,col)) for col in transpose(B)] for row in A]


def invariants(H,k):
    n = len(H)
    # Integer scaling of G/k-J by nk.
    B = [[n*((row>>j)&1)-k for j in range(n)] for row in H]
    C = multiply(B,transpose(B))
    T = multiply(C,B)
    fourth = sum(v*v for row in C for v in row)
    theta = sum(x*x*y for row,other in zip(B,T) for x,y in zip(row,other))
    coeff = rook_coefficients(B)
    return fourth,theta,coeff[4],coeff[5]


def partition_bounds():
    # Number of permutations with no fixed points by number of cycles.
    counts = [[0]*65 for _ in range(65)]
    counts[0][0]=1
    for n in range(2,65):
        for p in range(1,n//2+1):
            counts[n][p]=(n-1)*(counts[n-1][p]+counts[n-2][p-1])
        for d in range(n):
            numerator=sum(counts[n][p]*counts[n][n-d-p] for p in range(n-d+1))
            assert numerator <= factorial(n)*(n+1)**(3*d+1)


def main():
    tested=0
    for n,S in [(7,(0,1,3)),(11,(1,3,4,5,9)),(13,(0,1,3,9))]:
        bare=design(n,S)
        for H in (bare,tuple(((1<<n)-1)^row for row in bare)):
            k=H[0].bit_count()
            lam=k*(k-1)//(n-1)
            ref=invariants(H,k)
            for G in islice(switches(H),3):
                E=sum(((u&v).bit_count()-lam)**2 for i,u in enumerate(G) for j,v in enumerate(G) if i!=j)
                fourth,theta,four,five=[a-b for a,b in zip(invariants(G,k),ref)]
                assert fourth==n**4*E and four*4==fourth
                assert theta==(n-2*k)*fourth
                assert five==2*(n-2*k)*fourth
                # E/4 + sqrt(E) >= k-lambda, squared only for a positive RHS.
                diff = 4*(k-lam)-E
                assert diff<=0 or diff**2<=16*E
                tested+=1
    partition_bounds()
    for m in range(1,5):
        q=1<<m
        n=q*q
        signs=[1-2*((i//q & (i%q)).bit_count()%2) for i in range(n)]
        assert sum(signs)==isqrt(n)
        assert all(sum(signs[i]*signs[i^v] for i in range(n)) == 0 for v in range(1,n))
    print(f'{tested} exact fourth/fifth-order and theta comparisons, multiplier bounds through 64 labels, four bent-function designs passed')


if __name__=='__main__':
    main()
