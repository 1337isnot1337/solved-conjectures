#!/usr/bin/env python3
"""Fresh exact verification of the reconstructed concrete residual tail.

Historical local receipts certify prior bytes only. This gate rebuilds every
project dependency, audits all declarations including the447 new private finite
proofs, and requires full exact stock-kernel replay of these new source bytes.
"""

from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import re
import subprocess

from plan_lean_candidates import changed_sources
from verify_frankl_fc_candidate import maximal_tasks
from verify_lean_candidate import ROOT, LEAN, digest, revision, source_hashes
from verify_line_size_candidate import check_sources, dependency_order


INVENTORY_PATH = "docs/frankl-residual-tail-recovery-sources.json"
BASE_INVENTORY_PATH = "docs/frankl-span-four-source-inventory.json"
INVENTORY = json.loads((ROOT / INVENTORY_PATH).read_text())
BASE_INVENTORY = json.loads((ROOT / BASE_INVENTORY_PATH).read_text())
REPRODUCER_PATH = "results/frankl-generator-families/generate_span_four_residual_tail.py"
TASKS = {"tail": (INVENTORY["root"], sorted(set(INVENTORY["required_endpoints"] +
    BASE_INVENTORY["candidates"]["assembly"]["required_theorems"] +
    BASE_INVENTORY["candidates"]["word-coverage"]["required_theorems"])))}


def preflight_sources():
    if INVENTORY["schema"] != "frankl-residual-tail-recovery-v1":
        raise ValueError("Residual-tail inventory schema differs")
    for entry in INVENTORY["files"]:
        if digest(ROOT / entry["path"]) != entry["sha256"]:
            raise ValueError("Residual-tail source differs: " + entry["path"])


def private_nodes(modules):
    result = {}
    own_expected = INVENTORY["private_checked_nodes_by_module"]
    for module in modules:
        path = LEAN / (module.replace(".", "/") + ".lean")
        source = path.read_text()
        names = re.findall(r"^private theorem (checked[A-Za-z0-9_]*)\b", source, re.MULTILINE)
        namespaces = re.findall(r"^namespace ([A-Za-z0-9_.]+)\s*$", source, re.MULTILINE)
        if names and (len(namespaces) != 1 or len(names) != len(set(names))):
            raise ValueError("Unsupported finite-proof namespace layout: " + module)
        actual = [namespaces[0] + "." + name for name in names]
        if module in own_expected:
            if actual != own_expected[module]:
                raise ValueError("Tail private-proof inventory differs: " + module)
        elif module in BASE_INVENTORY["modules"]:
            if actual != BASE_INVENTORY["modules"][module]["private_certificate_nodes"]:
                raise ValueError("Prior private-proof inventory differs: " + module)
        elif actual:
            raise ValueError("Unlisted finite-proof module: " + module)
        if actual:
            result[module] = actual
    if not set(own_expected) <= set(modules):
        raise ValueError("Tail gate omits a certificate module")
    if sum(len(result[m]) for m in own_expected) != 447:
        raise ValueError("Tail must expose all447 new private proofs")
    flat = [name for names in result.values() for name in names]
    if len(flat) != len(set(flat)):
        raise ValueError("Duplicate finite-proof names")
    return result


def audit_source(modules, required, private_nodes):
    """Audit every owned declaration, retaining explicit theorem/node checks."""
    imports = "\n".join("import all " + module for module in modules)
    names = ",\n    ".join("`" + name for name in required)
    private_names = ",\n    ".join(
        "`" + name for names in private_nodes.values() for name in names)
    owned = ",\n    ".join(json.dumps(module) for module in modules)
    counts = json.dumps({module: len(names) for module, names in private_nodes.items()},
                        sort_keys=True)
    return f'''module
{imports}
import Lean.Util.CollectAxioms
import Lean.PrivateName

open Lean Elab Command in
run_cmd do
  let required : Array Name := #[{names}]
  for name in required do
    let info ← getConstInfo name
    unless info.isTheorem do
      throwError "Required endpoint is not a theorem: {{name}}"
  let expectedPrivate : Array Name := #[{private_names}]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let modules : Array String := #[{owned}]
  let env ← getEnv
  let mut count : Nat := 0
  let mut ownedCount : Nat := 0
  let mut seenPrivate : Array Name := #[]
  for (name, info) in env.constants.toList do
    let owned := match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
      | some mod => modules.contains mod.module.toString
      | none => false
    if owned then
      ownedCount := ownedCount + 1
      if let .axiomInfo _ := info then
        unless allowed.contains name do
          throwError "Unapproved project axiom {{name}}"
      if let .thmInfo _ := info then
        count := count + 1
        if let some userName := privateToUserName? name then
          if expectedPrivate.contains userName then
            seenPrivate := seenPrivate.push userName
      for axiomName in ← collectAxioms name do
        unless allowed.contains axiomName do
          throwError "Unapproved axiom {{axiomName}} in {{name}}"
  for name in expectedPrivate do
    unless seenPrivate.contains name do
      throwError "Missing private certificate theorem: {{name}}"
  unless seenPrivate.size == expectedPrivate.size do
    throwError "Private certificate theorem count mismatch"
  logInfo m!"PASS: {{count}} project theorems audited; all {{expectedPrivate.size}} private certificate-node proofs visible; only standard logical axioms"
  logInfo m!"PASS: {{ownedCount}} owned declarations audited transitively"
  logInfo {json.dumps("Private certificate-node counts by module: " + counts)}
'''


def audit_exact_closure(modules, required, destination):
    nodes = private_nodes(modules)
    path = destination / "AxiomAudit.lean"
    path.write_text(audit_source(modules, required, nodes))
    log = destination / "axiom-audit.log"
    output = logged_run(["lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true", str(path)], log)
    match = re.search(r"PASS: (\d+) project theorems audited; all (\d+) private "
                      r"certificate-node proofs visible", output)
    expected = sum(map(len, nodes.values()))
    owned_match = re.search(r"PASS: (\d+) owned declarations audited transitively", output)
    if match is None or int(match[2]) != expected:
        raise RuntimeError("Missing exact private-proof visibility result")
    if owned_match is None or int(owned_match[1]) < int(match[1]):
        raise RuntimeError("Missing complete owned-declaration axiom audit")
    return {"project_modules": len(modules), "project_theorems": int(match[1]),
            "owned_declarations_audited": int(owned_match[1]),
            "required_endpoints": len(required), "private_certificate_nodes_visible": expected,
            "new_private_certificate_nodes": 447, "explicit_import_all": True,
            "all_owned_declarations_audited": True, "audit_source_sha256": digest(path),
            "log_sha256": digest(log)}


def reproduce_data(destination):
    path = destination / "tail-regeneration.json"
    subprocess.run(["python3", str(ROOT / REPRODUCER_PATH), "--check", "--output", str(path)],
                   cwd=ROOT, check=True)
    data = json.loads(path.read_text())
    if (data["original_finder_stdout_sha256"] != INVENTORY["original_finder_stdout_sha256"] or
            data["private_checked_nodes"] != 447 or data["original_replay_count"] != 31):
        raise RuntimeError("Original tail data reproduction differs")
    for name, expected in data["generated_source_sha256"].items():
        if digest(LEAN / "Conjectures" / name) != expected:
            raise RuntimeError("Generated tail proof source changed: " + name)
    return {"path": str(path), "sha256": digest(path),
            "generated_sources": len(data["generated_source_sha256"]),
            "original_finder_stdout_sha256": data["original_finder_stdout_sha256"]}


GATE_INPUTS = (
    "scripts/verify_frankl_residual_tail.py",
    INVENTORY_PATH, BASE_INVENTORY_PATH, REPRODUCER_PATH,
    "scripts/verify_frankl_fc_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/verify_line_size_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    ".github/workflows/lean-frankl-residual-tail.yml",
    "lean/lean-toolchain",
    "lean/lakefile.toml",
    "lean/lake-manifest.json",
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
    if actual != "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6":
        raise RuntimeError("Lean checker differs from the reviewed stock pinned binary")
    return {"path": path, "sha256": actual}


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
    preflight_sources()
    initial = source_hashes(modules)
    initial_gate = gate_hashes()
    receipt = {
        "task": args.task, "commit": revision(), "target": target,
        "project_modules": modules, "source_sha256": initial,
        "gate_sha256": initial_gate, "required_theorems": required,
        "covered_tasks": covered, "status": "running", "completed_checks": [],
        "scope": "Exact48 residual extensions,31 literal width-five certificates and final17-edge rank; earlier graph/width-four/short-period obligations remain.",
        "recovery_inventory_sha256": digest(ROOT / INVENTORY_PATH),
    }
    destination = ROOT / ".candidate-artifacts" / ("frankl-residual-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        receipt["reproduction"] = reproduce_data(destination)
        receipt["checker"] = check_pinned_checker()
        check_output_paths(modules)
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        initial_objects = object_hashes(modules)
        receipt["artifact_sha256"] = initial_objects
        receipt["axiom_audit"] = audit_exact_closure(modules, required, destination)
        receipt["completed_checks"].append(
            "explicit import-all axiom whitelist and exact private-node visibility")
        receipt["kernel_replay"] = replay_exact_closure(target, modules, destination)
        receipt["completed_checks"].append("independent exact-closure kernel replay")
        if source_hashes(modules) != initial or gate_hashes() != initial_gate:
            raise RuntimeError("source or gate changed during verification")
        if object_hashes(modules) != initial_objects or check_pinned_checker() != receipt["checker"]:
            raise RuntimeError("proof objects or stock checker changed during verification")
        if digest(Path(receipt["reproduction"]["path"])) != receipt["reproduction"]["sha256"]:
            raise RuntimeError("Reproduction evidence changed during gate")
        receipt["status"] = "passed"
    except BaseException as exc:
        receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        (destination / "receipt.json").write_text(
            json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(f"PASS frankl-residual-{args.task}: strict source, axiom and pinned kernel gates", flush=True)


if __name__ == "__main__":
    main()
