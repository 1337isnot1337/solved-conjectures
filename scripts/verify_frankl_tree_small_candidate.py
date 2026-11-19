#!/usr/bin/env python3
"""Fresh exact source, all-declaration and stock-kernel gate for tree degrees 3--14.

The only changed Lean declaration receives a larger elaboration recursion
budget. The gate proves that deleting that one option command restores the
historical data source byte-for-byte. All 29 project modules are rebuilt from
source before the explicit import-all audit and exact materialized replay.
This does not identify the message cone with a finite graph counting fiber.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import time

from verify_lean_candidate import ROOT, LEAN, digest, revision, source_hashes
from verify_line_size_candidate import check_sources, dependency_order

INVENTORY_PATH = "docs/frankl-tree-small-candidate-sources.json"
WORKFLOW_PATH = ".github/workflows/lean-frankl-tree-small-candidate.yml"
INVENTORY = json.loads((ROOT / INVENTORY_PATH).read_text())
TARGET = "Conjectures.FranklTreeSmallDegrees"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
GATE_INPUTS = (
    "scripts/verify_frankl_tree_small_candidate.py", INVENTORY_PATH, WORKFLOW_PATH,
    "scripts/verify_lean_candidate.py", "scripts/verify_line_size_candidate.py",
    "scripts/plan_lean_candidates.py", "scripts/replay_lean.py",
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
)


def gate_hashes():
    return {path: digest(ROOT / path) for path in GATE_INPUTS}


def preflight_sources():
    if INVENTORY["schema"] != "frankl-tree-small-candidate-v1" or INVENTORY["root"] != TARGET:
        raise ValueError("Unexpected small-degree inventory schema/root")
    modules = dependency_order([TARGET])
    files = INVENTORY["files"]
    expected = {"lean/" + module.replace(".", "/") + ".lean" for module in modules}
    if (len(modules) != 29 or len(files) != 29
            or len({entry["path"] for entry in files}) != 29
            or {entry["path"] for entry in files} != expected):
        raise ValueError("The reviewed 29-module tree closure differs")
    for entry in files:
        path = ROOT / entry["path"]
        if path.is_symlink() or not path.is_file() or digest(path) != entry["sha256"]:
            raise ValueError("Tree source differs from the inventory: " + entry["path"])
        source = path.read_text(encoding="utf-8")
        if not re.match(r"\s*module(?:\s|$)", source):
            raise ValueError("Every tree object must retain its modern source facets")
    patch = INVENTORY["repair"]
    source = (ROOT / patch["path"]).read_text(encoding="utf-8")
    if source.count(patch["replacement_text"]) != 1:
        raise ValueError("The single scoped recursion-budget repair differs")
    original = source.replace(patch["replacement_text"], patch["original_text"], 1)
    if hashlib.sha256(original.encode("utf-8")).hexdigest() != patch["original_source_sha256"]:
        raise ValueError("Certificate data changed beyond the declared recursion option")
    required = INVENTORY["required_endpoints"]
    if len(required) != 173 or len(set(required)) != 173:
        raise ValueError("The required endpoint set differs")
    for degree in range(3, 15):
        module = f"Conjectures.FranklTreeBoundK{degree:02d}"
        text = (LEAN / (module.replace(".", "/") + ".lean")).read_text(encoding="utf-8")
        names = re.findall(r"^theorem ([A-Za-z0-9_]+)\b", text, re.MULTILINE)
        endpoints = {f"FranklTreeCone.Degree{degree:02d}." + name for name in names}
        if len(names) != 14 or not endpoints <= set(required):
            raise ValueError("Missing per-degree certificate theorem: " + module)
    return modules, required

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
    nodes = {}
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
            "public_degree_certificate_theorems": 168, "explicit_import_all": True,
            "all_owned_declarations_audited": True, "audit_source_sha256": digest(path),
            "log_sha256": digest(log)}

def assert_exact_replay_set(output, modules):
    replayed = re.findall(r"^replaying ([A-Za-z0-9_.]+)$", output, re.MULTILINE)
    if len(replayed) != len(set(replayed)):
        raise RuntimeError("kernel replay reported duplicate project modules")
    if set(replayed) != set(modules):
        missing = sorted(set(modules) - set(replayed))
        extra = sorted(set(replayed) - set(modules))
        raise RuntimeError(f"kernel replay set mismatch: missing={missing}; extra={extra}")
    return replayed

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

def logged_run(command, log_path, *, env=None):
    """Stream evidence and preserve independent command time/RSS measurements."""
    print("+ " + " ".join(map(str, command)), flush=True)
    resources = log_path.with_suffix(".resources.txt")
    timer = Path("/usr/bin/time")
    if not timer.is_file():
        raise RuntimeError("Hosted resource timer is unavailable")
    wrapped = [str(timer), "-f", "%e %M %x", "-o", str(resources), *map(str, command)]
    started = time.monotonic()
    output = []
    with log_path.open("w", encoding="utf-8") as log:
        process = subprocess.Popen(wrapped, cwd=LEAN, text=True, stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT, env=env or {**os.environ, "LEAN_NUM_THREADS": "1"})
        assert process.stdout is not None
        for line in process.stdout:
            print(line, end="", flush=True)
            log.write(line)
            output.append(line)
        result = process.wait()
    measurement = {"exit_code": result, "elapsed_seconds": time.monotonic() - started,
                   "command": list(map(str, command))}
    if resources.is_file():
        matches = re.findall(r"^([0-9.]+) ([0-9]+) ([0-9]+)$",
                             resources.read_text(), re.MULTILINE)
        if len(matches) == 1:
            elapsed, rss, exit_code = matches[0]
            measurement.update(timer_elapsed_seconds=float(elapsed), peak_rss_kib=int(rss),
                               timer_exit_code=int(exit_code))
    log_path.with_suffix(".metrics.json").write_text(
        json.dumps(measurement, indent=2, sort_keys=True) + "\n")
    if result:
        raise subprocess.CalledProcessError(result, command)
    return "".join(output)


def compiler_identity():
    version = subprocess.check_output(["lake", "env", "lean", "--version"],
                                      cwd=LEAN, text=True).strip()
    prefix = subprocess.check_output(["lake", "env", "lean", "--print-prefix"],
                                     cwd=LEAN, text=True).strip()
    compiler = (Path(prefix) / "bin/lean").resolve()
    if not compiler.is_file() or "eb6cafb" not in version:
        raise RuntimeError("The source compiler does not match the pinned Lean revision")
    return {"version": version, "path": str(compiler), "sha256": digest(compiler)}


def stage_objects(modules, destination, expected):
    stage = destination / "lib/lean"
    stage.mkdir(parents=True)
    staged_hashes = {}
    for module in modules:
        stem = module.replace(".", "/")
        for suffix in (".olean", ".olean.private", ".olean.server"):
            source = LEAN / ".lake/build/lib/lean" / (stem + suffix)
            target = stage / (stem + suffix)
            if source.is_symlink() or not source.is_file():
                raise RuntimeError("Missing materialized modern proof facet: " + str(source))
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source, target)
            actual = digest(target)
            if actual != expected[module][suffix]:
                raise RuntimeError("A proof facet changed while staging: " + str(source))
            staged_hashes[str(target.relative_to(stage))] = actual
    discovered = {str(path.relative_to(stage))[:-6].replace("/", ".")
                  for path in stage.rglob("*.olean")}
    if discovered != set(modules):
        raise RuntimeError("Materialized replay module set differs")
    return stage, staged_hashes


def replay_exact_closure(modules, destination, expected, checker):
    stage, staged_hashes = stage_objects(modules, destination, expected)
    raw = subprocess.check_output(["lake", "env", "python3", "-c",
        "import os; print(os.environ.get('LEAN_PATH', ''))"], cwd=LEAN, text=True).strip()
    search = []
    project_seen = False
    project = (LEAN / ".lake/build/lib/lean").resolve()
    for value in raw.split(os.pathsep):
        if not value:
            continue
        path = Path(value)
        path = (path if path.is_absolute() else LEAN / path).resolve()
        if path == project:
            search.append(str(stage))
            project_seen = True
        else:
            if (path / "Conjectures").exists() or (path / "Conjectures.olean").exists():
                raise RuntimeError("An external search path shadows the project namespace: " + str(path))
            search.append(str(path))
    if not project_seen:
        raise RuntimeError("Lake did not expose the checked project object directory")
    environment = {**os.environ, "LEAN_PATH": os.pathsep.join(search), "LEAN_NUM_THREADS": "1"}
    command = [checker["path"], "-v", "Conjectures"]
    if stdbuf := shutil.which("stdbuf"):
        command = [stdbuf, "-oL", "-eL", *command]
    log = destination / "kernel-replay.log"
    output = logged_run(command, log, env=environment)
    replayed = assert_exact_replay_set(output, modules)
    for path, expected_hash in staged_hashes.items():
        if digest(stage / path) != expected_hash:
            raise RuntimeError("A staged proof facet changed during replay: " + path)
    measurement = json.loads(log.with_suffix(".metrics.json").read_text())
    return {"replayed_modules": replayed, "exact_replay_set": True,
            "materialized_project_facets": staged_hashes, "workers": 1,
            "log_sha256": digest(log), "measurement": measurement}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preflight", action="store_true")
    args = parser.parse_args()
    modules, required = preflight_sources()
    if args.preflight:
        print(json.dumps({"status": "ready", "target": TARGET, "project_modules": modules,
                          "required_endpoints": len(required),
                          "certificate_data_unchanged": True}, indent=2))
        return
    destination = ROOT / ".candidate-artifacts/frankl-tree-small"
    if destination.exists() or destination.is_symlink():
        raise RuntimeError("The verification output directory must be new")
    destination.mkdir(parents=True)
    initial = source_hashes(modules)
    initial_gate = gate_hashes()
    started = time.monotonic()
    receipt = {
        "status": "running", "commit": revision(), "target": TARGET,
        "project_modules": modules, "source_sha256": initial,
        "gate_sha256": initial_gate, "required_theorems": required,
        "scope": INVENTORY["scope"], "certificate_data_unchanged": True,
        "recursion_repair": INVENTORY["repair"], "completed_checks": [],
    }
    try:
        receipt["compiler"] = compiler_identity()
        receipt["checker"] = check_pinned_checker()
        check_output_paths(modules)
        source_started = time.monotonic()
        check_sources(modules, receipt)
        receipt["source_seconds"] = time.monotonic() - source_started
        if receipt["checked_sources"] != modules or receipt["source_failures"]:
            raise RuntimeError("Strict source completion differs from the exact ordered closure")
        receipt["completed_checks"].append("strict source checks of all 29 modules")
        initial_objects = object_hashes(modules)
        receipt["artifact_sha256"] = initial_objects
        receipt["axiom_audit"] = audit_exact_closure(modules, required, destination)
        receipt["completed_checks"].append("all-owned-declaration import-all axiom audit")
        receipt["kernel_replay"] = replay_exact_closure(
            modules, destination, initial_objects, receipt["checker"])
        receipt["completed_checks"].append("exact materialized stock-kernel replay")
        if source_hashes(modules) != initial or gate_hashes() != initial_gate:
            raise RuntimeError("Source or gate input changed during verification")
        if object_hashes(modules) != initial_objects:
            raise RuntimeError("Proof artifacts changed during verification")
        if compiler_identity() != receipt["compiler"] or check_pinned_checker() != receipt["checker"]:
            raise RuntimeError("Source compiler or stock checker changed during verification")
        receipt.update(status="passed", all_input_and_artifact_hashes_unchanged=True)
    except BaseException as error:
        receipt.update(status="failed", error=f"{type(error).__name__}: {error}")
        raise
    finally:
        receipt["elapsed_seconds"] = time.monotonic() - started
        path = destination / "receipt.json"
        path.write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n")
        print("TREE-SMALL-CANDIDATE " + json.dumps({
            "status": receipt["status"], "commit": receipt["commit"],
            "project_modules": len(modules), "required_endpoints": len(required),
            "checked_sources": len(receipt.get("checked_sources", [])),
            "source_seconds": receipt.get("source_seconds"),
            "source_failures": receipt.get("source_failures", {}),
            "audit": receipt.get("axiom_audit"),
            "kernel": receipt.get("kernel_replay", {}).get("measurement"),
            "receipt_sha256": digest(path), "elapsed_seconds": receipt["elapsed_seconds"],
        }, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
