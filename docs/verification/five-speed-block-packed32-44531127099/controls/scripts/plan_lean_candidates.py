#!/usr/bin/env python3
"""Select candidate CI lanes whose project source closure changed."""

from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import subprocess

from verify_lean_candidate import COMPONENT_TASKS, ROOT, dependency_order, source, task_spec


GATE_INPUTS = {
    ".github/workflows/lean-candidates.yml",
    "scripts/plan_lean_candidates.py",
    "scripts/verify_lean_candidate.py",
    "lean/lean-toolchain",
    "lean/lakefile.toml",
    "lean/lake-manifest.json",
}


def changed_sources() -> set[str] | None:
    """None means a conservative full run, including manual dispatches."""
    event_path = os.environ.get("GITHUB_EVENT_PATH")
    if not event_path:
        return None
    event = json.loads(Path(event_path).read_text())
    kind = os.environ.get("GITHUB_EVENT_NAME")
    if kind == "push":
        base = event.get("before")
    elif kind == "pull_request":
        base = event["pull_request"]["base"]["sha"]
    else:
        return None
    if not base or set(base) == {"0"}:
        return None
    exists = subprocess.run(["git", "cat-file", "-e", base + "^{commit}"],
                            cwd=ROOT, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    if exists.returncode:
        return None
    output = subprocess.check_output(
        ["git", "diff", "--name-only", "-z", base, "HEAD", "--"], cwd=ROOT)
    return set(filter(None, output.decode().split("\0")))


def affected(task: str, changed: set[str] | None) -> bool:
    if changed is None or changed & GATE_INPUTS:
        return True
    targets, _ = task_spec(task)
    paths = {str(source(module).relative_to(ROOT)) for module in dependency_order(targets)}
    return bool(paths & changed)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--files", nargs="*", help="inspect explicit changed paths without an event")
    args = parser.parse_args()
    changed = set(args.files) if args.files is not None else changed_sources()
    plan = {
        "components": [task for task in COMPONENT_TASKS if affected(task, changed)],
        "four": affected("four-assembly", changed),
        "kz": affected("kz-assembly", changed),
    }
    print(json.dumps({"changed": sorted(changed) if changed is not None else "all", **plan},
                     indent=2))
    output = os.environ.get("GITHUB_OUTPUT")
    if output:
        with open(output, "a") as handle:
            for key, value in plan.items():
                handle.write(key + "=" + json.dumps(value, separators=(",", ":")) + "\n")


if __name__ == "__main__":
    main()
