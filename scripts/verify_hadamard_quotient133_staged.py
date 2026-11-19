#!/usr/bin/env python3
"""Compile three quotient-133 source closures, then audit and replay all of Main.

A source-stage receipt is not an acceptance receipt. The final job requires
all three exact-commit manifests, checks every source/input/object hash,
compiles uncovered assembly sources, audits every imported project theorem,
and performs the unchanged independent kernel replay of Main's full closure.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import shutil

import verify_hadamard_quotient133_candidate as gate


STAGES = ("catalog_verified", "rows_verified", "margins_verified")
SUFFIXES = (".olean", ".olean.server", ".olean.private")
BUILD = gate.LEAN / ".lake/build/lib/lean"
INPUTS = gate.GATE_INPUTS | {"scripts/verify_hadamard_quotient133_staged.py"}
SOURCE_CHECK = "strict source checks, warnings treated as errors"


def input_hashes() -> dict[str, str]:
    return {path: gate.digest(gate.ROOT / path) for path in sorted(INPUTS)}


def require(condition: bool, message: str) -> None:
    if not condition:
        raise RuntimeError(message)


def object_names(modules: list[str], suffixes=SUFFIXES) -> set[str]:
    return {module.replace(".", "/") + suffix
            for module in modules for suffix in suffixes}


def validate_manifest(receipt: dict, stage: str, commit: str,
                      modules: list[str], sources: dict[str, str],
                      inputs: dict[str, str]) -> dict[str, str]:
    """Validate provenance and complete source coverage before reading objects."""
    require(receipt.get("schema") == 1, "unknown source manifest schema")
    require(receipt.get("stage") == stage, "wrong source stage")
    require(receipt.get("phase") == "strict-source-only", "wrong source phase")
    require(receipt.get("status") == "source_passed", "source stage did not pass")
    require(receipt.get("commit") == commit, "source stage commit mismatch")
    require(receipt.get("target") == gate.TASKS[stage][0], "source target mismatch")
    require(receipt.get("project_modules") == modules, "source closure mismatch")
    require(receipt.get("checked_sources") == modules, "incomplete strict source coverage")
    require(receipt.get("source_failures") == {}, "source failures are present")
    require(receipt.get("completed_checks") == [SOURCE_CHECK], "unexpected source checks")
    require(receipt.get("source_sha256") == sources, "source hash mismatch")
    require(receipt.get("gate_sha256") == inputs, "verification input hash mismatch")
    objects = receipt.get("object_sha256")
    require(isinstance(objects, dict), "missing object hashes")
    require(object_names(modules, (".olean",)) <= objects.keys(), "missing primary objects")
    require(objects.keys() <= object_names(modules), "unexpected object paths")
    require(all(isinstance(value, str) and len(value) == 64
                and all(c in "0123456789abcdef" for c in value)
                for value in objects.values()), "invalid object digest")
    return objects


def verified_objects(directory: Path, objects: dict[str, str]) -> dict[str, Path]:
    """Hash every downloaded byte before any object enters the import path."""
    found = {}
    for name, expected in objects.items():
        path = directory / "objects" / name
        require(path.is_file() and not path.is_symlink(), f"missing object {name}")
        require(gate.digest(path) == expected, f"object hash mismatch: {name}")
        found[name] = path
    return found


def write_receipt(destination: Path, receipt: dict) -> None:
    destination.mkdir(parents=True, exist_ok=True)
    (destination / "receipt.json").write_text(
        json.dumps(receipt, indent=2, sort_keys=True) + "\n")


def compile_stage(stage: str) -> None:
    target, _ = gate.TASKS[stage]
    modules = gate.dependency_order(target)
    initial = gate.source_hashes(modules)
    inputs = input_hashes()
    commit = gate.revision()
    destination = gate.ROOT / ".candidate-artifacts/hadamard-quotient133-staged" / stage
    receipt = {"schema": 1, "stage": stage, "phase": "strict-source-only",
               "status": "running", "commit": commit, "target": target,
               "project_modules": modules, "source_sha256": initial,
               "gate_sha256": inputs, "completed_checks": []}
    try:
        gate.check_sources(modules, receipt)
        receipt["completed_checks"].append(SOURCE_CHECK)
        objects = {}
        for name in sorted(object_names(modules)):
            source = BUILD / name
            if not source.is_file():
                require(not name.endswith(".olean"), f"missing checked object {name}")
                continue
            target_path = destination / "objects" / name
            target_path.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source, target_path)
            objects[name] = gate.digest(target_path)
        require(gate.source_hashes(modules) == initial, "sources changed during compilation")
        require(input_hashes() == inputs, "verification inputs changed during compilation")
        require(gate.revision() == commit, "commit changed during compilation")
        receipt["object_sha256"] = objects
        receipt["status"] = "source_passed"
        validate_manifest(receipt, stage, commit, modules, initial, inputs)
    except BaseException as exc:
        receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        write_receipt(destination, receipt)
    print(f"SOURCE PASS {stage}: {len(modules)} strict sources; "
          "full audit and independent kernel replay remain pending", flush=True)


def assemble(directory: Path) -> None:
    target, required = gate.TASKS["main"]
    modules = gate.dependency_order(target)
    initial = gate.source_hashes(modules)
    inputs = input_hashes()
    commit = gate.revision()
    destination = gate.ROOT / ".candidate-artifacts/hadamard-quotient133-main"
    receipt = {"schema": 1, "task": "main", "phase": "complete-verification",
               "status": "running", "commit": commit, "target": target,
               "required_theorems": required, "project_modules": modules,
               "source_sha256": initial, "gate_sha256": inputs,
               "source_stage_receipt_sha256": {}, "completed_checks": []}
    try:
        gate.run("node", "../scripts/generate_hadamard_quotient133.mjs", "--check")
        receipt["completed_checks"].append("deterministic full packet reproduction against four frozen inputs")
        covered = set()
        all_objects = {}
        all_digests = {}
        for stage in STAGES:
            folder = directory / ("hadamard-quotient133-source-" + stage)
            manifest = folder / "receipt.json"
            stage_receipt = json.loads(manifest.read_text())
            stage_modules = gate.dependency_order(gate.TASKS[stage][0])
            require(set(stage_modules) <= set(modules), "stage is outside Main closure")
            objects = validate_manifest(stage_receipt, stage, commit, stage_modules,
                                        gate.source_hashes(stage_modules), inputs)
            found = verified_objects(folder, objects)
            for name, path in found.items():
                require(name not in all_digests or all_digests[name] == objects[name],
                        f"inconsistent shared object: {name}")
                all_digests[name] = objects[name]
                all_objects[name] = path
            covered.update(stage_modules)
            receipt["source_stage_receipt_sha256"][stage] = gate.digest(manifest)
            stage_archive = destination / "source-stages" / (stage + ".json")
            stage_archive.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(manifest, stage_archive)
        # Remove optional stale companions before copying the validated objects.
        for name in object_names(sorted(covered)):
            (BUILD / name).unlink(missing_ok=True)
        for name, path in all_objects.items():
            target_path = BUILD / name
            target_path.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(path, target_path)
            require(gate.digest(target_path) == all_digests[name], f"copy changed object: {name}")
        receipt["completed_checks"].append("three exact-commit source stages and every imported object hash")
        remaining = [module for module in modules if module not in covered]
        gate.check_sources(remaining, receipt)
        require(receipt["checked_sources"] == remaining, "assembly source coverage mismatch")
        receipt["assembly_checked_sources"] = list(receipt["checked_sources"])
        receipt["checked_sources"] = modules
        receipt["completed_checks"].append(SOURCE_CHECK)
        gate.audit([target], required, modules, "hadamard-quotient133-main")
        receipt["completed_checks"].append("module-ownership axiom whitelist and required theorems")
        gate.run("lake", "env", "python3", "../scripts/replay_lean.py", "--root", target)
        receipt["completed_checks"].append("independent exact-closure kernel replay")
        require(gate.source_hashes(modules) == initial, "sources changed during final verification")
        require(input_hashes() == inputs, "verification inputs changed during final verification")
        require(gate.revision() == commit, "commit changed during final verification")
        receipt["status"] = "passed"
    except BaseException as exc:
        receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        write_receipt(destination, receipt)
    print("PASS hadamard-quotient133-main: every strict source, all owned theorem axioms, "
          "and the complete independent kernel replay; unchanged sources and inputs", flush=True)


def main() -> None:
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
        assemble(args.directory)


if __name__ == "__main__":
    main()
