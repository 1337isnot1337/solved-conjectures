"""Replay selected CRT classes, then inspect every number left by the sieve."""
import argparse
import json
import subprocess
from math import gcd, isqrt
from pathlib import Path

from rank_residues import primes_up_to


def all_shifts(problem, bound):
    # Build the sequences independently of the ranking routine.
    if problem == "hou":
        from math import comb
        a, b = 0, 1
        fib = set()
        while b < bound:
            fib.add(b)
            a, b = b, a + b
        result = set()
        j = 0
        while (c := comb(2 * j, j) // (j + 1)) < bound:
            result.update(c + f for f in fib if c + f <= bound - 3)
            j += 1
        return sorted(result)
    prime_squares = [p * p for p in primes_up_to(isqrt(bound))]
    values = set()
    for a in range(bound.bit_length()):
        five = 1
        while (value := 2**a + (2 if problem == "sun-odd" else 1) * five) <= bound - 3:
            if value % 2 == (0 if problem == "sun-odd" else 1):
                values.add(value)
            five *= 5
    # The small set of shifts is held fixed as squares are excluded.
    for square in prime_squares:
        values.difference_update(x for x in tuple(values) if x % square == 0)
    return sorted(values)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("binary", type=Path)
    parser.add_argument("manifest", type=Path)
    parser.add_argument("--start", type=int, default=0)
    parser.add_argument("--stop", type=int)
    args = parser.parse_args()
    data = json.loads(args.manifest.read_text())
    classes = data["classes"][args.start:args.stop]
    if not classes:
        parser.error("empty class list")
    low, high, modulus = (data[k] for k in ("low", "high", "modulus"))
    shifts = data["shifts"]
    if all_shifts(data["problem"], high) != shifts:
        raise ValueError("independent sequence generation differs from manifest")
    for item in classes:
        assert sum(gcd(item["residue"] - s, modulus) == 1 for s in shifts) == item["score"]
    header = f"{low} {high} {modulus} {len(shifts)} {len(classes)}"
    inputs = "\n".join([header, " ".join(map(str, shifts)),
                        " ".join(str(item["residue"]) for item in classes)])
    with subprocess.Popen([str(args.binary.resolve()), "--ranked-shifts"], stdin=subprocess.PIPE,
                          stdout=subprocess.PIPE, text=True) as proc:
        proc.stdin.write(inputs)
        proc.stdin.close()
        pending = []
        for line in proc.stdout:
            print(line, end="", flush=True)
            if line.startswith("needs full check "):
                pending.append(int(line.split()[-1]))
        if proc.wait():
            raise RuntimeError("sieve failed")
    if not pending:
        return
    primes = primes_up_to(isqrt(max(pending)))
    for n in pending:
        composite = {}
        for s in shifts:
            r = n - s
            if r < 3 or r % 2 == 0:
                continue
            factor = None
            for p in primes:
                if p * p > r:
                    break
                if r % p == 0:
                    factor = p
                    break
            if factor is None:
                print(f"full check found witness n={n}, shift={s}, odd prime={r}", flush=True)
                break
            composite[str(s)] = factor
        else:
            print(json.dumps(dict(counterexample=n, problem=data["problem"],
                                  composite_residual_factors=composite)), flush=True)


if __name__ == "__main__":
    main()
