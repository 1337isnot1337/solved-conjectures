"""Exact small-order marked terms and large-order color probabilities."""
from fractions import Fraction as Q
from math import comb, factorial, prod


def v2(q):
    q=Q(q)
    if not q:
        return float('inf')
    def integer(z):
        return (z&-z).bit_length()-1
    return integer(q.numerator)-integer(q.denominator)


def low_terms(n):
    m,h=n//2,n//4
    one=same=different=0
    for a in range(1,m+1):
        one+=2**a*comb(m,a)*factorial(n-a)*factorial(a-1)
        for c in range(1,m+1):
            common=comb(m,a)*comb(m-a,c) if a+c<=m else 0
            other=sum(comb(h,j)*comb(h,a-j)*comb(m-j,c)
                      for j in range(max(0,a-h),min(h,a)+1))
            wt=2**(a+c)*factorial(n-a-c)*factorial(a-1)*factorial(c-1)
            same+=wt*common
            different+=wt*other
    return [Q(v,factorial(n)) for v in (one,same,different)]


def falling(v,k):
    return prod(v-i for i in range(k))


if __name__=='__main__':
    for n in range(4,69,4):
        a,b,c=low_terms(n)
        correction=-(n-1)*a+Q(n-1,2)*(b+(n-2)*c)
        assert v2(correction)>=1
        assert a==sum(Q(1,j) for j in range(1,n,2))

    cases=0
    for odd in (1,3,15,41):
        n=odd*2**108
        d=n.bit_length()-1
        K=16*(d+1)
        assert v2(n)>=10+4*(K-1).bit_length()
        assert 3*(107-(108).bit_length()+1)>=d
        for g in (2,4):
            M=n//g
            for length in (1,4,9,36,177):
                assert v2(Q(falling(M,length),falling(n,length))-Q(1,g))>=3
                for shape in [(length,1),(length,3)]+([(length,2,3,4)] if g==4 else []):
                    prob=Q(prod(falling(M,l) for l in shape),falling(n,sum(shape)))
                    assert v2(prob)>=3
                    cases+=1
            assert v2(Q(2**(K+1),(K+1)**2))>3*(d+1)+3
        assert v2(sum(Q(2**l,l) for l in range(1,K+1)))>=5
    print("17 exact low-order sums;",cases,"mixed-color probabilities at large orders")
