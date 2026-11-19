#!/usr/bin/env python3
"""Run one frozen, fresh all-owned accepted-closure candidate.

The snapshot fixes every accepted mathematical source, root, required name,
and verification input. This opt-in candidate leaves the accepted gate intact.
It archives the fresh checked kernel facets for later exact-byte evidence.
"""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import time

import audit_lean_all_owned as audit
import build_lean_parallel as build
import verify_lean_all_owned_candidate as inner_candidate

ROOT = Path(__file__).resolve().parents[1]
SNAPSHOT = "docs/lean-all-owned-accepted-snapshot.json"
CONTROLS = (
    "lean/ProofAudit.lean", "lean/lean-toolchain", "lean/lakefile.toml",
    "lean/lake-manifest.json", "scripts/verify_lean.sh",
    "scripts/replay_lean.py", "scripts/plan_accepted_lean.py",
    "scripts/build_lean_parallel.py", "scripts/replay_lean_parallel.py",
    "scripts/test_lean_parallel.py", "scripts/verify_lean_parallel_candidate.py",
    "docs/lean-parallel-candidate-sources.json", ".github/workflows/lean-parallel-candidate.yml",
    "scripts/audit_lean_all_owned.py", "scripts/test_lean_all_owned.py",
    "scripts/verify_lean_all_owned_candidate.py", ".github/workflows/lean-all-owned-candidate.yml",
    "docs/lean-all-owned-candidate-sources.json",
    "scripts/verify_lean_all_owned_accepted.py", ".github/workflows/lean-all-owned-accepted-candidate.yml",
)
SOURCE_JOBS = 2
KERNEL_WORKERS = 1
MEMORY_LIMIT_MIB = 12288


def staged_transformations():
    original_config = (ROOT / "lean/lakefile.toml").read_bytes()
    original_validator = (ROOT / "scripts/plan_accepted_lean.py").read_bytes()
    return {
        "configuration": inner_candidate.configuration_record(
            original_config, inner_candidate.legacy_compatible_config(original_config), True),
        "layout_validator": inner_candidate.validator_record(
            original_validator, inner_candidate.legacy_compatible_validator(original_validator), True),
    }


def verify_snapshot(snapshot):
    if snapshot.get("schema") != "lean-all-owned-accepted-snapshot-v1":
        raise ValueError("Unsupported frozen accepted snapshot")
    spec = audit.accepted_spec(ROOT)
    if spec != snapshot["spec"]:
        raise ValueError("Accepted registry, roots or required declarations changed")
    expected = {f"lean/{name.replace('.', '/')}.lean" for name in spec["modules"]} | set(CONTROLS)
    if set(snapshot["input_blob_sha"]) != expected:
        raise ValueError("Frozen input inventory differs from the exact accepted closure and controls")
    paths = sorted(expected)
    for path in paths:
        build.direct_file(ROOT / path)
    result = subprocess.run(["git", "hash-object", "--no-filters", "--stdin-paths"], cwd=ROOT,
                            input="\n".join(paths) + "\n", text=True, check=True,
                            stdout=subprocess.PIPE)
    hashes = result.stdout.splitlines()
    if len(hashes) != len(paths):
        raise ValueError("Git did not hash every frozen input")
    actual = dict(zip(paths, hashes))
    if actual != snapshot["input_blob_sha"]:
        changed = sorted(path for path in paths if actual[path] != snapshot["input_blob_sha"][path])
        raise ValueError("Frozen source/control bytes differ: " + repr(changed))
    if staged_transformations() != snapshot["staged_transformations"]:
        raise ValueError("Declared isolated configuration/validator transformation changed")
    return spec


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--output-dir", type=Path,
                        default=ROOT / ".candidate-artifacts/lean-all-owned-accepted")
    args = parser.parse_args(argv)
    build.direct_file(ROOT / SNAPSHOT)
    snapshot_bytes = (ROOT / SNAPSHOT).read_bytes()
    snapshot_hash = hashlib.sha256(snapshot_bytes).hexdigest()
    snapshot = json.loads(snapshot_bytes)
    head = build.git_head(ROOT)
    spec = verify_snapshot(snapshot)
    if args.preflight:
        print(json.dumps({"status": "ready", "git_head": head,
                          "snapshot_sha256": snapshot_hash,
                          "project_modules": len(spec["modules"]),
                          "required_declarations": len(spec["required"]),
                          "source_jobs": SOURCE_JOBS, "kernel_workers": KERNEL_WORKERS,
                          "memory_limit_mib": MEMORY_LIMIT_MIB,
                          "accepted_gate_changed": False,
                          "isolated_legacy_compatibility_opt_in": True}), flush=True)
        return 0
    output = args.output_dir.absolute()
    if output.exists() or output.is_symlink() or output.resolve() != output:
        raise ValueError("Full candidate output must be new and direct")
    receipt = {"schema": "lean-all-owned-accepted-candidate-v1", "status": "running",
               "git_head": head, "snapshot_sha256": snapshot_hash, "snapshot": snapshot,
               "project_modules": spec["modules"], "required_declarations": spec["required"],
               "source_jobs": SOURCE_JOBS, "kernel_workers": KERNEL_WORKERS,
               "memory_limit_mib": MEMORY_LIMIT_MIB, "accepted_gate_changed": False,
               "reuses_prior_project_objects": False,
               "configuration_modified_in_isolated_stage": True,
               "layout_validator_modified_in_isolated_stage": True}
    command = [sys.executable, str(ROOT / "scripts/verify_lean_all_owned_candidate.py"),
               "--accepted", "--allow-legacy-module-imports", "--jobs", str(SOURCE_JOBS), "--workers", str(KERNEL_WORKERS),
               "--memory-limit-mib", str(MEMORY_LIMIT_MIB), "--timeout-seconds", "21000",
               "--output-dir", str(output)]
    started = time.monotonic()
    try:
        subprocess.run(command, cwd=ROOT, check=True)
        inner_path = output / "receipt.json"
        inner_bytes = inner_path.read_bytes()
        inner = json.loads(inner_bytes)
        if (inner["status"] != "passed" or inner["scope"] != "accepted"
                or inner["spec"] != spec or inner["all_inputs_unchanged"] is not True):
            raise ValueError("The complete accepted-closure candidate did not pass")
        declared = snapshot["staged_transformations"]
        if (inner["isolated_configuration"] != declared["configuration"]
                or inner["isolated_layout_validator"] != declared["layout_validator"]):
            raise ValueError("The inner gate used another isolated configuration or validator")
        source = inner["source"]["source"]
        kernel = inner["kernel_replay"]["kernel"]
        if (source["status"] != "passed" or kernel["status"] != "passed"
                or set(source["artifact_sha256"]) != set(spec["modules"])
                or source["artifact_sha256"] != kernel["artifact_sha256"]
                or len(kernel["exact_replay_set"]) != len(spec["modules"])
                or set(kernel["exact_replay_set"]) != set(spec["modules"])
                or kernel["workers"] != KERNEL_WORKERS):
            raise ValueError("Fresh source/kernel inventory differs from the frozen full closure")
        if (inner["axiom_audit"]["all_owned_declarations_audited"] is not True
                or inner["axiom_audit"]["exact_raw_private_visibility"] is not True):
            raise ValueError("The all-owned raw-private audit is incomplete")
        if build.git_head(ROOT) != head or (ROOT / SNAPSHOT).read_bytes() != snapshot_bytes:
            raise ValueError("Frozen checkout or snapshot changed")
        verify_snapshot(snapshot)
        build.assert_inputs(output / "repo", inner["isolated_inputs"], inner["isolated_git_head"])
        staged = output / "replay-1/lib/lean"
        if staged.resolve() != staged or not staged.is_dir():
            raise ValueError("The archived proof-object directory is indirect or absent")
        discovered = {".".join(path.relative_to(staged).with_suffix("").parts)
                      for path in staged.rglob("*.olean")}
        if discovered != set(spec["modules"]):
            raise ValueError("The archived .olean inventory differs from the exact full closure")
        current_facets = {module: build.object_hashes(output / "repo/lean", staged, module)
                          for module in spec["modules"]}
        if current_facets != kernel["artifact_sha256"]:
            raise ValueError("Archived kernel facets changed after the inner gate")
        for relative, expected_hash in inner["evidence_sha256"].items():
            relative_path = Path(relative)
            if relative_path.is_absolute() or ".." in relative_path.parts:
                raise ValueError("Unsafe inner evidence path")
            evidence_path = output / relative_path
            build.direct_file(evidence_path)
            if build.sha256(evidence_path) != expected_hash:
                raise ValueError("Archived evidence changed after the inner gate: " + relative)
        build.direct_file(inner_path)
        if inner_path.read_bytes() != inner_bytes:
            raise ValueError("The complete inner candidate receipt changed")
        receipt.update(
            status="passed", source_sha256=source["input_sha256"],
            artifact_sha256=kernel["artifact_sha256"],
            all_owned_audit=inner["axiom_audit"],
            isolated_configuration=inner["isolated_configuration"],
            isolated_layout_validator=inner["isolated_layout_validator"],
            exact_kernel_replay=inner["kernel_replay"],
            complete_candidate_receipt_sha256=hashlib.sha256(inner_bytes).hexdigest(),
            all_frozen_inputs_unchanged=True, all_archived_kernel_facets_unchanged=True,
            archived_evidence_sha256=inner["evidence_sha256"],
            archived_kernel_facets_directory="replay-1/lib/lean",
            archived_source_directory="repo/lean")
    except BaseException as error:
        receipt.update(status="failed", error=f"{type(error).__name__}: {error}")
        raise
    finally:
        receipt["elapsed_seconds"] = time.monotonic() - started
        output.mkdir(parents=True, exist_ok=True)
        build.write_json(output / "full-snapshot-receipt.json", receipt)
        print("FULL-ALL-OWNED-CANDIDATE " + json.dumps({
            "status": receipt["status"], "modules": len(spec["modules"]),
            "required": len(spec["required"]),
            "receipt_sha256": build.sha256(output / "full-snapshot-receipt.json")}), flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
