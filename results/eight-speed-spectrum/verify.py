"""Check all eight-speed critical planes, modular lifts, and exact maxima."""
from fractions import Fraction
from itertools import combinations, combinations_with_replacement
from math import gcd, isqrt, lcm, prod
from pathlib import Path
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
BASES = ((1,2,3,4,5,6,7), (1,2,3,4,5,7,12), (1,4,5,6,7,11,13))
PRIMES = (151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,
          239,241,251,257,263,269,271,277,281,283)


def fold(x, q):
    return min(x % q, -x % q)


def enumerate_roots(p, raw):
    """Expand distinct root supports to all witnessless multisets up to units."""
    masks = {x:sum(1 << t for t in range(1,p//2+1) if 8*fold(t*x,p)>=p)
             for x in range(1,p//2+1)}
    distinct = {tuple(map(int,line.split())) for line in raw.splitlines()}
    assert distinct and all(len(s)==len(set(s))==8 and set(s)<=masks.keys() for s in distinct)
    candidates = set()
    for root in distinct:
        for size in range(1,9):
            for support in combinations(root,size):
                times = masks[support[0]]
                for x in support[1:]:
                    times &= masks[x]
                    if not times:
                        break
                if not times:
                    for extra in combinations_with_replacement(support,8-size):
                        candidates.add(tuple(sorted(support+extra)))
    ratios = {y:{x:fold(x*pow(y,-1,p),p) for x in masks} for y in masks}
    return {min(tuple(sorted(ratios[y][x] for x in s)) for y in set(s)) for s in candidates}


def peaks(s):
    times = {Fraction(k,a+b) for a,b in combinations(s,2) for k in range(a+b)}
    return {t:min(min(t*x % 1, -t*x % 1) for x in s) for t in times}


def check_product_families():
    for index,base in enumerate(BASES):
        heights = peaks(base)
        assert {t for t,h in heights.items() if h==Fraction(1,8)}=={Fraction(k,8) for k in (1,3,5,7)}
        assert max(heights.values())==Fraction(1,8)
        assert max(h for h in heights.values() if h<Fraction(1,8))<=Fraction(2,17)
        assert max(peaks(base+(8,)).values())==(Fraction(2,17) if index else Fraction(1,9))
        assert [x for x in base if x%8==1]==[1] and max(base)<=13


def in_product(s):
    return any(x%8==0 and (s[:i]+s[i+1:]) in BASES for i,x in enumerate(s))


def near_tight(s):
    for x in s:
        for k in range(1,4*x+1,8):
            if all(fold(k*y,8*x)>=x for y in s):
                return False
    return True


def main():
    if not __debug__:
        raise RuntimeError("run with Python assertions enabled")
    check_product_families()
    levels = (Fraction(3,23),Fraction(1,7),Fraction(1,6),Fraction(1,5),
              Fraction(1,4),Fraction(1,3),Fraction(1,2))
    increments = tuple(2*(a-b) for a,b in zip(levels,(Fraction(1,8),)+levels))
    bound = 1/prod(increments)
    assert bound==209960100 and increments[0]==Fraction(1,92)
    assert len(set(PRIMES))==len(PRIMES) and all(all(p%d for d in range(2,isqrt(p)+1)) for p in PRIMES)
    forced = lcm(*range(2,9))
    assert gcd(forced,prod(PRIMES))==1 and (forced*prod(PRIMES))**2*8**8>bound**16
    table = {}
    for line in (HERE/"sporadic.txt").read_text().splitlines():
        *coords, value = line.split()
        table[tuple(map(int,coords))] = Fraction(value)
    assert max(Fraction(max(s),r.denominator) for s,r in table.items())==Fraction(21,17)
    assert len(table)==17
    directions = set()
    with tempfile.TemporaryDirectory() as tmp:
        planes, roots, lift = (Path(tmp)/x for x in ("planes","roots","lift"))
        for exe, source in ((planes,HERE/"planes.cpp"), (roots,HERE.parent/"tight-six-speeds/modular.cpp"),
                            (lift,HERE.parent/"seven-speed-spectrum/lift.cpp")):
            subprocess.run(["c++","-O3","-std=c++20",source,"-o",exe],check=True)
        subprocess.run([planes],check=True)
        for p in PRIMES:
            raw = subprocess.check_output([roots,"--spectrum-eight"],input=str(p),text=True)
            reps = enumerate_roots(p,raw)
            lines = "".join(" ".join(map(str,s))+"\n" for s in sorted(reps))
            output = subprocess.check_output([lift,str(p),"--eight-speeds"],input=lines,text=True)
            assert output
            directions.update(tuple(map(int,line.split())) for line in output.splitlines())
            print(f"Prime {p} passed ({len(reps)} folded multisets).",flush=True)
    assert all(len(s)==len(set(s))==8 and tuple(sorted(s))==s and min(s)>0 and gcd(*s)==1 for s in directions)
    survivors = {s for s in directions if not in_product(s) and near_tight(s)}
    assert survivors==table.keys()
    for s,r in table.items():
        assert max(peaks(s).values())==r and r.denominator-8*r.numerator==1
        assert any(a+b in s for a in s for b in s)
    print(f"Checked {len(directions)} finite directions and all {len(table)} sporadic tuples.")


if __name__=="__main__":
    main()
