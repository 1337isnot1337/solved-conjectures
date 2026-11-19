"""Write exact scalar-mask data for the five-speed modular certificates.

Each output theorem checks the entire half-table in Lean. The generated
integers and this program are not trusted proof premises.
"""

from argparse import ArgumentParser
from hashlib import sha256
import json
from math import isqrt
from pathlib import Path


HERE = Path(__file__).resolve().parent


def entries(prime):
    if prime < 2 or any(prime % d == 0 for d in range(2, isqrt(prime) + 1)):
        raise ValueError(f"Not prime: {prime}")
    lower, upper = (prime + 4) // 5, 4 * prime // 5
    modulus = (1 << prime) - 1
    result = []
    for multiplier in range(1, prime // 2 + 1):
        inverse = pow(multiplier, -1, prime)
        mask = 0
        for a in range(lower, upper + 1):
            mask |= 1 << (inverse * a % prime)
        assert 0 <= mask < modulus
        assert (((1 << inverse) - 1) * mask
                + (1 << (inverse * lower % prime))) % modulus == (
                    1 << (inverse * (upper + 1) % prime)) % modulus
        result.append((inverse, mask))
    return result


def render(prime, table):
    return (
        "import Conjectures.LonelinessFiveSpeedScalarTable\n"
        "import Mathlib.Data.Nat.Prime.Basic\n\n"
        "set_option maxRecDepth 20000\n"
        "set_option maxHeartbeats 0\n\n"
        f"namespace Loneliness.FiveSpeedCertificate.ScalarMasks.P{prime}\n\n"
        "/-! Exact half-table; every stored mask is checked by a geometric congruence. -/\n\n"
        "def table : Array ScalarMaskEntry := #[\n"
        + ",\n".join(f"  {{ inverse := {inverse}, mask := 0x{mask:x} }}"
                      for inverse, mask in table)
        + "]\n\n"
        f"theorem prime : Nat.Prime {prime} := by decide +kernel\n\n"
        f"theorem checked : scalarTableCheck {prime} table = true := by\n"
        "  decide +kernel\n\n"
        f"theorem sound (u : ℕ) : GoodMask {prime} u (scalarMask {prime} table u) :=\n"
        f"  scalarTableCheck_sound {prime} table checked u\n\n"
        f"end Loneliness.FiveSpeedCertificate.ScalarMasks.P{prime}\n"
    )


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("--primes", nargs="*", type=int, default=[])
    parser.add_argument("--prime-list", type=Path,
                        help="JSON array of additional prime moduli")
    parser.add_argument("--lean-dir", type=Path, required=True)
    parser.add_argument("--manifest", type=Path)
    args = parser.parse_args()
    primes = set(args.primes)
    if args.prime_list:
        primes.update(json.loads(args.prime_list.read_text()))
    if not primes:
        parser.error("Supply --primes or --prime-list")
    args.lean_dir.mkdir(parents=True, exist_ok=True)
    records = []
    for p in sorted(primes):
        table = entries(p)
        name = f"LonelinessFiveSpeedScalarMask{p:04d}"
        text = render(p, table)
        path = args.lean_dir / (name + ".lean")
        path.write_text(text)
        records.append({"prime": p, "module": "Conjectures." + name,
                        "entries": len(table), "source_bytes": len(text.encode()),
                        "sha256": sha256(text.encode()).hexdigest()})
    manifest = {"status": "generated; Lean source, axiom and kernel gates pending",
                "primes": records}
    if args.manifest:
        args.manifest.write_text(json.dumps(manifest, indent=2) + "\n")
    print(json.dumps({"modules": len(records),
                      "entries": sum(r["entries"] for r in records),
                      "source_bytes": sum(r["source_bytes"] for r in records)},
                     sort_keys=True))


if __name__ == "__main__":
    main()
