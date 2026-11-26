"""Exact checks of the expanded proof identities. Not needed by the proof."""
from fractions import Fraction as F
from math import factorial


def add(a, b):
    c = [F(0)] * max(len(a), len(b))
    for i, x in enumerate(a):
        c[i] += x
    for i, x in enumerate(b):
        c[i] += x
    while len(c) > 1 and c[-1] == 0:
        c.pop()
    return c


def scale(c, t):
    return [t*x for x in c]


def mul(a, b, limit=None):
    size = len(a) + len(b) - 1
    if limit is not None:
        size = min(size, limit + 1)
    c = [F(0)] * size
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            if i+j >= size:
                break
            c[i+j] += x*y
    while len(c) > 1 and c[-1] == 0:
        c.pop()
    return c


def power(p, n):
    r = [F(1)]
    for _ in range(n):
        r = mul(r, p)
    return r


def step(p, n, q):
    e = 2/(1+q)
    out = [F(0)] * (len(p)+3)
    for j, x in enumerate(p):
        a = 1+n*e+j
        multipliers = (-q*q*a, q*(n+1-a), q*(4*n-2-a), 5*n-1-a)
        for d, m in enumerate(multipliers):
            out[j+d] += m*x
    return out


def qstep(p, n, q):
    e = 2/(1+q)
    out = [F(0)] * (2*n+3)
    for j, x in enumerate(p):
        out[j] -= q*(1+n*e+j)*x
        out[j+2] += (4*n+1-n*e-j)*x
    return out


def binomial_series(alpha, N):
    c = [F(1)]
    for n in range(1, N+1):
        c.append((alpha-n+1)*c[-1]/n)
    return c


def expand_paper_composition(q, N):
    """Use the first identity in source Theorem 4.15, independently of (1)."""
    power_part = binomial_series(-q, N)
    Y = [F(0), F(1)] + [-x/(q*(q+1)) for x in power_part[2:]]
    d = binomial_series(-(q+1)/2, N)
    d[0] += q
    C = [F(1)]
    for k in range(1, N+1):
        C.append(-sum(d[j]*C[k-j] for j in range(1, k+1))/d[0])
    powers = [[F(1)]]
    for _ in range(N):
        powers.append(mul(powers[-1], Y, N))
    b = [F(1)]
    for k in range(1, N+1):
        b.append(C[k] - sum(
            b[j]*(powers[j][k] if k < len(powers[j]) else 0)
            for j in range(k)
        ))
    return [b[j]*2**j*factorial(j) for j in range(N+1)]


def variation(p):
    nonzero = [x > 0 for x in p if x]
    return sum(a != b for a, b in zip(nonzero, nonzero[1:]))


def main():
    parameters = [F(1,100), F(1,17), F(1,4), F(2,3), F(9,10), F(1),
                  F(10,9), F(3,2), F(4), F(17), F(100)]
    algebra_checks = slice_checks = 0
    for q in parameters:
        nmax = 32
        eta = (q-1)/(2*q)
        p = [F(1)]
        r = [-eta*q, F(2), eta]
        independently = expand_paper_composition(q, 12)
        for n in range(1, nmax+1):
            assert len(p) == 3*n-2 and p[-1] > 0 and p[0]
            assert variation(r) == n-(q == 1)
            for k in range(n):
                assert (-1)**(n-1-k)*r[2*k+1] > 0
            for k in range(n+1):
                assert ((r[2*k] == 0) if eta == 0
                        else (-eta)*(-1)**(n+1-k)*r[2*k] > 0)
            if n < len(independently):
                assert sum(p)/(1+q)**(n-1) == independently[n], (q,n)
                slice_checks += 1
            p1 = step(p, n, q)
            den = [q, F(1)]
            d0 = [q, F(0), F(1)]
            c = (1+q)/(2*q)
            lhs = mul(r, power(den,n+2))
            rhs = add(scale(mul(mul(power(d0,2),den),p),n+1),
                      mul([c*q*q,F(0),-c],p1))
            assert lhs == rhs, (q,n)
            algebra_checks += 1
            p, r = p1, qstep(r,n,q)
    print(f"{slice_checks} exact source-series slice comparisons and "
          f"{algebra_checks} exact pole-cancellation/differentiation and sign checks passed.")


if __name__ == "__main__":
    main()
