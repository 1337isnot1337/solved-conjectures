#!/usr/bin/env python3
"""Generate finite Lean certificates for pairs of critical directions.

The default output checks the full Boolean test by kernel reduction. The
optional row form proposes short rejection witnesses and checks each witness.
Permutation and sign coverage are proved in the accompanying Lean modules.
"""

from pathlib import Path
import argparse


BASES = ((1, 2, 3, 4), (1, 3, 4, 7))
PATTERNS = tuple(tuple(sorted(base + (x,))) for base in BASES for x in base)


def permutations(xs):
    """Match Mathlib's permsOfList order exactly."""
    if not xs:
        return [tuple(range(5))]
    a, *rest = xs
    old = permutations(rest)
    return old + [tuple(b if x == a else a if x == b else x for x in p)
                  for b in rest for p in old]


PERMUTATIONS = permutations(list(range(5)))


def is_critical(v):
    xs = sorted(set(abs(x) for x in v))
    return any(xs == [xs[0] * x for x in base] for base in BASES)


def is_product(q, c):
    for j in range(5):
        rest = [i for i in range(5) if i != j]
        if tuple(abs(q[i]) for i in rest) in BASES and all(
                q[i] * c[k] == q[k] * c[i] for i in rest for k in rest):
            return True
    return False


def witness(q, c):
    if is_product(q, c):
        return "none"
    for a in range(5):
        for b in range(a + 1, 5):
            for sign in (1, -1):
                v = tuple((q[a] - sign * q[b]) * c[k]
                          - (c[a] - sign * c[b]) * q[k] for k in range(5))
                if all(v) and not is_critical(v):
                    vector = ", ".join(str(x) for x in v)
                    return (f"some ⟨{a}, {b}, {'true' if sign == 1 else 'false'}, "
                            f"![{vector}]⟩")
    raise ValueError(f"No checked rejection: {q}, {c}")


def generate_rows(i, j, destination):
    name = f"{i}{j}"
    lines = [
        "import Conjectures.LonelinessPlaneWitnessSoundness",
        "import Conjectures.FiniteCertificate",
        "",
        "/-! Generated finite plane certificate. Every row is checked by the Lean kernel. -/",
        "set_option maxRecDepth 100000",
        "set_option maxHeartbeats 0",
        "set_option Elab.async false",
        "",
        "namespace Loneliness.PlaneCertificate",
        "",
    ]
    for n, p in enumerate(PERMUTATIONS):
        row = []
        for mask in range(16):
            c = tuple((1 if k == 0 or (mask >> (k - 1)) & 1 else -1)
                      * PATTERNS[j][p[k]] for k in range(5))
            row.append(witness(PATTERNS[i], c))
        lines += [f"private def row{name}_{n:03d} : Fin 16 → Option Rejection := ![",
                  "  " + ",\n  ".join(row) + "]",
                  "",
                  f"private theorem valid{name}_{n:03d} : ∀ mask : Fin 16,",
                  f"    pairTest (canonical {i}) (tableCandidate {j} (permutationAt {n}) mask) = true :=",
                  f"  witnessRowCheck_sound {i} {j} {n} row{name}_{n:03d} (by decide +kernel)",
                  ""]
    lines += [f"theorem checked{name} : ∀ (n : Fin 120) (mask : Fin 16),",
              f"    pairTest (canonical {i}) (tableCandidate {j} (permutationAt n) mask) = true := by",
              "  apply FiniteCertificate.checked_list_rows (n := 120)",
              f"    (P := fun n => ∀ mask : Fin 16, pairTest (canonical {i}) (tableCandidate {j} (permutationAt n) mask) = true)",
              "    [" + ",\n     ".join(
                  f"⟨{n}, valid{name}_{n:03d}⟩" for n in range(120)) + "]",
              "  decide +kernel",
              "",
              "end Loneliness.PlaneCertificate",
              ""]
    destination.write_text("\n".join(lines))


def generate_static(i, j, destination):
    destination.write_text(f'''import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `({i},{j})`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid{i}{j} : staticCaseCheck {i} {j} = true := by decide +kernel

theorem checked{i}{j} : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical {i}) (tableCandidate {j} (permutationAt n) mask) = true :=
  staticCaseCheck_sound {i} {j} valid{i}{j}

end Loneliness.PlaneCertificate
''')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--block", choices=[f"{i}{j}" for i in range(8) for j in range(8)],
                        help="Two indices from 0 to 7; omit for all 64 blocks.")
    parser.add_argument("--rows", action="store_true", help="Use short row witnesses instead of direct reduction.")
    parser.add_argument("--lean-dir", type=Path,
                        default=Path(__file__).resolve().parents[2]
                        / "lean" / "Conjectures")
    args = parser.parse_args()
    indices = [(int(args.block[0]), int(args.block[1]))] if args.block else [
        (i, j) for i in range(8) for j in range(8)]
    for i, j in indices:
        (generate_rows if args.rows else generate_static)(
            i, j, args.lean_dir / f"LonelinessPlaneCertificate{i}{j}.lean")
    print(f"Generated {len(indices)} blocks with 1,920 kernel-checkable cases each.")


if __name__ == "__main__":
    main()
