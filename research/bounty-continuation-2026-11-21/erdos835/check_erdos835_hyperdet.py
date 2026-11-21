"""Exact coefficient diagnostics for the proposed cubic moment identity.

No finite parameter exclusion or positive relaxation is a solution of E835.
The root worker proposed the hyperdeterminant coefficient normalization.
"""
from fractions import Fraction
from math import comb, factorial
from collections import defaultdict
import argparse
import json


def exponent(*indices):
    v = [0]*8
    for i in indices:
        v[i] += 1
    return tuple(v)


DELTA = {
    exponent(0,0,7,7):1, exponent(1,1,6,6):1,
    exponent(2,2,5,5):1, exponent(3,3,4,4):1,
    exponent(0,1,6,7):-2, exponent(0,2,5,7):-2,
    exponent(0,3,4,7):-2, exponent(1,2,5,6):-2,
    exponent(1,3,4,6):-2, exponent(2,3,4,5):-2,
    exponent(0,3,5,6):4, exponent(1,2,4,7):4,
}


def power_delta(m):
    poly = {(0,)*8:1}
    for _ in range(m):
        nxt = defaultdict(int)
        for a,c in poly.items():
            for b,d in DELTA.items():
                nxt[tuple(x+y for x,y in zip(a,b))] += c*d
        poly = {a:c for a,c in nxt.items() if c}
    return poly


def moments(k, counts, poly):
    n = counts
    overlaps = (n[6]+n[7], n[5]+n[7], n[3]+n[7])
    e = [Fraction((-1)**s,comb(k,s)) for s in overlaps]
    r = Fraction(poly.get(n,0),factorial(k)**2)
    for x in n:
        r *= factorial(x)
    same = (1+k*sum(e)+k*(k-1)*r)/(k+1)**2
    pairs = [(1+k*z)/(k+1)-same for z in e]
    different = Fraction(k*(k-1),(k+1)**2)*(1-sum(e)+2*r)
    return [same]+pairs+[different],r


def analyze(k, poly=None):
    assert k >= 2 and k%2 == 0
    poly = power_delta(k//2) if poly is None else poly
    checks=0
    failures=[]
    minima=[None]*5
    for dist in range(k+1):
        caps=(k-dist,dist,dist,k-dist)
        for a in range(caps[0]+1):
            for b in range(caps[1]+1):
                for c in range(caps[2]+1):
                    d=k-a-b-c
                    if not 0 <= d <= caps[3]:
                        continue
                    counts=(caps[3]-d,d,caps[2]-c,c,caps[1]-b,b,caps[0]-a,a)
                    vals,r=moments(k,counts,poly)
                    checks+=1
                    for j,v in enumerate(vals):
                        if minima[j] is None or v<minima[j]:minima[j]=v
                    if min(vals)<0:
                        failures.append({'counts':counts,'R':str(r),'probabilities':list(map(str,vals))})
    return {'k':k,'nonzero_monomials':len(poly),'triple_orbits':checks,
            'minima':list(map(str,minima)),'failure_count':len(failures),
            'first_failures':failures[:10]}


if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('k',type=int,nargs='+')
    args=parser.parse_args()
    for k in args.k:
        print(json.dumps(analyze(k)),flush=True)
