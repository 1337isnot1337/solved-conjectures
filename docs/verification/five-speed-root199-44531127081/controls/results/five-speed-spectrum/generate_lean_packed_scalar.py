#!/usr/bin/env python3
"""Pack the masks of an existing literal scalar tree.

The generated Lean theorem checks every packed block against the original
tree by kernel reduction. Parsing or packing mistakes therefore cannot
change the oracle accepted by the soundness theorem.
"""

from argparse import ArgumentParser
from pathlib import Path
import hashlib
import json
import re


def main() -> None:
    parser = ArgumentParser()
    parser.add_argument("prime", type=int, nargs="?", default=1789)
    parser.add_argument("--lean-root", type=Path)
    args = parser.parse_args()
    repo = Path(__file__).resolve().parents[1]
    lean = args.lean_root or repo / "l-solitaire-limit-shapes" / "lean"
    source = lean / "Conjectures" / f"LonelinessFiveSpeedScalarTreeMask{args.prime:04d}.lean"
    masks = [0] + [int(value, 16) for value in
                   re.findall(r"mask := 0x([0-9a-fA-F]+)", source.read_text())]
    assert len(masks) == args.prime // 2 + 1
    packed = 0
    for index, mask in enumerate(masks):
        assert 0 <= mask < 1 << args.prime
        packed |= mask << (args.prime * index)
    module = f"LonelinessFiveSpeedPackedScalar{args.prime}"
    target = lean / "Conjectures" / f"{module}.lean"
    text = f"""import Conjectures.LonelinessFiveSpeedPackedScalar
import Conjectures.LonelinessFiveSpeedScalarTreeMask{args.prime:04d}

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.PackedScalars.P{args.prime}

/-! A literal packed oracle. Its finite equality certificate is checked
against the existing scalar tree, including the zero block. -/

noncomputable def packed : ℕ := nat_lit 0x{packed:x}

noncomputable def mask : ℕ → ℕ := packedScalarMask {args.prime} packed

theorem checked :
    packedScalarTreeCheck {args.prime} packed ScalarTrees.P{args.prime}.tree = true := by
  decide +kernel

theorem mask_eq_treeMask :
    mask = treeMask {args.prime} ScalarTrees.P{args.prime}.tree :=
  packedScalarMask_eq_treeMask_function {args.prime} packed ScalarTrees.P{args.prime}.tree checked

theorem sound (a : ℕ) : GoodMask {args.prime} a (mask a) :=
  packedScalarTreeCheck_sound {args.prime} packed ScalarTrees.P{args.prime}.tree
    ScalarTrees.P{args.prime}.checked checked a

end Loneliness.FiveSpeedCertificate.PackedScalars.P{args.prime}
"""
    target.write_text(text)
    print(json.dumps({"module": "Conjectures." + module,
                      "prime": args.prime,
                      "blocks": len(masks),
                      "packed_bits": packed.bit_length(),
                      "source_bytes": target.stat().st_size,
                      "tree_source_sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
                      "generated_source_sha256": hashlib.sha256(target.read_bytes()).hexdigest()},
                     indent=2))


if __name__ == "__main__":
    main()
