"""Exact finite checks for the Brown–Cameron threshold obstruction. Python 3.10+."""
from fractions import Fraction as F
from itertools import combinations
from math import comb
from collections import Counter


def check(cond, msg):
    if not cond:
        raise AssertionError(msg)


def e(k): return k*(k-1)//2
def mu(n,k,q): return comb(n,k)*q**e(k)

def moment2(n,h,q):
    # Ordered h-set pairs; intersecting edges are required absent only once.
    return comb(n,h)*sum(comb(h,s)*comb(n-h,h-s)*q**(2*e(h)-e(s))
                         for s in range(h+1))

def exhaustive(n=5):
    edges=list(combinations(range(n),2)); m=len(edges)
    needed=[(s.bit_count(),sum(1<<i for i,(u,v) in enumerate(edges)
                                 if s>>u&1 and s>>v&1)) for s in range(1<<n)]
    hist=Counter()
    for g in range(1<<m):
        counts=[0]*(n+1)
        for h,mask in needed:
            if not g&mask: counts[h]+=1
        hist[g.bit_count(),tuple(counts)]+=1
    for q in [F(1,3),F(1,2),F(2,3)]:
        for h in range(n+1):
            M=sum(f*q**(m-j)*(1-q)**j*v[h] for (j,v),f in hist.items())
            S=sum(f*q**(m-j)*(1-q)**j*v[h]**2 for (j,v),f in hist.items())
            check(
                (M, S) == (mu(n, h, q), moment2(n, h, q)),
                f"Moment mismatch for n={n}, h={h}, q={q}",
            )
            # Independently check the void-event telescope error bound.
            no=sum(f*q**(m-j)*(1-q)**j for (j,v),f in hist.items() if not v[h])
            dep=comb(n,h)*sum(comb(h,i)*comb(n-h,h-i)*q**(2*e(h)-e(i)) for i in range(2,h))
            check(
                abs(no - (1 - q**e(h))**comb(n, h)) <= dep,
                f"Void bound failed for n={n}, h={h}, q={q}",
            )
    print(f'Exhaustive: all {1<<m} labeled graphs on {n} vertices, all set sizes, 3 edge densities; first and second moments and void bounds passed.')

def threshold(k,q,lam):
    lo,hi=k-1,k
    while mu(hi,k,q)<lam: hi*=2
    while hi-lo>1:
        mid=(hi+lo)//2
        if mu(mid,k,q)<lam: lo=mid
        else: hi=mid
    check(
        mu(lo, k, q) < lam <= mu(hi, k, q),
        f"Threshold not bracketed by {lo} and {hi} for k={k}, q={q}, lambda={lam}",
    )
    return hi

def finite_certificate(k,q,mode):
    # Genuine unconditional lower bound at the displayed n, not a simulation.
    lam=(q**2 if mode=='Hurwitz' else q)/2
    n=threshold(k,q,lam); ms=[mu(n,k-i,q) for i in range(4)]
    # The lower bound for Pr(X_k>=1) is the two-term Bonferroni bound.
    nonempty=ms[0]-(moment2(n,k,q)-ms[0])/2
    delta=F(1,10); last=3 if mode=='Hurwitz' else 2
    errors=sum((moment2(n,k-i,q)/ms[i]**2-1)/delta**2 for i in range(1,last+1))
    case = f"{mode} certificate for n={n}, k={k}, q={q}"
    if mode=='Hurwitz':
        check(
            (1 + delta)**2 * ms[1] * ms[2] < (1 - delta) * ms[3],
            f"{case}: Hurwitz inequality does not fail at the prescribed deviations",
        )
    else:
        check(
            (1 + delta)**2 * ms[1]**2 < (1 - delta) * ms[2],
            f"{case}: log-concavity inequality does not fail at the prescribed deviations",
        )
    lower=nonempty-errors-mu(n,k+1,q)
    check(lower > lam / 2, f"{case}: probability lower bound did not exceed lambda/2")
    # Decimal printed as a guaranteed lower endpoint by rounding down.
    milli=lower*1000000; floor=milli.numerator//milli.denominator
    print(f'{mode:7} q={q}, k={k}, n={n}, exact certified failure probability >={floor}/1000000')

if __name__=='__main__':
    exhaustive()
    for q,k in [(F(1,3),64),(F(1,2),64),(F(2,3),100)]:
        for mode in ('Hurwitz','LC'): finite_certificate(k,q,mode)
