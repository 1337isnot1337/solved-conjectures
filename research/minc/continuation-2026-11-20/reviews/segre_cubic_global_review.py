"""Independent exact verification for segre_cubic_global_review.md.

No imports from the inequalities worker's implementation are used.
"""

from itertools import combinations
from math import comb
import sympy as sp


def matchings(vertices):
    if not vertices:
        return [()]
    first, *rest = vertices
    out = []
    for j, second in enumerate(rest):
        for tail in matchings(rest[:j] + rest[j+1:]):
            out.append(((first, second),) + tail)
    return out


def matching_sums(q):
    n = len(q)
    out = [sp.Integer(1)]
    for k in range(1, n//2 + 1):
        total = 0
        for subset in combinations(range(n), 2*k):
            for matching in matchings(list(subset)):
                total += sp.prod(q[i][j] for i, j in matching)
        out.append(sp.expand(total))
    return out


def check_moment_identity():
    # A formally arbitrary symmetric six-by-six Gram array with diagonal one.
    # Rank restrictions are not needed for these moment identities.
    q = [[sp.Integer(int(i == j)) for j in range(6)] for i in range(6)]
    for i, j in combinations(range(6), 2):
        q[i][j] = q[j][i] = sp.Symbol(f'q{i}{j}')
    row = [sum(r) for r in q]
    L = sum(row)
    a = sum(x*x for x in row)
    b = sum(row[i]*q[i][j]*row[j] for i in range(6) for j in range(6))
    t2 = sum(q[i][j]**2 for i in range(6) for j in range(6))
    t3 = sum(q[i][j]*q[j][k]*q[k][i]
             for i in range(6) for j in range(6) for k in range(6))
    u2 = sum(q[i][j]**3 for i in range(6) for j in range(6))
    c = sum(x**3 for x in row)
    d = sum(row[i]*q[i][j]**2 for i in range(6) for j in range(6))
    _, S1, S2, S3 = matching_sums(q)
    assert sp.expand(S1 - (L-6)/2) == 0
    assert sp.expand(S2 - (L**2/8-L/2-a/2+t2/4)) == 0
    predicted = (u2/3-d+c/3+b/2-6+L/2+L**2/8+L**3/48
                 -(1+L/4)*a+(sp.Rational(3,4)+L/8)*t2-t3/6)
    assert sp.expand(S3-predicted) == 0


def check_completion():
    L, a, b, t2, t3, c, d, u = sp.symbols('L a b t2 t3 c d u')
    S1 = (L-6)/2
    S2 = L**2/8-L/2-a/2+t2/4
    S3 = (u/3-d+c/3+b/2-6+L/2+L**2/8+L**3/48
          -(1+L/4)*a+(sp.Rational(3,4)+L/8)*t2-t3/6)
    E = 195+73*S1+13*S2+3*S3
    normK = (u+sp.Rational(3,4)*L*t2+sp.Rational(3,2)*b+L**3/4
             -3*d+c-sp.Rational(3,2)*L*a)
    residual = (-42+sp.Rational(63,2)*L+2*L**2-sp.Rational(3,16)*L**3
                +(-sp.Rational(19,2)+sp.Rational(3,4)*L)*a
                +(sp.Rational(11,2)-sp.Rational(3,8)*L)*t2-t3/2)
    assert sp.expand(E-normK-residual) == 0
    traceK = (L/2-2)**2*L-2*(L/2-2)*a+b
    R = (-42+sp.Rational(339,10)*L+sp.Rational(4,5)*L**2
         -sp.Rational(3,80)*L**3+(-sp.Rational(71,10)+sp.Rational(3,20)*L)*a
         +(sp.Rational(11,2)-sp.Rational(3,8)*L)*t2-t3/2+sp.Rational(3,5)*b)
    assert sp.expand(R-sp.Rational(3,5)*traceK-residual) == 0


def bernstein(poly, variable, degree, width):
    poly = sp.expand(poly)
    return [sp.expand(sum(sp.Rational(comb(i,j),comb(degree,j))*width**j
                          *poly.coeff(variable,j) for j in range(i+1)))
            for i in range(degree+1)]


def check_bernstein():
    x, L = sp.symbols('x L')
    expected = {
        'zero': [[48,12,48], [sp.Rational(1464,5),sp.Rational(816,5),sp.Rational(204,5)],
                 [sp.Rational(4416,5),sp.Rational(4272,5),768],
                 [sp.Rational(348,5),336,480]],
        'equal': [None, [sp.Rational(1779,5),sp.Rational(1002,5),sp.Rational(612,5),sp.Rational(204,5)],
                  [sp.Rational(5136,5),885,sp.Rational(4128,5),768],
                  [sp.Rational(1473,5),sp.Rational(1476,5),384,480]]}
    for name,y,z in [('zero',sp.Integer(0),6-x),('equal',(6-x)/2,(6-x)/2)]:
        t2=x*x+y*y+z*z
        t3=x**3+y**3+z**3
        R=(-42+sp.Rational(339,10)*L+sp.Rational(4,5)*L**2-sp.Rational(3,80)*L**3
           +(-sp.Rational(71,10)+sp.Rational(3,20)*L)*L*x
           +(sp.Rational(11,2)-sp.Rational(3,8)*L)*t2-t3/2+sp.Rational(3,5)*L*x*x)
        bs=bernstein(R,L,3,36)
        for k, bk in enumerate(bs):
            if name=='equal' and k==0:
                assert sp.expand(bk-12-sp.Rational(3,8)*(12-x)*(x-2)**2)==0
                continue
            coefficients=bernstein(bk,x,sp.degree(bk,x),6)
            assert coefficients==expected[name][k]
            assert all(value>=12 for value in coefficients)
            if k>0:
                assert all(value>12 for value in coefficients)


def permanent(a):
    n=len(a)
    values=[sp.Integer(0)]*(1<<n)
    values[0]=sp.Integer(1)
    for mask in range(1,1<<n):
        i=mask.bit_count()-1
        values[mask]=sp.expand(sum(a[i][j]*values[mask^(1<<j)]
                                  for j in range(n) if mask>>j&1))
    return sp.simplify(values[-1])


def check_gram_formulas():
    I=sp.I
    cases=[[(1,0)]*6,
           [(1,0),(0,1),(1,1),(1,-1),(1,I),(1,-I)],
           [(1,2),(2,I),(1+I,1),(3,1-I),(1,-2*I),(2+I,3)]]
    for index, vectors in enumerate(cases):
        v=[tuple(map(sp.sympify,row)) for row in vectors]
        norms=[sp.expand(sp.conjugate(x)*x+sp.conjugate(y)*y) for x,y in v]
        h=sp.prod(norms)
        bloch=[]
        for (x,y), norm in zip(v,norms):
            cross=sp.conjugate(x)*y
            bloch.append([sp.simplify(2*sp.re(cross)/norm),
                          sp.simplify(2*sp.im(cross)/norm),
                          sp.simplify((sp.conjugate(x)*x-sp.conjugate(y)*y)/norm)])
        q=[[sp.expand(sum(x*y for x,y in zip(u,w))) for w in bloch] for u in bloch]
        _,S1,S2,S3=matching_sums(q)
        gram=[[sp.expand(sum(sp.conjugate(x)*y for x,y in zip(u,w))) for w in v] for u in v]
        P=permanent(gram)
        wedge=[[sp.expand(abs(v[i][0]*v[j][1]-v[i][1]*v[j][0])**2)
                for j in range(6)] for i in range(6)]
        M=6*sum(sp.prod(wedge[i][j] for i,j in pairing)
                for pairing in matchings(list(range(6))))
        assert sp.simplify(P/h-sp.Rational(3,4)*(105+35*S1+7*S2+S3))==0
        assert sp.simplify(M/h-sp.Rational(3,4)*(15-3*S1+S2-S3))==0
        assert sp.simplify(2*P-M-9*h)>=0
        if index==1:
            assert (P/h,M/h)==(15,21)


if __name__=='__main__':
    check_moment_identity()
    check_completion()
    check_bernstein()
    check_gram_formulas()
    print('Formal matching identities checked for arbitrary symmetric unit-diagonal Gram symbols.')
    print('Cubic completion and trace-bound algebra checked exactly.')
    print('Independent two-stage Bernstein certificate checked exactly.')
    print('Permanent/hafnian normalization and octahedral attainment checked on exact Gram inputs.')
