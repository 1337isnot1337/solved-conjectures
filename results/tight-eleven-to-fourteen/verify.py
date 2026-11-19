"""Certify the integer directions above the published binary sieve results."""
import argparse
from fractions import Fraction
from hashlib import sha256
from itertools import combinations
from math import gcd, isqrt, lcm, prod
from pathlib import Path
import re
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
LEGACY_HASH = "04a8411382573d68b38372850d70548884246c48c4c21e951233f6c8791f4020"
TWELVE = (239,251,281,311,313,317,331,347,353,359,367,373,379,383,389,397,401,
          409,419,421,431,433,439,443,449,457,461,463,467,479,487,491,499,503,
          509,521,523,541,547,557,563,569,571,577)


def primes(a,b):
    return tuple(p for p in range(a,b+1) if all(p%i for i in range(2,isqrt(p)+1)))


def check_archive(path):
    data=path.read_bytes()
    assert sha256(data).hexdigest()==LEGACY_HASH
    logged=set()
    for block in re.split(r"(?=Parameters: p = )",data.decode()):
        match=re.match(r"Parameters: p = (\d+), k = 11\s",block)
        if not match:
            continue
        p=int(match[1])
        first=re.search(r"trying (\d+): T size = (\d+)",block)
        if first and int(first[1])==2 and int(first[2])==(p-1)//2:
            logged.add(p)
    assert set(TWELVE)<=logged


def folded_parent_representative(u,p):
    # The legacy lifts keep the sign that places the parent in the lower half modulo p.
    return tuple(sorted((u*x if u*x%p<=p//2 else -u*x)%(2*p) for x in range(1,12)))


def exact_maximum(row):
    def distance(k,q):
        return min(min(k*x%q,-k*x%q) for x in row)
    return max(Fraction(max(distance(k,a+b) for k in range((a+b)//2+1)),a+b)
               for a,b in combinations(row,2))


def main():
    if not __debug__:
        raise RuntimeError("run with Python assertions enabled")
    parser=argparse.ArgumentParser()
    parser.add_argument("--legacy-log",type=Path,help="also check the original twelve-runner search log")
    args=parser.parse_args()
    if args.legacy_log:
        check_archive(args.legacy_log)
    prime_sets={10:primes(127,467), 11:TWELVE, 12:(167,)+primes(179,733),
                13:(83,139,167,181,191)+primes(199,479)+(487,491,499,503,509,521,523,541,547,557)}
    assert tuple(map(len,prime_sets.values()))==(61,44,91,62)
    with tempfile.TemporaryDirectory() as tmp:
        lift=Path(tmp)/"lift"
        subprocess.run(["c++","-O3","-std=c++20",HERE/"lift.cpp","-o",lift],check=True)
        for n, ps in prime_sets.items():
            roots={tuple(range(1,n+1))}
            if n==13:
                roots.add(tuple(range(1,12))+(13,24))
            grid="".join(" ".join(map(str,r))+"\n" for r in sorted(roots))
            heights=[4*(Fraction(1,n+1-r)-Fraction(1,n+1))**2 for r in range(1,n)]
            increments=[b-a for a,b in zip([0]+heights,heights)]
            assert all(3*b>4*a for a,b in zip(increments,increments[1:]))
            forced=lcm(*range(2,n+1))
            assert len(set(ps))==len(ps) and all(primes(p,p)==(p,) for p in ps)
            assert gcd(forced,prod(ps))==1 and (forced*prod(ps))**2*(n*prod(increments))**n>1
            for p in ps:
                if n==11:
                    orbit={folded_parent_representative(u,p) for u in range(1,2*p) if gcd(u,2*p)==1}
                    assert len(orbit)==(p-1)//2
                output=subprocess.check_output([lift,str(p),str(n)],input=grid,text=True)
                assert {tuple(map(int,line.split())) for line in output.splitlines()}==roots,(p,n)
            assert all(exact_maximum(r)==Fraction(1,n+1) for r in roots)
            print(f"{n+1} runners: {len(ps)} prime fibers and {len(roots)} exact equality case(s) passed.",flush=True)


if __name__=="__main__":
    main()
