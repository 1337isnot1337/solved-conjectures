"""Generate separate base-coordinate checks for a normalized root cover.

The finite checker computes every eligible remaining coordinate and checks
its witness or structural conclusion. No omitted search output is assumed.
"""

from argparse import ArgumentParser
from hashlib import sha256
import json
from pathlib import Path


def render(prime):
    scalar = f"ScalarTrees.P{prime}"
    namespace = f"Loneliness.FiveSpeedCertificate.RootStars.P{prime}"
    half = prime // 2
    pieces = [
        "import Conjectures.LonelinessFiveSpeedRootStar\n",
        f"import Conjectures.LonelinessFiveSpeedScalarTreeMask{prime:04d}\n\n",
        "set_option maxRecDepth 100000\nset_option maxHeartbeats 0\n",
        "set_option Elab.async false\n\n",
        f"namespace {namespace}\n\n",
    ]
    for base in range(half + 1):
        pieces += [
            f"theorem checked{base:04d} : rootStarBaseCheck {prime}\n",
            f"    (treeMask {prime} {scalar}.tree) (treeInverse {scalar}.tree)\n",
            f"    (rootStarLeaf {prime}) {base} = true := by\n",
            "  decide +kernel\n\n",
        ]
    pieces += [
        f"theorem checked : ∀ b : Fin {half + 1}, rootStarBaseCheck {prime}\n",
        f"    (treeMask {prime} {scalar}.tree) (treeInverse {scalar}.tree)\n",
        f"    (rootStarLeaf {prime}) b.val = true := by\n",
        "  intro b\n  fin_cases b\n",
    ]
    pieces += [f"  · exact checked{base:04d}\n" for base in range(half + 1)]
    pieces += [
        f"\ntheorem sound : Loneliness.FiveSpeedRoot.NormalizedRootCover {prime}\n",
        f"    (treeInverse {scalar}.tree) := by\n",
        f"  apply normalizedRootCover_of_rootStarChecks {prime}\n",
        f"    (treeMask {prime} {scalar}.tree) (treeInverse {scalar}.tree) {scalar}.sound\n",
        "  intro b hb\n  exact checked ⟨b, by omega⟩\n\n",
        f"end {namespace}\n",
    ]
    return "".join(pieces)


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("--prime", type=int, required=True)
    parser.add_argument("--lean-dir", type=Path, required=True)
    parser.add_argument("--manifest", type=Path)
    args = parser.parse_args()
    content = render(args.prime)
    name = f"LonelinessFiveSpeedRootStarP{args.prime:04d}"
    args.lean_dir.mkdir(parents=True, exist_ok=True)
    (args.lean_dir / (name + ".lean")).write_text(content)
    record = {"status": "generated; Lean source, axiom and stock-kernel gates pending",
              "prime": args.prime, "module": "Conjectures." + name,
              "base_checks": args.prime // 2 + 1, "source_bytes": len(content.encode()),
              "sha256": sha256(content.encode()).hexdigest()}
    if args.manifest:
        args.manifest.write_text(json.dumps(record, indent=2) + "\n")
    print(json.dumps(record))


if __name__ == "__main__":
    main()
