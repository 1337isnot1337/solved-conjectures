"""Rational checks for the two ranges of the weighted half-chord bound."""
from fractions import Fraction as F
from math import factorial, isqrt, prod


def logs(x):
    h = (x-1)/(x+1)
    val = 2*sum(h**(2*j+1)/(2*j+1) for j in range(48))
    err = 2*abs(h)**97/(97*(1-h*h))
    return val-err,val+err


def exp_lower(x):
    assert x >= 0
    return sum(x**j/factorial(j) for j in range(35))


def sqrt_lower(x):
    return F(isqrt((x.numerator*10**16)//x.denominator),10**8)


def constants():
    a,z = F(7,5),F(89,100)
    assert a*z*z/2-z+logs(a)[0] > 0
    assert (F(12,7)-z)*exp_lower(z) > 2
    # A lower bound for sqrt(2) inside the logarithm and an upper bound in the numerator.
    r = sqrt_lower(F(2))
    assert (r+F(1,10**8))/logs(1+r)[0] < F(161,100)
    s = F(566,1000)
    assert (1-s)**2/s < F(1,3)
    g = (1/sqrt_lower(1-a*s*s)+1/sqrt_lower(1-a*F(161,100)*s*s))/2
    assert g < exp_lower(F(49,100))
    q = F(2,9)
    lo,hi = F(78749,10**5), F(78751,10**5)
    assert lo**2+(1-q)*lo**3 < 1 < hi**2+(1-q)*hi**3
    assert 1+(1-q)*logs(1-q)[0]/q > F(1203,10000)
    assert 2-1/hi-logs(2*lo)[0]-(1-q)*(lo-logs(1+hi)[1]) < F(1153,10000)


def matching_weights(A):
    layers = {0:F(1)}
    for row in A:
        new = layers.copy()
        for mask,weight in layers.items():
            for j,a in enumerate(row):
                if not mask >> j & 1:
                    dest = mask | (1 << j)
                    new[dest] = new.get(dest,0)+a*weight
        layers = new
    return [sum(w for m,w in layers.items() if m.bit_count() == k) for k in range(len(A)+1)]


def main():
    constants()
    tests=0
    for n in range(2,10):
        for weights in ((1,3,2), (0,0,1), (2,3,9,1)):
            A=[[sum(F(w,sum(weights)) for t,w in enumerate(weights) if (i+t)%n==j)
                for j in range(n)] for i in range(n)]
            q=sum(x*x for row in A for x in row)/n
            coeff=matching_weights(A)
            for z in (F(1,4),F(1),F(3),F(20)):
                terms=[v*z**i for i,v in enumerate(coeff)]
                unmatched=sum(v*(n-i) for i,v in enumerate(terms))/(n*sum(terms))
                assert unmatched >= (1+2*z)/(1+3*z+(1+q)*z*z)
                p=z/(1+z)
                probability=sum(terms)/(1+z)**n
                cols=zip(*A)
                h=prod(prod(1-p*x for x in col)*(1+sum(p*x/(1-p*x) for x in col)) for col in cols)
                assert probability<=h
                tests+=1
    print(f'{tests} rational cavity and column-collision comparisons and all analytic constant checks passed')


if __name__ == '__main__':
    main()
