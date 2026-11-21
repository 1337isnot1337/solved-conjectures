"""Exact finite diagnostics for McCrea's conjecture.

Enumerate profile words independently, compare both marked statistics
with the source formulas and positive large-power rewrites, and check
the saddlepoint means at q=1/2. The all-density proof is in PROOF.md.
"""

from collections import Counter
from fractions import Fraction as F

N = 13


def monomial(k, c=1):
    a = [0] * (N + 1)
    if k <= N:
        a[k] = c
    return a


ONE = monomial(0)
Q = monomial(1)


def add(a, b):
    return [x+y for x, y in zip(a, b)]


def sub(a, b):
    return [x-y for x, y in zip(a, b)]


def mul(a, b):
    return [sum(a[j]*b[i-j] for j in range(i+1)) for i in range(N+1)]


def power(a, n):
    result = ONE[:]
    for _ in range(n):
        result = mul(result, a)
    return result


def inverse(a):
    assert a[0] == 1
    b = [1]
    for n in range(1, N+1):
        b.append(-sum(a[j]*b[n-j] for j in range(1, n+1)))
    return b


def profiles(n, k):
    d, o = Counter(), Counter()
    for cuts in range(1 << (n-1)):
        lengths = []
        last = 0
        for i in range(1, n):
            if cuts & (1 << (i-1)):
                lengths.append(i-last)
                last = i
        lengths.append(n-last)
        # An interior block EN^m has size m+1. The final block has
        # one further N of weight one in the source's perimeter encoding.
        multiplicities = [v-1 for v in lengths]
        multiplicities[-1] += 1
        jd = sum(v >= k for v in multiplicities)
        jo = sum(i % k == 0 and v > 0 for i, v in enumerate(multiplicities, 1))
        d[jd] += 1
        o[jo] += 1
    assert sum(d.values()) == sum(o.values()) == 2**(n-1)
    return d, o


def main():
    checks = 0
    for k in range(2, 8):
        S = [int(1 <= i <= k) for i in range(N+1)]
        R = inverse(sub(ONE, S))
        L = inverse(sub(ONE, Q))
        H = mul(sub(ONE, Q), sub(ONE, S))
        invH = inverse(H)
        FD = mul(monomial(k+1), invH)
        AD = mul(monomial(k), power(R, 2))
        W = mul(Q, L)
        U = [0]*(N+1)
        for i in range(1, k):
            U = add(U, power(W, i))
        V = power(W, k)
        T = mul(Q, V)
        K = sub(ONE, mul(V, sub(ONE, Q)))
        invK = inverse(K)
        FO = mul(T, invK)
        AO = add(mul(mul(U,T), power(invK,2)), mul(V,invK))
        assert min(FD) >= 0 and min(AD) >= 0 and min(FO) >= 0 and min(AO) >= 0
        ds = [mul(mul(Q, sub(ONE, monomial(k-1))), invH)]
        os = [mul(U, invK)]
        for j in range(1, N+1):
            dj = mul(AD, power(FD,j-1))
            oj = mul(AO, power(FO,j-1))
            source_d = mul(mul(monomial((k+1)*j-1),power(sub(ONE,Q),2)),power(invH,j+1))
            source_o = add(mul(mul(U,power(T,j)),power(invK,j+1)),
                           mul(mul(V,power(T,j-1)),power(invK,j)))
            assert dj == source_d and oj == source_o
            ds.append(dj); os.append(oj)
        for n in range(1,N+1):
            d,o = profiles(n,k)
            for j in range(N+1):
                assert ds[j][n] == d[j]
                assert os[j][n] == o[j]
                checks += 2
        # Independent exact differentiation at q=1/2.
        q=F(1,2)
        h=1-2*q+q**(k+1)
        hp=-2+(k+1)*q**k
        assert q**(k+1)/h == 1
        assert k+1-q*hp/h == 2**(k+1)
        w=q/(1-q); wp=1/(1-q)**2
        v=w**k; vp=k*w**(k-1)*wp
        t=q*v; tp=v+q*vp
        kk=1-v*(1-q); kp=-vp*(1-q)+v
        assert t/kk == 1
        assert q*(tp/t-kp/kk) == 4*k
    print(f'Passed {checks} exact profile-count comparisons, source/rewrite '
          'identities, positivity checks, and both saddlepoint means for k=2..7.')


if __name__ == '__main__':
    main()
