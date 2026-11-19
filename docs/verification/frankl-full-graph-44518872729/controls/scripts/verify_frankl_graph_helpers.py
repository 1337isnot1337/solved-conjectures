#!/usr/bin/env python3
"""Verify recovered and reconstructed graph helpers with fresh exact gates.

The source inventory distinguishes exact recoveries from new proof bodies.
All project declarations and the full stock replay closure are checked.
The concrete large graph and rank certificates remain separate obligations.
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


INVENTORY_PATH = "docs/frankl-graph-helpers-sources.json"
INVENTORY = json.loads((ROOT / INVENTORY_PATH).read_text())
TASKS = {"helpers": (INVENTORY["root"], INVENTORY["required_theorems"])}


def preflight_sources():
    if INVENTORY["schema"] != "frankl-span-four-graph-helpers-recovery-v1":
        raise ValueError("Graph helper inventory schema differs")
    for path, record in INVENTORY["sources"].items():
        if digest(ROOT / path) != record["sha256"]:
            raise ValueError("Graph helper source differs from reviewed bytes: " + path)


GATE_INPUTS = (
    "scripts/verify_frankl_graph_helpers.py",
    INVENTORY_PATH,
    "scripts/verify_frankl_fc_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/verify_line_size_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    ".github/workflows/lean-frankl-graph-helpers.yml",
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


def lean_without_comments(text):
    """Remove comments and string contents before scanning declaration names."""
    out, i, depth, quoted = [], 0, 0, False
    while i < len(text):
        pair = text[i:i+2]
        ch = text[i]
        if depth:
            if pair == "/-":
                depth += 1
                out.extend("  ")
                i += 2
            elif pair == "-/":
                depth -= 1
                out.extend("  ")
                i += 2
            else:
                out.append("\n" if ch == "\n" else " ")
                i += 1
        elif quoted:
            if ch == "\\" and i + 1 < len(text):
                out.extend("  ")
                i += 2
            else:
                if ch == '"':
                    quoted = False
                out.append("\n" if ch == "\n" else " ")
                i += 1
        elif pair == "/-":
            depth = 1
            out.extend("  ")
            i += 2
        elif pair == "--":
            end = text.find("\n", i)
            if end < 0:
                end = len(text)
            out.extend(" " * (end - i))
            i = end
        else:
            if ch == '"':
                quoted = True
                out.append(" ")
            else:
                out.append(ch)
            i += 1
    if depth or quoted:
        raise ValueError("Unterminated Lean comment or string during private-proof scan")
    return "".join(out)


def explicit_private_proofs(modules):
    result = {}
    for module in modules:
        source = LEAN / (module.replace(".", "/") + ".lean")
        clean = lean_without_comments(source.read_text())
        scopes, names = [], []
        for raw in clean.splitlines():
            line = raw.strip()
            line = re.sub(r"^(?:@\[[^\]]*\]\s*)+", "", line)
            scope = re.fullmatch(r"namespace\s+([\w'.]+)", line)
            if scope:
                scopes.append(("namespace", scope[1]))
                continue
            if re.fullmatch(r"(?:(?:public|noncomputable)\s+)*section(?:\s+[\w'.]+)?", line):
                scopes.append(("section", ""))
                continue
            if re.fullmatch(r"end(?:\s+[\w'.]+)?", line):
                if not scopes:
                    raise ValueError("Unmatched Lean end in " + module)
                scopes.pop()
                continue
            declaration = re.match(r"private\s+(?:theorem|lemma)\s+([\w'.]+)\b", line)
            if declaration:
                prefix = ".".join(name for kind, name in scopes if kind == "namespace")
                name = declaration[1]
                if name.startswith("_root_."):
                    full = name.removeprefix("_root_.")
                else:
                    full = ".".join(part for part in (prefix, name) if part)
                names.append(module + "|" + full)
        count = len(re.findall(r"\bprivate\s+(?:theorem|lemma)\b", clean))
        if count != len(names) or len(names) != len(set(names)):
            raise ValueError("Unsupported or duplicate private-proof syntax in " + module)
        result[module] = names
    return result


def graph_audit_source(modules, required, private):
    names = lambda values: ",\n    ".join("`" + value for value in values)
    strings = lambda values: ",\n    ".join(json.dumps(value) for value in values)
    return '''module
''' + "".join("import all " + module + "\n" for module in modules) + '''import Lean.Util.CollectAxioms
import Lean.PrivateName

open Lean Elab Command in
run_cmd do
  let modules : Array String := #[''' + strings(modules) + ''']
  let required : Array Name := #[''' + names(required) + ''']
  let expectedPrivate : Array String := #[''' + strings(private) + ''']
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  let imported := env.header.modules.filter fun m => m.module.toString.startsWith "Conjectures."
  unless imported.size == modules.size do
    throwError "Project import closure count mismatch"
  for m in imported do
    unless modules.contains m.module.toString do
      throwError "Unexpected project import: {m.module}"
  for name in required do
    let info ← getConstInfo name
    unless info.isTheorem do
      throwError "Required endpoint is not a theorem: {name}"
  let mut declarations : Nat := 0
  let mut theorems : Nat := 0
  let mut privateDeclarations : Nat := 0
  let mut seenPrivate : Array String := #[]
  for (name, info) in env.constants.toList do
    let owner := env.getModuleIdxFor? name |>.bind (env.header.modules[·]?)
    if let some owner := owner then
      if modules.contains owner.module.toString then
        declarations := declarations + 1
        if info.isTheorem then
          theorems := theorems + 1
        if let some userName := privateToUserName? name then
          privateDeclarations := privateDeclarations + 1
          let key := owner.module.toString ++ "|" ++ userName.toString
          logInfo m!"PRIVATE_DECL {name} {key}"
          if info.isTheorem then
            logInfo m!"PRIVATE_THEOREM {name} {key}"
            if expectedPrivate.contains key then
              seenPrivate := seenPrivate.push key
        if let .axiomInfo _ := info then
          throwError "Unapproved project axiom: {name}"
        for axiomName in ← collectAxioms name do
          unless allowed.contains axiomName do
            throwError "Unapproved axiom {axiomName} in {name}"
        logInfo m!"DECL {name}"
  for name in expectedPrivate do
    unless seenPrivate.contains name do
      throwError "Missing explicit private proof: {name}"
  unless seenPrivate.size == expectedPrivate.size do
    throwError "Explicit private proof count mismatch"
  logInfo m!"PASS: {modules.size} project modules; {declarations} owned declarations; {theorems} owned theorems; {required.size} required endpoints; {privateDeclarations} private declarations; all {seenPrivate.size} explicit private proofs visible"
'''


def audit_exact_closure(modules, required, destination):
    by_module = explicit_private_proofs(modules)
    expected = [name for names in by_module.values() for name in names]
    source = destination / "AxiomAudit.lean"
    log = destination / "axiom-audit.log"
    source.write_text(graph_audit_source(modules, required, expected))
    output = logged_run(
        ["lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true", str(source)], log)
    match = re.search(
        r"PASS: (\d+) project modules; (\d+) owned declarations; (\d+) owned theorems; "
        r"(\d+) required endpoints; (\d+) private declarations; "
        r"all (\d+) explicit private proofs visible", output)
    if match is None:
        raise RuntimeError("Missing complete all-declaration audit summary")
    counts = list(map(int, match.groups()))
    if counts[0] != len(modules) or counts[3] != len(required) or counts[5] != len(expected):
        raise RuntimeError("Audit closure or required/private endpoint count mismatch")
    declarations = re.findall(r"^DECL (.+)$", output, re.MULTILINE)
    private = re.findall(r"^PRIVATE_DECL (.+)$", output, re.MULTILINE)
    private_theorems = re.findall(r"^PRIVATE_THEOREM (.+)$", output, re.MULTILINE)
    if len(declarations) != len(set(declarations)) or len(declarations) != counts[1]:
        raise RuntimeError("Declaration inventory differs from audit count")
    if len(private) != len(set(private)) or len(private) != counts[4]:
        raise RuntimeError("Private declaration inventory differs from audit count")
    inventory = destination / "declaration-inventory.json"
    inventory.write_text(json.dumps({
        "declarations": sorted(declarations),
        "private_declarations": sorted(private),
        "private_theorems": sorted(private_theorems),
        "expected_explicit_private_proofs_by_module": by_module,
    }, indent=2, sort_keys=True) + "\n")
    return {
        "explicit_import_all": True, "exact_project_import_closure": True,
        "all_owned_declarations_audited": True, "owned_declarations": counts[1],
        "project_theorems": counts[2], "private_declarations_visible": counts[4],
        "explicit_private_proofs_visible": counts[5],
        "expected_explicit_private_proofs_by_module": by_module,
        "audit_source_sha256": digest(source), "log_sha256": digest(log),
        "declaration_inventory_sha256": digest(inventory),
        "log": str(log.relative_to(ROOT)),
    }


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
        "scope": INVENTORY["scope"],
        "recovery_inventory": INVENTORY,
    }
    destination = ROOT / ".candidate-artifacts" / ("frankl-graph-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        receipt["checker"] = check_pinned_checker()
        check_output_paths(modules)
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        initial_objects = object_hashes(modules)
        receipt["artifact_sha256"] = initial_objects
        receipt["axiom_audit"] = audit_exact_closure(modules, required, destination)
        receipt["completed_checks"].append(
            "all-owned-declaration axiom whitelist, exact import closure and private-proof inventory")
        receipt["kernel_replay"] = replay_exact_closure(target, modules, destination)
        receipt["completed_checks"].append("independent exact-closure kernel replay")
        if source_hashes(modules) != initial or gate_hashes() != initial_gate:
            raise RuntimeError("source or gate changed during verification")
        if object_hashes(modules) != initial_objects or check_pinned_checker() != receipt["checker"]:
            raise RuntimeError("proof objects or stock checker changed during verification")
        receipt["status"] = "passed"
    except BaseException as exc:
        receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        (destination / "receipt.json").write_text(
            json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(f"PASS frankl-graph-{args.task}: strict source, axiom and pinned kernel gates", flush=True)


if __name__ == "__main__":
    main()
