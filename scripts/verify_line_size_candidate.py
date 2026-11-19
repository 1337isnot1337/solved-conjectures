#!/usr/bin/env python3
"""Check a separate, unregistered Erdős 607 candidate closure.

Successful jobs are component receipts. They neither register the component
in the accepted package nor establish the complete sharp asymptotic.
"""

from __future__ import annotations

import argparse
import json
import os
from pathlib import Path

from plan_lean_candidates import changed_sources
from verify_lean_candidate import (
    ROOT, audit, dependency_order, revision, run, source, source_hashes,
)


TASKS = {
    "geometry": (
        "Conjectures.LineSizeRecordCount",
        ["LineSize.exists_padded_carrier_realization",
         "LineSize.exists_large_record_iff",
         "LineSize.feasibleSizes_iff_realizable",
         "LineSize.lineSizeRecord_eq_of_large_eq",
         "LineSize.lineSizeCount_eq_tupleCount"],
    ),
    "profile": (
        "Conjectures.LineSizeAnalyticProfile",
        ["LineSize.Profile.saddle_profile_exact",
         "LineSize.Profile.Phi_le_gaussian",
         "LineSize.Profile.M_eq_Phi_sub_mul_deriv",
         "LineSize.Profile.V_eq_two_M_sub_mul_deriv"],
    ),
    "euler-kernel": (
        "Conjectures.LineSizeEulerKernel",
        ["LineSize.EulerKernel.meanExp_pos",
         "LineSize.EulerKernel.meanExp_analyticAt",
         "LineSize.EulerKernel.smoothLog_contDiff",
         "LineSize.EulerKernel.smoothLog_eq"],
    ),
}
GATE_INPUTS = {
    ".github/workflows/lean-line-size-candidates.yml",
    "scripts/verify_line_size_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
}


def affected(task: str, changed: set[str] | None) -> bool:
    if changed is None or changed & GATE_INPUTS:
        return True
    target, _ = TASKS[task]
    paths = {str(source(m).relative_to(ROOT)) for m in dependency_order([target])}
    return bool(changed & paths)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task", nargs="?", choices=TASKS)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--plan-ci", action="store_true")
    parser.add_argument("--files", nargs="*")
    args = parser.parse_args()
    if args.plan_ci:
        changed = set(args.files) if args.files is not None else changed_sources()
        tasks = [task for task in TASKS if affected(task, changed)]
        print(json.dumps({"tasks": tasks, "changed": sorted(changed)
                          if changed is not None else "all"}, indent=2))
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
    receipt = {
        "task": args.task, "commit": revision(), "target": target,
        "project_modules": modules, "source_sha256": initial,
        "status": "running", "completed_checks": [],
    }
    destination = ROOT / ".candidate-artifacts" / ("line-size-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        for module in modules:
            run("lake", "build", module)
        receipt["completed_checks"].append("source build")
        audit([target], required, modules, "line-size-" + args.task)
        receipt["completed_checks"].append("all-declaration axiom whitelist")
        run("lake", "env", "python3", "../scripts/replay_lean.py", "--root", target)
        receipt["completed_checks"].append("independent exact-closure kernel replay")
        if source_hashes(modules) != initial:
            raise RuntimeError("candidate source or pinned configuration changed during checks")
        receipt["status"] = "passed"
    except BaseException as exc:
        receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        (destination / "receipt.json").write_text(
            json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(f"PASS line-size-{args.task}: source, axiom, and kernel gates; unchanged sources",
          flush=True)


if __name__ == "__main__":
    main()
