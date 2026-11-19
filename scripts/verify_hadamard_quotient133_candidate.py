#!/usr/bin/env python3
"""Check one exact quotient-133 certificate proof closure.

Each successful task is a component receipt. It does not register the sources
in the accepted package or establish that every claim in the note is complete.
"""

from __future__ import annotations

import argparse
from graphlib import TopologicalSorter
import json
import os
import subprocess

from plan_lean_candidates import changed_sources
from replay_lean import imports_of, local_closure
from verify_lean_candidate import (
    ROOT, LEAN, audit, digest, revision, run, source, source_hashes,
)


TASKS = {
    'catalog': ('Conjectures.HadamardQuotient133Catalog', [
        'HadamardQuotient133.catalog_increasing',
        'HadamardQuotient133.gapCheck_excludes',
        'HadamardQuotient133.catalog_pair_forces_allowed',
        'HadamardQuotient133.assignmentsCheck_sound',
    ]),
    'model': ('Conjectures.HadamardQuotient133Model', [
        'HadamardQuotient133.squareClass7_eq_zero',
        'HadamardQuotient133.squareClass19_eq_zero',
        'HadamardQuotient133.squareClass7_eq_one',
        'HadamardQuotient133.squareClass19_eq_one',
        'HadamardQuotient133.sum_expand133',
        'HadamardQuotient133.correlation133_eq_signature',
        'HadamardQuotient133.norm7_formula',
        'HadamardQuotient133.norm19_formula',
        'HadamardQuotient133.correlation21_eq_signature',
        'HadamardQuotient133.fingerprint_pair',
    ]),
    'packet': ('Conjectures.HadamardQuotient133Packet', [
        'HadamardQuotient133.feasible_of_pair',
        'HadamardQuotient133.feasible_mem_rowsFor',
        'HadamardQuotient133.marginsFor_complete',
        'HadamardQuotient133.catalogAllCheck_sound',
        'HadamardQuotient133.quotientRow_catalogued',
        'HadamardQuotient133.quotient_pair_endpoints',
        'HadamardQuotient133.endpointPairsCheck_sound',
        'HadamardQuotient133.actual_margin_catalogued',
        'HadamardQuotient133.catalog_no_joint_pair',
    ]),
    'sample': ('Conjectures.HadamardQuotient133LeafSample', [
        'HadamardQuotient133.feasible_mem_rowsFor',
        'HadamardQuotient133.actual_margin_catalogued',
        'HadamardQuotient133.Finite.sample_outer_checked',
        'HadamardQuotient133.Finite.sample_quotient_leaf_checked',
        'HadamardQuotient133.Finite.sample_margin_leaf_checked',
        'HadamardQuotient133.Finite.sample_quotient_catalog_checked',
        'HadamardQuotient133.Finite.sample_margin_catalog_checked',
    ]),
    'orbits': ('Conjectures.HadamardQuotient133Orbits', [
        'HadamardQuotient133.squareClass7_rep7',
        'HadamardQuotient133.squareClass19_rep19',
        'HadamardQuotient133.squareClass7_eq_iff_square_unit',
        'HadamardQuotient133.squareClass19_eq_iff_square_unit',
        'HadamardQuotient133.correlation133_squareScale',
        'HadamardQuotient133.correlation133_neg',
        'HadamardQuotient133.orbitWitness133_valid',
        'HadamardQuotient133.correlation133_orbit',
        'HadamardQuotient133.signatures133_suffice',
    ]),
    'catalog_verified': ('Conjectures.HadamardQuotient133CatalogVerified', [
        'HadamardQuotient133.Finite.quotient_catalog_checked',
        'HadamardQuotient133.Finite.margin_catalog_checked',
    ]),
    'rows_verified': ('Conjectures.HadamardQuotient133RowsVerified', [
        'HadamardQuotient133.Finite.quotient_rows_checked',
        'HadamardQuotient133.Finite.endpoints_checked',
        'HadamardQuotient133.Finite.survivors_checked',
        'HadamardQuotient133.Finite.survivors_nodup',
        'HadamardQuotient133.Finite.survivors_length',
    ]),
    'margins_verified': ('Conjectures.HadamardQuotient133MarginsVerified', [
        'HadamardQuotient133.Finite.margins_checked',
    ]),
    'main': ('Conjectures.HadamardQuotient133Main', [
        'HadamardQuotient133.Finite.outer_checked',
        'HadamardQuotient133.Finite.quotient_catalog_checked',
        'HadamardQuotient133.Finite.margin_catalog_checked',
        'HadamardQuotient133.Finite.quotient_rows_checked',
        'HadamardQuotient133.Finite.margins_checked',
        'HadamardQuotient133.quotient133_pair_mem_survivors',
        'HadamardQuotient133.quotient133_pair_iff',
        'HadamardQuotient133.quotient133_exactly_thirty_two',
        'HadamardQuotient133.quotient133_no_lift',
    ]),
}

DEFAULT_TASKS = ("main",)

GATE_INPUTS = {'.github/workflows/lean-hadamard-quotient133-candidates.yml',
 'lean/lake-manifest.json',
 'lean/lakefile.toml',
 'lean/lean-toolchain',
 'scripts/plan_lean_candidates.py',
 'scripts/replay_lean.py',
 'scripts/verify_hadamard_quotient133_candidate.py',
 'scripts/verify_hadamard_quotient133_staged.py',
 'scripts/test_hadamard_quotient133_staged.py',
 'scripts/verify_lean_candidate.py',
 'scripts/generate_hadamard_quotient133.mjs',
 'results/hadamard-2396/PROOF.md',
 'results/hadamard-2396/quotient133.cpp',
 'results/hadamard-2396/quotient133.pairs',
 'results/hadamard-2396/audit.py'}


def dependency_order(target: str) -> list[str]:
    """Use the replay helper's header parser, including public imports."""
    modules = local_closure(LEAN, {target})
    graph = {
        module: sorted(dep for dep in imports_of(source(module)) if dep in modules)
        for module in sorted(modules)
    }
    return list(TopologicalSorter(graph).static_order())


def affected(task: str, changed: set[str] | None) -> bool:
    if changed is None or changed & GATE_INPUTS:
        return True
    target, _ = TASKS[task]
    paths = {str(source(m).relative_to(ROOT)) for m in dependency_order(target)}
    return bool(changed & paths)


def gate_hashes() -> dict[str, str]:
    return {path: digest(ROOT / path) for path in sorted(GATE_INPUTS)}


def check_sources(modules: list[str], receipt: dict) -> None:
    """Check independent sources after an error, but never use a failed object.

    This exposes independent component errors even if a later assembly is
    still being repaired. Any source error or blocked dependency fails the task;
    axiom and kernel checks run only after every source has passed.
    """
    failed: dict[str, str] = {}
    checked: list[str] = []
    receipt["source_failures"] = failed
    receipt["checked_sources"] = checked
    for module in modules:
        blocked = [dep for dep in imports_of(source(module)) if dep in failed]
        if blocked:
            failed[module] = "blocked by failed dependencies: " + ", ".join(blocked)
            print(f"SKIP {module}: {failed[module]}", flush=True)
            continue
        obj = LEAN / ".lake/build/lib/lean" / (module.replace(".", "/") + ".olean")
        obj.parent.mkdir(parents=True, exist_ok=True)
        try:
            run("lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true",
                str(source(module).relative_to(LEAN)), "-o", str(obj.relative_to(LEAN)))
        except subprocess.CalledProcessError as exc:
            failed[module] = f"strict source check exited {exc.returncode}"
        else:
            checked.append(module)
    if failed:
        raise RuntimeError(f"{len(failed)} sources failed or have failed dependencies")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task", nargs="?", choices=TASKS)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--plan-ci", action="store_true")
    parser.add_argument("--files", nargs="*")
    parser.add_argument("--requested-task", choices=("affected", *TASKS), default="affected")
    args = parser.parse_args()
    if args.plan_ci:
        changed = set(args.files) if args.files is not None else changed_sources()
        selected = DEFAULT_TASKS if args.requested_task == "affected" else [args.requested_task]
        tasks = [task for task in selected if affected(task, changed)]
        print(json.dumps({"tasks": tasks, "changed": sorted(changed)
                          if changed is not None else "all"}, indent=2))
        if output := os.environ.get("GITHUB_OUTPUT"):
            with open(output, "a") as handle:
                handle.write("tasks=" + json.dumps(tasks, separators=(",", ":")) + "\n")
                direct = [task for task in tasks if task != "main"]
                handle.write("direct_tasks=" + json.dumps(direct, separators=(",", ":")) + "\n")
                handle.write("main=" + str("main" in tasks).lower() + "\n")
        return
    if args.task is None:
        parser.error("a task or --plan-ci is required")
    target, required = TASKS[args.task]
    modules = dependency_order(target)
    if args.plan:
        print(json.dumps({"task": args.task, "target": target, "required": required,
                          "project_modules": modules}, indent=2))
        return
    initial = source_hashes(modules)
    initial_gate = gate_hashes()
    receipt = {
        "task": args.task, "commit": revision(), "target": target,
        "required_theorems": required, "project_modules": modules,
        "source_sha256": initial, "gate_sha256": initial_gate,
        "status": "running", "completed_checks": [],
    }
    destination = ROOT / ".candidate-artifacts" / ("hadamard-quotient133-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        if args.task == "sample":
            run("node", "../scripts/generate_hadamard_quotient133.mjs", "--check", "--sample")
            receipt["completed_checks"].append("deterministic sample reproduction against four frozen inputs")
        elif args.task == "main":
            run("node", "../scripts/generate_hadamard_quotient133.mjs", "--check")
            receipt["completed_checks"].append("deterministic full packet reproduction against four frozen inputs")
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        audit([target], required, modules, "hadamard-quotient133-" + args.task)
        receipt["completed_checks"].append("module-ownership axiom whitelist and required theorems")
        run("lake", "env", "python3", "../scripts/replay_lean.py", "--root", target)
        receipt["completed_checks"].append("independent exact-closure kernel replay")
        if source_hashes(modules) != initial or gate_hashes() != initial_gate:
            raise RuntimeError("candidate sources or verification inputs changed during checks")
        receipt["status"] = "passed"
    except BaseException as exc:
        receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        (destination / "receipt.json").write_text(
            json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(f"PASS hadamard-quotient133-{args.task}: strict source, axiom, and kernel gates; unchanged sources",
          flush=True)


if __name__ == "__main__":
    main()

