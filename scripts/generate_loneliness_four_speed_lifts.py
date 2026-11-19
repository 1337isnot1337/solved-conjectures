#!/usr/bin/env python3
"""Produce finite Lean certificates; all mathematical acceptance occurs in Lean."""
from itertools import combinations
from math import gcd
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "lean" / "Conjectures"
PRIMES = (17, 29, 31, 37, 41, 43, 47, 53, 59, 61)
SPECIAL = ((1, 2, 3, 4), (1, 3, 4, 7))


def folded(m, a):
    r = a % m
    return min(r, m-r)


def roots(p):
    inv = [0] + [pow(a, -1, p) for a in range(1, p)]
    for tail in combinations(range(2, p//2+1), 3):
        x = (1,) + tail
        if any(folded(p, inv[a]*b) < x[1] for a in x for b in x if a != b):
            continue
        if any(all(9*folded(p, t*a) >= 2*p for a in x) for t in range(1, p//2+1)):
            continue
        yield x


def visit(m, x, directions, depth=0):
    if m % 2 == 0 and all(a % 2 == 0 for a in x):
        return ("allEven",)
    for t in range(1, m//2+1):
        y = tuple(folded(m, t*a) for a in x)
        if 9*min(y) >= 2*m:
            return ("witness", t)
        if 18*max(y) <= m and any(y):
            g = gcd(*y)
            direction = tuple(sorted(a//g for a in y))
            directions.add(direction)
            return ("terminal", t, direction, m)
    if depth >= 8:
        raise RuntimeError(f"Unresolved node {m}, {x}")
    children = tuple(visit(2*m, tuple(m-a if mask >> i & 1 else a
                                    for i, a in enumerate(x)), directions, depth+1)
                     for mask in range(16))
    return ("branch", children)


def lean_list(xs):
    return "[" + ",".join(map(str, xs)) + "]"


def lean_vec(xs):
    return "!" + lean_list(xs)


def lean_tree(tree, direction_index):
    if tree[0] == "allEven":
        return ".allEven"
    if tree[0] == "terminal":
        return f".terminal {direction_index[tree[2]]*tree[3]+tree[1]}"
    if tree[0] != "branch":
        return f".{tree[0]} {tree[1]}"
    def choices(bit, mask):
        if bit == 4:
            return lean_tree(tree[1][mask], direction_index)
        return (f"(if b {bit} then {choices(bit+1, mask | (1<<bit))} "
                f"else {choices(bit+1, mask)})")
    return f".branch (fun b => {choices(0, 0)})"


def lower_witness(x):
    for m in range(1, 200):
        for t in range(1, m//2+1):
            if all(9*folded(m, t*a) >= 2*m for a in x):
                return m, t
    raise RuntimeError(f"No lower witness for {x}")


def main():
    directions = set()
    data = {p: [(x, visit(p, x, directions)) for x in roots(p)] for p in PRIMES}
    directions = sorted(directions)
    direction_index = {x:i for i,x in enumerate(directions)}
    certs = [(x, *lower_witness(x)) for x in directions if x not in SPECIAL]
    body = ["import Conjectures.LonelinessModularRationalWitness", "",
            "/-! Exact rational witnesses excluding every recovered direction",
            "except the two four-speed gap families. Generated data are checked",
            "by kernel reduction. -/", "", "namespace Loneliness.Modular.FourSpeed.Lifts", "",
            "set_option maxRecDepth 100000", "set_option maxHeartbeats 0", "",
            "def directions : List (List ℕ) :=", "  [" + ",\n   ".join(lean_list(x) for x in directions) + "]", "",
            "def lowerCertificates : List (List ℕ × ℕ × ℕ) :=",
            "  [" + ",\n   ".join(f"({lean_list(x)},{m},{t})" for x,m,t in certs) + "]", "",
            "theorem lowerCertificates_checked : ∀ c ∈ lowerCertificates,",
            "    0<c.2.1 ∧ RationalWitness 2 9 c.2.1 c.2.2 c.1 := by decide +kernel", "",
            "theorem directions_covered : ∀ ds ∈ directions,",
            "    ds=[1,2,3,4] ∨ ds=[1,3,4,7] ∨ ∃ c ∈ lowerCertificates, c.1=ds := by decide +kernel", "",
            "theorem directions_classified (ds : List ℕ) (hmem : ds∈directions)",
            "    (hlow : value ds<(2/9 : ℝ)) : ds=[1,2,3,4] ∨ ds=[1,3,4,7] := by",
            "  rcases directions_covered ds hmem with h | h | ⟨c,hc,rfl⟩",
            "  · exact Or.inl h", "  · exact Or.inr h",
            "  · have hh := lowerCertificates_checked c hc",
            "    exact False.elim ((not_le_of_gt hlow)",
            "      (rationalWitness_value_lower (by decide) (by decide) hh.1 hh.2))", "",
            "end Loneliness.Modular.FourSpeed.Lifts", ""]
    (OUT / "LonelinessFourSpeedLiftDirections.lean").write_text("\n".join(body))
    for p, rows in data.items():
        body = ["import Conjectures.LonelinessFourSpeedLiftSound", f"import Conjectures.LonelinessFourSpeedCertificate{p}",
                "import Mathlib.Tactic.FinCases", "",
                f"/-! Complete folded binary-lift certificates for the retained supports modulo {p}. -/", "",
                f"namespace Loneliness.Modular.FourSpeed.Lifts.Prime{p}", "",
                "open FoldedSearch", "set_option maxRecDepth 200000", "set_option maxHeartbeats 0", ""]
        for j,(x,tree) in enumerate(rows):
            body += [f"def tree{j} : Tree 4 := {lean_tree(tree, direction_index)}", "",
                     f"theorem tree{j}_checked : check 2 9 shortTerminal tree{j} {p} {lean_vec(x)}=true := by decide +kernel", ""]
        body += [f"def root : Fin {len(rows)} → (Fin 4 → ℕ) :=",
                 "  ![" + ",\n    ".join(lean_vec(x) for x,_ in rows) + "]", "",
                 f"def tree : Fin {len(rows)} → Tree 4 :=",
                 "  ![" + ",".join(f"tree{j}" for j in range(len(rows))) + "]", "",
                 f"theorem all_checked (i : Fin {len(rows)}) :",
                 f"    check 2 9 shortTerminal (tree i) {p} (root i)=true := by", "  fin_cases i"]
        body += [f"  · exact tree{j}_checked" for j in range(len(rows))]
        body += ["", f"theorem roots_injective : ∀ i : Fin {len(rows)}, Function.Injective (root i) := by decide +kernel", "",
                 f"theorem retained_eq : FourSpeed.Prime{p}.retained=",
                 "    Finset.univ.image (fun i => (List.ofFn (root i)).toFinset) := by decide +kernel", "",
                 f"end Loneliness.Modular.FourSpeed.Lifts.Prime{p}", ""]
        (OUT / f"LonelinessFourSpeedLift{p}.lean").write_text("\n".join(body))
    print(f"Generated {sum(map(len,data.values()))} roots and {len(directions)} directions.")


if __name__ == "__main__":
    main()
