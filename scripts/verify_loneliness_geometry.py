#!/usr/bin/env python3
"""Check unregistered runner geometry and hyperplane candidate closures.

The jobs produce component receipts. They do not register a proof or claim
that any complete classification or hyperplane counting theorem is finished.
"""

from __future__ import annotations

import argparse
import json
import os

from plan_lean_candidates import changed_sources
from verify_lean_candidate import (
    ROOT, audit, dependency_order, digest, export_artifacts, revision, run,
    source, source_hashes,
)


TASKS = {
    "basis": (
        ["Conjectures.LonelinessKZBasisReduction",
         "Conjectures.LonelinessPrimitiveSpeeds"],
        ["Loneliness.KZBasis.realFamily_prefix_independent",
         "Loneliness.KZBasis.gs_tail_product",
         "Loneliness.KZBasis.exists_ratio_basis",
         "Loneliness.PrimitiveBasis.primitive_speed_basis_extension"],
    ),
    "nearest-plane-value": (
        ["Conjectures.LonelinessNearestPlanePrefix"],
        ["Loneliness.NearestPlane.exists_integer_rounding_mod_prefix",
         "Loneliness.NearestPlane.exists_rounding_along_first_vector",
         "Loneliness.NearestPlane.prefix_spaceValue_le",
         "Loneliness.NearestPlane.runner_prefix_squared_lower"],
    ),
    "small-sharp": (
        ["Conjectures.LonelinessKZSmallSharp"],
        ["Loneliness.KZSmall.SixSpectrum.norm_cutoff_21829",
         "Loneliness.KZSmall.SixSpectrum.concrete_four_parameter_bound",
         "Loneliness.KZSmall.SixSpectrum.concrete_five_parameter_bound"],
    ),
    "hyperplane": (
        ["Conjectures.LonelinessHyperplaneFiniteExceptions",
         "Conjectures.LonelinessHyperplaneDenominator"],
        ["Loneliness.Hyperplane.integral_mFourier_velocity",
         "Loneliness.Hyperplane.integer_annihilator_iff",
         "Loneliness.Hyperplane.torusRelation_character_trivial_iff",
         "Loneliness.Hyperplane.exists_finite_frequency_average_control",
         "Loneliness.Hyperplane.exists_finite_frequency_dense_velocity",
         "Loneliness.Hyperplane.positiveBoxExceptional_card_le",
         "Loneliness.Hyperplane.exists_positiveBoxAdmissible_card_lower"],
    ),
}
GATE_INPUTS = {
    ".github/workflows/lean-loneliness-geometry.yml",
    "scripts/verify_loneliness_geometry.py",
    "scripts/verify_lean_candidate.py",
    "scripts/plan_lean_candidates.py",
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
}


def affected(task: str, changed: set[str] | None) -> bool:
    if changed is None or changed & GATE_INPUTS:
        return True
    targets, _ = TASKS[task]
    paths = {str(source(m).relative_to(ROOT)) for m in dependency_order(targets)}
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
    targets, required = TASKS[args.task]
    modules = dependency_order(targets)
    if args.plan:
        print(json.dumps({"task": args.task, "targets": targets,
                          "required": required, "project_modules": modules}, indent=2))
        return
    initial = source_hashes(modules)
    gate_hashes = {path: digest(ROOT / path) for path in sorted(GATE_INPUTS)}
    task = "geometry-" + args.task
    receipt = {
        "task": task, "commit": revision(), "targets": targets,
        "required_theorems": required, "project_modules": modules,
        "source_sha256": initial, "gate_sha256": gate_hashes,
        "status": "running", "completed_checks": [],
    }
    destination = ROOT / ".candidate-artifacts" / task
    try:
        for module in modules:
            run("lake", "build", module)
        receipt["completed_checks"].append("source build")
        audit(targets, required, modules, task)
        receipt["completed_checks"].append("all-declaration axiom whitelist")
        for module in modules:
            run("lake", "env", "leanchecker", module)
        receipt["completed_checks"].append("independent exact-closure kernel replay")
        if source_hashes(modules) != initial:
            raise RuntimeError("candidate source or pinned configuration changed during checks")
        if {path: digest(ROOT / path) for path in sorted(GATE_INPUTS)} != gate_hashes:
            raise RuntimeError("verification code changed during checks")
        export_artifacts(task, modules, modules)
        receipt["status"] = "passed"
    except BaseException as exc:
        receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        destination.mkdir(parents=True, exist_ok=True)
        (destination / "receipt.json").write_text(
            json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(f"PASS {task}: source, axiom, and kernel gates; unchanged sources", flush=True)


if __name__ == "__main__":
    main()
