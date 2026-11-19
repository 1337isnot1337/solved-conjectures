#!/usr/bin/env python3
"""Emit kernel-checkable finite prefix polynomial identities.

The Python recurrence proposes coefficients. Every generated Lean row checks
one exact recursion step against already checked shorter-head rows.
"""
from __future__ import annotations

import argparse
import importlib.util
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "results/pham-denominator-degree/prefix_certificate.py"
spec = importlib.util.spec_from_file_location("prefix_data", SOURCE)
data = importlib.util.module_from_spec(spec)
assert spec and spec.loader
spec.loader.exec_module(data)


def nat_list(a):
    return "[" + ",".join(map(str, a)) + "]"


def integer(s):
    return str(s) if s >= 0 else f"({s})"


def finset(items):
    return "{" + ",".join(map(str, items)) + "}" if items else "∅"


def polynomial(p):
    terms = []
    for i, c in enumerate(p):
        if c:
            coeff = f"({c} : ℚ[X])"
            terms.append(coeff if i == 0 else f"{coeff}*X^{i}")
    return " + ".join(terms) if terms else "(0 : ℚ[X])"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out", type=Path, default=ROOT / "lean/Conjectures/DenominatorPrefixRows.lean")
    parser.add_argument("--limit", type=int)
    parser.add_argument("--chunk-size", type=int, default=32)
    args = parser.parse_args()
    primary = data.certificate("0001001011")
    dual = data.certificate("0010110111")
    rows = dict(data.dead_rows)
    for key, (first, _) in data.prefix_rows.items():
        assert key not in rows or rows[key] == first
        rows[key] = first
    keys = sorted(rows, key=lambda key: (len(key[0]), key))
    dead_names = {key: f"dead_{i:03}" for i, key in enumerate(keys)}
    prefix_keys = sorted(data.prefix_rows, key=lambda key: (len(key[0]), key))
    prefix_names = {key: f"second_{i:03}" for i, key in enumerate(prefix_keys)}
    lines = [
        "import Conjectures.DenominatorPrefixTotals",
        "import Mathlib.Tactic.NormNum",
        "import Mathlib.Tactic.Ring",
        "", 
        "/-! Exact finite prefix certificates. Generated coefficient proposals are",
        "checked by recurrence and polynomial normalization in the kernel. -/",
        "namespace DenominatorForest.PrefixCertificate",
        "open Polynomial",
        "",
    ]
    for key in keys[:args.limit]:
        a, s = key
        choices = tuple(data.choices(a, s))
        children = {dead_names[child, offset] for _, child, offset in choices}
        simplifiers = ["Finset.sum_insert", "headStep", "headOffset", "List.range_succ"] + sorted(children)
        lines += [
            f"private theorem {dead_names[key]} : deadPoly {nat_list(a)} {integer(s)} =",
            f"    {polynomial(rows[key])} := by",
            *(["  simp"] if not a else [
                f"  have h := deadPoly_eq {nat_list(a)} {integer(s)}",
                f"  have hc : headChoices {nat_list(a)} {integer(s)} = {finset([j for j, _, _ in choices])} := by decide",
                "  rw [hc] at h",
                f"  norm_num [{', '.join(simplifiers)}] at h",
                "  calc",
                "    _ = _ := h",
                "    _ = _ := by ring",
            ]),
            "",
        ]
    if args.limit is None:
        for key in prefix_keys:
            a, s = key
            choices = tuple(data.choices(a, s))
            children = {prefix_names[child, offset] for _, child, offset in choices}
            if len(a) + s <= 0:
                children.add(dead_names[a, -len(a)])
            simplifiers = ["Finset.sum_insert", "headStep", "headOffset", "List.range_succ", "freePoly"] + sorted(children)
            lines += [
                f"private theorem {prefix_names[key]} : prefixSecond {nat_list(a)} {integer(s)} =",
                f"    {polynomial(data.prefix_rows[key][1])} := by",
                *(["  norm_num"] if not a else [
                    f"  have h := prefixSecond_eq {nat_list(a)} {integer(s)}",
                    f"  have hc : headChoices {nat_list(a)} {integer(s)} = {finset([j for j, _, _ in choices])} := by decide",
                    "  rw [hc] at h",
                    f"  norm_num [{', '.join(simplifiers)}] at h",
                    "  calc",
                    "    _ = _ := h",
                    "    _ = _ := by ring",
                ]),
                "",
            ]
    if args.limit is None:
        for label, cert in [("primary", primary), ("dual", dual)]:
            word_name = label + "Word"
            dead_root_names = sorted({dead_names[tuple(r["head"]), r["offset"]] for r in cert["roots"]})
            second_root_names = sorted({prefix_names[tuple(r["head"]), r["offset"]] for r in cert["roots"]})
            for term, key, names in [("sumFirst", "first_sum", dead_root_names),
                                     ("sumSecond", "second_sum", second_root_names)]:
                simplifiers = [term, "phaseHead", "phaseOffset", word_name,
                               "Finset.sum_range_succ"] + names
                lines += [f"theorem {label}_{term} : {term} {word_name} =",
                          f"    {polynomial(cert[key])} := by",
                          f"  norm_num [{', '.join(simplifiers)}]",
                          "  ring", ""]
            for term, key, name in [("deadPoly", "first", dead_names),
                                    ("prefixSecond", "second", prefix_names)]:
                root = cert["roots"][1]
                row = name[tuple(root["head"]), root["offset"]]
                lines += [f"theorem {label}_{key}_root :",
                          f"    {term} (phaseHead {word_name} 1) (phaseOffset {word_name} 1) =",
                          f"      {polynomial(root[key])} := by",
                          f"  simpa [phaseHead, phaseOffset, {word_name}] using {row}", ""]
    lines += ["end DenominatorForest.PrefixCertificate", ""]
    text = "\n".join(lines)
    chunks = 0
    if args.limit is None:
        assert args.chunk_size > 0
        row_start = text.index("private theorem dead_")
        aggregate_start = text.index("theorem primary_sumFirst")
        row_blocks = text[row_start:aggregate_start].strip().split("\n\n")
        assert len(row_blocks) == len(keys) + len(prefix_keys)
        previous = "DenominatorPrefixTotals"
        for offset in range(0, len(row_blocks), args.chunk_size):
            name = f"DenominatorPrefixData{chunks:02}"
            chunk_header = [
                f"import Conjectures.{previous}",
                "import Mathlib.Tactic.NormNum",
                "import Mathlib.Tactic.Ring",
                "",
                "/-! Generated finite recursion rows. Every coefficient identity",
                "is proved from the recursive equation and earlier shorter-head rows. -/",
                "namespace DenominatorForest.PrefixCertificate",
                "open Polynomial",
                "",
            ]
            chunk_body = "\n\n".join(row_blocks[offset:offset+args.chunk_size]).replace("private theorem", "theorem")
            chunk_text = "\n".join(chunk_header) + chunk_body + "\n\nend DenominatorForest.PrefixCertificate\n"
            args.out.with_name(name + ".lean").write_text(chunk_text, encoding="utf-8")
            previous = name
            chunks += 1
        text = f"import Conjectures.{previous}\n\nnamespace DenominatorForest.PrefixCertificate\nopen Polynomial\n\n" + text[aggregate_start:]
    args.out.write_text(text, encoding="utf-8")
    print(f"Emitted {len(keys[:args.limit])} dead rows; {len(prefix_keys) if args.limit is None else 0} second rows; {chunks} chunks.")


if __name__ == "__main__":
    main()
