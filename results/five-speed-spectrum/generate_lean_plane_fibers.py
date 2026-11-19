"""Propose compressed modular plane certificates for Lean kernel checking.

Every affine fiber is covered by roots of the permitted structural forms
and a short list of scalar multipliers. The search is not a proof premise.
The generated Lean module checks the full coverage using the scalar masks.
"""

from argparse import ArgumentParser
from hashlib import sha256
import json
from pathlib import Path
from time import monotonic

from generate_lean_scalar_masks import entries


HERE = Path(__file__).resolve().parent


def rotate(prime, mask, shift):
    shift %= prime
    return ((mask >> shift) | (mask << (prime - shift))) & ((1 << prime) - 1)


def affine_row(prime, row, x, y):
    offset = (row[0] * x + row[1] * y) % prime
    slope = row[2] % prime
    return offset, slope, pow(slope, -1, prime) if slope else 0


def fiber(prime, masks, matrix, forms, x, y):
    full = (1 << prime) - 1
    rows = [affine_row(prime, row, x, y) for row in matrix]
    roots = {}
    for i, row in enumerate(forms):
        a, c, inverse = affine_row(prime, row, x, y)
        if c == 0:
            if a == 0:
                return {"kind": "whole", "form": i}
        else:
            roots.setdefault(-a * inverse % prime, i)
    remaining = full
    for root in roots:
        remaining &= ~(1 << root)
    tokens = []
    options = []
    for t in range(1, prime // 2 + 1):
        mask = full
        for a, c, inverse in rows:
            if c == 0:
                r = t * a % prime
                if 5 * min(r, prime - r) < prime:
                    mask = 0
                    break
            else:
                mask &= rotate(prime, masks[t * c % prime], a * inverse)
        if mask & remaining:
            options.append((t, mask))
    while remaining:
        if not options:
            raise ValueError(f"Uncovered fiber p={prime}, x={x}, y={y}")
        t, mask = max(options, key=lambda option: (option[1] & remaining).bit_count())
        covered = remaining & mask
        if not covered:
            raise ValueError(f"Uncovered residue p={prime}, x={x}, y={y}")
        tokens.append(t)
        remaining &= ~mask
    return {"kind": "covered",
            "roots": [[form, root] for root, form in sorted(roots.items())],
            "tokens": tokens}


def generate(prime, space):
    table = entries(prime)
    half_masks = [0] + [entry[1] for entry in table]
    masks = [half_masks[min(t, prime - t)] for t in range(prime)]
    matrix = space["map"]
    forms = matrix + space["lines"]
    certificates = [fiber(prime, masks, matrix, forms, 1, y) for y in range(prime)]
    certificates.append(fiber(prime, masks, matrix, forms, 0, 1))
    certificates.append(fiber(prime, masks, matrix, forms, 0, 0))
    return certificates


def certificate_text(certificate):
    if certificate["kind"] == "whole":
        return ".whole " + str(certificate["form"])
    roots = ", ".join("⟨" + str(form) + ", " + str(root) + "⟩"
                      for form, root in certificate["roots"])
    tokens = ", ".join(map(str, certificate["tokens"]))
    return ".covered [" + roots + "] [" + tokens + "]"


def render(prime, index, certificates):
    namespace = f"Loneliness.FiveSpeedCertificate.PlaneFibers.M{index}P{prime}"
    scalar = f"ScalarMasks.P{prime}"
    return (
        "import Conjectures.LonelinessFiveSpeedPlaneFiberDefs\n"
        f"import Conjectures.LonelinessFiveSpeedScalarMask{prime:04d}\n\n"
        "/-! Generated affine-fiber coverage. Every bit is checked by the kernel. -/\n"
        "set_option maxRecDepth 100000\n"
        "set_option maxHeartbeats 0\n"
        "set_option Elab.async false\n\n"
        f"namespace {namespace}\n\n"
        "def certificates : Array FiberCertificate := #[\n"
        + ",\n".join("  " + certificate_text(c) for c in certificates)
        + "]\n\n"
        f"theorem checked : ∀ i : Fin ({prime} + 2),\n"
        f"    canonicalFiberCheck {prime} {scalar}.table {index} i\n"
        "      (certificates[i.val]?.getD (.whole 0)) = true := by\n"
        "  decide +kernel\n\n"
        f"theorem sound : CanonicalProjectiveCover {prime} {index} :=\n"
        f"  checked_canonical_projective_cover {prime} {scalar}.table {index}\n"
        f"    certificates {scalar}.checked checked\n\n"
        f"end {namespace}\n"
    )


def render_map_data(cover):
    def vector(row):
        return "![" + ", ".join(map(str, row)) + "]"

    return (
        "import Conjectures.LonelinessFiveSpeedRelationData\n\n"
        "/-! Exact parameter forms used by the nine modular plane covers. -/\n"
        "namespace Loneliness.FiveSpeedCertificate\n\n"
        "def planeParameterForms : Fin 9 → List ThreeIntegerVector := ![\n"
        + ",\n".join("  [" + ",\n   ".join(vector(row) for row in space["lines"])
                       + "]" for space in cover)
        + "]\n\n"
        "def planeStructuralForms (k : Fin 9) : List ThreeIntegerVector :=\n"
        "  List.ofFn (canonicalMaps k) ++ planeParameterForms k\n\n"
        "end Loneliness.FiveSpeedCertificate\n"
    )


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("--prime", type=int, required=True)
    parser.add_argument("--map", type=int, required=True, dest="map_index")
    parser.add_argument("--cover", type=Path, default=HERE / "cover.json")
    parser.add_argument("--json-output", type=Path, required=True)
    parser.add_argument("--lean-dir", type=Path)
    parser.add_argument("--write-map-data", action="store_true")
    args = parser.parse_args()
    started = monotonic()
    raw = args.cover.read_bytes()
    cover = json.loads(raw)
    certificates = generate(args.prime, cover[args.map_index])
    lengths = [len(c.get("tokens", [])) for c in certificates]
    record = {
        "status": "proposed; Lean source, axiom and stock-kernel gates pending",
        "prime": args.prime, "map": args.map_index,
        "cover_sha256": sha256(raw).hexdigest(),
        "fibers": len(certificates),
        "whole_fibers": sum(c["kind"] == "whole" for c in certificates),
        "tokens": sum(lengths), "max_tokens": max(lengths),
        "certificates": certificates,
    }
    if args.lean_dir:
        name = f"LonelinessFiveSpeedPlaneFiber{args.map_index}P{args.prime:04d}"
        text = render(args.prime, args.map_index, certificates)
        args.lean_dir.mkdir(parents=True, exist_ok=True)
        (args.lean_dir / (name + ".lean")).write_text(text)
        record.update(module="Conjectures." + name, source_bytes=len(text.encode()),
                      source_sha256=sha256(text.encode()).hexdigest())
        if args.write_map_data:
            (args.lean_dir / "LonelinessFiveSpeedPlaneFiberData.lean").write_text(
                render_map_data(cover))
    args.json_output.write_text(json.dumps(record, separators=(",", ":")) + "\n")
    print(json.dumps({k: v for k, v in record.items() if k != "certificates"}
                     | {"elapsed_seconds": round(monotonic() - started, 3)}), flush=True)


if __name__ == "__main__":
    main()
