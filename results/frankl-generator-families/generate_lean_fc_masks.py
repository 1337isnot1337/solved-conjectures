#!/usr/bin/env python3
"""Emit kernel-checked FC certificates using natural-number bit masks.

The mathematical transport from masks to actual finite sets is proved in
FranklFCBitCode and FranklFCFiniteDomain. Search output remains untrusted.
"""

from __future__ import annotations

import argparse
from pathlib import Path

from generate_lean_fc_certificates import PATTERNS, elements, lean_set, unions
from generate_lean_fc_flow import search


def mask_family(mask):
    return "∅" if mask == 0 else "{" + ", ".join(map(str, elements(mask))) + "}"


def emit(name, tree, namespace=None, core_only=False):
    n, generators, weights = PATTERNS[name]
    title = "".join(part.title() for part in name.split("_"))
    namespace = namespace or "Frankl.FC." + (
        "SmallCyclicPasch" if name == "pasch" else "Vaughan" + title
    )
    base = unions(generators)
    join = "(fun a b : ℕ => a ||| b)"
    domain = f"(BitCode.domain {n})"
    lines = [
        "module", "",
        "public import Conjectures.FranklFCBitCode",
        "public import Conjectures.FranklFC",
        "public import Conjectures.FranklShareFlowPointwise",
    ]
    if not core_only:
        lines.append("public import Conjectures.FranklFCFiniteDomain")
    lines += [
        "", "@[expose] public section", "",
        "set_option maxRecDepth 20000",
        "set_option maxHeartbeats 0",
        "set_option Elab.async false", "",
        f"namespace {namespace}", "",
        "/-! Proposed by generate_lean_fc_masks.py. The finite decoder, each",
        "branch, and every integer share transfer are checked in Lean. -/", "",
        f"def ground : Finset ℕ := Finset.range {n}",
        f"def weights (i : ℕ) : ℕ := ({list(weights)} : List ℕ).getD i 0",
        "def base : Finset (Finset ℕ) := {" + ", ".join(map(lean_set, base)) + "}",
        "def codedBase : Finset ℕ := {" + ", ".join(map(str, base)) + "}",
        f"def codedShare (a : ℕ) : ℤ := share ground weights (BitCode.decode {n} a)",
        "",
    ]
    nodes = []
    proofs = []

    def visit(node, forced, excluded):
        kind = node[0]
        if kind == "split":
            a = node[1]
            next_forced = forced | (1 << a)
            for b in (*base, *elements(forced)):
                next_forced |= 1 << (a | b)
            next_excluded = excluded | (1 << a)
            left = visit(node[2], forced, next_excluded)
            right = visit(node[3], next_forced, excluded)
            expression = f".split {a} c{left} c{right}"
        else:
            entries = [] if kind == "bound" else node[1]
            plan = "[" + ",\n    ".join(
                f"⟨{a}, {b}, {amount}⟩" for a, b, amount in entries
            ) + "]"
            expression = ".leaf " + plan
        i = len(nodes)
        nodes.append(f"private def c{i} : ShareFlow.Certificate ℕ :=\n  {expression}")
        header = (
            f"private theorem checked{i} :\n"
            f"    ShareFlow.check {join} codedBase {domain}\n"
            f"      codedShare ({mask_family(forced)}) ({mask_family(excluded)}) c{i} = true := by\n"
        )
        if kind == "split":
            body = (
                "  apply ShareFlow.check_split\n"
                f"  · have he : insert {a} ({mask_family(excluded)} : Finset ℕ) = "
                f"{mask_family(next_excluded)} := by decide +kernel\n"
                f"    rw [he]\n    exact checked{left}\n"
                f"  · have hf : ShareSearch.infer {join} codedBase "
                f"({mask_family(forced)}) {a} = {mask_family(next_forced)} := by decide +kernel\n"
                f"    rw [hf]\n    exact checked{right}"
            )
        else:
            body = "  apply ShareFlow.check_leaf_of_pointwise\n  decide +kernel"
        proofs.append(header + body)
        return i

    root = visit(tree, 0, 0)
    lines += nodes + [""] + proofs + [
        "", f"@[no_expose] def certificate : ShareFlow.Certificate ℕ := c{root}", "",
        "theorem checked :",
        f"    ShareFlow.check {join} codedBase {domain}",
        "      codedShare ∅ ∅ certificate = true := by",
        f"  exact checked{root}", "",
        "theorem coded_extension_share_nonnegative {family : Finset ℕ}",
        f"    (hc : ShareSearch.ClosedFor {join} codedBase family)",
        f"    (hd : family ⊆ {domain}) :",
        "    0 ≤ ∑ a ∈ family, codedShare a :=",
        "  ShareFlow.certificate_nonnegative certificate checked hc hd", "",
    ]
    if not core_only:
        lines += [
            "theorem extension_share_nonnegative {family : Finset (Finset ℕ)}",
            "    (hc : ShareSearch.ClosedFor (fun A B => A ∪ B) base family)",
            "    (hd : family ⊆ ground.powerset) :",
            "    0 ≤ ∑ S ∈ family, share ground weights S := by",
            "  exact extension_shares_of_finite_domain_certificate",
            f"    (D := BitCode.domain {n}) (decode := BitCode.decode {n})",
            f"    (join := {join}) (codedBase := codedBase)",
            "    (W := ground) (base := base) (w := weights) (codedShare := codedShare)",
            f"    (BitCode.decode_injOn {n}) (BitCode.image_domain {n})",
            "    (fun _ ha _ hb => BitCode.or_mem_domain ha hb)",
            f"    (fun a _ b _ => BitCode.decode_or {n} a b)",
            "    (by decide +kernel) (by decide +kernel) (fun _ _ => rfl)",
            "    certificate checked family hd hc", "",
            "theorem abundant {family : Finset (Finset ℕ)}",
            "    (hu : UnionClosed family) (hb : base ⊆ family) :",
            "    ∃ x ∈ ground, 0 < weights x ∧ Abundant family x := by",
            "  apply abundant_of_extension_shares hu hb (by decide +kernel)",
            "    (by refine ⟨0, ?_, ?_⟩ <;> decide +kernel)",
            "  exact fun _ hd hc => extension_share_nonnegative hc hd", "",
        ]
    lines += [f"end {namespace}", ""]
    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("pattern", choices=PATTERNS)
    parser.add_argument("--node-limit", type=int, default=10000)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--namespace")
    parser.add_argument("--core-only", action="store_true")
    args = parser.parse_args()
    title = "".join(part.title() for part in args.pattern.split("_"))
    filename = "FranklSmallCyclicPaschCertificate.lean" if args.pattern == "pasch" else (
        "FranklVaughan" + title + ".lean"
    )
    output = args.output or Path(__file__).resolve().parents[2] / "lean" / "Conjectures" / filename
    output.write_text(emit(args.pattern, search(args.pattern, args.node_limit),
                           args.namespace, args.core_only))
    print(output.name)


if __name__ == "__main__":
    main()
