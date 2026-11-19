"""Propose balanced scalar trees for exact Lean kernel checks.

The branch counts and every scalar-mask entry are checked inside Lean.
Balancing changes the cost of direct lookup; it adds no proof assumption.
"""

from argparse import ArgumentParser
from hashlib import sha256
import json
from pathlib import Path

from generate_lean_scalar_masks import entries


def tree_text(table, indent=2):
    padding = " " * indent
    if len(table) == 1:
        inverse, mask = table[0]
        return padding + f"(.leaf {{ inverse := {inverse}, mask := 0x{mask:x} }})"
    middle = len(table) // 2
    return (padding + f"(.branch {middle}\n"
            + tree_text(table[:middle], indent + 2) + "\n"
            + tree_text(table[middle:], indent + 2) + ")")


def render(prime, table, prime_method="decide"):
    namespace = f"Loneliness.FiveSpeedCertificate.ScalarTrees.P{prime}"
    prime_import = ("Mathlib.Tactic.NormNum.Prime" if prime_method == "norm_num"
                    else "Mathlib.Data.Nat.Prime.Basic")
    prime_proof = "norm_num" if prime_method == "norm_num" else "decide +kernel"
    return (
        "import Conjectures.LonelinessFiveSpeedScalarTree\n"
        f"import {prime_import}\n\n"
        "set_option maxRecDepth 20000\n"
        "set_option maxHeartbeats 0\n"
        "set_option Elab.async false\n\n"
        f"namespace {namespace}\n\n"
        "/-! Exact half-table stored as a counted balanced tree. -/\n\n"
        "def tree : ScalarTree :=\n" + tree_text(table) + "\n\n"
        f"theorem prime : Nat.Prime {prime} := by {prime_proof}\n\n"
        f"theorem checked : scalarTreeCheck {prime} tree = true := by\n"
        "  decide +kernel\n\n"
        "theorem valid : tree.valid = true :=\n"
        f"  scalarTreeCheck_valid {prime} tree checked\n\n"
        f"theorem sound (u : ℕ) : GoodMask {prime} u (treeMask {prime} tree u) :=\n"
        f"  scalarTreeCheck_sound {prime} tree checked u\n\n"
        f"theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ {prime}) :\n"
        f"    u * treeInverse tree u % {prime} = 1 % {prime} :=\n"
        f"  scalarTreeCheck_inverse {prime} tree checked u hu hhalf\n\n"
        f"end {namespace}\n"
    )


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("--primes", nargs="*", type=int, default=[])
    parser.add_argument("--prime-list", type=Path)
    parser.add_argument("--lean-dir", type=Path, required=True)
    parser.add_argument("--manifest", type=Path)
    parser.add_argument("--prime-method", choices=("decide", "norm_num"), default="decide",
                        help="Proof-producing primality tactic; table checks always use the kernel")
    args = parser.parse_args()
    primes = set(args.primes)
    if args.prime_list:
        primes.update(json.loads(args.prime_list.read_text()))
    if not primes:
        parser.error("Supply --primes or --prime-list")
    args.lean_dir.mkdir(parents=True, exist_ok=True)
    records = []
    for prime in sorted(primes):
        table = entries(prime)
        name = f"LonelinessFiveSpeedScalarTreeMask{prime:04d}"
        content = render(prime, table, args.prime_method)
        (args.lean_dir / (name + ".lean")).write_text(content)
        records.append({"prime": prime, "module": "Conjectures." + name,
                        "prime_method": args.prime_method,
                        "entries": len(table), "maximum_lookup_depth": (len(table)-1).bit_length(),
                        "source_bytes": len(content.encode()),
                        "sha256": sha256(content.encode()).hexdigest()})
    manifest = {"status": "generated; Lean source, axiom and stock-kernel gates pending",
                "primes": records}
    if args.manifest:
        args.manifest.write_text(json.dumps(manifest, indent=2) + "\n")
    print(json.dumps({"modules": len(records),
                      "entries": sum(r["entries"] for r in records),
                      "source_bytes": sum(r["source_bytes"] for r in records)},
                     sort_keys=True))


if __name__ == "__main__":
    main()
