"""Certify the complete seven-speed spectrum strictly below 1/7."""
from fractions import Fraction
from itertools import combinations, combinations_with_replacement
from math import gcd, isqrt, lcm, prod
from pathlib import Path
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
PRIMES = (151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,241,251)


def fold(x, q):
    return min(x%q, -x%q)


def root_multisets(p, raw):
    """Recover every witnessless nonzero multiset up to signed scaling and permutation."""
    distinct = {tuple(map(int,line.split())) for line in raw.splitlines()}
    assert distinct and all(len(s)==len(set(s))==7 and min(s)>=1 and max(s)<=p//2 for s in distinct)
    masks = {x:sum(1<<t for t in range(1,p//2+1) if 7*fold(t*x,p)>=p)
             for x in range(1,p//2+1)}
    pending = set()
    for speeds in distinct:
        for size in range(1,8):
            for support in combinations(speeds,size):
                times=masks[support[0]]
                for x in support[1:]:
                    times &= masks[x]
                if times:
                    continue
                for extra in combinations_with_replacement(support,7-size):
                    pending.add(tuple(sorted(support+extra)))
    inverse = {x:pow(x,-1,p) for x in masks}
    return {min(tuple(sorted(fold(x*inverse[y],p) for x in s)) for y in set(s))
            for s in pending}


def exact_maximum(s):
    return max(Fraction(max(min(fold(t*x,a+b) for x in s) for t in range((a+b)//2+1)),a+b)
               for a,b in combinations(s,2))


def sporadic_value(s):
    if s[:6]==(1,2,3,4,5,6) and s[-1]%7==0:
        return None
    # Quick witnesses precede the exhaustive endpoint test.
    if any(all(7*fold(t*x,q)>=q for x in s)
           for q in (7,13,19,29,47,71,101) for t in range(1,q//2+1)):
        return None
    for x in s:
        if any(all(fold(k*y,7*x)>=x for y in s) for k in range(1,7*x//2+1,7)):
            return None
    return exact_maximum(s)


def main():
    if not __debug__:
        raise RuntimeError("run with Python assertions enabled")
    assert len(set(PRIMES))==len(PRIMES)
    assert all(all(p%d for d in range(2,isqrt(p)+1)) for p in PRIMES)
    increments = (Fraction(4,231),Fraction(1,33),Fraction(1,15),
                  Fraction(1,10),Fraction(1,6),Fraction(1,3))
    levels = (Fraction(5,33),Fraction(1,6),Fraction(1,5),Fraction(1,4),Fraction(1,3),Fraction(1,2))
    for i,level in enumerate(levels,1):
        assert sum(increments[:i])==2*(level-Fraction(1,7))
    bound=1/prod(increments)
    forced=lcm(*range(2,8))
    assert gcd(forced,prod(PRIMES))==1 and (forced*prod(PRIMES))**2*7**7>bound**14

    expected={}
    for line in (HERE/"sporadic.txt").read_text().splitlines():
        *speeds,value=line.split()
        expected[tuple(map(int,speeds))]=Fraction(value)
    assert max(Fraction(max(s), r.denominator) for s, r in expected.items()) == Fraction(13, 5)
    assert len(expected)==27
    assert {r for r in expected.values() if r.denominator-7*r.numerator!=1}=={
        Fraction(3,23),Fraction(5,37),Fraction(9,65)}
    directions=set()
    with tempfile.TemporaryDirectory() as tmp:
        enum, lift=Path(tmp)/"enumerate",Path(tmp)/"lift"
        for exe,source in ((enum,HERE.parent/"tight-six-speeds/modular.cpp"),(lift,HERE/"lift.cpp")):
            subprocess.run(["c++","-O3","-std=c++20",source,"-o",exe],check=True)
        for p in PRIMES:
            raw=subprocess.check_output([enum,"--list-sevenths"],input=str(p),text=True)
            roots=root_multisets(p,raw)
            data="".join(" ".join(map(str,s))+"\n" for s in sorted(roots))
            output=subprocess.check_output([lift,str(p)],input=data,text=True)
            assert output
            directions.update(tuple(map(int,l.split())) for l in output.splitlines())
            print(f"Prime {p} passed ({len(roots)} folded multisets).",flush=True)
    assert all(len(s)==len(set(s))==7 and min(s)>0 and gcd(*s)==1 for s in directions)
    found={s:r for s in directions if (r:=sporadic_value(s)) is not None}
    assert found==expected
    assert all(exact_maximum(s)==r and r<Fraction(1,7) for s,r in expected.items())
    assert all(any(a+b in s for a in s for b in s) for s in expected)
    print(f"Checked {len(directions)} finite directions and all 27 exact sporadic values.")


if __name__=="__main__":
    main()
