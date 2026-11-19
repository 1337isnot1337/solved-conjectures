#!/usr/bin/env python3
"""Fresh source stages and complete owned/private/kernel verification for quotient 133.

Source-stage receipts are never acceptance receipts. The final job authenticates
all five source stages from the same run and commit, compiles the remaining
assemblies, audits every owned serialized declaration, and replays the exact
closure with the unchanged pinned checker. Numerical predicates and limits are
unchanged.
"""
from __future__ import annotations

import argparse
from collections import Counter
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import time

import audit_lean_all_owned as owned
from build_lean_parallel import modern_module
import verify_frankl_orbit_batches as profiles
import verify_hadamard_quotient133_candidate as gate

REPOSITORY = "1337isnot1337/solved-conjectures"
STAGE_TARGETS = {
    "catalog_verified": gate.TASKS["catalog_verified"][0],
    "rows_verified": gate.TASKS["rows_verified"][0],
    "margins_source0": "Conjectures.HadamardQuotient133MarginsSource0",
    "margins_source1": "Conjectures.HadamardQuotient133MarginsSource1",
    "margins_source2": "Conjectures.HadamardQuotient133MarginsSource2",
}
STAGES = tuple(STAGE_TARGETS)
SUFFIXES = (".olean", ".olean.server", ".olean.private")
INPUTS = gate.GATE_INPUTS | {
    "scripts/audit_lean_all_owned.py",
    "scripts/build_lean_parallel.py",
    "scripts/plan_accepted_lean.py",
    "scripts/verify_frankl_orbit_batches.py",
}
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
SOURCE_CHECK = "strict source checks, warnings treated as errors"
MEMORY_MIB = 4500
JOB_SECONDS = 90 * 60
SCHEMA = 3


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def encoded(value):
    return json.dumps(value, indent=2, sort_keys=True).encode() + b"\n"


def sha_bytes(value):
    return hashlib.sha256(value).hexdigest()


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(encoded(value))


def input_hashes():
    return {name: gate.digest(gate.ROOT / name) for name in sorted(INPUTS)}


def ci_identity(commit):
    require(os.environ.get("GITHUB_REPOSITORY") == REPOSITORY,
            "Unexpected workflow repository")
    require(os.environ.get("GITHUB_SHA") == commit, "Workflow/checkout SHA mismatch")
    result = {"repository": REPOSITORY, "sha": commit}
    for variable, key in (("GITHUB_RUN_ID", "run_id"), ("GITHUB_RUN_ATTEMPT", "run_attempt")):
        value = os.environ.get(variable, "")
        require(value.isascii() and value.isdecimal() and int(value) > 0,
                "Missing workflow identity: " + variable)
        result[key] = int(value)
    workflow = os.environ.get("GITHUB_WORKFLOW_REF", "")
    require(workflow.startswith(
        REPOSITORY + "/.github/workflows/lean-hadamard-quotient133-candidates.yml@"),
        "Unexpected workflow definition")
    result["workflow_ref"] = workflow
    return result


def assert_head_inputs(commit, modules, sources, inputs):
    require(gate.revision() == commit, "Checkout changed")
    paths = dict(inputs)
    paths.update({str(gate.source(module).relative_to(gate.ROOT)): sources[module]
                  for module in modules})
    for relative, expected in paths.items():
        path = gate.ROOT / relative
        require(path.is_file() and not path.is_symlink(), "Indirect input: " + relative)
        require(gate.digest(path) == expected, "Worktree input changed: " + relative)
        committed = subprocess.check_output(
            ["git", "show", commit + ":" + relative], cwd=gate.ROOT)
        require(sha_bytes(committed) == expected, "Input differs from HEAD: " + relative)


def resolve_runtime():
    compiler, external, identity = profiles.resolve_runtime(None)
    require(identity["lean_sha256"] == LEAN_SHA256
            and identity["checker_sha256"] == CHECKER_SHA256,
            "Compiler/checker differs from the pinned binaries")
    require(all(not (Path(path) / prefix).exists()
                for path in external for prefix in ("Conjectures", "Solitaire")),
            "Unstaged project objects on external search path")
    return compiler, external, identity


def file_inventory(stage):
    result = {}
    for path in sorted(stage.rglob("*")):
        require(not path.is_symlink(), "Symlink in evidence")
        if path.is_file():
            name = path.relative_to(stage).as_posix()
            if name not in ("receipt.json", "receipt.sha256"):
                result[name] = gate.digest(path)
    return result


def save_receipt(stage, receipt, *, seal=False):
    if seal:
        receipt["evidence_sha256"] = file_inventory(stage)
    write_json(stage / "receipt.json", receipt)
    (stage / "receipt.sha256").write_text(gate.digest(stage / "receipt.json") + "\n")


def prepare(stage, modules, sources, inputs):
    require(not stage.exists(), "Evidence stage must be fresh")
    (stage / "src").mkdir(parents=True)
    (stage / "lib/lean").mkdir(parents=True)
    (stage / "logs").mkdir()
    (stage / "progress").mkdir()
    for module in modules:
        target = stage / "src" / (module.replace(".", "/") + ".lean")
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(gate.source(module), target)
        require(gate.digest(target) == sources[module], "Source copy changed")
    for relative, expected in inputs.items():
        target = stage / "controls" / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(gate.ROOT / relative, target)
        require(gate.digest(target) == expected, "Control copy changed")


def environment(compiler, external, stage):
    result = os.environ.copy()
    result.update({
        "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
        "LEAN_SYSROOT": str(compiler),
        "LEAN_NUM_THREADS": "1",
        "UV_USE_IO_URING": "0",
        "PATH": str(compiler / "bin") + os.pathsep + result.get("PATH", ""),
    })
    return result


def check(command, stage, env, label, deadline, cwd=None):
    remaining = deadline - time.monotonic()
    require(remaining > 0, "Existing job deadline exhausted")
    log = stage / "logs" / (label + ".log")
    progress = stage / "progress" / (label + ".json")
    result = profiles.profile(command, cwd or stage / "src", env, log, progress, remaining)
    result["log_relative"] = log.relative_to(stage).as_posix()
    result["progress_relative"] = progress.relative_to(stage).as_posix()
    write_json(progress, result)
    result["progress_sha256"] = gate.digest(progress)
    return result


def successful(result):
    return (type(result.get("exit_code")) is int and result["exit_code"] == 0
            and result.get("timed_out") is False)



def recheck_evidence(stage, receipt):
    records = list(receipt.get("source_checks", {}).values())
    records += [receipt[name] for name in
                ("producer_reproduction", "axiom_audit", "kernel_replay") if name in receipt]
    for record in records:
        for field, prefix, digest_field in (
                ("log_relative", "logs/", "log_sha256"),
                ("progress_relative", "progress/", "progress_sha256")):
            relative = record[field]
            require(isinstance(relative, str) and relative.startswith(prefix)
                    and "\\" not in relative
                    and all(part not in ("", ".", "..") for part in relative.split("/")),
                    "Invalid check evidence path")
            path = stage / relative
            require(path.is_file() and not path.is_symlink()
                    and gate.digest(path) == record[digest_field],
                    "Checked log/profile changed")
        profile = json.loads((stage / record["progress_relative"]).read_text())
        require(all(record.get(key) == value for key, value in profile.items()),
                "Profile differs from its recorded check")
    if "axiom_audit" in receipt:
        audit = receipt["axiom_audit"]
        for relative, field in (
                ("src/HadamardQuotient133Audit.lean", "audit_source_sha256"),
                ("declaration-inventory.json", "declaration_inventory_sha256")):
            path = stage / relative
            require(path.is_file() and not path.is_symlink()
                    and gate.digest(path) == audit[field],
                    "Checked audit source/inventory changed")
    for name, expected in receipt.get("source_stage_receipt_sha256", {}).items():
        folder = stage / "source-stages" / name
        require(gate.digest(folder / "receipt.json") == expected, "Preserved stage receipt changed")
        prior = json.loads((folder / "receipt.json").read_text())
        require(file_inventory(folder) == prior["evidence_sha256"],
                "Preserved stage evidence changed")


def source_command(compiler, stage, module):
    stem = module.replace(".", "/")
    return [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
            "-o", str(stage / "lib/lean" / (stem + ".olean")), stem + ".lean"]


def compile_sources(modules, compiler, stage, env, receipt, deadline):
    failures = {}
    receipt["source_failures"] = failures
    receipt["checked_sources"] = []
    receipt["source_checks"] = {}
    for module in modules:
        blocked = [name for name in gate.imports_of(gate.source(module)) if name in failures]
        if blocked:
            failures[module] = "blocked by " + ", ".join(blocked)
            continue
        output = stage / "lib/lean" / (module.replace(".", "/") + ".olean")
        require(not output.exists(), "Source target was not fresh")
        output.parent.mkdir(parents=True, exist_ok=True)
        result = check(source_command(compiler, stage, module), stage, env,
                       module + ".source", deadline)
        receipt["source_checks"][module] = result
        if successful(result):
            receipt["checked_sources"].append(module)
        else:
            failures[module] = "strict source failed"
        save_receipt(stage, receipt)
    require(not failures, "Source failures or blocked dependents remain")
    require(receipt["checked_sources"] == modules, "Incomplete source coverage")


def object_hashes(stage, modules, modern):
    result = {}
    for module in modules:
        stem = module.replace(".", "/")
        present = {}
        for suffix in SUFFIXES:
            path = stage / "lib/lean" / (stem + suffix)
            if path.exists():
                require(path.is_file() and not path.is_symlink(), "Indirect object")
                present[suffix] = gate.digest(path)
        expected = set(SUFFIXES) if modern[module] else {".olean"}
        require(set(present) == expected, "Object facet inventory differs: " + module)
        result.update({stem + suffix: value for suffix, value in present.items()})
    actual = {path.relative_to(stage / "lib/lean").as_posix()
              for path in (stage / "lib/lean").rglob("*") if path.is_file()}
    require(actual == set(result), "Extra object outside exact closure")
    return result


def recheck(stage, modules, sources, inputs, objects, modern, compiler, commit):
    assert_head_inputs(commit, modules, sources, inputs)
    for module in modules:
        require(gate.digest(stage / "src" / (module.replace(".", "/") + ".lean"))
                == sources[module], "Staged source changed")
    for relative, expected in inputs.items():
        require(gate.digest(stage / "controls" / relative) == expected,
                "Staged control changed")
    require(object_hashes(stage, modules, modern) == objects, "Checked objects changed")
    require(gate.digest(compiler / "bin/lean") == LEAN_SHA256
            and gate.digest(compiler / "bin/leanchecker") == CHECKER_SHA256,
            "Runtime changed")


def begin(stage, target, kind):
    modules = gate.dependency_order(target)
    sources = {module: gate.digest(gate.source(module)) for module in modules}
    inputs = input_hashes()
    commit = gate.revision()
    identity = ci_identity(commit)
    assert_head_inputs(commit, modules, sources, inputs)
    compiler, external, runtime = resolve_runtime()
    modern = {module: modern_module(gate.source(module)) for module in modules}
    prepare(stage, modules, sources, inputs)
    receipt = {"schema": SCHEMA, "phase": kind, "status": "running",
               "commit": commit, "ci": identity, "runtime": runtime,
               "target": target, "project_modules": modules,
               "source_sha256": sources, "gate_sha256": inputs,
               "modern_modules": modern, "completed_checks": [],
               "accepted_registry_changed": False}
    save_receipt(stage, receipt)
    return (modules, sources, inputs, commit, identity, compiler, runtime, modern,
            environment(compiler, external, stage), receipt)


def validate_manifest(receipt, stage_name, commit, modules, sources, inputs, ci, runtime, modern):
    require(receipt.get("schema") == SCHEMA, "Unknown source manifest schema")
    require(receipt.get("stage") == stage_name
            and receipt.get("phase") == "strict-source-only"
            and receipt.get("status") == "source_passed", "Source stage did not pass")
    require(receipt.get("commit") == commit, "Source commit mismatch")
    prior_ci = receipt.get("ci", {})
    for key in ("repository", "sha", "run_id", "workflow_ref"):
        require(prior_ci.get(key) == ci[key], "Source workflow identity mismatch")
    attempt = prior_ci.get("run_attempt")
    require(type(attempt) is int and 0 < attempt <= ci["run_attempt"],
            "Invalid or future source attempt")
    require(receipt.get("runtime") == runtime, "Source runtime identity mismatch")
    require(receipt.get("target") == STAGE_TARGETS[stage_name], "Source target mismatch")
    require(receipt.get("project_modules") == modules
            and receipt.get("checked_sources") == modules,
            "Incomplete or altered source closure")
    require(receipt.get("source_failures") == {}
            and receipt.get("completed_checks") == [SOURCE_CHECK],
            "Source failure or unexpected source claim")
    require(receipt.get("source_sha256") == sources
            and receipt.get("gate_sha256") == inputs
            and receipt.get("modern_modules") == modern,
            "Source/input/facet metadata mismatch")
    checks = receipt.get("source_checks", {})
    require(set(checks) == set(modules) and all(successful(row) for row in checks.values()),
            "Missing successful source profiles")
    expected = {module.replace(".", "/") + suffix for module in modules
                for suffix in (SUFFIXES if modern[module] else (".olean",))}
    objects = receipt.get("object_sha256", {})
    require(isinstance(objects, dict) and set(objects) == expected,
            "Object facet inventory mismatch")
    require(all(re.fullmatch(r"[0-9a-f]{64}", value)
                for value in objects.values()), "Invalid object digest")
    require(receipt.get("accepted_registry_changed") is False, "Stage overstates scope")
    return objects


def authenticate_stage(folder, receipt, stage_name, modules, sources, inputs, objects):
    require(folder.is_dir() and not folder.is_symlink(), "Missing stage artifact")
    require((folder / "receipt.sha256").read_text()
            == gate.digest(folder / "receipt.json") + "\n", "Receipt hash mismatch")
    require(file_inventory(folder) == receipt.get("evidence_sha256"),
            "Sealed stage evidence mismatch")
    for module in modules:
        stem = module.replace(".", "/")
        require(gate.digest(folder / "src" / (stem + ".lean")) == sources[module],
                "Stage source bytes mismatch")
        row = receipt["source_checks"][module]
        original = gate.ROOT / ".candidate-artifacts/hadamard-quotient133-staged" / stage_name
        require(row["command"] == source_command(Path(receipt["runtime"]["lean_path"]).parent.parent,
                                                  original, module),
                "Source command mismatch")
        log = folder / "logs" / (module + ".source.log")
        progress = folder / "progress" / (module + ".source.json")
        require(row["log_relative"] == log.relative_to(folder).as_posix()
                and row["progress_relative"] == progress.relative_to(folder).as_posix(),
                "Source evidence path mismatch")
        require(gate.digest(log) == row["log_sha256"]
                and gate.digest(progress) == row["progress_sha256"], "Source profile hash mismatch")
        require(json.loads(progress.read_text())
                == {key: value for key, value in row.items() if key != "progress_sha256"},
                "Source profile content mismatch")
    for relative, expected in inputs.items():
        require(gate.digest(folder / "controls" / relative) == expected,
                "Stage control bytes mismatch")
    require(object_hashes(folder, modules, receipt["modern_modules"]) == objects,
            "Stage object bytes mismatch")


def compile_stage(stage_name):
    stage = gate.ROOT / ".candidate-artifacts/hadamard-quotient133-staged" / stage_name
    values = begin(stage, STAGE_TARGETS[stage_name], "strict-source-only")
    modules, sources, inputs, commit, ci, compiler, runtime, modern, env, receipt = values
    receipt["stage"] = stage_name
    deadline = time.monotonic() + JOB_SECONDS
    try:
        compile_sources(modules, compiler, stage, env, receipt, deadline)
        objects = object_hashes(stage, modules, modern)
        receipt["object_sha256"] = objects
        receipt["completed_checks"].append(SOURCE_CHECK)
        recheck(stage, modules, sources, inputs, objects, modern, compiler, commit)
        recheck_evidence(stage, receipt)
        receipt["status"] = "source_passed"
        validate_manifest(receipt, stage_name, commit, modules, sources, inputs, ci, runtime, modern)
        save_receipt(stage, receipt, seal=True)
    except BaseException as error:
        receipt["status"] = "failed"
        receipt["error"] = str(error)
        save_receipt(stage, receipt)
        raise
    print(f"SOURCE PASS {stage_name}: {len(modules)} fresh sources; audit/kernel pending", flush=True)


def audit_and_replay(stage, modules, required, modern, compiler, env, receipt, deadline):
    # The reusable renderer has optional relaxed audit elaboration settings.
    # Remove those settings here; this lane retains the existing default limits.
    text = owned.audit_source(modules, required, ["HadamardQuotient133."])
    options = "set_option maxRecDepth 100000\nset_option maxHeartbeats 0\n"
    require(text.count(options) == 1, "Audit renderer option policy changed")
    text = text.replace(options, "")
    audit_path = stage / "src/HadamardQuotient133Audit.lean"
    audit_path.write_text(text)
    result = check([str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                    audit_path.name], stage, env, "all-owned-audit", deadline)
    require(successful(result), "All-owned private audit failed")
    spec = {"modules": modules, "required": required, "legacy_prefixes": ["HadamardQuotient133."]}
    inventory = owned.validate_log((stage / result["log_relative"]).read_text(), spec, modern)
    require(all(inventory["declarations"][name]["kind"] == "theorem" for name in required),
            "Required endpoint is not a theorem")
    write_json(stage / "declaration-inventory.json", inventory)
    result.update({"all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
                   "complete_serialized_private_import": True, "summary": inventory["summary"],
                   "audit_source_sha256": gate.digest(audit_path),
                   "declaration_inventory_sha256": gate.digest(stage / "declaration-inventory.json")})
    receipt["axiom_audit"] = result
    receipt["completed_checks"].append("all-owned serialized-private declaration and axiom audit")
    save_receipt(stage, receipt)
    command = [str(compiler / "bin/leanchecker"), "-v", "Conjectures"]
    if buffer := shutil.which("stdbuf"):
        command = [buffer, "-oL", "-eL", *command]
    result = check(command, stage, env, "kernel-replay", deadline)
    require(successful(result), "Independent stock kernel replay failed")
    actual = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$",
                        (stage / result["log_relative"]).read_text(), re.M)
    require(Counter(actual) == Counter(modules) and len(actual) == len(set(actual)),
            "Exact stock replay module multiset mismatch")
    result.update({"replayed_modules": actual, "exact_target_multiset": True,
                   "unchanged_stock_checker": True, "stock_prefix": "Conjectures"})
    receipt["kernel_replay"] = result
    receipt["completed_checks"].append("independent exact-closure stock kernel replay")


def assemble(directory):
    target, required = gate.TASKS["main"]
    stage = gate.ROOT / ".candidate-artifacts/hadamard-quotient133-main"
    values = begin(stage, target, "complete-verification")
    modules, sources, inputs, commit, ci, compiler, runtime, modern, env, receipt = values
    deadline = time.monotonic() + JOB_SECONDS
    receipt.update({"task": "main", "required_theorems": required,
                    "source_stage_receipt_sha256": {}, "source_stage_provenance": {}})
    try:
        reproduction = check(["node", str(gate.ROOT / "scripts/generate_hadamard_quotient133.mjs"),
                              "--check"], stage, env, "producer-reproduction", deadline, gate.ROOT)
        require(successful(reproduction), "Full deterministic packet reproduction failed")
        receipt["producer_reproduction"] = reproduction
        receipt["completed_checks"].append("deterministic full packet reproduction against four frozen inputs")
        covered = set()
        all_objects = {}
        all_paths = {}
        for stage_name in STAGES:
            folder = directory / ("hadamard-quotient133-source-" + stage_name)
            manifest = folder / "receipt.json"
            prior = json.loads(manifest.read_text())
            stage_modules = gate.dependency_order(STAGE_TARGETS[stage_name])
            require(set(stage_modules) <= set(modules), "Source stage is outside Main closure")
            stage_sources = {module: sources[module] for module in stage_modules}
            stage_modern = {module: modern[module] for module in stage_modules}
            objects = validate_manifest(prior, stage_name, commit, stage_modules,
                                        stage_sources, inputs, ci, runtime, stage_modern)
            authenticate_stage(folder, prior, stage_name, stage_modules, stage_sources, inputs, objects)
            for name, expected in objects.items():
                require(name not in all_objects or all_objects[name] == expected,
                        "Shared object disagreement")
                all_objects[name] = expected
                all_paths[name] = folder / "lib/lean" / name
            covered.update(stage_modules)
            receipt["source_stage_receipt_sha256"][stage_name] = gate.digest(manifest)
            receipt["source_stage_provenance"][stage_name] = prior["ci"]
            archived = stage / "source-stages" / stage_name
            shutil.copytree(folder, archived)
            require(file_inventory(archived) == prior["evidence_sha256"],
                    "Stage evidence changed during preservation")
            require(gate.digest(archived / "receipt.json") == gate.digest(manifest),
                    "Stage receipt changed during preservation")
        # Only already authenticated objects enter the new project import path.
        for name, source_path in all_paths.items():
            destination = stage / "lib/lean" / name
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source_path, destination)
            require(gate.digest(destination) == all_objects[name], "Object copy changed")
        receipt["completed_checks"].append("five authenticated same-run source stages and exact object coverage")
        remaining = [module for module in modules if module not in covered]
        compile_sources(remaining, compiler, stage, env, receipt, deadline)
        receipt["assembly_checked_sources"] = list(receipt["checked_sources"])
        receipt["checked_sources"] = modules
        receipt["source_stage_modules"] = sorted(covered)
        receipt["completed_checks"].append(SOURCE_CHECK)
        objects = object_hashes(stage, modules, modern)
        receipt["object_sha256"] = objects
        audit_and_replay(stage, modules, required, modern, compiler, env, receipt, deadline)
        recheck(stage, modules, sources, inputs, objects, modern, compiler, commit)
        recheck_evidence(stage, receipt)
        receipt["status"] = "passed"
        save_receipt(stage, receipt, seal=True)
    except BaseException as error:
        receipt["status"] = "failed"
        receipt["error"] = str(error)
        save_receipt(stage, receipt)
        raise
    print("PASS quotient-133: complete fresh source coverage, all-owned/private audit, "
          "and exact unchanged stock replay", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    commands = parser.add_subparsers(dest="command", required=True)
    stage = commands.add_parser("source")
    stage.add_argument("stage", choices=STAGES)
    final = commands.add_parser("assemble")
    final.add_argument("directory", type=Path)
    args = parser.parse_args()
    if args.command == "source":
        compile_stage(args.stage)
    else:
        assemble(args.directory.resolve())


if __name__ == "__main__":
    main()
