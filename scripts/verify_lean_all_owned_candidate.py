#!/usr/bin/env python3
"""Isolated all-owned audit candidate; no accepted registry or proof edits.

Default execution checks a small mixed modern/legacy fixture. --accepted
requires a separate explicit hosted invocation and checks the current exact
accepted closure from fresh sources. Both modes use the unchanged pinned
checker. No prior project objects or prior proof receipts are reused.
"""
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
import tomllib

import audit_lean_all_owned as audit
import build_lean_parallel as build
import replay_lean_parallel as replay
import verify_lean_parallel_candidate as scheduler

ROOT = Path(__file__).resolve().parents[1]
OWN_INPUTS = (
    "scripts/audit_lean_all_owned.py",
    "scripts/test_lean_all_owned.py",
    "scripts/verify_lean_all_owned_candidate.py",
    ".github/workflows/lean-all-owned-candidate.yml",
    "docs/lean-all-owned-candidate-sources.json",
)
FROZEN_SCHEDULER = (
    "scripts/build_lean_parallel.py", "scripts/replay_lean_parallel.py",
    "scripts/test_lean_parallel.py", "scripts/verify_lean_parallel_candidate.py",
    "docs/lean-parallel-candidate-sources.json", ".github/workflows/lean-parallel-candidate.yml",
)


def fixture_spec(*, legacy_mathlib=False):
    sources = dict(scheduler.FIXTURE_SOURCES)
    sources["Conjectures.Base"] = sources["Conjectures.Base"].replace(
        "end ParallelFixture\n",
        "private noncomputable def unreferencedChoice : Nat := Classical.choice "
        "(show Nonempty Nat from ⟨7⟩)\n"
        "opaque unreferencedOpaque : Nat := 9\n"
        "inductive FixtureToken where | token\n"
        "end ParallelFixture\n")
    sources["Solitaire.Base"] = sources["Solitaire.Base"].replace(
        "theorem value", "private theorem unreferencedLegacy : True := True.intro\n"
        "theorem value")
    if legacy_mathlib:
        sources["Solitaire.Base"] = "import Mathlib.Data.Nat.Basic\n" + sources["Solitaire.Base"]
    required = list(scheduler.FIXTURE_REQUIRED) + ["ParallelFixture.unreferencedDefinition"]
    spec = {"registered_modules": list(scheduler.FIXTURE_MODULES),
            "modules": sorted(sources), "required": required, "legacy_prefixes": [],
            "checker_prefixes": ["Solitaire", "Conjectures"]}
    return sources, spec


def check_frozen_inventory():
    inventory = json.loads((ROOT / "docs/lean-all-owned-candidate-sources.json").read_text())
    if inventory.get("schema") != "lean-all-owned-audit-candidate-v1":
        raise ValueError("Unexpected all-owned candidate inventory")
    for entry in inventory["files"] + inventory["dependency_files"]:
        path = ROOT / entry["path"]
        build.direct_file(path)
        if build.sha256(path) != entry["sha256"]:
            raise ValueError("Reviewed candidate input changed: " + entry["path"])
    baseline = json.loads((ROOT / "docs/lean-parallel-candidate-sources.json").read_text())
    for entry in baseline["files"]:
        if build.sha256(ROOT / entry["path"]) != entry["sha256"]:
            raise ValueError("Reviewed scheduler input changed: " + entry["path"])


def commit_snapshot(repo):
    subprocess.run(["git", "add", "--", ".gitignore", "lean", "scripts"],
                   cwd=repo, check=True, timeout=30)
    subprocess.run(["git", "-c", "user.name=All-owned audit fixture",
                    "-c", "user.email=all-owned-fixture@example.invalid",
                    "-c", "commit.gpgsign=false", "-c", "core.hooksPath=/dev/null",
                    "commit", "-qm", "Freeze exact all-owned audit candidate inputs"],
                   cwd=repo, check=True, timeout=30)


def legacy_compatible_config(original):
    """Change only Lake's documented legacy-import advisory opt-in."""
    parsed = tomllib.loads(original.decode("utf-8"))
    if "allowNonModules" in parsed:
        raise ValueError("Original config already declares allowNonModules; review it explicitly")
    derived = b"allowNonModules = true\n" + original
    if tomllib.loads(derived.decode("utf-8")) != {**parsed, "allowNonModules": True}:
        raise ValueError("Staged configuration changed another option")
    return derived


def configuration_record(original, derived, enabled):
    expected = legacy_compatible_config(original) if enabled else original
    if derived != expected:
        raise ValueError("Staged Lake configuration differs from the declared transformation")
    return {
        "source_path": "lean/lakefile.toml",
        "allow_legacy_module_imports": enabled,
        "original_utf8": original.decode("utf-8"),
        "derived_utf8": derived.decode("utf-8"),
        "original_sha256": hashlib.sha256(original).hexdigest(),
        "derived_sha256": hashlib.sha256(derived).hexdigest(),
        "only_change": "top-level allowNonModules = true" if enabled else "none",
        "lake_warning_failure_retained": True,
        "public_configuration_unchanged": True,
        "scope": ("The explicit Lake compatibility opt-in suppresses its legacy-import advisory; all other source warnings remain fatal. This is not an unchanged-configuration replay."
                  if enabled else "Original Lake configuration preserved exactly."),
    }


def prepare_repo(destination, sources, spec, cache, accepted, *, allow_legacy_module_imports=False):
    lean = scheduler.prepare_repo(destination, sources, spec["required"], {}, cache)
    for relative in (*OWN_INPUTS[:3], "scripts/verify_lean.sh"):
        source, target = ROOT / relative, destination / relative
        build.direct_file(source)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source, target)
        if build.sha256(source) != build.sha256(target):
            raise ValueError("Input changed while copying: " + relative)
    if accepted:
        shutil.copyfile(ROOT / "lean/ProofAudit.lean", lean / "ProofAudit.lean")
    if allow_legacy_module_imports:
        config = lean / "lakefile.toml"
        config.write_bytes(legacy_compatible_config(config.read_bytes()))
    text = audit.audit_source(spec["modules"], spec["required"], spec["legacy_prefixes"])
    (lean / "AllOwnedProofAudit.lean").write_text(text, encoding="utf-8")
    if not accepted:
        negative = audit.audit_source(
            spec["modules"], spec["required"], spec["legacy_prefixes"],
            allowed=("propext", "Quot.sound"))
        (lean / "AllOwnedNegativeAudit.lean").write_text(negative, encoding="utf-8")
    commit_snapshot(destination)
    return lean


def check_audit(lean, directory, spec, sources, args):
    path = lean / "AllOwnedProofAudit.lean"
    original = path.read_text(encoding="utf-8")
    expected = audit.audit_source(spec["modules"], spec["required"], spec["legacy_prefixes"])
    if original != expected:
        raise ValueError("The frozen all-owned audit source differs")
    digest = build.sha256(path)
    run = scheduler.bounded_command("all-owned-audit",
        ["lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true", str(path)],
        cwd=lean, output=directory, memory_limit_mib=args.memory_limit_mib,
        timeout_seconds=args.timeout_seconds)
    log_path = directory / "all-owned-audit.log"
    modern = {module: next(build.header_tokens(text), None) == "module"
              for module, text in sources.items()}
    inventory = audit.validate_log(log_path.read_text(), spec, modern)
    if build.sha256(path) != digest or path.read_text(encoding="utf-8") != original:
        raise ValueError("All-owned audit source changed during execution")
    inventory_path = directory / "declaration-inventory.json"
    build.write_json(inventory_path, inventory)
    run.update(summary=inventory["summary"], source_sha256=digest,
               log_sha256=build.sha256(log_path),
               declaration_inventory_sha256=build.sha256(inventory_path),
               all_owned_declarations_audited=True, exact_raw_private_visibility=True)
    return run, inventory


def check_negative(lean, directory, spec, args):
    path = lean / "AllOwnedNegativeAudit.lean"
    original = path.read_text()
    expected = audit.audit_source(spec["modules"], spec["required"], spec["legacy_prefixes"],
                                  allowed=("propext", "Quot.sound"))
    if original != expected:
        raise ValueError("Frozen negative fixture differs")
    digest = build.sha256(path)
    run = scheduler.bounded_command("negative-private-definition",
        ["lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true", str(path)],
        cwd=lean, output=directory, memory_limit_mib=args.memory_limit_mib,
        timeout_seconds=args.timeout_seconds, expected_failure=True)
    log_path = directory / "negative-private-definition.log"
    text = log_path.read_text()
    if not re.search(r"Unapproved axiom Classical\.choice in [^\n]*unreferencedChoice", text):
        raise ValueError("Negative fixture did not reject the unused private definition")
    parsed = [json.loads(line.split(audit.MARKER, 1)[1]) for line in text.splitlines()
              if audit.MARKER in line]
    if any(row.get("tag") == "passed" for row in parsed) or not parsed:
        raise ValueError("Negative fixture lacked visibility checks or falsely passed")
    if build.sha256(path) != digest or path.read_text() != original:
        raise ValueError("Negative audit source changed")
    run.update(expected_private_definition_rejection=True,
               source_sha256=digest, log_sha256=build.sha256(log_path))
    return run



def remember_evidence(paths, output, frozen):
    for path in paths:
        build.direct_file(path)
        relative = str(path.relative_to(output))
        digest = build.sha256(path)
        if relative in frozen and frozen[relative] != digest:
            raise ValueError("Previously recorded verification evidence changed: " + relative)
        frozen[relative] = digest


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--accepted", action="store_true",
                        help="Explicitly run the complete current accepted closure")
    parser.add_argument("--allow-legacy-module-imports", action="store_true",
                        help="Record an isolated allowNonModules=true Lake configuration; public config stays unchanged")
    parser.add_argument("--jobs", type=int, choices=range(1, 5), default=2)
    parser.add_argument("--workers", type=int, choices=range(1, 5), default=1)
    parser.add_argument("--memory-limit-mib", type=int, default=12288)
    parser.add_argument("--timeout-seconds", type=float, default=21600)
    args = parser.parse_args(argv)
    if args.memory_limit_mib <= 0 or args.timeout_seconds <= 0:
        parser.error("Resource bounds must be positive")
    check_frozen_inventory()
    if args.accepted:
        spec = audit.accepted_spec(ROOT)
        sources = {module: build.source_path(ROOT / "lean", module).read_text(encoding="utf-8")
                   for module in spec["modules"]}
        original_graph, _, _, original_extra = build.scope_plan(ROOT, spec["registered_modules"])
    else:
        sources, spec = fixture_spec(legacy_mathlib=args.allow_legacy_module_imports)
        original_graph, original_extra = {}, set()
    head = build.git_head(ROOT)
    frozen = build.snapshot_inputs(ROOT, original_graph,
        set(original_extra) | set(OWN_INPUTS) | set(FROZEN_SCHEDULER))
    output = args.output_dir.absolute()
    if output.exists() or output.is_symlink() or output.resolve() != output:
        raise ValueError("Output directory must be new and direct")
    if output.is_relative_to(ROOT / "lean/.lake"):
        raise ValueError("Output cannot enter the original project cache")
    output.mkdir(parents=True)
    cache = (ROOT / "lean/.lake/packages").resolve()
    if not (cache / "mathlib").is_dir():
        raise ValueError("The pinned external package cache must be prepared")
    receipt = {"schema": "lean-all-owned-audit-candidate-v1", "status": "running",
               "scope": "accepted" if args.accepted else "mixed-module-fixture",
               "git_head": head, "input_sha256": frozen, "spec": spec,
               "accepted_gate_changed": False, "uses_prior_project_objects": False,
               "source_jobs": args.jobs, "kernel_workers": args.workers}
    started = time.monotonic()
    evidence = {}
    try:
        receipt["protocol_tests"] = scheduler.bounded_command("protocol-tests",
            [sys.executable, str(ROOT / "scripts/test_lean_all_owned.py")],
            cwd=ROOT, output=output, memory_limit_mib=args.memory_limit_mib, timeout_seconds=300)
        tests = (output / "protocol-tests.log").read_text()
        if not re.search(r"Ran 14 tests in", tests) or not re.search(r"^OK$", tests, re.MULTILINE):
            raise ValueError("Complete all-owned protocol test suite did not pass")
        remember_evidence([output / "protocol-tests.log"], output, evidence)
        lean = prepare_repo(output / "repo", sources, spec, cache, args.accepted,
                            allow_legacy_module_imports=args.allow_legacy_module_imports)
        receipt["isolated_configuration"] = configuration_record(
            (ROOT / "lean/lakefile.toml").read_bytes(), (lean / "lakefile.toml").read_bytes(),
            args.allow_legacy_module_imports)
        receipt["legacy_mathlib_fixture"] = not args.accepted and args.allow_legacy_module_imports
        graph, _, _, extra = build.scope_plan(lean.parent, spec["registered_modules"])
        if set(graph) != set(sources):
            raise ValueError("Copied accepted source inventory differs")
        audit_files = {"lean/AllOwnedProofAudit.lean", *OWN_INPUTS[:3]}
        if not args.accepted:
            audit_files.add("lean/AllOwnedNegativeAudit.lean")
        copied_frozen = build.snapshot_inputs(lean.parent, graph, set(extra) | audit_files)
        if args.accepted:
            for module in graph:
                relative = "lean/" + module.replace(".", "/") + ".lean"
                if copied_frozen[relative] != frozen[relative]:
                    raise ValueError("A mathematical source changed while copying: " + module)
        copied_head = build.git_head(lean.parent)
        receipt.update(isolated_git_head=copied_head, isolated_inputs=copied_frozen)
        receipt["source"] = scheduler.source_phase(
            lean, output, spec["registered_modules"], None, args)
        remember_evidence([output / "source-command.log", *sorted((output / "source").rglob("*.log")),
                           output / "source/receipt.json"], output, evidence)
        receipt["axiom_audit"], inventory = check_audit(lean, output, spec, sources, args)
        remember_evidence([output / "all-owned-audit.log", output / "declaration-inventory.json"],
                          output, evidence)
        if not args.accepted:
            private = inventory["private_declarations"]
            names = set(private.values())
            if not {"ParallelFixture.unreferencedChoice",
                    "ParallelFixture.Other.unreferencedLegacy",
                    "ParallelFixture.Left.checked", "ParallelFixture.Right.checked"} <= names:
                raise ValueError("Fixture omitted modern/legacy private declarations")
            chosen = next(row for row in inventory["declarations"].values()
                          if row["private_user_name"] == "ParallelFixture.unreferencedChoice")
            if chosen["kind"] != "definition" or "Classical.choice" not in chosen["axioms"]:
                raise ValueError("The unused private definition did not exercise axiom collection")
            receipt["negative_fixture"] = check_negative(lean, output, spec, args)
            remember_evidence([output / "negative-private-definition.log"], output, evidence)
        kernel_args = argparse.Namespace(**vars(args))
        kernel_args.workers = [args.workers]
        receipt["kernel_replay"] = scheduler.kernel_phases(
            lean, output, spec["registered_modules"], None, graph, kernel_args,
            receipt["source"])[str(args.workers)]
        remember_evidence([output / f"replay-{args.workers}-command.log",
                           output / f"replay-{args.workers}/receipt.json",
                           output / f"replay-{args.workers}/kernel.log"], output, evidence)
        remember_evidence([output / relative for relative in list(evidence)], output, evidence)
        receipt["evidence_sha256"] = evidence
        build.assert_inputs(lean.parent, copied_frozen, copied_head)
        build.assert_inputs(ROOT, frozen, head)
        receipt.update(status="passed", all_inputs_unchanged=True)
    except BaseException as error:
        receipt.update(status="failed", error=f"{type(error).__name__}: {error}")
        source_receipt = output / "source/receipt.json"
        if source_receipt.is_file():
            source_status = json.loads(source_receipt.read_text())
            for row in source_status.get("source_results", []):
                if row.get("exit_code") not in (None, 0) and not row.get("cancelled"):
                    path = output / "source" / (row["module"] + ".log")
                    if path.is_file():
                        print("FAILED-SOURCE-LOG " + row["module"], flush=True)
                        print(path.read_text(errors="replace")[-16000:], flush=True)
        raise
    finally:
        receipt["elapsed_seconds"] = time.monotonic() - started
        build.write_json(output / "receipt.json", receipt)
        print("ALL-OWNED-CANDIDATE " + json.dumps({
            "status": receipt["status"], "scope": receipt["scope"],
            "receipt": str(output / "receipt.json"),
            "receipt_sha256": build.sha256(output / "receipt.json"),
            "summary": receipt.get("axiom_audit", {}).get("summary")}), flush=True)
    return 0


if __name__ == "__main__":
    signal.signal(signal.SIGTERM, build.interrupted)
    try:
        raise SystemExit(main())
    except (OSError, ValueError, RuntimeError, subprocess.SubprocessError) as error:
        print(f"FAIL: {error}", file=sys.stderr)
        raise SystemExit(1) from error
