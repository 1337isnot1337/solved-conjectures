"""Generate the 200 H-line certificates and the original 164 two-column maps.

The Python checks protect the generator and preserve map numbering.  Formal
verification is performed by the generated Lean checks and their soundness
theorems; these Python checks are not a proof gate.
"""

from __future__ import annotations

import argparse
from collections import Counter
from hashlib import sha256
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
PATTERNS = ((1, 2, 3, 4), (1, 3, 4, 7))
PREFIX = "LonelinessFiveSpeedLineReduction"


def digest(path: Path) -> str:
    return sha256(path.read_bytes()).hexdigest()


def default_lean_dir() -> Path:
    for parent in HERE.parents:
        for candidate in (parent / "lean", parent / "l-solitaire-limit-shapes" / "lean"):
            if (candidate / "Conjectures").is_dir():
                return candidate
    raise FileNotFoundError("Pass --lean-dir with the Lean project directory")


def vector(values) -> str:
    return "![" + ", ".join(map(str, values)) + "]"


def bool_vector(values) -> str:
    return vector("true" if value else "false" for value in values)


def matrix(rows) -> str:
    return vector(vector(row) for row in rows)


def eliminate(a, h, pivot):
    free = [j for j in range(3) if j != pivot]
    return [[row[j] * h[pivot] - row[pivot] * h[j] for j in free] for row in a]


def repeated_payload(rows):
    for i in range(5):
        for j in range(i + 1, 5):
            for negative in (False, True):
                sign = -1 if negative else 1
                if rows[i] == [sign * value for value in rows[j]]:
                    return {"left": i, "right": j, "negative": negative}
    return None


def critical_payload(rows):
    for root in range(5):
        for second, pattern in enumerate(PATTERNS):
            selected = []
            negative = []
            for multiplier in pattern:
                found = None
                for row in range(5):
                    for neg in (False, True):
                        sign = -1 if neg else 1
                        if rows[row] == [sign * multiplier * value for value in rows[root]]:
                            found = (row, neg)
                            break
                    if found is not None:
                        break
                if found is None:
                    break
                selected.append(found[0])
                negative.append(found[1])
            if len(selected) == 4:
                return {"second": bool(second), "root": root,
                        "selected": selected, "negative": negative}
    return None


def render_case(case):
    if case["kind"] == "image":
        disposition = f".image {case['map']}"
    elif case["kind"] == "repeated":
        p = case["payload"]
        disposition = f".repeated {p['left']} {p['right']} " + str(p["negative"]).lower()
    else:
        p = case["payload"]
        payload = ("{ second := " + str(p["second"]).lower()
                   + f", root := {p['root']}, selected := {vector(p['selected'])}"
                   + f", negative := {bool_vector(p['negative'])} }}")
        disposition = ".critical " + payload
    return f"{{ pivot := {case['pivot']}, disposition := {disposition} }}"


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--cover", type=Path, default=HERE / "cover.json")
    parser.add_argument("--lean-dir", type=Path)
    parser.add_argument("--provenance", type=Path,
                        help="Check exact map IDs and origins against the saved provenance JSON")
    parser.add_argument("--metadata", type=Path, default=HERE / "line-certificate-data.json")
    args = parser.parse_args()
    lean_dir = args.lean_dir or default_lean_dir()
    output_dir = lean_dir / "Conjectures"
    spaces = json.loads(args.cover.read_text())
    assert len(spaces) == 9
    maps = []
    map_lookup = {}
    tables = []
    counts = Counter()
    for space_index, space in enumerate(spaces):
        a = space["map"]
        assert len(a) == 5 and all(len(row) == 3 for row in a)
        table = []
        for line_index, h in enumerate(space["lines"]):
            assert len(h) == 3 and any(h)
            pivot = min((j for j in range(3) if h[j]), key=lambda j: abs(h[j]))
            b = eliminate(a, h, pivot)
            assert all(row != [0, 0] for row in b), (space_index, line_index, "zero row")
            case = {"space": space_index, "line": line_index,
                    "pivot": pivot, "pivot_value": h[pivot]}
            repeated = repeated_payload(b)
            critical = critical_payload(b)
            if repeated is not None:
                case.update(kind="repeated", payload=repeated)
            elif critical is not None:
                case.update(kind="critical", payload=critical)
                counts["critical1347" if critical["second"] else "critical1234"] += 1
            else:
                key = tuple(map(tuple, b))
                if key not in map_lookup:
                    index = len(maps)
                    map_lookup[key] = index
                    row_bounds = [sum(map(abs, row)) for row in b]
                    bound = max(row_bounds)
                    assert 0 < bound <= 17
                    x_row = next(i for i, row in enumerate(b) if row[0] and row[1] == 0)
                    y_row = next(i for i, row in enumerate(b) if row[0] == 0 and row[1])
                    maps.append({"id": index, "matrix": b, "origins": [], "L": bound,
                                 "xRow": x_row, "yRow": y_row,
                                 "maxRow": row_bounds.index(bound)})
                index = map_lookup[key]
                maps[index]["origins"].append([space_index, line_index, pivot, h[pivot]])
                case.update(kind="image", map=index)
            counts[case["kind"]] += 1
            table.append(case)
        tables.append(table)
    assert len(maps) == 164
    assert sum(map(len, tables)) == 200
    assert counts == {"image": 166, "critical": 30, "repeated": 4,
                      "critical1234": 22, "critical1347": 8}
    if args.provenance:
        reference = json.loads(args.provenance.read_text())
        assert len(reference["maps"]) == len(maps)
        for actual, expected in zip(maps, reference["maps"]):
            for key in ("id", "matrix", "origins"):
                assert actual[key] == expected[key], (actual["id"], key)

    data = [f"import Conjectures.{PREFIX}Defs",
            "import Conjectures.LonelinessFiveSpeedPlaneFiberData", "",
            "/-! Generated exact integer data for the 200 parameter relations.",
            "Map indices follow the original verifier's first-occurrence order. -/", "",
            "namespace Loneliness.FiveSpeedCertificate", "", "open Matrix", "",
            "def boundedMaps : Fin 164 → Matrix (Fin 5) (Fin 2) ℤ := !["]
    data.append(",\n".join("  " + matrix(item["matrix"]) for item in maps) + "]")
    data.extend(["", "def boundedMapL : Fin 164 → ℕ :=", "  " + vector(item["L"] for item in maps),
                 "", "def boundedMapFactsPayloads : Fin 164 → LineMapFactsPayload := !["])
    data.append(",\n".join(f"  {{ xRow := {item['xRow']}, yRow := {item['yRow']}, maxRow := {item['maxRow']} }}"
                           for item in maps) + "]")
    data.extend(["", "def lineCertificates : Fin 9 → List LineCertificate := !["])
    data.append(",\n".join("  [" + ",\n   ".join(map(render_case, table)) + "]" for table in tables) + "]")
    data.extend(["", "end Loneliness.FiveSpeedCertificate", ""])
    outputs = {PREFIX + "Data.lean": "\n".join(data)}
    for k in range(9):
        text = f"""import Conjectures.{PREFIX}Data

/-! Kernel-reduced checks for every parameter relation of canonical map {k}. -/
namespace Loneliness.FiveSpeedCertificate

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
theorem lineTable_{k}_checked :
    lineTableCheck boundedMaps (canonicalMaps {k})
      (planeParameterForms {k}) (lineCertificates {k}) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
"""
        outputs[PREFIX + f"{k:02d}.lean"] = text
    outputs[PREFIX + "MapCertificate.lean"] = f"""import Conjectures.{PREFIX}Data

/-! Exact row bounds and pure-axis witnesses for all retained maps. -/
namespace Loneliness.FiveSpeedCertificate

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
theorem boundedMapFacts_checked : ∀ m : Fin 164,
    lineMapFactsCheck (boundedMaps m) (boundedMapL m) (boundedMapFactsPayloads m) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
"""
    aggregate = [*(f"import Conjectures.{PREFIX}{k:02d}" for k in range(9)),
                 f"import Conjectures.{PREFIX}MapCertificate", "",
                 "namespace Loneliness.FiveSpeedCertificate", "",
                 "theorem allLineTables_checked (k : Fin 9) :",
                 "    lineTableCheck boundedMaps (canonicalMaps k)",
                 "      (planeParameterForms k) (lineCertificates k) = true := by",
                 "  fin_cases k"]
    aggregate.extend(f"  · exact lineTable_{k}_checked" for k in range(9))
    aggregate.extend(["", "theorem every_parameter_form_checked (k : Fin 9)",
                      "    (h : ThreeIntegerVector) (hmem : h ∈ planeParameterForms k) :",
                      "    ∃ certificate ∈ lineCertificates k,",
                      "      lineCaseCheck boundedMaps (canonicalMaps k) h certificate = true :=",
                      "  lineTableCheck_mem boundedMaps (canonicalMaps k) (planeParameterForms k)",
                      "    (lineCertificates k) (allLineTables_checked k) hmem", "",
                      "end Loneliness.FiveSpeedCertificate", ""])
    outputs[PREFIX + "Certificate.lean"] = "\n".join(aggregate)
    output_dir.mkdir(parents=True, exist_ok=True)
    for filename, content in outputs.items():
        (output_dir / filename).write_text(content)
    metadata = {"cover_sha256": digest(args.cover), "maps": maps, "tables": tables,
                "counts": dict(counts), "generated_modules": list(outputs),
                "provenance_sha256": digest(args.provenance) if args.provenance else None,
                "note": "Generator data only; Lean source, axiom, and kernel gates are required."}
    args.metadata.write_text(json.dumps(metadata, indent=2) + "\n")
    print(json.dumps({"maps": len(maps), "line_cases": 200, "counts": dict(counts),
                      "modules": len(outputs), "metadata": str(args.metadata)}, indent=2))


if __name__ == "__main__":
    main()
