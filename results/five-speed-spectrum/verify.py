"""Replay the finite part of the five-speed spectrum proof using Python and C++20."""
from fractions import Fraction
from itertools import combinations, permutations, product
import json
from math import gcd, isqrt, prod
from pathlib import Path
import subprocess
from tempfile import TemporaryDirectory

HERE = Path(__file__).resolve().parent
BOUND = 33750
PAIRS = list(combinations(range(5), 2))
TRIPLES = list(combinations(range(5), 3))
CRITICAL = ((1, 2, 3, 4), (1, 3, 4, 7))
QUINTUPLES = {
    (1, 2, 3, 5, 8): 2, (1, 3, 4, 5, 9): 1, (1, 3, 4, 5, 11): 3,
    (1, 3, 4, 5, 18): 2, (1, 3, 4, 5, 27): 6, (1, 4, 5, 6, 7): 2,
    (1, 4, 5, 6, 27): 6, (1, 7, 8, 9, 15): 3, (2, 3, 5, 8, 19): 4,
    (2, 5, 7, 8, 9): 3, (3, 5, 8, 9, 13): 4, (3, 5, 8, 11, 13): 4,
}


def canonical(v):
    v = tuple(v)
    g = gcd(*v)
    if next((x for x in v if x), 0) < 0:
        g = -g
    return tuple(x // g for x in v) if g else v


def det(a, b, c):
    return (a[0]*(b[1]*c[2]-b[2]*c[1]) + a[1]*(b[2]*c[0]-b[0]*c[2])
            + a[2]*(b[0]*c[1]-b[1]*c[0]))


def check_spaces(spaces):
    orbits = set()
    for space in spaces:
        a = space["map"]
        for axis in range(3):
            unit = tuple(int(i == axis) for i in range(3))
            assert unit in {canonical(r) for r in a if sum(map(abs, r)) == 1}
        for perm in permutations(a):
            # Complementary 3x3 minors are the dual Pluecker coordinates.
            w = [(-1)**(i+j) * det(*(perm[k] for k in range(5) if k not in (i,j)))
                 for i,j in PAIRS]
            for signs in product((1,-1), repeat=4):
                s = (1,) + signs
                orbits.add(canonical(v*s[i]*s[j] for v,(i,j) in zip(w,PAIRS)))
    unit = [[int(j == i) for j in range(5)] for i in range(5)]
    equations = set()
    for i,j,k in product(range(5), repeat=3):
        r = [x+y-z for x,y,z in zip(unit[i],unit[j],unit[k])]
        if sum(map(abs,r)) == 3:
            equations.add(canonical(r))
    cases = list(combinations(sorted(equations),2))
    cases.append(((1,1,-1,0,0), (3,-1,0,0,0)))
    forbidden = unit + [[x+e*y for x,y in zip(unit[i],unit[j])]
                        for i,j in PAIRS for e in (-1,1)]
    for r,s in cases:
        w = canonical(r[i]*s[j]-r[j]*s[i] for i,j in PAIRS)
        if w in orbits:
            continue
        # If t lies in the row span of r,s, every solution has t.v=0.
        assert any(all(det(*[(r[k],s[k],t[k]) for k in tri]) == 0 for tri in TRIPLES)
                   for t in forbidden), (r,s)
    print(f"Checked {len(cases)} relation pairs against {len(spaces)} spaces.", flush=True)


def primes(stop):
    return [p for p in range(53, stop+1) if all(p % i for i in range(2,isqrt(p)+1))]


def flatten(matrix):
    return [v for row in matrix for v in row]


def verify_cover(run, spaces):
    root_product = 1
    products = [1]*len(spaces)
    limits = [prod(BOUND**2 * sum(x*x for x in r) for r in s["map"]+s["lines"])
              for s in spaces]
    for p in primes(1800):
        if root_product <= (5*BOUND)**111:
            if run("root",p) == "1":
                root_product *= p
        active = [i for i in range(len(spaces)) if products[i]**2 <= limits[i]]
        if active:
            data = [[i, *flatten(spaces[i]["map"]), len(spaces[i]["lines"]),
                     *flatten(spaces[i]["lines"])] for i in active]
            results = [tuple(map(int,line.split())) for line in run("plane",p,data).splitlines()]
            assert [i for i,_ in results] == active
            for i,ok in results:
                if ok == 1:
                    products[i] *= p
        if root_product > (5*BOUND)**111 and all(a*a>b for a,b in zip(products,limits)):
            print(f"All ten exact prime-product inequalities passed by prime {p}.", flush=True)
            return
    raise AssertionError("prime products insufficient")


def sign_row(row):
    return tuple(-v for v in row) if next((v for v in row if v),0)<0 else tuple(row)


def critical(rows):
    return any(all(tuple(k*v for v in row) in rows for k in pattern)
               for row in rows for pattern in CRITICAL)


def reduced_planes(spaces):
    planes = []
    for s in spaces:
        for h in s["lines"]:
            j = min((i for i in range(3) if h[i]),key=lambda i:abs(h[i]))
            a = [tuple(r[i]*h[j]-r[j]*h[i] for i in range(3) if i!=j) for r in s["map"]]
            rows = set(map(sign_row,a))
            if (0,0) in rows or len(rows)<5 or critical(rows):
                continue
            if a not in planes:
                planes.append(a)
    return planes


def candidates(run, planes):
    # Free parameters are two entries of the signed speed vector, up to sign.
    # Reduce their ratio to coprime x,y with 1 <= x <= B and |y| <= B.
    p,q = 50021,50023
    data = [[i,*flatten(a)] for i,a in enumerate(planes)]
    tables = []
    for prime in (p,q):
        table = [list(map(int,row.split())) for row in run("slopes",prime,data).splitlines()]
        assert [r[0] for r in table] == list(range(len(planes)))
        tables.append([r[1:] for r in table])
    inverses = [0]+[pow(x,-1,q) for x in range(1,BOUND+1)]
    result = set()
    for a,left,right in zip(planes,*tables):
        right = set(right)
        def record(x,y):
            d = sorted(abs(u*x+v*y) for u,v in a)
            if d[0] == 0 or len(set(d))<5:
                return
            d = tuple(z//gcd(*d) for z in d)
            if sum(z*z for z in d)<BOUND**2 and not critical({(z,) for z in d}):
                result.add(d)
        record(0,1)
        for slope in left:
            for x in range(1,BOUND+1):
                r = slope*x % p
                # Since B<p, these are the only lifts in [-B,B].
                for y in (r,r-p):
                    if abs(y)<=BOUND and y*inverses[x]%q in right and gcd(x,y)==1:
                        record(x,y)
    return result


def evaluate(d):
    def distance(a,q):
        return min(min(a*v % q, -a*v % q) for v in d)
    # An early success gives an exact witness at or above the threshold.
    for q in range(2,181):
        if any(5*distance(a,q)>=q for a in range(1,q//2+1)):
            return None
    best = Fraction(0)
    for q in {x+y for x,y in combinations(d,2)}:
        for a in range(q//2+1):
            best = max(best, Fraction(distance(a,q),q))
    return best if 5*best<1 else None


def main():
    if not __debug__:
        raise RuntimeError("run with Python assertions enabled")
    spaces = json.loads((HERE/"cover.json").read_text())
    check_spaces(spaces)
    with TemporaryDirectory() as tmp:
        exe = Path(tmp)/"sieve"
        subprocess.run(["c++","-std=c++20","-O3",str(HERE/"sieve.cpp"),"-o",exe],check=True)
        def run(mode,p,data=()):
            stdin = "".join(" ".join(map(str,row))+"\n" for row in data)
            return subprocess.check_output([exe,mode,str(p)],input=stdin,text=True).strip()
        verify_cover(run,spaces)
        planes = reduced_planes(spaces)
        tuples = candidates(run,planes)
    actual = {d:value for d in sorted(tuples) if (value:=evaluate(d)) is not None}
    assert actual == {d:Fraction(s,5*s+1) for d,s in QUINTUPLES.items()}, actual
    print(f"{len(planes)} two-parameter maps, {len(tuples)} residual quintuples, "
          f"{len(actual)} below 1/5. All have denominator 5 times numerator plus one.")
    for d,value in actual.items():
        print(d,value)


if __name__ == "__main__":
    main()
