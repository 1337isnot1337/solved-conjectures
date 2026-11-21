"""Polynomial identities and an all-multiplicity restoration certificate."""
from fractions import Fraction as Q
from itertools import combinations, permutations
from math import prod
from verify import jerrum_graph, multiply, rook_polynomial


def add(*summands):
    size = max(len(a) for _,a in summands)
    result = [0]*size
    for scale,a in summands:
        for i,coefficient in enumerate(a):
            result[i] += scale*coefficient
    while len(result)>1 and result[-1] == 0:
        result.pop()
    return result


def deriv(p):
    return [i*p[i] for i in range(1,len(p))] or [0]


def operator(n,w):
    a = deriv(w)
    return add((n*n,w),(-1,a),(-n,[0]+a),(-1,[0]+deriv(a)))


def defect_polynomials(n,p):
    pp = deriv(p)
    d = add((n*n,multiply(p,p)),(-n,[0]+multiply(p,pp)),(-1,[0]+multiply(pp,pp)))
    c = add((1,multiply(p,pp)),(1,[0]+multiply(p,deriv(pp))),(-1,[0]+multiply(pp,pp)))
    return d,c


def powers(p,m):
    v = [1]
    for _ in range(m):
        v = multiply(v,p)
    return v


def direct_polynomial(rows):
    n = len(rows)
    total = []
    for k in range(n+1):
        total.append(sum(prod(rows[i][j] for i,j in zip(I,J))
                         for I in combinations(range(n),k) for J in permutations(range(n),k)))
    return total[::-1]


def tests():
    for rows in [[[Q(1)]], [[Q(1,4),Q(3,4)],[Q(3,4),Q(1,4)]],
                 [[Q(1,5),Q(2,5),Q(2,5)],[Q(1,5),Q(3,5),Q(1,5)],
                  [Q(3,5),Q(0),Q(2,5)]]]:
        n = len(rows)
        p = direct_polynomial(rows)
        d,c = defect_polynomials(n,p)
        for m in range(2,8):
            rhs = multiply(powers(p,m-2),add((m*m,d),(-m,c)))
            assert operator(n*m,powers(p,m)) == rhs
    for s in [Q(1,7),Q(5,4),Q(11),Q(20)]:
        x = 1/(s*(1+s))
        k2 = s*(1+s)/(x*(1+2*s))
        for eta in [Q(1,13),Q(17,3)]:
            k3 = k2*k2/s+eta
            d2 = 2*(1+2*s)*k2-2*x*k2*k2-2*x*(1+2*s)*k3
            assert d2/(2*k2)-(s-x*k2) == -x*(1+2*s)*eta/k2
    print("18 exact power identities and 8 contact substitutions")
    for f in [4,5]:
        n,edges = jerrum_graph(f=f)
        g = rook_polynomial(n,edges)
        # Positive global scale makes every coefficient integral.
        p = [g[n-j]*3**j for j in range(n+1)]
        d,c = defect_polynomials(n,p)
        assert operator(n,p)[0] < 0
        assert len(d)==2*n-1 and all(v>0 for v in d)
        assert len(c)==2*n-1 and all(2*a-b>0 for a,b in zip(d,c))
        print("length",f,"one copy fails; all powers from two pass")


if __name__ == '__main__':
    tests()
