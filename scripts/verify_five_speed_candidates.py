#!/usr/bin/env python3
"""Check one unregistered five-speed certificate family from its source.

Every local import is compiled, every owned theorem is audited transitively,
and every local module is submitted to the unmodified pinned kernel checker.
Passing this workflow does not add a module to the accepted project roots.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess

import verify_lean_candidate as common


TASK_REGISTRY = "scripts/five_speed_candidate_tasks.json"
TASKS = json.loads((common.ROOT / TASK_REGISTRY).read_text())


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def selected_tasks() -> list[str]:
    event = json.loads(Path(os.environ["GITHUB_EVENT_PATH"]).read_text())
    if os.environ.get("GITHUB_EVENT_NAME") == "workflow_dispatch":
        return list(TASKS)
    if "pull_request" in event:
        before = event["pull_request"]["base"]["sha"]
        after = event["pull_request"]["head"]["sha"]
    else:
        before = event.get("before", "")
        after = event.get("after", "HEAD")
    if not before or set(before) == {"0"}:
        return list(TASKS)
    changed = set(subprocess.check_output(
        ["git", "diff", "--name-only", before, after], cwd=common.ROOT, text=True).splitlines())
    infrastructure = {
        ".github/workflows/five-speed-candidates.yml",
        "scripts/verify_five_speed_candidates.py", "scripts/verify_lean_candidate.py",
        "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
    }
    if changed & infrastructure:
        return list(TASKS)
    previous = subprocess.run(
        ["git", "show", before + ":" + TASK_REGISTRY], cwd=common.ROOT,
        text=True, capture_output=True, check=False)
    old_tasks = json.loads(previous.stdout) if previous.returncode == 0 else {}
    return [task for task, (targets, required) in TASKS.items()
            if old_tasks.get(task) != [targets, required] or
            changed & {"lean/" + module.replace(".", "/") + ".lean"
                       for module in common.dependency_order(targets)}]


def export(task: str, targets: list[str], modules: list[str]) -> None:
    destination = common.ROOT / ".five-speed-artifacts" / task
    if destination.exists():
        shutil.rmtree(destination)
    hashes = {}
    for module in modules:
        stem = module.replace(".", "/")
        for suffix in (".olean", ".olean.server", ".olean.private", ".ilean"):
            relative = Path("lib/lean") / (stem + suffix)
            source = common.BUILD / relative
            if not source.is_file():
                if suffix == ".olean":
                    raise ValueError(f"missing checked module artifact: {module}")
                continue
            target = destination / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source, target)
            hashes[str(relative)] = digest(target)
    source_hashes = common.source_hashes(modules)
    for relative in [TASK_REGISTRY, "scripts/verify_five_speed_candidates.py",
                     "scripts/verify_lean_candidate.py",
                     ".github/workflows/five-speed-candidates.yml"]:
        source_hashes[relative] = digest(common.ROOT / relative)
    receipt = {
        "task": task, "commit": common.revision(), "targets": targets,
        "status": "checked candidate; not registered in accepted roots",
        "checked_project_modules": modules,
        "source_sha256": source_hashes, "artifact_sha256": hashes,
        "checks": ["warning-as-error source compilation", "owned transitive axiom whitelist",
                   "unmodified stock kernel replay for every local module"],
    }
    output = destination / "receipts" / (task + ".json")
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task", choices=list(TASKS), nargs="?")
    parser.add_argument("--matrix", action="store_true")
    parser.add_argument("--plan", action="store_true")
    args = parser.parse_args()
    if args.matrix:
        matrix = json.dumps(selected_tasks(), separators=(",", ":"))
        with open(os.environ["GITHUB_OUTPUT"], "a") as output:
            output.write("tasks=" + matrix + "\n")
        print(matrix)
        return
    if args.task is None:
        parser.error("provide a task or --matrix")
    targets, required = TASKS[args.task]
    modules = common.dependency_order(targets)
    if args.plan:
        print(json.dumps({"task": args.task, "targets": targets, "required": required,
                          "project_modules": modules}, indent=2))
        return
    for module in modules:
        output = common.BUILD / "lib/lean" / (module.replace(".", "/") + ".olean")
        output.parent.mkdir(parents=True, exist_ok=True)
        common.run("lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true",
                   "-Dlinter.all=false", "-o", str(output.relative_to(common.LEAN)),
                   module.replace(".", "/") + ".lean")
    common.audit(targets, required, modules, "five-" + args.task)
    for module in modules:
        common.run("lake", "env", "leanchecker", module)
    export(args.task, targets, modules)
    print(f"PASS {args.task}: all {len(modules)} local modules compiled, audited and replayed")


if __name__ == "__main__":
    main()
