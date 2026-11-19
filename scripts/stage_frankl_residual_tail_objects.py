#!/usr/bin/env python3
"""Materialize the just-verified residual-tail sources and object facets.

This is an archive-delivery step after the unchanged fresh Tail gate. It does
not replay proofs, modify the gate receipt, or reuse a historical receipt.
Every copied byte is checked against that fresh receipt before and after
copying. Newly observed compiler metadata is recorded separately.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess

import verify_frankl_residual_tail as gate

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_RECEIPT = ROOT / ".candidate-artifacts/frankl-residual-tail/receipt.json"
FACETS = {".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig"}
REQUIRED_FACETS = {".olean", ".olean.private", ".olean.server"}
CONFIGS = {"lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json"}


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def checked_file(path, expected):
    path = Path(path)
    require(re.fullmatch(r"[0-9a-f]{64}", expected) is not None,
            "Invalid recorded SHA-256: " + str(path))
    require(path.is_file() and not path.is_symlink(),
            "Expected a materialized file: " + str(path))
    require(path.resolve().is_relative_to(ROOT),
            "Archive input escapes the checkout: " + str(path))
    require(digest(path) == expected, "Archive input hash differs: " + str(path))


def compiler_metadata():
    code = ("import json,os,shutil; print(json.dumps({"
            "'lean':shutil.which('lean'),"
            "'checker':shutil.which('leanchecker'),"
            "'lean_path':os.environ.get('LEAN_PATH','')}))")
    result = json.loads(subprocess.check_output(
        ["lake", "env", "python3", "-c", code], cwd=gate.LEAN, text=True))
    lean = Path(result["lean"])
    checker = Path(result["checker"])
    require(lean.is_file() and checker.is_file(), "Missing current Lean runtime")
    result["lean_sha256"] = digest(lean)
    result["checker_sha256"] = digest(checker)
    result["lean_version"] = subprocess.check_output(
        [str(lean), "--version"], text=True).strip()
    result["observation"] = "After the fresh gate; not a field of its raw receipt"
    return result


def validate_receipt(receipt, destination):
    require(receipt.get("status") == "passed", "Tail gate has not passed")
    require(receipt.get("task") == "tail", "Receipt is not the Tail task")
    require(receipt.get("commit") == gate.revision(), "Receipt is from another checkout")
    target, modules, covered, required = gate.task_spec("tail")
    require(receipt.get("target") == target, "Tail target differs")
    require(receipt.get("project_modules") == modules, "Exact Tail import closure differs")
    require(len(modules) == 116 and len(set(modules)) == 116,
            "Expected the unchanged 116-module Tail closure")
    require(all(re.fullmatch(r"Conjectures(?:\.[A-Za-z][A-Za-z0-9_]*)+", m)
                for m in modules), "Unsafe project module name")
    require(receipt.get("covered_tasks") == covered, "Covered task inventory differs")
    require(receipt.get("required_theorems") == required and len(required) == 117,
            "Required Tail endpoint inventory differs")
    checked = receipt.get("checked_sources", [])
    require(len(checked) == len(modules) and set(checked) == set(modules),
            "Fresh strict-source inventory is incomplete")
    require(not receipt.get("source_failures"), "Receipt contains a source failure")
    require(receipt.get("completed_checks") == [
        "strict source checks, warnings treated as errors",
        "explicit import-all axiom whitelist and exact private-node visibility",
        "independent exact-closure kernel replay"],
        "Receipt omits an existing proof gate")

    expected_sources = {"lean/" + m.replace(".", "/") + ".lean" for m in modules} | CONFIGS
    require(set(receipt.get("source_sha256", {})) == expected_sources,
            "Checked source/configuration inventory differs")
    require(set(receipt.get("gate_sha256", {})) == set(gate.GATE_INPUTS),
            "Frozen gate-input inventory differs")
    objects = receipt.get("artifact_sha256", {})
    require(set(objects) == set(modules), "Proof-object closure differs")
    for module, facets in objects.items():
        require(REQUIRED_FACETS <= set(facets) <= FACETS,
                "Modern facet inventory differs: " + module)

    audit = receipt.get("axiom_audit", {})
    require(audit.get("all_owned_declarations_audited") is True and
            audit.get("explicit_import_all") is True and
            audit.get("project_modules") == len(modules) and
            audit.get("required_endpoints") == len(required),
            "Missing exact all-owned import-all audit")
    nodes = gate.private_nodes(modules)
    require(audit.get("private_certificate_nodes_visible") ==
            sum(len(names) for names in nodes.values()) == 1044 and
            audit.get("new_private_certificate_nodes") == 447,
            "Private proof inventory differs")
    require(audit.get("owned_declarations_audited", 0) >=
            audit.get("project_theorems", 0) > 0,
            "Invalid owned-declaration audit counts")
    kernel = receipt.get("kernel_replay", {})
    replayed = kernel.get("replayed_modules", [])
    require(kernel.get("exact_replay_set") is True and
            len(replayed) == len(modules) and set(replayed) == set(modules),
            "Stock replay did not cover every exact project module")

    evidence = {
        "AxiomAudit.lean": audit["audit_source_sha256"],
        "axiom-audit.log": audit["log_sha256"],
        "kernel-replay.log": kernel["log_sha256"],
        "tail-regeneration.json": receipt["reproduction"]["sha256"],
    }
    require(Path(receipt["reproduction"]["path"]).resolve() ==
            (destination / "tail-regeneration.json").resolve(),
            "Reproduction JSON is outside this fresh gate")
    for relative, expected in evidence.items():
        checked_file(destination / relative, expected)
    gate.preflight_sources()
    require(gate.source_hashes(modules) == receipt["source_sha256"],
            "Current source/configuration bytes differ from the passed gate")
    require(gate.gate_hashes() == receipt["gate_sha256"],
            "Current gate bytes differ from the passed gate")
    require(gate.object_hashes(modules) == objects,
            "Current proof facets differ from the passed gate")
    require(gate.check_pinned_checker() == receipt["checker"],
            "Current stock checker differs from the passed gate")
    return modules, evidence


def materialize(receipt_path, output):
    require(not receipt_path.is_symlink() and receipt_path.resolve().is_relative_to(ROOT),
            "Receipt must be a regular file inside the checkout")
    receipt_path = receipt_path.resolve()
    output = output.resolve()
    require(receipt_path == DEFAULT_RECEIPT.resolve(), "Unexpected Tail receipt path")
    require(output == receipt_path.parent / "materialized", "Unexpected archive path")
    require(not output.exists(), "Refusing to overwrite an archive snapshot")
    raw_receipt = receipt_path.read_bytes()
    receipt_hash = hashlib.sha256(raw_receipt).hexdigest()
    receipt = json.loads(raw_receipt)
    modules, evidence = validate_receipt(receipt, receipt_path.parent)
    runtime = compiler_metadata()
    require(runtime["checker_sha256"] == receipt["checker"]["sha256"],
            "Recorded and observed checker hashes differ")
    helper_hash = digest(Path(__file__))
    output.mkdir(parents=True, exist_ok=False)
    files = {}

    def copy(relative, source, expected):
        require(relative not in files, "Duplicate archive path: " + relative)
        target = output / relative
        require(target.resolve().is_relative_to(output), "Unsafe archive target")
        checked_file(source, expected)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, target)
        require(not target.is_symlink() and digest(target) == expected,
                "Copied archive file differs: " + relative)
        files[relative] = expected

    for relative, expected in receipt["source_sha256"].items():
        archive = ("src/" + relative.removeprefix("lean/")
                   if relative.endswith(".lean") else "configuration/" + relative)
        copy(archive, ROOT / relative, expected)
    for module, facets in receipt["artifact_sha256"].items():
        stem = module.replace(".", "/")
        for suffix, expected in facets.items():
            copy("lib/lean/" + stem + suffix,
                 gate.LEAN / ".lake/build/lib/lean" / (stem + suffix), expected)
    for relative, expected in receipt["gate_sha256"].items():
        copy("gate-sources/" + relative, ROOT / relative, expected)
    copy("gate-sources/scripts/stage_frankl_residual_tail_objects.py",
         Path(__file__), helper_hash)
    for relative, expected in evidence.items():
        copy("evidence/" + relative, receipt_path.parent / relative, expected)
    copy("evidence/receipt.json", receipt_path, receipt_hash)

    # Recheck every original source/object/evidence after materialization.
    validate_receipt(receipt, receipt_path.parent)
    require(receipt_path.read_bytes() == raw_receipt, "Passed receipt changed while copying")
    require(digest(Path(__file__)) == helper_hash, "Archive helper changed while copying")
    require(compiler_metadata() == runtime, "Observed Lean runtime changed while copying")
    actual_files = {p.relative_to(output).as_posix() for p in output.rglob("*") if p.is_file()}
    require(actual_files == set(files), "Materialized archive file set differs")
    for relative, expected in files.items():
        checked_file(output / relative, expected)
    present_modules = {".".join(p.relative_to(output / "lib/lean").with_suffix("").parts)
                       for p in (output / "lib/lean/Conjectures").rglob("*.olean")}
    require(present_modules == set(modules), "Copied proof-object closure differs")
    manifest = {
        "schema": "frankl-residual-tail-materialized-v1",
        "status": "materialized_from_fresh_pass",
        "commit": receipt["commit"],
        "target": receipt["target"],
        "gate_receipt_sha256": receipt_hash,
        "archive_helper_sha256": helper_hash,
        "project_modules": modules,
        "required_theorems": receipt["required_theorems"],
        "source_sha256": receipt["source_sha256"],
        "artifact_sha256": receipt["artifact_sha256"],
        "observed_runtime": runtime,
        "file_sha256": files,
        "source_stage": "src/Conjectures",
        "object_stage": "lib/lean/Conjectures",
        "raw_receipt": "evidence/receipt.json",
        "scope": "Exact copied bytes from the immediately preceding fresh Tail source, all-owned audit, and stock-kernel pass; no historical facet reuse.",
    }
    path = output / "materialization.json"
    path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"status": manifest["status"], "modules": len(modules),
        "files": len(files), "receipt_sha256": receipt_hash,
        "materialization_sha256": digest(path)}, sort_keys=True), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--receipt", type=Path, default=DEFAULT_RECEIPT)
    parser.add_argument("--output", type=Path,
                        default=DEFAULT_RECEIPT.parent / "materialized")
    args = parser.parse_args()
    materialize(args.receipt, args.output)


if __name__ == "__main__":
    main()
