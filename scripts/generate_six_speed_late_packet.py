#!/usr/bin/env python3
"""Render bounded six-speed packets through the proved structural count.

Numerical frame proofs use the proved structural count. Compatibility tables are
checked in subtrees of at most four entries and composed with Boolean conjunction.
Every original proposition and every byte of certificate data comes from the
existing hybrid producer and is checked by exact recovery of that producer's
source. Generation makes no Lean verification claim.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
import re

import generate_six_speed_prime_arithmetic as arithmetic
import generate_six_speed_prime_certificates as baseline


ROOT = Path(__file__).resolve().parents[1]
FUEL_MODULE = "Conjectures.LonelinessModularCoverFuelCuts"
FUEL_SOUND = "SupportSearch.Bits.FuelCuts.boundedCheck_sound"
FRAME = re.compile(r"theorem frame[0-9]+_checked :")
COMPATIBILITY_ENTRIES_PER_CHECK = 4
FROZEN_HELPERS = {
    "lean/Conjectures/LonelinessModularCoverFastCounts.lean":
        "bbc76f17ce5e115461d40d6ac0b75af9da2edb6dc1de1229bebd0dfd2e067361",
    "lean/Conjectures/LonelinessModularCoverFuelCounts.lean":
        "a9ce5f7f9c413edf96f08e5bc4230e33f9bb02cd19e1316d925ae655eba0911e",
    "lean/Conjectures/LonelinessModularCoverFuelCuts.lean":
        "d8d9fb0c0b31e07d50e8b1a58ecbaff8540cebffdb1444b492858465070ae368",
}


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def split_compatibility(source, data, root):
    """Replace only a large compatible_checked proof, with exact source recovery.

    Subtrees use the upstream producer's literal tree renderer. The original
    compatibleTable definition is not rewritten. Each private theorem checks at
    most COMPATIBILITY_ENTRIES_PER_CHECK entries; the public theorem only combines
    these opaque proofs along the original binary tree, so it never reduces the
    complete arithmetic table in one kernel computation.
    """
    p, b = data["p"], root["b"]
    width = data["half"] + 1
    entries = sorted((b * width + int(a), int(value))
                     for a, value in root["compatible"].items())
    original_table = "def compatibleTable : Memo.Tree :=\n" + arithmetic.memo(entries) + "\n"
    require(source.count(original_table) == 1,
            "Original compatibility table does not match the upstream renderer")
    statement = ("theorem compatible_checked :\n"
                 f"    Memo.check (InitialMemo.compatibleBase {p} inverse {width}) "
                 "compatibleTable = true := by\n")
    original_proof = statement + "  decide +kernel\n"
    require(source.count(original_proof) == 1,
            "Original compatible_checked proposition or proof changed")
    require("compatible_part" not in source and "compatible_branch_checked" not in source,
            "Compatibility helper name collides with upstream source")
    if len(entries) <= COMPATIBILITY_ENTRIES_PER_CHECK:
        return source, []

    declarations = [
        "private theorem compatible_branch_checked {fallback : ℕ → ℕ} (pivot : ℕ)\n"
        "    {left right : Memo.Tree}\n"
        "    (hleft : Memo.check fallback left = true)\n"
        "    (hright : Memo.check fallback right = true) :\n"
        "    Memo.check fallback (.branch pivot left right) = true := by\n"
        "  exact Bool.and_eq_true_iff.mpr ⟨hleft, hright⟩\n"
    ]
    chunk_sizes = []

    def proof(subtree):
        if len(subtree) <= COMPATIBILITY_ENTRIES_PER_CHECK:
            name = f"compatible_part{len(chunk_sizes):03d}_checked"
            chunk_sizes.append(len(subtree))
            declarations.append(
                f"private theorem {name} :\n"
                f"    Memo.check (InitialMemo.compatibleBase {p} inverse {width})\n"
                + arithmetic.memo(subtree, 6) + " = true := by\n"
                "  decide +kernel\n")
            return name
        middle = len(subtree) // 2
        left, right = proof(subtree[:middle]), proof(subtree[middle:])
        # Keeping Memo.check as the head of both the helper and goal avoids
        # asking conversion to evaluate a concrete Bool.and tree during assembly.
        return f"(compatible_branch_checked {subtree[middle][0]} {left} {right})"

    composition = proof(entries)
    require(sum(chunk_sizes) == len(entries)
            and all(0 < size <= COMPATIBILITY_ENTRIES_PER_CHECK for size in chunk_sizes),
            "Compatibility chunks do not cover the exact original entries")
    replacement = ("\n".join(declarations) + "\n" + statement
                   + "  exact " + composition + "\n")
    rendered = source.replace(original_proof, replacement, 1)
    require(rendered.count(replacement) == 1
            and rendered.replace(replacement, original_proof, 1) == source,
            "Compatibility proof splitting changed original data or propositions")
    require(rendered.count(original_table) == 1 and rendered.count(statement) == 1,
            "Compatibility data or public proposition was not preserved")
    return rendered, chunk_sizes


def transform(source):
    output = []
    pending = False
    replacements = 0
    for line in source.splitlines():
        if FRAME.fullmatch(line):
            require(not pending, "Previous numerical theorem has no expected proof body")
            pending = True
        if pending and line == "  decide +kernel":
            output.append("  apply " + FUEL_SOUND)
            replacements += 1
            pending = False
        output.append(line)
    require(not pending, "Final numerical theorem has no expected proof body")
    if replacements:
        output.insert(0, "import " + FUEL_MODULE)
    rendered = "\n".join(output) + "\n"
    recovered = rendered
    if replacements:
        recovered = recovered.removeprefix("import " + FUEL_MODULE + "\n")
        recovered = recovered.replace("  apply " + FUEL_SOUND + "\n", "")
    require(recovered == source, "Transport changed data, propositions, or other proof bytes")
    return rendered, replacements


def fuel_files(data, block_size=32, combined_frame_limit=32, layout="hybrid"):
    require(block_size == 32 and combined_frame_limit == 32 and layout == "hybrid",
            "Unreviewed packet layout")
    for path, digest in FROZEN_HELPERS.items():
        require(hashlib.sha256((ROOT / path).read_bytes()).hexdigest() == digest,
                "Reviewed structural-count source differs: " + path)
    base = f"Conjectures.LonelinessSixSpeedPrime{data['p']:04d}"
    arithmetic_roots = {
        base + f"B{root['b']:03d}"
        + ("Arithmetic" if len(root["frames"]) > combined_frame_limit else ""): root
        for root in data["roots"]
    }
    checked_roots = set()
    total = 0
    for module, source in baseline.pipeline_files(data, block_size, combined_frame_limit):
        if module in arithmetic_roots:
            require(module not in checked_roots, "Repeated compatibility proof module")
            source, _ = split_compatibility(source, data, arithmetic_roots[module])
            checked_roots.add(module)
        else:
            require("theorem compatible_checked :" not in source,
                    "A compatibility proof escaped bounded checking")
        rendered, count = transform(source)
        expected = sum(FRAME.fullmatch(line) is not None for line in source.splitlines())
        require(count == expected, "A numerical theorem escaped transport")
        if count == 0:
            require(rendered == source, "Nonnumerical source changed")
        total += count
        yield module, rendered
    require(total == sum(len(root["frames"]) for root in data["roots"]),
            "Missing or duplicated numerical proof transport")
    require(checked_roots == set(arithmetic_roots),
            "Missing or duplicated compatibility proof transformation")
