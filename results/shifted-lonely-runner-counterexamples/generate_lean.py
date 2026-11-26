"""Extract exact covers and attainment witnesses for the adjacent Lean certificate checker."""

import argparse
import json
from fractions import Fraction
from math import lcm
from pathlib import Path

HERE = Path(__file__).resolve().parent
LEAN = HERE.parents[1] / "lean" / "Conjectures"


def witnesses(row):
    """Greedily cover [0,1] at the claimed radius; find a tight point of that cover."""
    gamma = Fraction(row["gamma"])
    scale = lcm(row["shift_den"], gamma.denominator)
    radius = int(gamma * scale)
    tracks = [(v, a * (scale // row["shift_den"]))
              for v, a in zip(row["speeds"], row["shift_num"], strict=True)]
    arcs = []
    for i, (v, a) in enumerate(tracks):
        for k in range(v + 2):
            center = k * scale - a
            lo = Fraction(center - radius, v * scale)
            hi = Fraction(center + radius, v * scale)
            if lo <= 1 and 0 <= hi:
                arcs.append((lo, hi, i, k))
    arcs.sort()
    end, cursor, chain, endpoints = Fraction(0), 0, [], [Fraction(0)]
    while end < 1:
        best = end
        while cursor < len(arcs) and arcs[cursor][0] <= end:
            _, hi, i, k = arcs[cursor]
            if best < hi:
                best, witness = hi, (i, k)
            cursor += 1
        if best == end:
            raise ValueError(f"uncovered time after {end} at n={row['n']}")
        chain.append(witness)
        endpoints.append(best)
        end = best

    def attains(t):
        den = scale * t.denominator
        return all(radius * t.denominator <=
                   (a * t.denominator + v * t.numerator * scale) % den <=
                   den - radius * t.denominator for v, a in tracks)

    time = next(t for t in endpoints if t <= 1 and attains(t))
    return tracks, scale, radius, chain, time


def lean_list(items, width):
    return "[\n    " + ",\n    ".join(
        ", ".join(items[i:i + width]) for i in range(0, len(items), width)) + "]"


def row_declarations(row):
    n = row["n"]
    tracks, scale, radius, chain, time = witnesses(row)
    tr = lean_list([f"({v}, {a})" for v, a in tracks], 5)
    ar = lean_list([f"({i}, {k})" for i, k in chain], 10)
    return (f"def row{n} : Row where\n  tracks := {tr}\n  scale := {scale}\n"
            f"  radius := {radius}\n  time := {time.numerator} / {time.denominator}\n\n"
            f"private def chain{n} : List (ℕ × ℕ) := {ar}\n\n"
            f"theorem verified{n} : (row{n}).Verified {n} :=\n"
            f"  verified_of_checks (chain := chain{n}) (by decide +kernel) (by decide)\n")


def generated(rows):
    if [r["n"] for r in rows] != list(range(18, 58)):
        raise ValueError("expected the forty published records in order")
    imports = []
    for start in range(0, len(rows), 5):
        group = rows[start:start + 5]
        name = f"ShiftedLonelyRunnerData{group[0]['n']}To{group[-1]['n']}"
        imports.append("import Conjectures." + name)
        yield name, ("import Conjectures.ShiftedLonelyRunnerCertificate\n\n"
                     "/-! Generated from the published shifted-runner certificates by "
                     "generate_lean.py. -/\n\nnamespace ShiftedLonelyRunner\n\n"
                     "set_option maxRecDepth 16000\nset_option maxHeartbeats 0\n\n"
                     + "\n".join(map(row_declarations, group))
                     + "\nend ShiftedLonelyRunner\n")
    # Each interval case needs its own explicit record and checked theorem.
    yield "ShiftedLonelyRunner", ("\n".join(imports) + "\n\nnamespace ShiftedLonelyRunner\n\n"
          "/-- The published record for every size in the certified range has its stated\n"
          "attained real-time maximum and strictly violates the shifted bound. -/\n"
          "theorem verified_range (n : ℕ) (hlo : 18 ≤ n) (hhi : n ≤ 57) :\n"
          "    ∃ row : Row, row.Verified n := by\n  interval_cases n\n"
          + "".join(f"  · exact ⟨row{n}, verified{n}⟩\n" for n in range(18, 58))
          + "\n/-- Zhang’s shifted Lonely Runner bound fails at each of the forty sizes. -/\n"
          "theorem zhang_question_8_5 (n : ℕ) (hlo : 18 ≤ n) (hhi : n ≤ 57) :\n"
          "    Gamma n < 1 / ((n : ℝ) + 1) := by\n"
          "  obtain ⟨w, hw⟩ := verified_range n hlo hhi\n  exact hw.Gamma_lt\n"
          "\nend ShiftedLonelyRunner\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="compare against the committed modules")
    args = parser.parse_args()
    rows = json.loads((HERE / "certificates.json").read_text())
    for name, source in generated(rows):
        path = LEAN / (name + ".lean")
        if args.check:
            if path.read_text() != source:
                raise SystemExit(f"certificate module differs: {path}")
        else:
            path.write_text(source)


if __name__ == "__main__":
    main()
