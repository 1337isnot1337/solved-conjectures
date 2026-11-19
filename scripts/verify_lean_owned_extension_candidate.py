#!/usr/bin/env python3
"""Fresh hosted fixture for a scoped all-owned modern-module extension audit."""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import signal
import subprocess
import sys
import time

import audit_lean_owned_extension as audit
import build_lean_parallel as build
import verify_lean_parallel_candidate as scheduler

ROOT = Path(__file__).resolve().parents[1]
OWN_INPUTS = (
    "scripts/audit_lean_owned_extension.py",
    "scripts/test_lean_owned_extension.py",
    "scripts/verify_lean_owned_extension_candidate.py",
    ".github/workflows/lean-owned-extension-candidate.yml",
)
DEP = "Conjectures.ExtensionDependency"
GOOD = "Conjectures.ExtensionGood"
BAD = "Conjectures.ExtensionBad"
IMPORTED = [DEP, GOOD, BAD]
OWNED = [GOOD, BAD]
REQUIRED = {GOOD: ["ExtensionGood.result"], BAD: ["ExtensionBad.result"]}
RESTRICTED = ("propext", "Quot.sound")

SOURCES = {
    DEP: """module

public import Mathlib.Data.Nat.Basic

@[expose] public section

namespace ExtensionDependency

private noncomputable def hiddenUnownedChoice : Nat :=
  Classical.choice (show Nonempty Nat from ⟨7⟩)

def unrelated : Nat := 3

end ExtensionDependency
""",
    GOOD: """module

public import Conjectures.ExtensionDependency

@[expose] public section

namespace ExtensionGood

private theorem hiddenProof : 2 + 2 = 4 := rfl

def value : Nat := 4

theorem result : 2 + 2 = 4 := hiddenProof

end ExtensionGood
""",
    BAD: """module

public import Conjectures.ExtensionGood

@[expose] public section

namespace ExtensionBad

private noncomputable def hiddenOwnedChoice : Nat :=
  Classical.choice (show Nonempty Nat from ⟨9⟩)

theorem result : 2 + 2 = 4 := ExtensionGood.result

end ExtensionBad
""",
}


def remember(path, output, evidence):
    build.direct_file(path)
    relative = path.relative_to(output).as_posix()
    digest = build.sha256(path)
    if relative in evidence and evidence[relative] != digest:
        raise ValueError("Previously recorded evidence changed: " + relative)
    evidence[relative] = digest


def audit_check(label, lean, output, imported, owned, required, args, *,
                allowed=audit.ALLOWED, negative=False):
    source = audit.audit_source(imported, owned, required, allowed=allowed)
    path = lean / (label + ".lean")
    path.write_text(source, encoding="utf-8")
    source_bytes = path.read_bytes()
    source_hash = build.sha256(path)
    run = scheduler.bounded_command(label,
        ["lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true", str(path)],
        cwd=lean, output=output, memory_limit_mib=args.memory_limit_mib,
        timeout_seconds=args.timeout_seconds, expected_failure=negative)
    log = output / (label + ".log")
    text = log.read_text()
    if negative:
        if not re.search(r"Unapproved axiom Classical\.choice in [^\n]*hiddenOwnedChoice", text):
            raise ValueError("Negative audit failed for another reason")
        if any(json.loads(line.split(audit.MARKER, 1)[1]).get("tag") == "passed"
               for line in text.splitlines() if audit.MARKER in line):
            raise ValueError("Negative audit falsely recorded success")
        inventory = {"expected_owned_private_choice_rejection": True}
    else:
        inventory = audit.validate_log(text, imported, owned, required, allowed=allowed)
    if path.read_bytes() != source_bytes or build.sha256(path) != source_hash:
        raise ValueError("Frozen scoped audit source changed")
    inventory_path = output / (label + "-inventory.json")
    build.write_json(inventory_path, inventory)
    run.update(source_sha256=source_hash, log_sha256=build.sha256(log),
               inventory_sha256=build.sha256(inventory_path), inventory=inventory)
    return run, [path, log, inventory_path]


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path,
                        default=ROOT / ".candidate-artifacts/lean-owned-extension")
    parser.add_argument("--jobs", type=int, choices=range(1, 5), default=2)
    parser.add_argument("--memory-limit-mib", type=int, default=12288)
    parser.add_argument("--timeout-seconds", type=float, default=1800)
    args = parser.parse_args(argv)
    if args.memory_limit_mib <= 0 or args.timeout_seconds <= 0:
        parser.error("Resource bounds must be positive")
    output = args.output_dir.absolute()
    if output.exists() or output.is_symlink() or output.resolve() != output:
        raise ValueError("Fixture output must be new and direct")
    head = build.git_head(ROOT)
    controls = {*OWN_INPUTS, *scheduler.SCRIPT_FILES}
    frozen = build.snapshot_inputs(ROOT, {}, controls)
    output.mkdir(parents=True)
    cache = (ROOT / "lean/.lake/packages").resolve()
    if not (cache / "mathlib").is_dir():
        raise ValueError("Pinned external package cache is absent")
    receipt = {"schema": "lean-owned-extension-fixture-v1", "status": "running",
               "git_head": head, "input_sha256": frozen,
               "imported_modules": IMPORTED, "owned_modules": OWNED,
               "required_by_module": REQUIRED, "accepted_gate_changed": False,
               "uses_prior_project_objects": False}
    evidence = {}
    started = time.monotonic()
    try:
        receipt["protocol_tests"] = scheduler.bounded_command("protocol-tests",
            [sys.executable, str(ROOT / "scripts/test_lean_owned_extension.py")],
            cwd=ROOT, output=output, memory_limit_mib=args.memory_limit_mib,
            timeout_seconds=300)
        test_text = (output / "protocol-tests.log").read_text()
        if not re.search(r"Ran 17 tests in", test_text) or not re.search(r"^OK$", test_text, re.MULTILINE):
            raise ValueError("Complete scoped-audit protocol tests did not pass")
        remember(output / "protocol-tests.log", output, evidence)
        lean = scheduler.prepare_repo(output / "repo", SOURCES,
            [name for names in REQUIRED.values() for name in names], {}, cache)
        graph, _prefixes, _external, extra = build.scope_plan(lean.parent, [], BAD)
        if set(graph) != set(IMPORTED):
            raise ValueError("Fixture closure differs")
        copied_head = build.git_head(lean.parent)
        copied_inputs = build.snapshot_inputs(lean.parent, graph, extra)
        receipt.update(isolated_git_head=copied_head, isolated_inputs=copied_inputs)
        receipt["source"] = scheduler.source_phase(lean, output, [], BAD, args)
        for path in [output / "source-command.log", output / "source/receipt.json",
                     *sorted((output / "source").glob("*.log"))]:
            remember(path, output, evidence)
        receipt["positive"], paths = audit_check(
            "OwnedExtensionAudit", lean, output, IMPORTED, OWNED, REQUIRED, args)
        for path in paths:
            remember(path, output, evidence)
        positive = receipt["positive"]["inventory"]
        private = set(positive["private_declarations"].values())
        if not {"ExtensionGood.hiddenProof", "ExtensionBad.hiddenOwnedChoice"} <= private:
            raise ValueError("Modern private fixture declarations were not visible")
        receipt["unowned_choice"], paths = audit_check(
            "UnownedChoiceAudit", lean, output, [DEP, GOOD], [GOOD],
            {GOOD: REQUIRED[GOOD]}, args, allowed=RESTRICTED)
        for path in paths:
            remember(path, output, evidence)
        if any(row["owner"] == DEP for row in
               receipt["unowned_choice"]["inventory"]["declarations"].values()):
            raise ValueError("Unowned dependency was included in the scoped audit")
        receipt["negative"], paths = audit_check(
            "OwnedPrivateNegativeAudit", lean, output, IMPORTED, OWNED, REQUIRED,
            args, allowed=RESTRICTED, negative=True)
        for path in paths:
            remember(path, output, evidence)
        kernel_args = argparse.Namespace(**vars(args))
        kernel_args.workers = [1]
        receipt["kernel"] = scheduler.kernel_phases(
            lean, output, [], BAD, graph, kernel_args, receipt["source"])["1"]
        for path in [output / "replay-1-command.log", output / "replay-1/receipt.json",
                     output / "replay-1/kernel.log"]:
            remember(path, output, evidence)
        build.assert_inputs(lean.parent, copied_inputs, copied_head)
        build.assert_inputs(ROOT, frozen, head)
        for relative in list(evidence):
            remember(output / relative, output, evidence)
        receipt.update(status="passed", evidence_sha256=evidence,
                       all_frozen_inputs_unchanged=True,
                       unowned_dependency_choice_excluded=True,
                       hidden_owned_private_choice_rejected=True)
    except BaseException as error:
        receipt.update(status="failed", error=f"{type(error).__name__}: {error}")
        raise
    finally:
        receipt["elapsed_seconds"] = time.monotonic() - started
        build.write_json(output / "receipt.json", receipt)
        print("OWNED-EXTENSION-CANDIDATE " + json.dumps({
            "status": receipt["status"], "receipt_sha256": build.sha256(output / "receipt.json"),
            "summary": receipt.get("positive", {}).get("inventory", {}).get("summary"),
            "negative": receipt.get("hidden_owned_private_choice_rejected", False)}), flush=True)
    return 0


if __name__ == "__main__":
    signal.signal(signal.SIGTERM, build.interrupted)
    raise SystemExit(main())
