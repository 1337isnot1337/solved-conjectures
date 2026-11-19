"""Verify every certificate used for the nine-runner equality theorem."""
from math import isqrt, lcm, prod
from pathlib import Path
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
PRIMES = (71,89,97,101,107,113,131,137,139,149,151,157,163,167,173,179,
          181,191,193,197,199,211,223,227,229,233)


def main():
    if not __debug__:
        raise RuntimeError("run with Python assertions enabled")
    assert len(PRIMES)==len(set(PRIMES))
    assert all(all(p%d for d in range(2,isqrt(p)+1)) for p in PRIMES)
    assert all(2*(6*p)>8*72 for p in PRIMES)
    bound=36*28*21*15*10*6*3
    assert (lcm(*range(2,9))*prod(PRIMES))**2 * 8**8 > bound**16
    with tempfile.TemporaryDirectory() as tmp:
        tmp=Path(tmp)
        enum, lifts=tmp/"enumerate", tmp/"lifts"
        for exe,source in ((enum,HERE.parent/"tight-six-speeds/modular.cpp"),
                           (lifts,HERE/"lifts.cpp")):
            subprocess.run(["c++","-std=c++20","-O3",source,"-o",exe],check=True)
        for p in PRIMES:
            rows=subprocess.check_output([enum,"--list-ninths"],input=str(p),text=True)
            subprocess.run([lifts,str(p)],input=rows,text=True,check=True)
    print("The consecutive speeds give the unique primitive nine-runner equality case.")


if __name__=="__main__":
    main()
