#!/usr/bin/env python3
"""Bounded numerical checks, NOT a proof or an asymptotic-rate certificate."""
import argparse, cmath, hashlib, itertools, json, math, random, time


def support(p, k, a, seed):
    rng = random.Random(seed)
    rho = k/p
    raw = {s for s in range(p) if rng.random() < rho + 2*a*math.cos(2*math.pi*s/p)}
    out = set(raw)
    edits = abs(len(raw)-k)
    if len(out)>k:
        out.difference_update(rng.sample(sorted(out),len(out)-k))
    elif len(out)<k:
        out.update(rng.sample(sorted(set(range(p))-out),k-len(out)))
    return sorted(out), len(raw), edits


def permanent_dp(p, S):
    # dp[mask] assigns rows 0,...,popcount(mask)-1 to exactly these columns.
    # No spectral or asymptotic estimate enters this integer recurrence.
    rows = [sum(1 << ((i+s)%p) for s in S) for i in range(p)]
    dp = [0]*(1<<p)
    dp[0]=1
    for mask in range((1<<p)-1):
        v=dp[mask]
        if not v:
            continue
        available=rows[mask.bit_count()] & ~mask
        while available:
            bit=available & -available
            dp[mask|bit]+=v
            available-=bit
    return dp[-1]


def permanent_brute(p, S):
    allowed=set(S)
    return sum(all((perm[i]-i)%p in allowed for i in range(p)) for perm in itertools.permutations(range(p)))


def analyze(p,k,a,seed):
    S, raw_count, edits=support(p,k,a,seed)
    assert len(S)==k and len(set(S))==k and all(0<=s<p for s in S)
    lam=[sum(cmath.exp(2j*math.pi*l*s/p) for s in S)/k for l in range(p)]
    target=[1 if l==0 else a/(k/p) if l in (1,p-1) else 0 for l in range(p)]
    err=max(abs(x-y) for x,y in zip(lam,target))
    op=max(abs(x) for x in lam[1:])
    sqmass=sum(abs(x)**2 for x in lam[1:])
    assert abs(sqmass-(p/k-1))<1e-10
    assert abs(lam[-1]-lam[1].conjugate())<1e-10
    assert err <= 12*math.sqrt(math.log(p)/p)+1e-12
    exact=permanent_dp(p,S)
    assert exact%p==k%p
    if p<=7:
        assert exact==permanent_brute(p,S)
    actual=math.log(exact)-p*math.log(k)-math.lgamma(p+1)+p*math.log(p)
    finite=-0.5*sum(math.log1p(-abs(x)**2) for x in lam[1:])
    z=(a/(k/p))**2
    limiting=0.5*(p/k-1)-math.log1p(-z)-z
    return dict(p=p,k=k,amplitude=a,seed=seed,support=S,raw_cardinality=raw_count,cardinality_edits=edits,
        permanent=str(exact),permanent_mod_p=exact%p,parseval_error=sqmass-(p/k-1),
        max_normalized_fourier_error=err,coarse_proved_fourier_bound=12*math.sqrt(math.log(p)/p),
        exceptional_magnitude=abs(lam[1]),max_tail_magnitude=max(abs(lam[l]) for l in range(2,p-1)),
        B_operator_norm=op,B_max_entry=max(1/p,1/k-1/p),
        log_normalized_permanent=actual,finite_log_determinant_factor=finite,limiting_log_factor=limiting,
        actual_minus_finite=actual-finite,actual_minus_limit=actual-limiting)


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--output',default='sanity-results.json')
    ap.add_argument('--primes',nargs='+',type=int,default=[7,11,13,17,19])
    args=ap.parse_args()
    assert all(7<=p<=19 and all(p%d for d in range(2,math.isqrt(p)+1)) for p in args.primes), 'bounded test supports primes 7..19 only'
    start=time.time(); results=[]
    for p in args.primes:
        for k in sorted({math.ceil(p/3),math.floor(2*p/3)}):
            for j,a in enumerate([0,1/24,1/12]):
                seed=int.from_bytes(hashlib.sha256(f'NSS-sanity-v1:{p}:{k}:{j}'.encode()).digest()[:8],'big')
                r=analyze(p,k,a,seed);results.append(r)
                print(f'p={p:2} k={k:2} a={a:.5f} per={r["permanent"]} error(actual-finite)={r["actual_minus_finite"]:.4g}',flush=True)
    report=dict(scope='Finite numerical checks only; no conjecture proof, distinctness guarantee, asymptotic rate, or claim these small samples meet spectral bound 1/2.',
                method='Exact integer subset DP; brute permutation cross-check for p<=7. Independent Bernoulli profiles with deterministic SHA256-derived seeds and uniform random cardinality repair.',
                amplitudes=[0,1/24,1/12], results=results,elapsed_seconds=time.time()-start)
    with open(args.output,'w') as f:json.dump(report,f,indent=2);f.write('\n')
    print('PASS',len(results),'cases;',args.output)

if __name__=='__main__': main()
