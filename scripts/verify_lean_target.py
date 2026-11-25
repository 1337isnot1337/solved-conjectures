#!/usr/bin/env python3
"""Rebuild one exact project closure, audit every declaration, and replay it.

This target check does not replace scripts/verify_lean.sh or claim that the
whole repository passes. It uses the existing all-owned audit and stock replay.
Mathlib must already be installed at the revisions in lean/lake-manifest.json.
"""

from __future__ import annotations

import argparse
import datetime
import hashlib
import json
import os
from pathlib import Path
import subprocess

import audit_lean_all_owned as audit
import replay_lean as replay


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", required=True)
    parser.add_argument("--require", action="append", required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--per-module-replay", action="store_true",
                        help="replay each scoped module in its own stock checker process")
    args = parser.parse_args()
    repo = Path(__file__).resolve().parents[1]
    lean = repo / "lean"
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    modules, _ = replay.replay_plan(lean, [], args.root)
    order: list[str] = []
    seen: set[str] = set()

    def source(module: str) -> Path:
        return lean / (module.replace(".", "/") + ".lean")

    def visit(module: str) -> None:
        if module in seen:
            return
        seen.add(module)
        for dependency in replay.imports_of(source(module)):
            if dependency in modules:
                visit(dependency)
        order.append(module)

    visit(args.root)
    if set(order) != modules:
        raise RuntimeError("Incomplete project import closure")
    inputs = [source(module) for module in sorted(modules)] + [
        lean / "lean-toolchain", lean / "lake-manifest.json", lean / "lakefile.toml",
        repo / "scripts/audit_lean_all_owned.py", repo / "scripts/replay_lean.py",
        Path(__file__).resolve(),
    ]
    before = {str(path.relative_to(repo)): sha(path) for path in inputs}
    env = os.environ.copy()
    env["LEAN_NUM_THREADS"] = "1"
    started = datetime.datetime.now(datetime.timezone.utc).isoformat()
    commands = []

    def run(command: list[str], log: str) -> None:
        print("RUN", " ".join(command), flush=True)
        with (out / log).open("w") as stream:
            result = subprocess.run(command, cwd=lean, env=env, stdout=stream,
                                    stderr=subprocess.STDOUT, check=False)
        commands.append({"command": command, "exit_code": result.returncode, "log": log})
        if result.returncode:
            print((out / log).read_text(), flush=True)
            raise SystemExit(result.returncode)
        print("PASS", log, flush=True)

    for module in order:
        relative = module.replace(".", "/")
        output = lean / ".lake/build/lib/lean" / (relative + ".olean")
        output.parent.mkdir(parents=True, exist_ok=True)
        run(["lake", "env", "lean", "-j1", "-DwarningAsError=true", "-o",
             str(output), relative + ".lean"], module + ".compile.log")
    spec = {"modules": sorted(modules), "required": args.require, "legacy_prefixes": []}
    audit_file = out / "TargetAudit.lean"
    audit_file.write_text(audit.audit_source(spec["modules"], spec["required"], []))
    run(["lake", "env", "lean", "-j1", "-DwarningAsError=true", str(audit_file)], "audit.log")
    modern = {module: next(replay.header_tokens(source(module).read_text()), None) == "module"
              for module in modules}
    validated = audit.validate_log((out / "audit.log").read_text(), spec, modern)
    replay_command = ["lake", "env", "python3", str(repo / "scripts/replay_lean.py"),
                      "--root", args.root]
    if args.per_module_replay:
        replay_command.append("--per-module")
    run(replay_command, "replay.log")
    after = {str(path.relative_to(repo)): sha(path) for path in inputs}
    if after != before:
        raise RuntimeError("Proof or verification inputs changed during verification")
    receipt = {
        "schema": "target-complete-closure-verification-v1",
        "started_at": started,
        "finished_at": datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "root": args.root,
        "project_modules": sorted(modules),
        "required_endpoints": args.require,
        "source_sha256": {path: digest for path, digest in before.items()
                          if path.endswith(".lean")},
        "input_sha256": before,
        "lean_toolchain": (lean / "lean-toolchain").read_text().strip(),
        "manifest_sha256": sha(lean / "lake-manifest.json"),
        "commands": commands,
        "all_owned_audit": validated["summary"],
        "full_repository_gate": "not run by this target-scoped helper",
        "status": "PASS",
    }
    (out / "receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
    print("PASS: strict source, every owned declaration, stock-kernel replay", flush=True)


if __name__ == "__main__":
    main()
