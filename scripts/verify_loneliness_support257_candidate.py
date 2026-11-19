#!/usr/bin/env python3
"""Check one exact split prime-257 support-certificate proof closure.

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
    'main': ('Conjectures.LonelinessSixSpeedSupport257Cuts', [
        'Loneliness.Modular.SixSpeed.Support257Cuts.inverse_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.cover_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.compatible_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.selected_mask_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.available_mask_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.uncovered_mask_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.table_checks',
        'Loneliness.Modular.SixSpeed.Support257Cuts.fragment_size_le_three',
        'Loneliness.Modular.SixSpeed.Support257Cuts.all_frames_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.root_frame_eq',
        'Loneliness.Modular.SixSpeed.Support257Cuts.root_tape_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.tape_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.tree_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.normalized_cover_impossible',
    ]),
    'facts': ('Conjectures.LonelinessSixSpeedSupport257CutFacts', [
        'Loneliness.Modular.SixSpeed.Support257Cuts.inverse_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.cover_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.compatible_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.selected_mask_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.available_mask_checked',
        'Loneliness.Modular.SixSpeed.Support257Cuts.uncovered_mask_checked',
    ]),
    'checks00': ('Conjectures.LonelinessSixSpeedSupport257CutChecks00', [
        'Loneliness.Modular.SixSpeed.Support257Cuts.block00_checked',
    ]),
    'checks01': ('Conjectures.LonelinessSixSpeedSupport257CutChecks01', [
        'Loneliness.Modular.SixSpeed.Support257Cuts.block01_checked',
    ]),
    'checks02': ('Conjectures.LonelinessSixSpeedSupport257CutChecks02', [
        'Loneliness.Modular.SixSpeed.Support257Cuts.block02_checked',
    ]),
    'checks03': ('Conjectures.LonelinessSixSpeedSupport257CutChecks03', [
        'Loneliness.Modular.SixSpeed.Support257Cuts.block03_checked',
    ]),
    'checks04': ('Conjectures.LonelinessSixSpeedSupport257CutChecks04', [
        'Loneliness.Modular.SixSpeed.Support257Cuts.block04_checked',
    ]),
    'checks05': ('Conjectures.LonelinessSixSpeedSupport257CutChecks05', [
        'Loneliness.Modular.SixSpeed.Support257Cuts.block05_checked',
    ]),
    'checks06': ('Conjectures.LonelinessSixSpeedSupport257CutChecks06', [
        'Loneliness.Modular.SixSpeed.Support257Cuts.block06_checked',
    ]),
    'checks07': ('Conjectures.LonelinessSixSpeedSupport257CutChecks07', [
        'Loneliness.Modular.SixSpeed.Support257Cuts.block07_checked',
    ]),
    'checks08': ('Conjectures.LonelinessSixSpeedSupport257CutChecks08', [
        'Loneliness.Modular.SixSpeed.Support257Cuts.block08_checked',
    ]),
    'checks09': ('Conjectures.LonelinessSixSpeedSupport257CutChecks09', [
        'Loneliness.Modular.SixSpeed.Support257Cuts.block09_checked',
    ]),
}

GATE_INPUTS = {'.github/workflows/lean-loneliness-support257-candidates.yml',
 'lean/lake-manifest.json',
 'lean/lakefile.toml',
 'lean/lean-toolchain',
 'scripts/plan_lean_candidates.py',
 'scripts/replay_lean.py',
 'scripts/verify_loneliness_support257_candidate.py',
 'scripts/verify_lean_candidate.py',
 'scripts/generate_six_support_257_cuts.mjs',
 'lean/Conjectures/LonelinessSixSpeedSupport257Probe.lean'}


def dependency_order(target: str) -> list[str]:
    """Use the replay helper's header parser, including public imports."""
    modules = local_closure(LEAN, {target})
    graph = {
        module: sorted(dep for dep in imports_of(source(module)) if dep in modules)
        for module in sorted(modules)
    }
    if "Conjectures.LonelinessSixSpeedSupport257Probe" in modules:
        raise ValueError("The split certificate must not import the original probe")
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

    This exposes independent fragment and arithmetic errors even if another
    batch or the final assembly is still being repaired. Any source error or
    blocked dependency fails the task; axiom and kernel checks run only after
    every source has passed.
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
    parser.add_argument("--requested-task", choices=TASKS, default="main",
                        help="one workflow task; default main checks the complete closure")
    args = parser.parse_args()
    if args.plan_ci:
        changed = set(args.files) if args.files is not None else changed_sources()
        tasks = [args.requested_task] if affected(args.requested_task, changed) else []
        print(json.dumps({"tasks": tasks, "changed": sorted(changed)
                          if changed is not None else "all"}, indent=2))
        if output := os.environ.get("GITHUB_OUTPUT"):
            with open(output, "a") as handle:
                handle.write("tasks=" + json.dumps(tasks, separators=(",", ":")) + "\n")
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
    destination = ROOT / ".candidate-artifacts" / ("loneliness-support257-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        subprocess.run(["node", str(ROOT / "scripts/generate_six_support_257_cuts.mjs"),
                        "--check"], cwd=ROOT, check=True)
        receipt["completed_checks"].append("deterministic split-data reproduction")
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        audit([target], required, modules, "loneliness-support257-" + args.task)
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
    print(f"PASS loneliness-support257-{args.task}: strict source, axiom, and kernel gates; unchanged sources",
          flush=True)


if __name__ == "__main__":
    main()
