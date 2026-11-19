"""Write the literal bounded candidate list and checked rational witnesses."""

from argparse import ArgumentParser
from hashlib import sha256
import json
from math import gcd
from pathlib import Path


def nat_list(values):
    return "[" + ", ".join(map(str, values)) + "]"


def render(data):
    candidates = data["candidates"]
    exceptions = [row["speeds"] for row in candidates if "exception_s" in row]
    assert len(candidates) == 407 and len(exceptions) == 12
    assert len({tuple(row["speeds"]) for row in candidates}) == len(candidates)
    for row in candidates:
        speeds = row["speeds"]
        assert len(speeds) == 5 and 0 < speeds[0]
        assert all(a < b for a, b in zip(speeds, speeds[1:]))
        assert gcd(*speeds) == 1
    lines = []
    for row in candidates:
        witness = row.get("threshold_witness", {"denominator": 0, "numerator": 0})
        lines.append("  { speeds := " + nat_list(row["speeds"])
                     + f", denominator := {witness['denominator']}, numerator := {witness['numerator']} }}")
    return (
        "import Conjectures.LonelinessFiveSpeedBoundedCandidateDefs\n\n"
        "set_option maxRecDepth 100000\nset_option maxHeartbeats 0\n"
        "set_option Elab.async false\n\n"
        "namespace Loneliness.FiveSpeedCertificate\n\n"
        "def sporadicTuples : List (List ℕ) := [\n"
        + ",\n".join("  " + nat_list(speeds) for speeds in exceptions) + "]\n\n"
        + "def candidateEntries : List RationalCandidate := [\n"
        + ",\n".join(lines) + "]\n\n"
        + "def candidateTuples : List (List ℕ) := candidateEntries.map RationalCandidate.speeds\n\n"
        + "theorem candidateEntries_checked : candidateTableCheck sporadicTuples candidateEntries = true := by\n"
        + "  decide +kernel\n\n"
        + "theorem candidateTuples_low (speeds : List ℕ) (hmem : speeds ∈ candidateTuples)\n"
        + "    (hlow : Loneliness.value speeds < (1 / 5 : ℝ)) : speeds ∈ sporadicTuples :=\n"
        + "  candidateTableCheck_low sporadicTuples candidateEntries candidateEntries_checked speeds hmem hlow\n\n"
        + "theorem candidateTuples_length : candidateTuples.length = 407 := by decide +kernel\n\n"
        + "theorem sporadicTuples_length : sporadicTuples.length = 12 := by decide +kernel\n\n"
        + "theorem sporadicTuples_nodup : sporadicTuples.Nodup := by decide +kernel\n\n"
        + "end Loneliness.FiveSpeedCertificate\n"
    )


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("--data", type=Path, required=True)
    parser.add_argument("--lean-dir", type=Path, required=True)
    parser.add_argument("--manifest", type=Path)
    args = parser.parse_args()
    raw = args.data.read_bytes()
    content = render(json.loads(raw))
    name = "LonelinessFiveSpeedBoundedCandidates"
    args.lean_dir.mkdir(parents=True, exist_ok=True)
    (args.lean_dir / (name + ".lean")).write_text(content)
    record = {"status": "generated; Lean source, axiom and stock-kernel gates pending",
              "module": "Conjectures." + name, "candidates": 407, "exceptions": 12,
              "input_sha256": sha256(raw).hexdigest(), "source_bytes": len(content.encode()),
              "source_sha256": sha256(content.encode()).hexdigest()}
    if args.manifest:
        args.manifest.write_text(json.dumps(record, indent=2) + "\n")
    print(json.dumps(record))


if __name__ == "__main__":
    main()
