"""Write plane certificates with direct scalar trees and finite proof blocks.

The certificate proposals are identical to the array version. Each small
interval of projective labels has its own exact Lean finite check.
"""

from argparse import ArgumentParser
from hashlib import sha256
import json
from pathlib import Path
from time import monotonic

from generate_lean_plane_fibers import certificate_text, generate


HERE = Path(__file__).resolve().parent


def render(prime, index, certificates, block_size, check_style="forall", literal_code=True):
    if check_style not in {"forall", "bool"}:
        raise ValueError(f"Unknown check style: {check_style}")
    namespace = f"Loneliness.FiveSpeedCertificate.PlaneTreeFibers.M{index}P{prime}"
    scalar = f"ScalarTrees.P{prime}"
    support = ("LonelinessFiveSpeedPlaneFiberBoolBlocks" if check_style == "bool"
               else "LonelinessFiveSpeedPlaneFiberTreeDefs")
    pieces = [
        f"import Conjectures.{support}\n",
        f"import Conjectures.LonelinessFiveSpeedScalarTreeMask{prime:04d}\n\n",
        "/-! Generated affine fibers, checked in separate finite intervals. -/\n",
        "set_option maxRecDepth 100000\nset_option maxHeartbeats 0\n",
        "set_option Elab.async false\n\n",
        f"namespace {namespace}\n\n",
    ]
    blocks = []
    for start in range(0, len(certificates), block_size):
        group = certificates[start:start + block_size]
        count = len(group)
        stop = start + count
        suffix = f"{start:04d}"
        declaration = "def" if literal_code else "noncomputable def"
        pieces += [
            f"{declaration} certificates{suffix} : Array FiberCertificate := #[\n",
            ",\n".join("  " + certificate_text(c) for c in group),
            "]\n\n",
        ]
        if check_style == "bool":
            pieces += [
                f"theorem checked{suffix} : canonicalTreeFiberBoolBlockCheck\n",
                f"    {prime} {scalar}.tree {index} {start} {count} certificates{suffix} = true := by\n",
                "  decide +kernel\n\n",
            ]
            soundness = "checked_canonical_tree_projective_bool_block"
        else:
            pieces += [
                f"theorem checked{suffix} : ∀ j : Fin {count},\n",
                f"    canonicalTreeFiberCheck {prime} {scalar}.tree {index}\n",
                f"      ⟨{start} + j.val, by omega⟩\n",
                f"      (certificates{suffix}[j.val]?.getD (.whole 0)) = true := by\n",
                "  decide +kernel\n\n",
            ]
            soundness = "checked_canonical_tree_projective_block"
        pieces += [
            f"theorem sound{suffix} : CanonicalProjectiveBlock {prime} {index} {start} {stop} :=\n",
            f"  {soundness} {prime} {scalar}.tree {index}\n",
            f"    {start} {count} (by decide) certificates{suffix} {scalar}.checked checked{suffix}\n\n",
        ]
        blocks.append((start, stop, suffix))
    pieces += [f"theorem sound : CanonicalProjectiveCover {prime} {index} := by\n"]
    previous = "sound0000"
    for start, stop, suffix in blocks[1:]:
        current = "h" + suffix
        pieces += [
            f"  have {current} : CanonicalProjectiveBlock {prime} {index} 0 {stop} :=\n",
            f"    canonicalProjectiveBlock_append {prime} {index} 0 {start} {stop}\n",
            f"      {previous} sound{suffix}\n",
        ]
        previous = current
    pieces += [f"  exact canonicalProjectiveCover_of_block {prime} {index} {previous}\n\n",
               f"end {namespace}\n"]
    return "".join(pieces), len(blocks)


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("--prime", type=int, required=True)
    parser.add_argument("--map", type=int, required=True, dest="map_index")
    parser.add_argument("--cover", type=Path, default=HERE / "cover.json")
    parser.add_argument("--certificate-input", type=Path)
    parser.add_argument("--json-output", type=Path, required=True)
    parser.add_argument("--lean-dir", type=Path, required=True)
    parser.add_argument("--block-size", type=int, default=32)
    parser.add_argument("--check-style", choices=["forall", "bool"], default="forall")
    parser.add_argument("--no-literal-code", action="store_true",
                        help="Keep literal definitions kernel-reducible without executable compilation")
    args = parser.parse_args()
    if args.block_size <= 0:
        parser.error("--block-size must be positive")
    started = monotonic()
    raw = args.cover.read_bytes()
    cover = json.loads(raw)
    if args.certificate_input:
        proposed = json.loads(args.certificate_input.read_text())
        assert proposed["prime"] == args.prime and proposed["map"] == args.map_index
        assert proposed["cover_sha256"] == sha256(raw).hexdigest()
        certificates = proposed["certificates"]
    else:
        certificates = generate(args.prime, cover[args.map_index])
    assert len(certificates) == args.prime + 2
    content, block_count = render(args.prime, args.map_index, certificates, args.block_size,
                                  args.check_style, not args.no_literal_code)
    name = f"LonelinessFiveSpeedPlaneTreeFiber{args.map_index}P{args.prime:04d}"
    args.lean_dir.mkdir(parents=True, exist_ok=True)
    (args.lean_dir / (name + ".lean")).write_text(content)
    lengths = [len(c.get("tokens", [])) for c in certificates]
    record = {
        "status": "proposed; Lean source, axiom and stock-kernel gates pending",
        "prime": args.prime, "map": args.map_index,
        "cover_sha256": sha256(raw).hexdigest(),
        "fibers": len(certificates), "blocks": block_count, "block_size": args.block_size,
        "check_style": args.check_style,
        "literal_code": not args.no_literal_code,
        "whole_fibers": sum(c["kind"] == "whole" for c in certificates),
        "tokens": sum(lengths), "max_tokens": max(lengths),
        "certificates": certificates, "module": "Conjectures." + name,
        "source_bytes": len(content.encode()), "source_sha256": sha256(content.encode()).hexdigest(),
    }
    args.json_output.write_text(json.dumps(record, separators=(",", ":")) + "\n")
    print(json.dumps({k: v for k, v in record.items() if k != "certificates"}
                     | {"elapsed_seconds": round(monotonic() - started, 3)}), flush=True)


if __name__ == "__main__":
    main()
