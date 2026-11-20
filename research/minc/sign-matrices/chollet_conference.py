"""Exact exploratory checks of Paley symmetric conference Gram matrices.

For a symmetric conference C with C*C=q I, A=sqrt(q)I+C is PSD.
All arithmetic below is in Z[sqrt(q)]. No conjecture is inferred from cases.
"""
from math import comb, factorial


def paley_conference(q):
    if q == 9:
        def sub(x,y):
            return ((x%3-y%3)%3)+3*((x//3-y//3)%3)
        def mul(x,y):
            a,b=x%3,x//3; c,d=y%3,y//3
            return ((a*c+2*b*d)%3)+3*((a*d+b*c)%3)
        def chi(x):
            if not x: return 0
            z=mul(x,x); z=mul(z,z)
            assert z in (1,2)
            return 1 if z==1 else -1
    else:
        assert q%4==1
        def sub(x,y): return (x-y)%q
        def chi(x):
            if not x: return 0
            z=pow(x,(q-1)//2,q)
            assert z in (1,q-1)
            return 1 if z==1 else -1
    c=[[0]+[1]*q]+[[1]+[chi(sub(i,j)) for j in range(q)] for i in range(q)]
    n=q+1
    assert all(sum(c[i][k]*c[k][j] for k in range(n))==q*(i==j)
               for i in range(n) for j in range(n))
    return c


def permanent_sqrt_identity_plus(c,q):
    n=len(c); a=[0]*(1<<n); b=[0]*(1<<n); a[0]=1
    for mask in range(1,1<<n):
        i=mask.bit_count()-1; rem=mask; aa=bb=0
        while rem:
            bit=rem&-rem; j=bit.bit_length()-1; old=mask^bit
            if i==j:
                aa+=q*b[old]; bb+=a[old]
            else:
                aa+=c[i][j]*a[old]; bb+=c[i][j]*b[old]
            rem^=bit
        a[mask]=aa; b[mask]=bb
    return a[-1],b[-1]


if __name__=="__main__":
    for q in (5,9,13,17):
        c=paley_conference(q); n=q+1
        a,b=permanent_sqrt_identity_plus(c,q)
        r=sum(comb(n,k)*factorial(k)*(q-1)**(n-k) for k in range(n+1))
        assert b==0
        print(f"n={n} rank={n//2} per_A={a} per_abs2={r} gap={a*a-r} ratio={r/(a*a):.15g}",flush=True)
