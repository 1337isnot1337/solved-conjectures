"""Exhaust the modular alternatives for seven-speed equality."""
from fractions import Fraction
from itertools import combinations, product
from math import isqrt, prod
from pathlib import Path
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
SHAPES = ((1,2,3,4,5,6,7), (1,2,3,4,5,7,12), (1,4,5,6,7,11,13))
PRIMES = (251,257,263,269,271,277,281,283,293,307,311,313,317,331,337,347,349)


def folded(x, modulus):
    return min(x % modulus, -x % modulus)


def exact_maximum(speeds):
    return max(Fraction(min(folded(t*x, a+b) for x in speeds), a+b)
               for a,b in combinations(speeds,2) for t in range(a+b))


def multiplier_mask(speed, residue, p, q):
    # Bit kp+t tests time t/p + k/q, for signed speed residues modulo p and q.
    mask = 0
    for k in range(q):
        for t in range(p):
            if 8*folded(q*speed*t+p*residue*k, p*q)>p*q:
                mask |= 1 << (k*p+t)
    return mask


def common(masks):
    head, *rest = masks
    for m in rest:
        head &= m
    return head


def mixed_obstruction(speeds, masks, q):
    # A primitive integer tuple cannot have every coordinate divisible by q.
    for residues in product(range(q), repeat=len(speeds)):
        if any(residues) and not common([masks[x,c] for x,c in zip(speeds,residues)]):
            return True
    return False


def verify_prime(p, enumerator):
    raw = subprocess.check_output([enumerator, "--list-eighths"], input=str(p), text=True)
    sets = {tuple(map(int,line.split())) for line in raw.splitlines()}
    shapes = {tuple(sorted(folded(a*x,p) for x in w))
              for a in range(1,p//2+1) for w in SHAPES}
    assert sets and all(len(s)==len(set(s))==7 and s==tuple(sorted(s)) for s in sets)
    assert all(any(tuple(sorted(folded(a*x,p) for x in w)) in sets
                   for a in range(1,p//2+1)) for w in SHAPES)
    basic = {x:multiplier_mask(x,0,p,1) for s in sets for x in s}
    candidates = sets-shapes
    for s in sets:
        # Every smaller witnessless support extends to a witnessless seven-set.
        assert all(common([basic[x] for x in sub]) for sub in combinations(s,5))
        for sub in combinations(s,6):
            if not common([basic[x] for x in sub]):
                candidates.update(tuple(sorted((*sub,x))) for x in sub)
    for q in (2,3):
        masks = {(x,c):multiplier_mask(x,c,p,q)
                 for x in {x for s in candidates for x in s} for c in range(q)}
        candidates = {s for s in candidates if mixed_obstruction(s,masks,q)}
    assert not candidates, (p,candidates)
    print(f"Prime {p} passed ({len(sets)} distinct-support representatives).", flush=True)


def main():
    if not __debug__:
        raise RuntimeError("run with Python assertions enabled")
    for w in SHAPES:
        assert exact_maximum(w)==Fraction(1,8)
    bound = 28*21*15*10*6*3
    assert len(PRIMES)==len(set(PRIMES))
    assert all(all(p%d for d in range(2,isqrt(p)+1)) for p in PRIMES)
    assert all(Fraction(13,2*p)<Fraction(5,33)-Fraction(1,8) for p in PRIMES)
    assert prod(PRIMES)**2*7**7>bound**14
    with tempfile.TemporaryDirectory() as tmp:
        exe = Path(tmp)/"enumerate"
        subprocess.run(["c++","-O3","-std=c++20",HERE.parent/"tight-six-speeds/modular.cpp",
                        "-o",exe],check=True)
        for p in PRIMES:
            verify_prime(p,exe)
    print("All prime, norm, geometric lifting, and equality checks passed.")


if __name__=="__main__":
    main()
