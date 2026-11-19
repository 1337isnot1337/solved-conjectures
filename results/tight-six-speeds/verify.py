"""Replay the strict six-speed classification and the seven-coordinate plane test."""
from math import isqrt, prod
from pathlib import Path
import subprocess
from tempfile import TemporaryDirectory

HERE = Path(__file__).resolve().parent
PRIMES = (
    257,271,307,313,359,373,379,383,389,397,401,409,419,433,439,443,449,463,
    467,479,491,499,509,521,541,547,557,563,571,577,587,593,601,607,613,617,
    631,641,643,647,653,659,661,673,677,683,691,701,709,719,727,733,739,
)


def main():
    if not __debug__:
        raise RuntimeError("run with Python assertions enabled")
    assert len(PRIMES)==len(set(PRIMES))
    assert all(p>=53 and all(p%d for d in range(2,isqrt(p)+1)) for p in PRIMES)
    bound = 21*30**4
    limit = 91**6 * bound**18
    assert prod(PRIMES)>limit
    with TemporaryDirectory() as tmp:
        for name in ("modular","planes"):
            exe = Path(tmp)/name
            subprocess.run(["c++","-O3","-std=c++20",str(HERE/(name+".cpp")),"-o",exe],check=True)
            if name=="planes":
                subprocess.run([exe],check=True)
                continue
            output = subprocess.check_output([exe],input=" ".join(map(str,PRIMES)),text=True)
            results = [tuple(map(int,row.split())) for row in output.splitlines()]
            assert results == [(p,1) for p in PRIMES]
            print(f"All {len(PRIMES)} finite fields passed. Prime product exceeds "
                  f"the obstruction bound by a factor greater than {prod(PRIMES)//limit}.",flush=True)


if __name__=="__main__":
    main()
