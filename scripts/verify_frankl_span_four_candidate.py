#!/usr/bin/env python3
"""Verify frozen cyclic Frankl components without registering a complete result.

The assembly still requires eleven concrete finite checks. Planning uses the
explicit import/hash inventory even when peer sources are unpublished. A
selected verification fails before Lean setup if any required source is absent
or differs from the reviewed inventory. No source is fetched automatically.
"""

from __future__ import annotations

import argparse
from graphlib import TopologicalSorter
import json
import os
from pathlib import Path
import re
import subprocess

from plan_lean_candidates import changed_sources
from replay_lean import imports_of, project_namespace
from verify_lean_candidate import ROOT, LEAN, digest, revision, source_hashes
from verify_line_size_candidate import check_sources, dependency_order
from verify_frankl_fc_candidate import audit_source, maximal_tasks


INVENTORY_PATH = "docs/frankl-span-four-source-inventory.json"
GATE_INPUTS = (
    "scripts/verify_frankl_span_four_candidate.py",
    "scripts/test_frankl_span_four_candidate.py",
    "scripts/verify_frankl_fc_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/verify_line_size_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    ".github/workflows/lean-frankl-span-four-candidates.yml",
    INVENTORY_PATH,
)
CONFIG_INPUTS = {"lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json"}


def load_inventory(root=None):
    root = ROOT if root is None else Path(root)
    data = json.loads((root / INVENTORY_PATH).read_text())
    if data.get("schema_version") != 1:
        raise ValueError("unsupported span-four inventory schema")
    for module, entry in data["modules"].items():
        if not re.fullmatch(r"Conjectures\.[A-Za-z0-9_.]+", module):
            raise ValueError(f"unsupported project module: {module}")
        expected_path = "lean/" + module.replace(".", "/") + ".lean"
        if entry["path"] != expected_path or not re.fullmatch(r"[0-9a-f]{64}", entry["sha256"]):
            raise ValueError(f"invalid source inventory entry: {module}")
        for imported in entry["project_imports"]:
            if imported not in data["modules"]:
                raise ValueError(f"unlisted project dependency: {module} -> {imported}")
    if set(data["configuration_sha256"]) != CONFIG_INPUTS:
        raise ValueError("incomplete pinned configuration inventory")
    for task, spec in data["candidates"].items():
        if spec["root"] not in data["modules"] or not spec["required_theorems"]:
            raise ValueError(f"candidate lacks a listed root or required endpoints: {task}")
    return data


INVENTORY = load_inventory()
TASKS = {task: (spec["root"], spec["required_theorems"])
         for task, spec in INVENTORY["candidates"].items()}


def inventory_order(target, inventory=None):
    inventory = INVENTORY if inventory is None else inventory
    graph = {}

    def visit(module):
        if module in graph:
            return
        if module not in inventory["modules"]:
            raise ValueError(f"project source has no reviewed inventory entry: {module}")
        graph[module] = tuple(inventory["modules"][module]["project_imports"])
        for dependency in graph[module]:
            visit(dependency)

    visit(target)
    return list(TopologicalSorter(graph).static_order())


def task_closures():
    return {task: frozenset(inventory_order(target))
            for task, (target, _) in TASKS.items()}


def task_spec(task):
    if task not in TASKS:
        if task in INVENTORY.get("reserved_candidates", {}):
            raise ValueError(f"candidate {task} is reserved but not activated; a complete receipt is required")
        raise ValueError(f"unknown candidate: {task}")
    closures = task_closures()
    covered = sorted(name for name in TASKS if closures[name] <= closures[task])
    required = sorted({name for member in covered for name in TASKS[member][1]})
    if not required:
        raise ValueError(f"candidate {task} has no required endpoints")
    target = TASKS[task][0]
    return target, inventory_order(target), covered, required


def preflight_report(task, root=None):
    root = ROOT if root is None else Path(root)
    target, modules, covered, required = task_spec(task)
    missing, mismatched, imports_changed = [], [], []
    for module in modules:
        entry = INVENTORY["modules"][module]
        path = root / entry["path"]
        if not path.is_file():
            missing.append(module)
            continue
        if digest(path) != entry["sha256"]:
            mismatched.append(module)
            continue
        actual = sorted(x for x in imports_of(path) if project_namespace(x) is not None)
        if actual != sorted(entry["project_imports"]):
            imports_changed.append(module)
    config_changed = [path for path, expected in INVENTORY["configuration_sha256"].items()
                      if not (root / path).is_file() or digest(root / path) != expected]
    return {
        "task": task, "target": target, "project_modules": modules,
        "covered_tasks": covered, "required_theorems": required,
        "ready": not (missing or mismatched or imports_changed or config_changed),
        "missing_sources": sorted(missing),
        "missing_peer_sources": sorted(set(missing) & set(INVENTORY["peer_owned_modules"])),
        "source_hash_mismatches": sorted(mismatched),
        "import_inventory_mismatches": sorted(imports_changed),
        "configuration_mismatches": sorted(config_changed),
        "source_policy": "Use reviewed repository sources only; no automatic download or peer publication.",
    }


def ci_plan(changed, selected=None):
    closures = task_closures()
    global_inputs = set(GATE_INPUTS) | CONFIG_INPUTS
    if selected is not None:
        task_spec(selected)
        affected = [selected]
    else:
        affected = [task for task, modules in closures.items() if changed is None or
                    changed & (global_inputs | {INVENTORY["modules"][m]["path"] for m in modules})]
    retained = maximal_tasks(affected, closures)
    return {
        "tasks": retained,
        "affected_tasks": sorted(affected),
        "covered_affected_tasks": {task: sorted(name for name in affected
            if closures[name] <= closures[task]) for task in retained},
        "required_theorems": {task: task_spec(task)[3] for task in retained},
        "preflight": {task: preflight_report(task) for task in retained},
        "reserved_candidates": INVENTORY.get("reserved_candidates", {}),
    }


def gate_hashes():
    return {path: digest(ROOT / path) for path in GATE_INPUTS}


def private_certificate_nodes(modules, root=None):
    """Cover Vaughan/Pasch checkedN and period-nine checkedN_M proofs exactly."""
    root = ROOT if root is None else Path(root)
    result = {}
    for module in modules:
        entry = INVENTORY["modules"][module]
        text = (root / entry["path"]).read_text()
        names = re.findall(r"^private theorem (checked[A-Za-z0-9_]*)\b", text, re.MULTILINE)
        namespaces = re.findall(r"^namespace ([A-Za-z0-9_.]+)\s*$", text, re.MULTILINE)
        if names and (len(namespaces) != 1 or len(names) != len(set(names))):
            raise ValueError(f"unsupported private certificate namespace layout: {module}")
        actual = [namespaces[0] + "." + name for name in names]
        if actual != entry["private_certificate_nodes"]:
            raise ValueError(f"private certificate inventory differs: {module}")
        if actual:
            result[module] = actual
    flat = [name for names in result.values() for name in names]
    if len(flat) != len(set(flat)):
        raise ValueError("ambiguous duplicate private certificate user names")
    return result


def logged_run(command, log_path):
    print("+ " + " ".join(command), flush=True)
    output = []
    with log_path.open("w") as log:
        process = subprocess.Popen(command, cwd=LEAN, text=True, stdout=subprocess.PIPE,
                                   stderr=subprocess.STDOUT,
                                   env={**os.environ, "LEAN_NUM_THREADS": "1"})
        assert process.stdout is not None
        for line in process.stdout:
            print(line, end="", flush=True)
            log.write(line)
            output.append(line)
        result = process.wait()
    if result:
        raise subprocess.CalledProcessError(result, command)
    return "".join(output)


def audit_exact_closure(modules, required, destination):
    nodes = private_certificate_nodes(modules)
    path = destination / "AxiomAudit.lean"
    path.write_text(audit_source(modules, required, nodes))
    log = destination / "axiom-audit.log"
    output = logged_run(["lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true",
                         str(path)], log)
    match = re.search(r"PASS: (\d+) project theorems audited; all (\d+) private "
                      r"certificate-node proofs visible", output)
    expected = sum(map(len, nodes.values()))
    if match is None or int(match[2]) != expected:
        raise RuntimeError("audit did not report exact private-certificate visibility")
    return {"explicit_import_all": True, "project_modules": len(modules),
            "project_theorems": int(match[1]), "required_endpoints": len(required),
            "private_certificate_nodes_visible": expected,
            "private_certificate_nodes_by_module": {m: len(v) for m, v in nodes.items()},
            "audit_source_sha256": digest(path), "log_sha256": digest(log)}


def assert_exact_replay_set(output, modules):
    replayed = re.findall(r"^replaying ([A-Za-z0-9_.]+)$", output, re.MULTILINE)
    if len(replayed) != len(set(replayed)):
        raise RuntimeError("kernel replay reported duplicate project modules")
    if set(replayed) != set(modules):
        missing = sorted(set(modules) - set(replayed))
        extra = sorted(set(replayed) - set(modules))
        raise RuntimeError(f"kernel replay set mismatch: missing={missing}; extra={extra}")
    return replayed


def replay_exact_closure(target, modules, destination):
    log = destination / "kernel-replay.log"
    output = logged_run(["lake", "env", "python3", "../scripts/replay_lean.py", "--root", target], log)
    replayed = assert_exact_replay_set(output, modules)
    return {"replayed_modules": replayed, "exact_replay_set": True,
            "log_sha256": digest(log)}


def object_hashes(modules):
    result = {}
    for module in modules:
        stem = LEAN / ".lake/build/lib/lean" / module.replace(".", "/")
        artifacts = {}
        for suffix in (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig"):
            path = Path(str(stem) + suffix)
            if path.is_symlink():
                raise RuntimeError(f"project proof artifacts must be materialized: {path}")
            if not path.is_file():
                if suffix.startswith(".olean"):
                    raise RuntimeError(f"missing modern Lean object facet: {path}")
                continue
            artifacts[suffix] = digest(path)
        result[module] = artifacts
    return result


def check_output_paths(modules):
    for module in modules:
        stem = LEAN / ".lake/build/lib/lean" / module.replace(".", "/")
        for suffix in (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig"):
            path = Path(str(stem) + suffix)
            if path.is_symlink():
                raise RuntimeError(f"refusing to overwrite a symlinked project artifact: {path}")


def check_pinned_checker():
    command = ["lake", "env", "python3", "-c",
               "import shutil; print(shutil.which('leanchecker') or '')"]
    path = subprocess.check_output(command, cwd=LEAN, text=True).strip()
    if not path or not Path(path).is_file():
        raise RuntimeError("pinned Lean checker is unavailable")
    actual = digest(Path(path))
    if actual != INVENTORY["toolchain"]["checker_sha256"]:
        raise RuntimeError("Lean checker differs from the reviewed stock pinned binary")
    return {"path": path, "sha256": actual}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task", nargs="?", choices=sorted(TASKS))
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--plan", action="store_true")
    modes.add_argument("--plan-ci", action="store_true")
    modes.add_argument("--preflight", action="store_true")
    parser.add_argument("--files", nargs="*")
    args = parser.parse_args()
    if args.files is not None and not args.plan_ci:
        parser.error("--files requires --plan-ci")
    if args.plan_ci:
        changed = set(args.files) if args.files is not None else changed_sources()
        plan = ci_plan(changed, args.task)
        print(json.dumps(plan, indent=2))
        if output := os.environ.get("GITHUB_OUTPUT"):
            with open(output, "a") as handle:
                handle.write("tasks=" + json.dumps(plan["tasks"], separators=(",", ":")) + "\n")
        return
    if args.task is None:
        parser.error("a candidate or --plan-ci is required")
    report = preflight_report(args.task)
    if args.plan:
        print(json.dumps(report, indent=2))
        return
    destination = ROOT / ".candidate-artifacts" / ("frankl-span-four-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    receipt = {**report, "commit": revision(), "status": "running", "completed_checks": [],
               "inventory_sha256": digest(ROOT / INVENTORY_PATH),
               "gate_sha256": gate_hashes(), "scope": INVENTORY["candidates"][args.task]["scope"]}
    try:
        if not report["ready"]:
            receipt["status"] = "blocked"
            print(json.dumps(report, indent=2), flush=True)
            raise RuntimeError("candidate publication preflight failed; required sources or pinned hashes are missing/mismatched")
        if args.preflight:
            receipt["status"] = "ready_for_verification"
            print(json.dumps(report, indent=2))
            return
        target = report["target"]
        modules = dependency_order([target])
        if set(modules) != set(report["project_modules"]):
            raise RuntimeError("actual project import closure differs from the reviewed inventory")
        required = report["required_theorems"]
        initial_sources = source_hashes(modules)
        initial_gate = receipt["gate_sha256"]
        receipt["project_modules"] = modules
        receipt["source_sha256"] = initial_sources
        receipt["checker"] = check_pinned_checker()
        check_output_paths(modules)
        check_sources(modules, receipt)
        artifacts = object_hashes(modules)
        receipt["artifact_sha256"] = artifacts
        receipt["completed_checks"].append("strict source rebuild of every project dependency")
        receipt["axiom_audit"] = audit_exact_closure(modules, required, destination)
        receipt["completed_checks"].append("import-all audit with exact private-node visibility")
        receipt["kernel_replay"] = replay_exact_closure(target, modules, destination)
        receipt["completed_checks"].append("stock kernel replay with exact module-set equality")
        if source_hashes(modules) != initial_sources or gate_hashes() != initial_gate:
            raise RuntimeError("source or gate changed during verification")
        if object_hashes(modules) != artifacts or check_pinned_checker() != receipt["checker"]:
            raise RuntimeError("object facets or stock checker changed during verification")
        receipt["status"] = "passed"
    except BaseException as exc:
        if receipt["status"] != "blocked":
            receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        (destination / "receipt.json").write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(f"PASS frankl-span-four-{args.task}: exact source, axiom and stock kernel gates", flush=True)


if __name__ == "__main__":
    main()
