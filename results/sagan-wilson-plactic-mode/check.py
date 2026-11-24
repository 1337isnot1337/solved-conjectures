"""Exact finite witness from the hook-length and hook-content formulas."""
from math import factorial,prod

def partitions(n,hi):
    if n==0:
        yield ()
    else:
        for d in range(min(n,hi),0,-1):
            for sub in partitions(n-d,d):yield (d,)+sub

def hook_product(shape):
    return prod(row-j+sum(r>j for r in shape[i+1:])
                for i,row in enumerate(shape) for j in range(row))

def counts(n):
    out=[0]*(n+1)
    for shape in partitions(n,n):
        f=factorial(n)//hook_product(shape)
        tail=shape[1:]
        factors=[j-i for i,r in enumerate(tail) for j in range(r)]
        h=hook_product(tail)
        for m in range(1,n+1):
            out[m]+=f*(prod(m-1+c for c in factors)//h)
    return out

def binomial_coeffs(a):
    out=[]
    while a:
        out.append(a[0])
        a=[y-x for x,y in zip(a,a[1:])]
    return out

def main():
    for n in range(2,11):
        a=binomial_coeffs(counts(n))
        assert a[0]==a[-1]==0
        max_at=(n+1)//2
        if n<10:
            assert a[max_at]==max(a),n
        else:
            assert a[5]==75095 and a[6]==88704 and a[6]==max(a)
            print(a[1:-1])
    print("PASS: n=10 counterexample and exact smaller modes")

if __name__=='__main__':main()
