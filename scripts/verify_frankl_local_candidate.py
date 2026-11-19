#!/usr/bin/env python3
"""Verify standalone Frankl local-certificate checker extensions.

These tasks prove exact checker semantics and soundness. They do not assert
that any finite window certificate has passed, or complete the span-four
theorem. Their closures do not include the Vaughan/Matching data.
"""

from __future__ import annotations

import argparse
import json
import os

from plan_lean_candidates import changed_sources
from verify_frankl_fc_candidate import audit_exact_closure, maximal_tasks
from verify_lean_candidate import ROOT, digest, revision, run, source_hashes
from verify_line_size_candidate import check_sources, dependency_order


TASKS = {
    "maximal-cover": ("Conjectures.FranklLocalMaximalCover", [
        "FranklLocal.local_union_subset_localPart",
        "FranklLocal.mem_compatible_iff_maximalCover",
        "FranklLocal.maximalCompatible_eq",
        "FranklLocal.boundary_disjoint_window",
        "FranklLocal.maximalCertificateCheck_eq",
        "FranklLocal.maximalCertificateCheck_abundance",
        "FranklLocal.certificateCheck_abundance",
        "FranklLocal.weighted_local_certificate_abundance",
    ]),
    "mask-checker": ("Conjectures.FranklLocalMaskCertificate", [
        "FranklLocal.Mask.decode_zero",
        "FranklLocal.Mask.decode_and",
        "FranklLocal.Mask.mask_subset_iff",
        "FranklLocal.Mask.mask_disjoint_iff",
        "FranklLocal.Mask.decoded_filter",
        "FranklLocal.Mask.decoded_localCodes",
        "FranklLocal.Mask.decoded_coveringMasks",
        "FranklLocal.Mask.decode_coverCode",
        "FranklLocal.Mask.compatible_test_iff",
        "FranklLocal.Mask.compatibleCodes_decode",
        "FranklLocal.Mask.maskImbalance_eq",
        "FranklLocal.Mask.rowShare_eq",
        "FranklLocal.Mask.rowShare_compatible",
        "FranklLocal.Mask.check_certificateCheck",
        "FranklLocal.Mask.check_weightCertificate",
        "FranklLocal.Mask.check_abundance",
        "FranklLocal.Mask.fullCheck_weightCertificate",
        "FranklLocal.Mask.fullCheck_abundance",
    ]),
    "mask-domains": ("Conjectures.FranklLocalMaskDomains", [
        "FranklLocal.Mask.mem_submasks",
        "FranklLocal.Mask.submasks_bounded",
        "FranklLocal.Mask.submasks_nodup",
        "FranklLocal.Mask.submasks_decode",
        "FranklLocal.Mask.exists_submasks_decode",
        "FranklLocal.Mask.submasks_decode_injOn",
        "FranklLocal.Mask.submasks_length",
        "FranklLocal.Mask.decode_xor_and",
        "FranklLocal.Mask.decode_boundaryCode",
        "FranklLocal.Mask.validDomains_submasks",
        "FranklLocal.Mask.validDomains_of_submasks",
        "FranklLocal.Mask.outside_submasks_length",
    ]),
}

GATE_INPUTS = (
    "scripts/verify_frankl_local_candidate.py",
    "scripts/verify_frankl_fc_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/verify_line_size_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    ".github/workflows/lean-frankl-local-candidates.yml",
)


def gate_hashes():
    return {path: digest(ROOT / path) for path in GATE_INPUTS}


def task_closures():
    return {task: frozenset(dependency_order([target]))
            for task, (target, _) in TASKS.items()}


def task_spec(task, closures=None):
    closures = task_closures() if closures is None else closures
    covered = sorted(name for name in TASKS if closures[name] <= closures[task])
    # A larger retained closure must also check every endpoint belonging to
    # its contained tasks, including tasks suppressed by maximal selection.
    required = sorted({endpoint for name in covered for endpoint in TASKS[name][1]})
    target = TASKS[task][0]
    return target, dependency_order([target]), covered, required


def ci_plan(changed):
    closures = task_closures()
    global_inputs = set(GATE_INPUTS) | {
        "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
    }
    affected = []
    for task, modules in closures.items():
        paths = {"lean/" + module.replace(".", "/") + ".lean" for module in modules}
        if changed is None or changed & (global_inputs | paths):
            affected.append(task)
    retained = maximal_tasks(affected, closures)
    return {"tasks": retained, "affected_tasks": sorted(affected),
            "covered_tasks": {task: task_spec(task, closures)[2] for task in retained},
            "required_theorems": {task: task_spec(task, closures)[3] for task in retained}}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task", nargs="?", choices=TASKS)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--plan-ci", action="store_true")
    parser.add_argument("--files", nargs="*", help="explicit changed paths for --plan-ci")
    args = parser.parse_args()
    if args.plan_ci:
        changed = set(args.files) if args.files is not None else changed_sources()
        plan = ci_plan(changed)
        print(json.dumps(plan, indent=2))
        if output := os.environ.get("GITHUB_OUTPUT"):
            with open(output, "a") as handle:
                handle.write("tasks=" + json.dumps(plan["tasks"], separators=(",", ":")) + "\n")
        return
    if args.task is None:
        parser.error("a task or --plan-ci is required")
    if args.files is not None:
        parser.error("--files requires --plan-ci")
    target, modules, covered, required = task_spec(args.task)
    if args.plan:
        print(json.dumps({"task": args.task, "target": target,
                          "covered_tasks": covered, "required": required,
                          "project_modules": modules}, indent=2))
        return
    initial = source_hashes(modules)
    initial_gate = gate_hashes()
    receipt = {
        "task": args.task, "commit": revision(), "target": target,
        "project_modules": modules, "source_sha256": initial,
        "gate_sha256": initial_gate, "required_theorems": required,
        "covered_tasks": covered, "status": "running", "completed_checks": [],
        "scope": "Local-certificate checker semantics, exact domains and soundness; no finite window certificate.",
    }
    destination = ROOT / ".candidate-artifacts" / ("frankl-local-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        receipt["axiom_audit"] = audit_exact_closure(modules, required, destination)
        receipt["completed_checks"].append(
            "explicit import-all axiom whitelist and exact private-node visibility")
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
    print(f"PASS frankl-local-{args.task}: strict source, axiom and pinned kernel gates", flush=True)


if __name__ == "__main__":
    main()
