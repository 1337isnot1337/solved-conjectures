"""Independent exact checks for the conjugate Gaussian search.

These checks validate identities and a small overlap search. They do not prove
global completeness, novelty, or prize eligibility.
"""
import argparse
import importlib.util
import json
from math import gcd, isqrt
from pathlib import Path
import subprocess
import sympy as sp


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--binary", default="/tmp/conjugate-gaussian-search")
    args = ap.parse_args()
    here = Path(__file__).resolve().parent
    spec = importlib.util.spec_from_file_location(
        "independent_verifier", here.parent / "jsp-gaussian" / "verify_candidates.py")
    verifier = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(verifier)

    s, t, b, x, y = sp.symbols("s t b x y")
    families = [
        (-2*s**4, s*t, -4*(s*t)**4, (4*s**8-t**4)/3),
        (54*s**4, 3*s*t, -4*(3*s*t)**4, 972*s**8+t**4),
        (-216*s**4, 6*s*t, (6*s*t)**4, 15552*s**8+t**4),
    ]
    for a, c, target, b2 in families:
        assert sp.expand(2*a*(a*a-3*b2)-target) == 0
    U, V = 2*(y+x*x), 4*x*(y+x*x)
    residual = sp.expand(V*V-U**3+3888*U)
    quotient, remainder = sp.div(residual, y*y-x**4-972, y)
    assert remainder == 0
    assert sp.expand((216*y)**2-(36*x)**3+3888*(36*x)) == 46656*(y*y-x**3+3*x)

    r=sp.symbols("r", nonzero=True)
    f=-2*(r**8-84*r**6+630*r**4-756*r**2+81)
    assert sp.expand(f/r**4-(-2*(r+3/r)**4+192*(r+3/r)**2-2304))==0
    assert sp.expand(f/r**4-(-2*(r-3/r)**4+144*(r-3/r)**2-288))==0

    # Exhaust all t in the first family for s<=100, independently of UFD code.
    direct = set()
    for ss in range(1,101):
        for tt in range(1,isqrt(2*ss**4)+1):
            r = 4*ss**8-tt**4
            if r<=0 or r%3:
                continue
            bb = isqrt(r//3)
            if 3*bb*bb == r and gcd(2*ss**4,bb)==1:
                direct.add((ss,tt,bb))
    run = subprocess.run([args.binary,"100"],capture_output=True,text=True,check=True)
    structural = set()
    for line in run.stdout.splitlines():
        row=json.loads(line)
        bases, exponents=verifier.decode(row)
        check=verifier.verify(bases,exponents)
        assert check["identity"] and check["hyperbolic"] and check["nonunit"]
        assert check["pairwise_gcd_norms"]==[1,1,1]
        structural.add((row["s"],int(row["t"]),abs(bases[0][1])))
    assert structural==direct

    full_rows=[]
    known={verifier.power_key(b,e):name for name,b,e in verifier.KNOWN}
    for line in (here/"conjugate-candidates.jsonl").read_text().splitlines():
        row=json.loads(line)
        bases, exponents=verifier.decode(row)
        check=verifier.verify(bases,exponents)
        assert check["identity"] and check["hyperbolic"] and check["nonunit"]
        assert check["pairwise_gcd_norms"]==[1,1,1]
        full_rows.append({"s":row["s"],"t":row["t"],"known":known.get(verifier.power_key(bases,exponents)),**check})
    print(json.dumps({"symbolic_family_identities":True,"elliptic_map_identity":True,
                      "genus3_quotient_identities":True,
                      "small_overlap_s_bound":100,"small_overlap_hits":sorted(direct),
                      "full_search_candidates":full_rows},indent=2))


if __name__=="__main__":
    main()
