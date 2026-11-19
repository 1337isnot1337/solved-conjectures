#!/usr/bin/env python3
"""Hosted-only candidate validation for bounded source and kernel scheduling.

The original checkout is read-only. Fresh isolated fixture repositories use its
pinned dependency cache, but never its project objects. The successful fixture
covers both namespace roots, private proofs, source dependencies and exact
stock replay. A separate deliberately ill-typed fixture must fail before its
dependent is started. The real arithmetic pilot is rebuilt and audited once,
then its complete closure is replayed independently at every requested worker
count. No accepted root, registry or verification command is changed.
"""
from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import re
import shutil
import signal
import subprocess
import sys
import time

import build_lean_parallel as build
import replay_lean_parallel as replay

ROOT = Path(__file__).resolve().parent.parent
PILOT_ROOT = "Conjectures.FranklSmallCyclicWeightsPilot"
INVENTORY_PATH = "docs/lean-parallel-candidate-sources.json"
WORKFLOW_PATH = ".github/workflows/lean-parallel-candidate.yml"
SCRIPT_FILES = (
    "scripts/build_lean_parallel.py",
    "scripts/replay_lean_parallel.py",
    "scripts/test_lean_parallel.py",
    "scripts/verify_lean_parallel_candidate.py",
    "scripts/plan_accepted_lean.py",
    "scripts/replay_lean.py",
)
FIXTURE_MODULES = (
    "Conjectures.Base", "Conjectures.Left", "Conjectures.Right",
    "Conjectures.Top", "Solitaire.Base",
)
FIXTURE_SOURCES = {
    "Conjectures": "import Conjectures.Top\n",
    "Solitaire": "import Solitaire.Base\n",
    "Conjectures.Base": """module
@[expose] public section
namespace ParallelFixture
def unreferencedDefinition : Nat := 7
theorem base : 1 + 1 = (2 : Nat) := rfl
end ParallelFixture
""",
    "Conjectures.Left": """module
public import Conjectures.Base
@[expose] public section
namespace ParallelFixture.Left
private theorem checked : 2 + 2 = (4 : Nat) := by decide
theorem value : 2 + 2 = (4 : Nat) := checked
end ParallelFixture.Left
""",
    "Conjectures.Right": """module
public import Conjectures.Base
@[expose] public section
namespace ParallelFixture.Right
private theorem checked : 3 + 3 = (6 : Nat) := by decide
theorem value : 3 + 3 = (6 : Nat) := checked
end ParallelFixture.Right
""",
    "Conjectures.Top": """module
public import Conjectures.Left
public import Conjectures.Right
@[expose] public section
namespace ParallelFixture.Top
theorem both : (2 + 2 = (4 : Nat)) ∧ (3 + 3 = (6 : Nat)) :=
  ⟨ParallelFixture.Left.value, ParallelFixture.Right.value⟩
end ParallelFixture.Top
""",
    "Solitaire.Base": """namespace ParallelFixture.Other
theorem value : True := True.intro
end ParallelFixture.Other
""",
}
FIXTURE_REQUIRED = (
    "ParallelFixture.base", "ParallelFixture.Left.value",
    "ParallelFixture.Right.value", "ParallelFixture.Top.both",
    "ParallelFixture.Other.value",
)
FIXTURE_PRIVATE = {
    "Conjectures.Left": ["ParallelFixture.Left.checked"],
    "Conjectures.Right": ["ParallelFixture.Right.checked"],
}
PILOT_REQUIRED = tuple(
    f"FranklSmallCyclic.Weights.Period{n}Pilot.{name}"
    for n in (7, 8, 9) for name in ("checked", "each_checked"))


def audit_source(modules, required, private_nodes):
    """Every owned declaration is scanned, including unused definitions."""
    imports = "\n".join("import all " + module for module in sorted(modules))
    endpoints = ", ".join("`" + name for name in required)
    private = [name for names in private_nodes.values() for name in names]
    private_names = ", ".join("`" + name for name in private)
    owned = ", ".join(json.dumps(module) for module in sorted(modules))
    # The accepted roots may be legacy sources. A legacy audit can import
    # both formats while retaining explicit import-all private visibility.
    return f'''{imports}
import Lean.Util.CollectAxioms
import Lean.PrivateName

open Lean Elab Command in
run_cmd do
  let required : Array Name := #[{endpoints}]
  let expectedPrivate : Array Name := #[{private_names}]
  let modules : Array String := #[{owned}]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  let mut declarations : Nat := 0
  let mut theorems : Nat := 0
  let mut seenPrivate : Array Name := #[]
  for name in required do
    let info ← getConstInfo name
    unless info.isTheorem do
      throwError "Required endpoint is not a theorem: {{name}}"
  for (name, info) in env.constants.toList do
    let owned := match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
      | some mod => modules.contains mod.module.toString
      | none => false
    if owned then
      declarations := declarations + 1
      if let .axiomInfo _ := info then
        unless allowed.contains name do
          throwError "Unapproved project axiom {{name}}"
      if let .thmInfo _ := info then
        theorems := theorems + 1
        if let some userName := privateToUserName? name then
          if expectedPrivate.contains userName then
            seenPrivate := seenPrivate.push userName
      for axiomName in ← collectAxioms name do
        unless allowed.contains axiomName do
          throwError "Unapproved axiom {{axiomName}} in {{name}}"
  for name in expectedPrivate do
    unless seenPrivate.contains name do
      throwError "Missing private theorem {{name}}"
  unless seenPrivate.size == expectedPrivate.size do
    throwError "Private theorem count mismatch"
  logInfo m!"PARALLEL-AUDIT PASS: {{declarations}} owned declarations; {{theorems}} theorems; {{expectedPrivate.size}} private proofs; {{required.size}} endpoints"
'''


def private_inventory(sources):
    result = {}
    for module, source in sorted(sources.items()):
        names = re.findall(r"^private theorem (checked[A-Za-z0-9_]*)\b", source, re.MULTILINE)
        if not names:
            continue
        namespaces = re.findall(r"^namespace ([A-Za-z0-9_.]+)\s*$", source, re.MULTILINE)
        if len(namespaces) != 1 or len(names) != len(set(names)):
            raise ValueError("Unsupported finite-proof namespace layout: " + module)
        result[module] = [namespaces[0] + "." + name for name in names]
    flat = [name for names in result.values() for name in names]
    if len(flat) != len(set(flat)):
        raise ValueError("Duplicate expected private-proof name")
    return result


def checkout_snapshot(graph):
    return build.snapshot_inputs(ROOT, graph, (*SCRIPT_FILES, INVENTORY_PATH, WORKFLOW_PATH))


def prepare_repo(destination, sources, required, private_nodes, package_cache):
    destination.mkdir()
    lean = destination / "lean"
    lean.mkdir()
    for relative in (*build.CONFIG, *SCRIPT_FILES):
        source, target = ROOT / relative, destination / relative
        build.direct_file(source)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source, target)
        if build.sha256(source) != build.sha256(target):
            raise ValueError("Input changed while copying: " + relative)
    for module, content in sources.items():
        path = build.source_path(lean, module)
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
    # Lake still has its original three library declarations. Empty roots not
    # imported by a candidate are source placeholders, never omitted members
    # of that candidate's replay closure.
    for root in ("Conjectures", "Solitaire"):
        path = build.source_path(lean, root)
        if not path.exists():
            path.write_text("-- This root is outside the selected candidate closure.\n")
    audit = lean / "ProofAudit.lean"
    audit.write_text(audit_source(sources, required, private_nodes), encoding="utf-8")
    (destination / ".gitignore").write_text("lean/.lake/\n__pycache__/\n", encoding="utf-8")
    (lean / ".lake").mkdir()
    (lean / ".lake/packages").symlink_to(package_cache, target_is_directory=True)
    subprocess.run(["git", "init", "-q"], cwd=destination, check=True, timeout=30)
    subprocess.run(["git", "add", "--", ".gitignore", "lean", "scripts"],
                   cwd=destination, check=True, timeout=30)
    subprocess.run(["git", "-c", "user.name=Scheduler fixture",
                    "-c", "user.email=scheduler-fixture@example.invalid",
                    "-c", "commit.gpgsign=false", "-c", "core.hooksPath=/dev/null",
                    "commit", "-qm", "Isolated bounded Lean verification fixture"],
                   cwd=destination, check=True, timeout=30)
    return lean


def bounded_command(label, command, *, cwd, output, memory_limit_mib, timeout_seconds,
                    expected_failure=False):
    result = {"command": list(map(str, command)), "results": [], "metrics": {}}
    env = {**os.environ, "LEAN_NUM_THREADS": "1", "PYTHONDONTWRITEBYTECODE": "1"}
    # Every isolated Lake invocation derives its own manifest search path.
    # Do not inherit the original checkout if this runner was itself launched
    # through lake env.
    env.pop("LEAN_PATH", None)
    try:
        build.run_dag({label: set()}, lambda _: result["command"],
            cwd=cwd, env=env, output=output, jobs=1, memory_limit_mib=memory_limit_mib,
            records=result["results"], timeout_seconds=timeout_seconds,
            metrics=result["metrics"])
    except RuntimeError:
        completed = result["results"]
        if (not expected_failure or len(completed) != 1
                or completed[0].get("cancelled") or completed[0].get("exit_code") == 0):
            log = output / (label + ".log")
            if log.is_file():
                print(log.read_text(errors="replace")[-8000:], flush=True)
            raise
    else:
        if expected_failure:
            raise ValueError("The negative fixture unexpectedly succeeded")
    result["expected_failure"] = expected_failure
    return result


def load_receipt(path, status, phase):
    build.direct_file(path)
    result = json.loads(path.read_text(encoding="utf-8"))
    if result.get("status") != status or result.get("phase") != phase:
        raise ValueError("Unexpected verification receipt status/phase: " + str(path))
    return result


def source_phase(lean, output, modules, root, args, *, expected_failure=False):
    command = [sys.executable, str(lean.parent / "scripts/build_lean_parallel.py"),
               "--lean-dir", str(lean), "--jobs", str(args.jobs),
               "--memory-limit-mib", str(args.memory_limit_mib),
               "--timeout-seconds", str(args.timeout_seconds),
               "--output-dir", str(output / "source")]
    command += ["--root", root] if root else list(modules)
    result = bounded_command("source-command", command, cwd=lean, output=output,
        memory_limit_mib=args.memory_limit_mib, timeout_seconds=args.timeout_seconds + 600,
        expected_failure=expected_failure)
    path = output / "source/receipt.json"
    receipt = load_receipt(path, "failed" if expected_failure else "passed", "source")
    result.update(receipt=str(path), receipt_sha256=build.sha256(path), source=receipt)
    return result


def audit_phase(lean, output, modules, required, private_nodes, args):
    path = lean / "ProofAudit.lean"
    expected = audit_source(modules, required, private_nodes)
    if path.read_text(encoding="utf-8") != expected:
        raise ValueError("The frozen import-all audit source differs")
    result = bounded_command("audit-command",
        ["lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true", str(path)],
        cwd=lean, output=output, memory_limit_mib=args.memory_limit_mib,
        timeout_seconds=args.timeout_seconds)
    log = output / "audit-command.log"
    match = re.search(
        r"PARALLEL-AUDIT PASS: (\d+) owned declarations; (\d+) theorems; "
        r"(\d+) private proofs; (\d+) endpoints", log.read_text())
    if (match is None or int(match[3]) != sum(map(len, private_nodes.values()))
            or int(match[4]) != len(required) or int(match[1]) < int(match[2])):
        raise ValueError("Missing complete declaration/private-proof audit result")
    result.update(all_owned_declarations_audited=True, explicit_import_all=True,
        owned_declarations=int(match[1]), project_theorems=int(match[2]),
        private_proofs=int(match[3]), required_endpoints=int(match[4]),
        audit_source_sha256=build.sha256(path), private_nodes_by_module=private_nodes)
    return result


def kernel_phases(lean, output, modules, root, graph, args, source):
    results = {}
    for workers in args.workers:
        destination = output / f"replay-{workers}"
        command = ["lake", "env", sys.executable,
            str(lean.parent / "scripts/replay_lean_parallel.py"),
            "--lean-dir", str(lean), "--workers", str(workers),
            "--memory-limit-mib", str(args.memory_limit_mib),
            "--timeout-seconds", str(args.timeout_seconds),
            "--source-receipt", source["receipt"], "--output-dir", str(destination)]
        command += ["--root", root] if root else list(modules)
        run = bounded_command(f"replay-{workers}-command", command, cwd=lean,
            output=output, memory_limit_mib=args.memory_limit_mib,
            timeout_seconds=args.timeout_seconds + 120)
        path = destination / "receipt.json"
        receipt = load_receipt(path, "passed", "kernel")
        replayed = receipt.get("exact_replay_set", [])
        if (set(replayed) != set(graph) or len(replayed) != len(graph)
                or receipt.get("artifact_sha256") != source["source"]["artifact_sha256"]
                or receipt.get("checker_sha256") != replay.CHECKER_SHA256
                or receipt.get("workers") != workers):
            raise ValueError("The guarded kernel result differs from its exact fresh source closure")
        run.update(receipt=str(path), receipt_sha256=build.sha256(path), kernel=receipt)
        results[str(workers)] = run
    return results


def verify_positive(name, sources, required, private_nodes, modules, root, output, cache, args):
    directory = output / name
    directory.mkdir()
    lean = prepare_repo(directory / "repo", sources, required, private_nodes, cache)
    graph, _prefixes, _external, extra = build.scope_plan(lean.parent, modules, root)
    if set(graph) != set(sources):
        raise ValueError("Copied source list differs from the exact selected closure")
    frozen = build.snapshot_inputs(lean.parent, graph, set(extra) | {"lean/ProofAudit.lean"})
    head = build.git_head(lean.parent)
    result = {"project_modules": sorted(graph), "isolated_git_head": head,
              "frozen_inputs": frozen, "status": "running"}
    build.write_json(directory / "receipt.json", result)
    try:
        result["source"] = source_phase(lean, directory, modules, root, args)
        if result["source"]["source"].get("source_module_count") != len(graph):
            raise ValueError("The source scheduler omitted a module")
        result["axiom_audit"] = audit_phase(lean, directory, graph, required, private_nodes, args)
        result["kernel_replays"] = kernel_phases(lean, directory, modules, root, graph,
                                                args, result["source"])
        build.assert_inputs(lean.parent, frozen, head)
        if name == "fixture":
            if (len(graph) != 7 or not {"Conjectures", "Solitaire"} <= set(graph)
                    or result["axiom_audit"]["owned_declarations"] <=
                       result["axiom_audit"]["project_theorems"]):
                raise ValueError("The core fixture did not cover roots and non-theorem declarations")
        result.update(status="passed", all_frozen_hashes_unchanged=True)
    except BaseException as error:
        result.update(status="failed", error=f"{type(error).__name__}: {error}")
        raise
    finally:
        build.write_json(directory / "receipt.json", result)
    return result


def verify_negative(output, cache, args):
    directory = output / "expected-source-failure"
    directory.mkdir()
    sources = dict(FIXTURE_SOURCES)
    # This intentionally ill-typed theorem is confined to the disposable test
    # repository. It must never produce a successful source or proof receipt.
    sources["Conjectures.Right"] += "\ntheorem deliberately_failing : False := True.intro\n"
    lean = prepare_repo(directory / "repo", sources, FIXTURE_REQUIRED, FIXTURE_PRIVATE, cache)
    result = source_phase(lean, directory, FIXTURE_MODULES, None, args, expected_failure=True)
    records = result["source"]["source_results"]
    failed = [r for r in records if r["module"] == "Conjectures.Right"
              and r.get("exit_code") != 0 and not r.get("cancelled")]
    if len(failed) != 1 or any(r["module"] in {"Conjectures.Top", "Conjectures"} for r in records):
        raise ValueError("A failed source released one of its dependent build targets")
    if (directory / "audit-command.log").exists() or list(directory.glob("replay-*")):
        raise ValueError("A failed source was allowed into a later verification phase")
    result.update(expected_failure_observed=True, dependents_never_started=True,
                  audit_not_started=True, kernel_not_started=True)
    build.write_json(directory / "receipt.json", result)
    return result


def measurement_summary(receipt):
    result = {}
    for name in ("fixture", "real_pilot"):
        phase = receipt.get(name)
        if not phase:
            continue
        source = phase["source"]["source"]
        audit = phase["axiom_audit"]
        kernels = {}
        for workers, entry in phase["kernel_replays"].items():
            kernel = entry["kernel"]
            kernels[workers] = {
                "replayed_modules": kernel["replayed_module_count"],
                "receipt_sha256": entry["receipt_sha256"],
                **{key: kernel["kernel"][key] for key in (
                    "elapsed_seconds", "sampled_peak_rss_kib",
                    "sampled_peak_high_water_kib", "sampled_peak_threads",
                    "sampled_peak_processes", "thread_limit")},
            }
        result[name] = {
            "project_modules": len(phase["project_modules"]),
            "source_seconds": source["elapsed_seconds"],
            "source_metrics": source["metrics"],
            "source_receipt_sha256": phase["source"]["receipt_sha256"],
            "owned_declarations": audit["owned_declarations"],
            "project_theorems": audit["project_theorems"],
            "private_proofs": audit["private_proofs"],
            "required_endpoints": audit["required_endpoints"],
            "kernel_measurements": kernels,
        }
    return result


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--jobs", type=int, choices=range(1, build.MAX_WORKERS + 1), default=2)
    parser.add_argument("--workers", type=int, nargs="+", choices=range(1, build.MAX_WORKERS + 1),
                        default=[1, 2, 3, 4])
    parser.add_argument("--memory-limit-mib", type=int, default=12288)
    parser.add_argument("--timeout-seconds", type=float, default=3600)
    parser.add_argument("--fixture-only", action="store_true",
                        help="Omit the real arithmetic measurement, recording only the small fixture scope")
    args = parser.parse_args(argv)
    inventory = json.loads((ROOT / INVENTORY_PATH).read_text(encoding="utf-8"))
    if inventory.get("schema") != "bounded-lean-scheduler-candidate-v1":
        raise ValueError("Unsupported scheduler candidate inventory")
    for entry in inventory["files"]:
        path = ROOT / entry["path"]
        build.direct_file(path)
        if build.sha256(path) != entry["sha256"]:
            raise ValueError("Candidate source differs from its reviewed inventory: " + entry["path"])
    if len(args.workers) != len(set(args.workers)):
        parser.error("Worker measurements must be distinct")
    if args.memory_limit_mib <= 0 or args.timeout_seconds <= 0:
        parser.error("Resource bounds must be positive")
    output = args.output_dir.absolute()
    if output.exists() or output.is_symlink():
        raise ValueError("Candidate output directory must be new")
    if output.resolve().is_relative_to(ROOT / "lean/.lake"):
        raise ValueError("Candidate outputs cannot be placed in the original Lean cache")
    output.mkdir(parents=True)
    if output.resolve() != output:
        raise ValueError("Candidate output directory must not be indirect")
    cache = (ROOT / "lean/.lake/packages").resolve()
    if not (cache / "mathlib").is_dir():
        raise ValueError("The pinned Mathlib package cache must be prepared by the hosted workflow")
    pilot_graph, pilot_sources, pilot_nodes = {}, {}, {}
    if not args.fixture_only:
        pilot_graph, _prefixes, _external, _extra = build.scope_plan(ROOT, [], PILOT_ROOT)
        pilot_sources = {m: build.source_path(ROOT / "lean", m).read_text(encoding="utf-8")
                         for m in pilot_graph}
        pilot_nodes = private_inventory(pilot_sources)
        if len(pilot_graph) != 25 or sum(map(len, pilot_nodes.values())) != 24:
            raise ValueError("The reviewed 25-module / 24-private-proof pilot closure differs")
    head = build.git_head(ROOT)
    frozen = checkout_snapshot(pilot_graph)
    receipt = {"status": "running", "scope": "fixture-only" if args.fixture_only else "fixture-and-real-pilot",
        "git_head": head, "input_sha256": frozen, "source_jobs": args.jobs,
        "kernel_worker_measurements": args.workers, "memory_limit_mib": args.memory_limit_mib,
        "checker_sha256": replay.CHECKER_SHA256, "accepted_gate_changed": False,
        "reuses_prior_project_objects": False, "package_cache": str(cache)}
    started = time.monotonic()
    try:
        receipt["protocol_tests"] = bounded_command("protocol-tests",
            [sys.executable, str(ROOT / "scripts/test_lean_parallel.py")],
            cwd=ROOT, output=output, memory_limit_mib=args.memory_limit_mib, timeout_seconds=300)
        test_log = (output / "protocol-tests.log").read_text()
        match = re.search(r"Ran (\d+) tests in", test_log)
        if match is None or int(match[1]) != 22 or not re.search(r"^OK$", test_log, re.MULTILINE):
            raise ValueError("The complete 22-test protocol suite did not pass")
        receipt["protocol_tests"]["tests_passed"] = int(match[1])
        receipt["fixture"] = verify_positive("fixture", FIXTURE_SOURCES, FIXTURE_REQUIRED,
            FIXTURE_PRIVATE, FIXTURE_MODULES, None, output, cache, args)
        receipt["expected_source_failure"] = verify_negative(output, cache, args)
        if not args.fixture_only:
            receipt["real_pilot"] = verify_positive("real-pilot", pilot_sources, PILOT_REQUIRED,
                pilot_nodes, [], PILOT_ROOT, output, cache, args)
        build.assert_inputs(ROOT, frozen, head)
        receipt.update(status="passed", original_inputs_unchanged=True)
    except BaseException as error:
        receipt.update(status="failed", error=f"{type(error).__name__}: {error}")
        raise
    finally:
        receipt["elapsed_seconds"] = time.monotonic() - started
        build.write_json(output / "receipt.json", receipt)
        print("SCHEDULER-CANDIDATE " + json.dumps({
            "status": receipt["status"], "scope": receipt["scope"],
            "receipt": str(output / "receipt.json"),
            "receipt_sha256": build.sha256(output / "receipt.json"),
            "protocol_tests_passed": receipt.get("protocol_tests", {}).get("tests_passed"),
            "expected_source_failure_observed": receipt.get("expected_source_failure", {}).get(
                "expected_failure_observed", False),
            "measurements": measurement_summary(receipt)}), flush=True)
    return 0


if __name__ == "__main__":
    signal.signal(signal.SIGTERM, build.interrupted)
    try:
        raise SystemExit(main())
    except (OSError, ValueError, RuntimeError, subprocess.SubprocessError) as error:
        print(f"FAIL: {error}", file=sys.stderr)
        raise SystemExit(1) from error
