"""Exact diagnostic for the published BCEL projective matroid family.

This computes flag numbers from BCEL26 Proposition 4.16, then the dual
Chow gamma coefficients from CFH26 Theorem 4.9. It is not a proof of the
whole conjecture. No network or formal-verification dependencies.
"""
from functools import lru_cache
from math import comb
import sympy as sp


def gaussian(n, k, q):
    if k < 0 or k > n:
        return 0
    value = 1
    for i in range(k):
        value = value * (q ** (n-i) - 1) // (q ** (i+1) - 1)
    return value


def projective_flags(q, n):
    @lru_cache(None)
    def alpha(d, b, ranks):
        if not ranks:
            return 1
        s = ranks[-1]
        return sum(gaussian(d,a,q) * comb(b,s-a)
                   * alpha(a,s-a,ranks[:-1])
                   for a in range(max(0,s-b),min(d,s)+1))
    c = q**6 * comb(n,4)
    flags = {}
    for mask in range(64):
        ranks = tuple(i+1 for i in range(6) if mask >> i & 1)
        value = alpha(6,n,ranks)
        if mask >> 5 & 1:
            value += c * (alpha(3,4,ranks[:-1]) - alpha(3,4,ranks))
        flags[mask] = value
    return flags


def gamma_coefficients(flags, rank, augmented=False):
    def beta(mask):
        out = 0
        sub = mask
        while True:
            out += (-1)**(mask.bit_count()-sub.bit_count())*flags[sub]
            if not sub:
                return out
            sub = (sub-1)&mask
    full = (1 << (rank-1))-1
    gamma = [0]*((rank if augmented else rank-1)//2+1)
    for stable in range(1 << (rank-1 if augmented else rank-2)):
        if stable & (stable << 1):
            continue
        gamma[stable.bit_count()] += beta(full ^ stable)
    return gamma


def polynomial_from_gamma(gamma, degree):
    x = sp.Symbol('x')
    return sp.Poly(sum(a*x**i*(1+x)**(degree-2*i)
                       for i,a in enumerate(gamma)),x)


def affine_flags(q, packing=False):
    m = q*q+q+1 if packing else (q*q+1)//2
    n1=q**4
    n2=q**3*(q**3+q*q+q+1)
    n3=q*q*(q*q+1)*(q*q+q+1)
    b2=comb(m,2)
    b3=comb(m,3)
    return {0:1,1:n1+m,2:n2+n1*m+b2,4:n3+n1*b2+b3,
            3:q*n2+2*n1*m+2*b2,
            5:q*q*n3+m*q*q*(q*q+1)+3*n1*b2+3*b3,
            6:(q*q+q)*n3+m*q**4*(q*q+1)+3*n1*b2+3*b3,
            7:q*(q*q+q)*n3+2*m*q**4*(q*q+1)+6*n1*b2+6*b3}


def affine_negative_zeta_certificate():
    """Certify that this amplification route fails for the whole affine family.

    The shift is polynomial algebra over QQ, not a finite grid test.
    It proves u_(m+1)^2 > u_m*u_(m+2) for every q>=3 and m>=1.
    """
    q,m=sp.symbols('q m')
    n1=q**4
    n2=q**3*(q**3+q*q+q+1)
    n3=q*q*(q*q+1)*(q*q+q+1)
    a=(q*q+1)/2
    b2=a*(a-1)/2
    b3=a*(a-1)*(a-2)/6
    f={0:1,1:n1+a,2:n2+n1*a+b2,4:n3+n1*b2+b3,
       3:q*n2+2*n1*a+2*b2,
       5:q*q*n3+a*q*q*(q*q+1)+3*n1*b2+3*b3,
       6:(q*q+q)*n3+a*q**4*(q*q+1)+3*n1*b2+3*b3,
       7:q*(q*q+q)*n3+2*a*q**4*(q*q+1)+6*n1*b2+6*b3}
    c=[sum(v for mask,v in f.items() if mask.bit_count()==i)
       for i in range(4)]
    u=-m+c[1]*m*(m+1)/2-c[2]*m*(m+1)*(m+2)/6 \
       +c[3]*m*(m+1)*(m+2)*(m+3)/24
    defect=sp.expand(u.subs(m,m+1)**2-u*u.subs(m,m+2))
    certificate=sp.Poly(sp.expand(defect.subs({q:q+3,m:m+1})),q,m)
    assert len(certificate.terms())==133
    assert all(c>0 for c in certificate.coeffs())
    assert certificate.coeff_monomial(1)>0
    return certificate


def truncated_product_flags(factors, rank):
    """Flag vector of a rank-r truncation from factor flag vectors/ranks."""
    from itertools import product
    ranks=[r for f,r in factors]
    levels=list(product(*(range(r+1) for r in ranks)))
    by_total={s:[a for a in levels if sum(a)==s] for s in range(rank)}
    flags={0:1}
    for mask in range(1,1 << (rank-1)):
        desired=[s for s in range(1,rank) if mask>>(s-1)&1]
        def count(pos,previous,masks):
            if pos==len(desired):
                value=1
                for (f,r),m in zip(factors,masks):
                    value*=f[m]
                return value
            out=0
            for current in by_total[desired[pos]]:
                if any(a<b for a,b in zip(current,previous)):
                    continue
                updated=tuple(m|(1 << (a-1) if 0<a<r else 0)
                              for m,a,r in zip(masks,current,ranks))
                out+=count(pos+1,current,updated)
            return out
        flags[mask]=count(0,(0,)*len(factors),(0,)*len(factors))
    return flags


if __name__ == '__main__':
    certificate=affine_negative_zeta_certificate()
    print('Affine negative-zeta defect: 133 positive shifted coefficients.',flush=True)
    z = sp.Symbol('z')
    for q in (2,3,5,7,11,23,101):
        for n in sorted({4,q**3}):
            f=projective_flags(q,n)
            for aug in (False,True):
                g=gamma_coefficients(f,7,aug)
                p=sp.Poly(sum(a*z**i for i,a in enumerate(g)),z)
                print('q',q,'N',n,'augmented',aug,
                      'gamma',g,'real roots',p.count_roots(-sp.oo,sp.oo),
                      'degree',p.degree(),flush=True)
