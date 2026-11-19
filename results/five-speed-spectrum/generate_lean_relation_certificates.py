"""Generate exact integer payloads for the five-speed relation reduction.

The orbit search proposes payloads. Lean must check every matrix identity;
neither this search nor its Python assertions are proof premises.
"""

from argparse import ArgumentParser
from hashlib import sha256
from itertools import combinations, permutations, product
import json
from math import gcd
from pathlib import Path


HERE = Path(__file__).resolve().parent
PAIRS = tuple(combinations(range(5), 2))


def canonical(values):
    values = tuple(values)
    divisor = gcd(*values)
    if next((x for x in values if x), 0) < 0:
        divisor = -divisor
    return tuple(x // divisor for x in values) if divisor else values


def determinant(rows):
    a, b, c = rows
    return (a[0] * (b[1] * c[2] - b[2] * c[1])
            + a[1] * (b[2] * c[0] - b[0] * c[2])
            + a[2] * (b[0] * c[1] - b[1] * c[0]))


def dual_minors(matrix):
    return canonical(
        (-1) ** (i + j)
        * determinant([matrix[k] for k in range(5) if k not in (i, j)])
        for i, j in PAIRS
    )


def minor(relations):
    r, s = relations
    for a, b in PAIRS:
        d = r[a] * s[b] - r[b] * s[a]
        if d:
            return a, b, d
    raise ValueError("Dependent relation rows")


def multiply(left, right):
    return [[sum(x * y for x, y in zip(row, column))
             for column in zip(*right)] for row in left]


def selector(matrix):
    rows, negative = [], []
    for j in range(3):
        for i, row in enumerate(matrix):
            if abs(row[j]) == 1 and all(row[k] == 0 for k in range(3) if k != j):
                rows.append(i)
                negative.append(row[j] == -1)
                break
        else:
            raise ValueError("Missing signed unit row")
    selected = [[0] * 5 for _ in range(3)]
    for j, i in enumerate(rows):
        selected[j][i] = -1 if negative[j] else 1
    return {"row": rows, "negative": negative}, selected


def projection_payload(matrix, relations):
    a, b, d = minor(relations)
    r, s = relations
    selected, picker = selector(matrix)
    projected = multiply(matrix, picker)
    residual = [[int(i == j) - projected[i][j] for j in range(5)]
                for i in range(5)]
    parameters = [[d * x for x in row] for row in picker]
    correction = [[row[a] * s[b] - row[b] * s[a],
                   r[a] * row[b] - r[b] * row[a]] for row in residual]
    ar, uc = multiply(matrix, parameters), multiply(correction, relations)
    assert all(d * int(i == j) == ar[i][j] + uc[i][j]
               for i in range(5) for j in range(5))
    return {"denominator": d, "parameters": parameters,
            "correction": correction}, selected


def row_span_payload(row, relations):
    a, b, d = minor(relations)
    r, s = relations
    coefficients = [row[a] * s[b] - row[b] * s[a],
                    r[a] * row[b] - r[b] * row[a]]
    if not all(d * row[i] == coefficients[0] * r[i] + coefficients[1] * s[i]
               for i in range(5)):
        return None
    return {"denominator": d, "coefficients": coefficients}


def generate(cover):
    canonical_maps = [space["map"] for space in cover]
    orbit = {}
    for map_index, matrix in enumerate(canonical_maps):
        for permutation in permutations(range(5)):
            for tail in product((1, -1), repeat=4):
                signs = (1,) + tail
                transformed = [[signs[i] * x for x in matrix[permutation[i]]]
                               for i in range(5)]
                orbit.setdefault(dual_minors(transformed),
                                 (map_index, permutation, signs, transformed))

    units = [[int(i == j) for j in range(5)] for i in range(5)]
    equations = set()
    for i, j, k in product(range(5), repeat=3):
        row = [units[i][a] + units[j][a] - units[k][a] for a in range(5)]
        if sum(map(abs, row)) == 3:
            equations.add(canonical(row))
    equations = sorted(equations)
    assert len(equations) == 50
    forbidden = [(row, {"kind": "zero", "coordinate": i})
                 for i, row in enumerate(units)]
    for i, j in PAIRS:
        for sign in (-1, 1):
            row = [units[i][a] + sign * units[j][a] for a in range(5)]
            forbidden.append((row, {"kind": "repeat", "left": i,
                                    "right": j, "sign": sign}))

    cases = []
    indices = list(combinations(range(50), 2))
    for case_id in range(1226):
        if case_id < len(indices):
            i, j = indices[case_id]
            relations = [equations[i], equations[j]]
            origin = {"kind": "pair", "left": i, "right": j}
        else:
            relations = [(1, 1, -1, 0, 0), (3, -1, 0, 0, 0)]
            origin = {"kind": "134"}
        r, s = relations
        key = canonical(r[i] * s[j] - r[j] * s[i] for i, j in PAIRS)
        if key in orbit:
            map_index, permutation, signs, transformed = orbit[key]
            payload, selected = projection_payload(transformed, relations)
            conclusion = {"kind": "image", "map": map_index,
                          "permutation": permutation,
                          "negative": [x < 0 for x in signs],
                          "selector": selected, "payload": payload}
        else:
            for row, conclusion in forbidden:
                payload = row_span_payload(row, relations)
                if payload is not None:
                    conclusion = {**conclusion, "payload": payload}
                    break
            else:
                raise ValueError(f"Uncovered relation case {case_id}: {relations}")
        cases.append({"id": case_id, "origin": origin,
                      "relations": relations, "conclusion": conclusion})
    return {"canonical_maps": canonical_maps, "relation_rows": equations,
            "cases": cases}


def lean(value):
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (list, tuple)):
        return "![" + ", ".join(lean(x) for x in value) + "]"
    return str(value)


def render_payload(payload):
    if "parameters" in payload:
        return ("{ denominator := " + lean(payload["denominator"])
                + ", parameters := " + lean(payload["parameters"])
                + ", correction := " + lean(payload["correction"]) + " }")
    return ("{ denominator := " + lean(payload["denominator"])
            + ", coefficients := " + lean(payload["coefficients"]) + " }")


def render_conclusion(conclusion):
    payload = render_payload(conclusion["payload"])
    if conclusion["kind"] == "zero":
        return ".zero " + str(conclusion["coordinate"]) + " " + payload
    if conclusion["kind"] == "repeat":
        return (".repeated " + str(conclusion["left"]) + " "
                + str(conclusion["right"]) + " "
                + lean(conclusion["sign"] == -1) + " " + payload)
    selected = conclusion["selector"]
    signed = ("{ index := " + str(conclusion["map"])
              + ", permutation := " + lean(conclusion["permutation"])
              + ", negative := " + lean(conclusion["negative"]) + " }")
    selector_text = ("{ row := " + lean(selected["row"])
                     + ", negative := " + lean(selected["negative"]) + " }")
    return ".image " + signed + " " + payload + " " + selector_text


def write_lean(data, directory):
    directory.mkdir(parents=True, exist_ok=True)
    namespace = "namespace Loneliness.FiveSpeedCertificate\n\n"
    end = "\nend Loneliness.FiveSpeedCertificate\n"
    prelude = ("set_option maxRecDepth 8192\n"
               "set_option maxHeartbeats 0\n\n"
               + namespace + "open Matrix\nopen scoped Matrix\n\n")
    text = ("import Conjectures.LonelinessFiveSpeedLinearReduction\n"
            "import Mathlib.Data.Fin.VecNotation\n\n") + prelude
    text += "/-! Concrete maps and the complete signed additive-relation catalogue. -/\n\n"
    text += "def canonicalMaps : Fin 9 → ThreeParameterMap :=\n  "
    text += lean(data["canonical_maps"]) + "\n\n"
    text += "def relationRows : Fin 50 → FiveIntegerVector :=\n  "
    text += lean(data["relation_rows"]) + "\n\n"
    text += "def pairRelations (a b : Fin 50) : TwoRelationMatrix :=\n"
    text += "  ![relationRows a, relationRows b]\n\n"
    text += "def special134Relations : TwoRelationMatrix :=\n"
    text += "  ![![1, 1, -1, 0, 0], ![3, -1, 0, 0, 0]]\n"
    (directory / "LonelinessFiveSpeedRelationData.lean").write_text(text + end)

    by_pair = {(case["origin"]["left"], case["origin"]["right"]): case
               for case in data["cases"] if case["origin"]["kind"] == "pair"}
    dummy = ".zero 0 { denominator := 1, coefficients := ![0, 0] }"
    modules = []
    for a in range(49):
        suffix = f"{a:02d}"
        module = "LonelinessFiveSpeedRelation" + suffix
        modules.append(module)
        text = "import Conjectures.LonelinessFiveSpeedRelationDefs\n\n" + prelude
        text += f"def relationCertificates{suffix} : Fin 50 → RelationCaseCertificate :=\n  ![\n"
        text += ",\n".join("    " + (render_conclusion(by_pair[a, b]["conclusion"])
                                      if a < b else dummy) for b in range(50))
        text += "]\n\n"
        text += f"theorem relationCertificates{suffix}_checked : ∀ b : Fin 50,\n"
        text += f"    ({a} : Fin 50) < b →\n"
        text += f"      relationCaseCheck (pairRelations {a} b) (relationCertificates{suffix} b) = true := by\n"
        text += "  decide +kernel\n"
        (directory / (module + ".lean")).write_text(text + end)

    special = data["cases"][-1]
    assert special["origin"]["kind"] == "134"
    module = "LonelinessFiveSpeedRelation134"
    modules.append(module)
    text = "import Conjectures.LonelinessFiveSpeedRelationDefs\n\n" + prelude
    text += "def relationCertificate134 : RelationCaseCertificate :=\n  "
    text += render_conclusion(special["conclusion"]) + "\n\n"
    text += "theorem relationCertificate134_checked :\n"
    text += "    relationCaseCheck special134Relations relationCertificate134 = true := by\n"
    text += "  decide +kernel\n"
    (directory / (module + ".lean")).write_text(text + end)

    text = "".join("import Conjectures." + module + "\n" for module in modules)
    text += "import Mathlib.Tactic.FinCases\n\n" + prelude
    text += "theorem every_relation_pair_checked (a b : Fin 50) (hab : a < b) :\n"
    text += "    ∃ certificate, relationCaseCheck (pairRelations a b) certificate = true := by\n"
    text += "  fin_cases a\n"
    for a in range(49):
        suffix = f"{a:02d}"
        text += f"  · exact ⟨relationCertificates{suffix} b, relationCertificates{suffix}_checked b hab⟩\n"
    text += "  · change 49 < b.val at hab\n    omega\n"
    (directory / "LonelinessFiveSpeedRelationCertificate.lean").write_text(text + end)
    return ["LonelinessFiveSpeedRelationData", *modules,
            "LonelinessFiveSpeedRelationCertificate"]


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("--cover", type=Path, default=HERE / "cover.json")
    parser.add_argument("--json-output", required=True, type=Path)
    parser.add_argument("--lean-dir", type=Path,
                        help="write proposed Lean data and certificate modules")
    args = parser.parse_args()
    raw = args.cover.read_bytes()
    data = generate(json.loads(raw))
    data["status"] = "proposed integer payloads; not an accepted Lean certificate"
    data["cover_sha256"] = sha256(raw).hexdigest()
    args.json_output.write_text(json.dumps(data, separators=(",", ":")) + "\n")
    modules = write_lean(data, args.lean_dir) if args.lean_dir else []
    counts = {kind: sum(case["conclusion"]["kind"] == kind for case in data["cases"])
              for kind in ("image", "zero", "repeat")}
    print(json.dumps({"cases": len(data["cases"]), "conclusions": counts,
                      "generated_modules": len(modules),
                      "output": str(args.json_output)}, sort_keys=True))


if __name__ == "__main__":
    main()
