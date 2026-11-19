"""Exhaustive integer verifier for the six-speed loneliness spectrum."""
from itertools import combinations, permutations, product
from math import gcd, isqrt, prod
from pathlib import Path
from tempfile import TemporaryDirectory
import json
import subprocess

HERE = Path(__file__).resolve().parent
FOUR = (
    ((1,0,0,0),(0,1,0,0),(1,1,0,0),(1,-1,0,0),(0,0,1,0),(0,0,0,1)),
    ((1,0,0,0),(0,1,0,0),(1,1,0,0),(0,0,1,0),(1,0,1,0),(0,0,0,1)),
)
CRITICAL = (
    tuple(zip((1,2,3,4,5,0),(0,0,0,0,0,1))),
    tuple(zip((1,3,4,5,9,0),(0,0,0,0,0,1))),
    tuple(zip((1,0,1,2,3,3),(0,1,1,1,1,2))),
)
EXPECTED = {
    (1,2,5,6,7,8,2,13), (2,5,6,8,10,11,2,13), (1,4,5,6,7,22,2,13),
    (1,2,3,5,8,18,3,19), (2,3,5,6,8,11,3,19), (2,5,6,7,8,11,3,19),
    (1,3,4,5,18,46,4,25), (1,3,4,5,7,24,5,31), (1,4,5,6,7,33,6,37),
}


def determinant(rows):
    if len(rows)==1:
        return rows[0][0]
    if len(rows)==2:
        (a,b),(c,d) = rows
        return a*d-b*c
    return sum((-1)**j * x * determinant([r[:j]+r[j+1:] for r in rows[1:]])
               for j,x in enumerate(rows[0]))


def norm2(r):
    return sum(x*x for x in r)


def gram(a):
    return determinant([[sum(r[i]*r[j] for r in a) for j in range(len(a[0]))]
                        for i in range(len(a[0]))])


def signed(row):
    return tuple(-x for x in row) if next((x for x in row if x),0)<0 else tuple(row)


def canonical(a):
    # Use independent coordinate forms as parameters. Cramer's rule gives
    # each row in this basis. Absolute speeds permit independent row signs.
    rank = len(a[0])
    keys = []
    for positions in permutations(range(len(a)),rank):
        basis = [a[i] for i in positions]
        den = determinant(basis)
        if not den:
            continue
        rows = [tuple(determinant(basis[:j]+[v]+basis[j+1:]) for j in range(rank)) for v in a]
        g = gcd(den,*(x for r in rows for x in r))
        for tail in product((1,-1),repeat=rank-1):
            signs=(1,)+tail
            normalized=tuple(sorted(signed([x*s//g for x,s in zip(row,signs)]) for row in rows))
            keys.append((abs(den)//g,normalized))
    return min(keys)


def restrict(maps, covers):
    out=set()
    for a,hs in zip(maps,covers,strict=True):
        for h in hs:
            pivot=min((i for i in range(len(h)) if h[i]),key=lambda i:abs(h[i]))
            b=[tuple(h[pivot]*r[i]-r[pivot]*h[i] for i in range(len(h)) if i!=pivot) for r in a]
            rows=set(map(signed,b))
            if len(rows)==6 and all(any(r) for r in rows):
                out.add(canonical(b))
    return sorted(out)


def triangle_cover():
    a=((1,0,0,0,0),(0,1,0,0,0),(-1,-1,0,0,0),
       (0,0,1,0,0),(0,0,0,1,0),(0,0,0,0,1))
    h=set()
    for i,j in combinations(range(3),2):
        for r in a[3:]:
            for e in (-1,1):
                h.add(signed([x-y+e*z for x,y,z in zip(a[i],a[j],r)]))
    for r in a[:3]:
        for u,v in combinations(a[3:],2):
            for e,f in product((-1,1),repeat=2):
                h.add(signed([x+e*y+f*z for x,y,z in zip(r,u,v)]))
    collisions=[tuple(x-y for x,y in zip(a[i],a[j])) for i,j in combinations(range(3),2)]
    assert len(h)==54
    return a,collisions,sorted(h)


def bound_product(rows, bound2):
    return prod(bound2*norm2(r) for r in rows)


def field_limits(four_covers):
    a,collisions,h=triangle_cover()
    # The first comparison is P^4 against the square of D_0^2 times
    # the product of the 80 three-speed forms, all squared in the bound.
    b6=163350**2
    return ([b6**12*(3*b6)**80,
             bound_product([*a,*collisions,*h],54450**2*3),
             *(bound_product([*m,*hs],9075**2*gram(m)) for m,hs in zip(FOUR,four_covers))],
            [4,2,2,2])


def flatten(rows):
    return [x for row in rows for x in row]


def serial(rows):
    return "".join(" ".join(map(str,row))+"\n" for row in rows)


def prime(p):
    return p>=2 and all(p%i for i in range(2,isqrt(p)+1))


def main():
    if not __debug__:
        raise RuntimeError("run with Python assertions enabled")
    cert=json.loads((HERE/"covers.json").read_text())
    four=cert["four"]
    three=[tuple(map(tuple,s["map"])) for s in cert["three"]]
    three_covers=[s["lines"] for s in cert["three"]]
    generated=restrict(FOUR,four)
    assert generated==[(1,a) for a in three]
    critical={canonical(a) for a in CRITICAL}
    leaves=[a for den,a in restrict(three,three_covers) if (den,a) not in critical]
    with TemporaryDirectory() as tmp:
        tmp=Path(tmp)
        sources={"list":HERE.parent/"tight-six-speeds"/"modular.cpp",
                 "planes":HERE.parent/"five-speed-spectrum"/"sieve.cpp",
                 "check":HERE/"check-fields.cpp","gap":HERE/"check-gap.cpp","leaves":HERE/"check-leaves.cpp"}
        for exe,source in sources.items():
            subprocess.run(["c++","-std=c++20","-O3",str(source),"-o",tmp/exe],check=True)
        def run(exe,*args,stdin=""):
            return subprocess.check_output([tmp/exe,*map(str,args)],input=stdin,text=True)
        gap=run("gap").splitlines()
        for line in gap:
            row=list(map(int,line.split()))
            assert len(row)==12 and canonical(list(zip(row[:6],row[6:]))) in critical
        assert len(gap)==190
        print("Checked the gap above 1/6 on two-dimensional subtori.",flush=True)

        hs=triangle_cover()[2]
        fields=tmp/"covers.txt"
        fields.write_text(serial([[len(s),*flatten(s)] for s in [hs,*four]]))
        limits,powers=field_limits(four)
        products=[1]*4
        primes=json.loads((HERE/"primes.json").read_text())
        assert len(primes)==len(set(primes)) and all(prime(p) and p>=53 for p in primes)
        for p in primes:
            raw=run("list","--list-sixths",stdin=str(p))
            flags=list(map(int,run("check",p,fields,stdin=raw).split()))
            assert len(flags)==4 and set(flags)<={0,1}
            for i,ok in enumerate(flags):
                if ok:
                    products[i]*=p
        assert all(v**n>b for v,n,b in zip(products,powers,limits))
        print(f"All four high-dimensional prime-product inequalities passed ({len(primes)} primes).",flush=True)

        products=[1]*len(three)
        # Use the global norm bound here. All listed maps have signed unit
        # rows, as checked by the canonical representation above.
        limits=[bound_product([*a,*hs],163350**2) for a,hs in zip(three,three_covers)]
        for p in range(53,3001):
            if not prime(p):
                continue
            active=[i for i,n in enumerate(products) if n*n<=limits[i]]
            if not active:
                break
            rows=[[i,*flatten(three[i]),len(three_covers[i]),*flatten(three_covers[i])] for i in active]
            flags=[tuple(map(int,l.split())) for l in run("planes","plane6",p,stdin=serial(rows)).splitlines()]
            assert [i for i,ok in flags]==active
            for i,ok in flags:
                if ok==1:
                    products[i]*=p
        assert all(n*n>b for n,b in zip(products,limits))
        print(f"Checked all {len(three)} three-parameter covers.",flush=True)
        output=run("leaves",stdin=serial([[i,*flatten(a)] for i,a in enumerate(leaves)]))
        assert {tuple(map(int,l.split())) for l in output.splitlines()}==EXPECTED
        print(f"Checked {len(leaves)} noncritical two-parameter maps and nine exact sporadic values.")
        print(output,end="")


if __name__=="__main__":
    main()
