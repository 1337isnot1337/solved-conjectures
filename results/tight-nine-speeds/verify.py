"""Check the KZ product bound and modular certificates for ten runners."""
from fractions import Fraction
from math import gcd, isqrt, lcm, prod
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
PRIMES = (71,73,79,83,89,97,101,103,107,109,113,127,131,137,
          139,149,151,157,163,167,173,179,181,191,193,197,199,211)


def main():
    if not __debug__:
        raise RuntimeError("run with Python assertions enabled")
    assert len(PRIMES)==len(set(PRIMES))
    assert all(all(p%d for d in range(2,isqrt(p)+1)) and 12*p>9*90 for p in PRIMES)
    forced = lcm(*range(2,10))
    assert gcd(forced,prod(PRIMES))==1
    prefix = [(2*(Fraction(1,10-i)-Fraction(1,10)))**2 for i in range(9)]
    increments = [b-a for a,b in zip(prefix,prefix[1:])]
    assert all(3*b>4*a for a,b in zip(increments,increments[1:]))
    assert (forced*prod(PRIMES))**2*(9*prod(increments))**9>1
    with tempfile.TemporaryDirectory() as tmp:
        enum, lifts = Path(tmp)/"enumerate", Path(tmp)/"lifts"
        for exe,source,flags in ((enum,ROOT/"tight-six-speeds/modular.cpp",[]),
                                 (lifts,ROOT/"tight-eight-speeds/lifts.cpp",["-DSPEED_COUNT=9"])):
            subprocess.run(["c++","-std=c++20","-O3",*flags,source,"-o",exe],check=True)
        for p in PRIMES:
            rows=subprocess.check_output([enum,"--list-tenths"],input=str(p),text=True)
            subprocess.run([lifts,str(p)],input=rows,text=True,check=True)
    print("The consecutive speeds give the unique primitive ten-runner equality case.")


if __name__=="__main__":
    main()
