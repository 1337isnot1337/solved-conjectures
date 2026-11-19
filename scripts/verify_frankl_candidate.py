#!/usr/bin/env python3
"""Strict source, axiom and pinned-kernel gates for the Frankl proof lanes.

A passing component is not a complete proof of either Frankl result. Accepted
registration and the ordinary full-package gate remain separate obligations.
"""

from __future__ import annotations

import argparse
import json
import os

from plan_lean_candidates import changed_sources

from verify_lean_candidate import (
    ROOT, audit, digest, revision, run, source_hashes,
)
from verify_line_size_candidate import check_sources, dependency_order


TASKS = {
    "arithmetic": ("Conjectures.FranklArithmetic", [
        "FranklArithmetic.sufficient_test",
        "FranklArithmetic.lopsided_criterion",
        "FranklArithmetic.absence_bound",
    ]),
    "local": ("Conjectures.FranklLocalWeights", [
        "FranklLocal.fiber_eq_compatible",
        "FranklLocal.weighted_local_certificate_abundance",
    ]),
    "incidence": ("Conjectures.FranklIncidence", [
        "FranklIncidence.canonical_maximal",
        "FranklIncidence.canonical_unionOfIndependentSet",
        "FranklIncidence.absent_iff_occupied",
    ]),
    "lopsided": ("Conjectures.FranklLopsided", [
        "Frankl.Lopsided.conditional_card_bound",
        "Frankl.Lopsided.query_card_bound",
    ]),
}

TASKS.update({
    "bits": ("Conjectures.FranklBits", ["FranklBits.card_bad_transport", "FranklBits.card_absent_with_rest"]),
    "local-certificate": ("Conjectures.FranklLocalCertificate", ["FranklLocal.certificateCheck_abundance"]),
    "large-bound": ("Conjectures.FranklLargeBound", ["Frankl.LargeBound.cardinal_absence_bound"]),
    "large-selection": ("Conjectures.FranklFamilyCanonical", ["Frankl.Large.canonical_filtered_card"]),
    "large-query": ("Conjectures.FranklLargeQuery", ["Frankl.Large.three_regular_point_absence_independent_nonreaders"]),
    "large-probability": ("Conjectures.FranklLargeProbability", ["Frankl.Large.nonneighbor_event_bound"]),
    "large-theorem": ("Conjectures.FranklLargeTheorem", ["Frankl.Large.large_generator_frequency"]),
    "tree-counts": ("Conjectures.FranklTreeCounts", ["FranklTreeCounts.branchCounts_eq"]),
    "tree-foundations": ("Conjectures.FranklTreeCertificate", ["FranklTreeCone.childrenCheck_sound", "FranklTreeCone.highGirthTreeCheck_sound"]),
    "tree-k03": ("Conjectures.FranklTreeBoundK03", ["FranklTreeCone.Degree03.checked"]),
})

GATE_INPUTS = (
    "scripts/verify_frankl_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/verify_line_size_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    ".github/workflows/lean-frankl-candidates.yml",
)


def gate_hashes():
    return {path: digest(ROOT / path) for path in GATE_INPUTS}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task", nargs="?", choices=TASKS)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--plan-ci", action="store_true")
    args = parser.parse_args()
    if args.plan_ci:
        changed = changed_sources()
        global_inputs = set(GATE_INPUTS) | {
            "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
        }
        tasks = []
        for task, (target, _) in TASKS.items():
            closure = {"lean/" + module.replace(".", "/") + ".lean"
                       for module in dependency_order([target])}
            if changed is None or changed & (global_inputs | closure):
                tasks.append(task)
        print(json.dumps({"tasks": tasks}, indent=2))
        if output := os.environ.get("GITHUB_OUTPUT"):
            with open(output, "a") as handle:
                handle.write("tasks=" + json.dumps(tasks, separators=(",", ":")) + "\n")
        return
    if args.task is None:
        parser.error("a task or --plan-ci is required")
    target, required = TASKS[args.task]
    modules = dependency_order([target])
    if args.plan:
        print(json.dumps({"task": args.task, "target": target,
                          "required": required, "project_modules": modules}, indent=2))
        return
    initial = source_hashes(modules)
    initial_gate = gate_hashes()
    receipt = {
        "task": args.task, "commit": revision(), "target": target,
        "project_modules": modules, "source_sha256": initial,
        "gate_sha256": initial_gate, "required_theorems": required,
        "status": "running", "completed_checks": [],
    }
    destination = ROOT / ".candidate-artifacts" / ("frankl-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        audit([target], required, modules, "frankl-" + args.task)
        receipt["completed_checks"].append("all-declaration transitive axiom whitelist")
        run("lake", "env", "python3", "../scripts/replay_lean.py", "--root", target)
        receipt["completed_checks"].append("independent exact-closure kernel replay")
        if source_hashes(modules) != initial or gate_hashes() != initial_gate:
            raise RuntimeError("source or gate changed during verification")
        receipt["status"] = "passed"
    except BaseException as exc:
        receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        (destination / "receipt.json").write_text(
            json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(f"PASS frankl-{args.task}: strict source, axiom and pinned kernel gates", flush=True)


if __name__ == "__main__":
    main()
