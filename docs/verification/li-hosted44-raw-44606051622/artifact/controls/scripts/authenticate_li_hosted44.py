#!/usr/bin/env python3
"""Authenticate the original successful Li44 GitHub Actions artifact.

This is an offline, read-only verification of a fixed artifact identified by
the GitHub API and upload log.  It does not compile Lean, replay objects,
register results, or claim coverage of differing serialized proof bodies.
Run/job/artifact identifiers and the archive digest are fixed provenance
pins; the original commit's git blobs supply all source and control bytes.

The output directory must not exist.  Original archive members are preserved
under OUTPUT/original; authenticated git inputs are under OUTPUT/frozen.
Only a complete successful authentication creates OUTPUT/authentication.json.
"""
from __future__ import annotations

import argparse
import hashlib
import importlib
import json
import math
import os
from pathlib import Path, PurePosixPath
import re
import stat
import subprocess
import sys
import zipfile


HEAD = "20e0e95eb421cf8ea728d34aa29a6d0eb1137789"
RUN_ID = 44599210697
JOB_ID = 135825706963
ARTIFACT_ID = 14568527194
ARCHIVE_SHA256 = "281b57fd87cf7d6123cdcabff4a5803f3d426116dbb4a9aa01370318b2a138ed"
ARCHIVE_BYTES = 19830817
ARCHIVE_MEMBERS = 272
EXPANDED_BYTES = 76189121
RECEIPT_SHA256 = "da585dbd99530825af7bac8c4730c1a6666bfa151ce98ad4c6f52b9d537aa09d"
MODEL_SHA256 = "6625ba9585caba15395d604d208b6577866a071622e6694ab0a94fd3be683724"
GATE_SHA256 = "5533b789c681e32b3894994e937d6313757faeccdd078d6c68ea87bb9832b67c"
LITERAL_SHA256 = "14b9ca268b5bf943f1656b21119b43adfa5529cf0414479c0f1ad762079ef53b"
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
LEAN_VERSION = ("Lean (version 4.35.0, x86_64-unknown-linux-gnu, commit "
                "eb6cafb7290e8bd5f2937522d8d804f58f02bafc, Release)")
HOST_TOOLCHAIN = "/home/runner/.elan/toolchains/leanprover--lean4---v4.35.0"
HOST_STAGE = ("/home/runner/work/solved-conjectures/solved-conjectures/"
              ".candidate-artifacts/li-exact")
MODEL_PATH = "docs/li-exact-sources.json"
GATE_PATH = "scripts/verify_li_exact.py"
OWN_INPUTS = (GATE_PATH, ".github/workflows/lean-li-exact.yml", MODEL_PATH)
CONFIGURATION_INPUTS = (
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
)
HELPER_INPUTS = (
    "scripts/audit_lean_all_owned.py", "scripts/build_lean_parallel.py",
    "scripts/plan_accepted_lean.py", "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py", "scripts/verify_frankl_orbit_batches.py",
    "scripts/verify_lean_candidate.py",
)
ALLOWED = ["propext", "Classical.choice", "Quot.sound"]
SOURCE_POLICY = {"fresh_project_objects": True, "linter_override": False,
                 "warning_as_error": True}
EXPECTED_SUMMARY = {
    "allowed_axioms": ALLOWED, "declarations": 1247, "modules": 44,
    "private_declarations": 95, "raw_declarations": 1247,
    "required": 71, "tag": "passed", "theorems": 932,
}


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def digest(path):
    result = hashlib.sha256()
    with Path(path).open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            result.update(block)
    return result.hexdigest()


def read_json(raw, label):
    def pairs(items):
        result = {}
        for key, value in items:
            require(key not in result, "Duplicate JSON key in " + label + ": " + key)
            result[key] = value
        return result

    def bad_constant(value):
        raise RuntimeError("Non-finite JSON constant in " + label + ": " + value)

    return json.loads(raw, object_pairs_hook=pairs, parse_constant=bad_constant)


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True, allow_nan=False) + "\n").encode()


def save_new(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("xb") as stream:
        stream.write(data)


def relative_name(name):
    require(isinstance(name, str) and name and "\\" not in name and "\0" not in name,
            "Invalid archive/control filename")
    path = PurePosixPath(name)
    require(not path.is_absolute() and path.as_posix() == name
            and all(part not in ("", ".", "..") for part in path.parts),
            "Non-canonical archive/control filename: " + name)
    return path


def git_bytes(repository, path):
    relative_name(path)
    return subprocess.check_output(
        ["git", "show", HEAD + ":" + path], cwd=repository,
    )


def extract_original(archive_path, output):
    require(archive_path.is_file() and not archive_path.is_symlink(),
            "Archive must be a regular file")
    require(archive_path.stat().st_size == ARCHIVE_BYTES, "Archive byte count differs")
    require(digest(archive_path) == ARCHIVE_SHA256, "Original archive digest differs")
    require(not output.exists(), "Choose a new output directory; nothing is overwritten")
    with zipfile.ZipFile(archive_path) as archive:
        infos = archive.infolist()
        require(len(infos) == ARCHIVE_MEMBERS, "Archive member count differs")
        require(len({info.filename for info in infos}) == len(infos),
                "Duplicate archive filename")
        require(sum(info.file_size for info in infos) == EXPANDED_BYTES,
                "Archive expansion size differs")
        for info in infos:
            relative_name(info.filename)
            mode = info.external_attr >> 16
            require(not info.is_dir() and stat.S_IFMT(mode) in (0, stat.S_IFREG),
                    "Archive contains a directory or non-regular member")
            require(not (info.flag_bits & 1), "Encrypted archive member")
            require(info.compress_type in (zipfile.ZIP_STORED, zipfile.ZIP_DEFLATED),
                    "Unsupported archive compression")
        original = output / "original"
        original.mkdir(parents=True)
        members = {}
        for info in infos:
            # ZipFile.read checks each CRC.  Names were validated before any write.
            raw = archive.read(info)
            require(len(raw) == info.file_size, "Archive member size differs")
            path = original / info.filename
            save_new(path, raw)
            members[info.filename] = {"bytes": len(raw), "sha256": sha(raw)}
        require(digest(archive_path) == ARCHIVE_SHA256, "Archive changed during extraction")
    return original, members


def authenticate(archive_path, output, repository):
    script_sha = digest(Path(__file__))
    require(subprocess.check_output(["git", "rev-parse", HEAD + "^{commit}"],
                                    cwd=repository, text=True).strip() == HEAD,
            "Original source commit is unavailable")
    original, members = extract_original(archive_path, output)
    receipt_raw = (original / "receipt.json").read_bytes()
    require(sha(receipt_raw) == RECEIPT_SHA256, "Original receipt digest differs")
    receipt = read_json(receipt_raw, "receipt.json")
    require(receipt["schema"] == "li-exact-receipt-v1", "Receipt schema differs")
    require(receipt["status"] == "passed" and receipt["git_commit"] == HEAD,
            "Original receipt is not the pinned successful run")
    for key in ("all_frozen_hashes_unchanged", "literal_li_scope_checked",
                "finite_colour_scope", "supplementary_negative_coefficient_included"):
        require(receipt[key] is True, "Missing successful scope flag: " + key)
    require(receipt["accepted_registry_changed"] is False
            and receipt["infinite_variable_ring_constructed"] is False,
            "Receipt acceptance or mathematical scope differs")
    require(receipt["source_failures"] == receipt["blocked_sources"] == {},
            "Original source closure has failures or blocked descendants")
    require(receipt["source_policy"] == SOURCE_POLICY, "Strict source policy differs")
    require(receipt["axiom_whitelist"] == ALLOWED, "Axiom whitelist differs")
    require(receipt["source_workers"] == receipt["kernel_threads"] == 1,
            "Source/kernel concurrency differs")

    model_raw = git_bytes(repository, MODEL_PATH)
    require(sha(model_raw) == MODEL_SHA256, "Original model digest differs")
    model = read_json(model_raw, MODEL_PATH)
    require(model["sealed"] is True and model["project_module_count"] == 44
            and model["required_theorem_count"] == 71, "Unsealed or incorrect model scope")
    require(set(model["configuration_sha256"]) == set(CONFIGURATION_INPUTS)
            and set(model["helper_sha256"]) == set(HELPER_INPUTS),
            "Configuration/helper inventory differs")
    controls = {**model["configuration_sha256"], **model["helper_sha256"]}
    for path in OWN_INPUTS:
        controls[path] = sha(git_bytes(repository, path))
    require(controls[GATE_PATH] == GATE_SHA256 and controls[MODEL_PATH] == MODEL_SHA256,
            "Original gate/model pins differ")
    require(receipt["gate_sha256"] == controls, "Receipt gate/control inventory differs")
    frozen = output / "frozen"
    for path, expected in controls.items():
        raw = git_bytes(repository, path)
        require(sha(raw) == expected, "Original pinned control differs: " + path)
        save_new(frozen / path, raw)

    # The frozen helper executes only its previously pinned Python validation
    # functions.  No current-main helper, Lean compiler, or checker is invoked.
    for module, expected in model["source_sha256"].items():
        require(re.fullmatch(r"Conjectures\.Li[A-Za-z0-9_]+", module),
                "Unexpected Li module name")
        relative = module.replace(".", "/") + ".lean"
        raw = (original / "src" / relative).read_bytes()
        require(sha(raw) == expected
                and raw == git_bytes(repository, "lean/" + relative),
                "Proof source differs from original git blob: " + module)
        target = frozen / "lean" / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        os.link(original / "src" / relative, target)
    sys.dont_write_bytecode = True
    sys.path.insert(0, str(frozen / "scripts"))
    for name in (Path(path).stem for path in (*HELPER_INPUTS, GATE_PATH)):
        require(name not in sys.modules, "Unexpected preloaded proof helper: " + name)
    gate = importlib.import_module("verify_li_exact")
    for path in (*HELPER_INPUTS, GATE_PATH):
        name = Path(path).stem
        if name in sys.modules:
            require(Path(sys.modules[name].__file__).resolve() == (frozen / path).resolve(),
                    "Validation helper came from outside frozen inputs")
    require(gate.LEAN_SHA256 == LEAN_SHA256 and gate.CHECKER_SHA256 == CHECKER_SHA256,
            "Original verifier binary pins differ")
    modules, required, modern = gate.preflight(model)
    require(len(modules) == 44 and len(required) == 71 and not any(modern.values()),
            "Original preflight scope differs")
    require(receipt["project_modules"] == modules and receipt["required_theorems"] == required,
            "Receipt module/theorem order differs")
    require(receipt["modern_modules"] == modern and receipt["roots"] == model["roots"],
            "Receipt module mode/root inventory differs")
    require(receipt["source_sha256"] == model["source_sha256"]
            and receipt["contribution"] == model["contribution"]
            and receipt["scope"] == model["scope"], "Receipt source/scope/credit differs")
    require(set(receipt["source_checks"]) == set(receipt["kernel_checks"]) == set(modules),
            "Missing or extra source/kernel process record")

    toolchain = receipt["toolchain"]
    require(toolchain == {
        "lean_path": HOST_TOOLCHAIN + "/bin/lean", "lean_sha256": LEAN_SHA256,
        "checker_path": HOST_TOOLCHAIN + "/bin/leanchecker",
        "checker_sha256": CHECKER_SHA256, "lean_version": LEAN_VERSION,
    }, "Original compiler/checker paths, version or digests differ")
    require(isinstance(receipt["external_lean_path"], list)
            and receipt["external_lean_path"]
            and all(isinstance(path, str) and
                    ("/.lake/packages/" in path or path == HOST_TOOLCHAIN + "/lib/lean")
                    for path in receipt["external_lean_path"]),
            "Unexpected external library search path")
    strict = [toolchain["lean_path"], "-j1", "-M4500", "-DwarningAsError=true"]

    def process(check, stem, expected_command, empty=False):
        require(check["exit_code"] == 0 and check["timed_out"] is False,
                "Unsuccessful process: " + stem)
        require(check["command"] == expected_command, "Process command differs: " + stem)
        log_name, progress_name = "logs/" + stem + ".log", "progress/" + stem + ".json"
        require(check["log"] == HOST_STAGE + "/" + log_name
                and check["progress"] == HOST_STAGE + "/" + progress_name,
                "Original process evidence paths differ: " + stem)
        log_raw, progress_raw = ((original / name).read_bytes()
                                 for name in (log_name, progress_name))
        require(sha(log_raw) == check["log_sha256"]
                and sha(progress_raw) == check["progress_sha256"],
                "Process log/profile digest differs: " + stem)
        if empty:
            require(log_raw == b"", "Strict source/literal log is not empty: " + stem)
        profile = read_json(progress_raw, progress_name)
        needed = {"command", "exit_code", "timed_out", "seconds", "user_seconds",
                  "system_seconds", "peak_rss_kib", "log", "log_sha256"}
        require(needed <= set(profile), "Incomplete process profile: " + stem)
        require(all(check.get(key) == value for key, value in profile.items()),
                "Process profile/receipt values disagree: " + stem)
        for key in ("seconds", "user_seconds", "system_seconds", "peak_rss_kib"):
            require(isinstance(profile[key], (int, float)) and math.isfinite(profile[key])
                    and profile[key] >= 0, "Invalid resource profile: " + stem)
        return log_raw.decode()

    objects = {}
    for module in modules:
        stem = module.replace(".", "/")
        source = original / "src" / (stem + ".lean")
        check = receipt["source_checks"][module]
        require(check["source_sha256"] == model["source_sha256"][module],
                "Process source digest differs: " + module)
        compiled_output = HOST_STAGE + "/lib/lean/" + stem + ".olean"
        process(check, module + ".source", strict + ["-o", compiled_output, stem + ".lean"], empty=True)
        facets = gate.module_objects(original, module, modern)
        require(facets == check["artifact_sha256"] == receipt["artifact_sha256"][module],
                "Compiled object facets differ: " + module)
        direct = {dep for dep in gate.imports_of(source)
                  if dep == "Conjectures" or dep.startswith("Conjectures.")
                  or dep == "Solitaire" or dep.startswith("Solitaire.")}
        require(direct == set(check["direct_project_imports"]),
                "Direct project import inventory differs: " + module)
        for dep, record in check["direct_project_imports"].items():
            require(dep in objects, "Import was not successfully built earlier: " + dep)
            require(record == {"source_sha256": model["source_sha256"][dep],
                               "artifact_sha256": objects[dep]},
                    "Imported source/object provenance differs: " + module + " -> " + dep)
        objects[module] = facets
    require(gate.objects(original, modules, modern) == objects == receipt["artifact_sha256"],
            "Exact object closure differs")
    all_objects = {str(path.relative_to(original / "lib/lean")).removesuffix(".olean").replace("/", ".")
                   for path in (original / "lib/lean").rglob("*.olean")}
    require(all_objects == set(modules), "Extra project object namespace or missing module")

    statements = original / "src/LiExactStatements.lean"
    require(statements.read_text() == gate.STATEMENTS, "Literal contract source differs")
    require(digest(statements) == LITERAL_SHA256 == receipt["literal_statements_sha256"]
            == model["literal_statements_sha256"], "Literal contract digest differs")
    require(len(re.findall(r"^example\b", gate.STATEMENTS, re.M)) == 25,
            "Literal mathematical contract count differs")
    process(receipt["literal_statements"], "literal-statements", strict + [statements.name], empty=True)

    audit_path = original / "src/LiExactAudit.lean"
    require(audit_path.read_text() == gate.audit.audit_source(modules, required, model["legacy_prefixes"]),
            "Generated all-owned audit source differs")
    audit_check = receipt["axiom_audit"]
    require(digest(audit_path) == audit_check["audit_source_sha256"], "Audit source digest differs")
    audit_log = process(audit_check, "all-owned-audit", strict + [audit_path.name])
    inventory = gate.audit.validate_log(audit_log,
        {"modules": modules, "required": required, "legacy_prefixes": model["legacy_prefixes"]}, modern)
    inventory_raw = (original / "declaration-inventory.json").read_bytes()
    require(inventory == read_json(inventory_raw, "declaration-inventory.json")
            and sha(inventory_raw) == audit_check["declaration_inventory_sha256"],
            "Parsed audit inventory or digest differs")
    require(inventory["summary"] == audit_check["summary"] == EXPECTED_SUMMARY,
            "All-owned audit counts differ")
    require(all(inventory["declarations"][name]["kind"] == "theorem" for name in required),
            "Required endpoint is not a theorem")
    for key in ("all_owned_declarations_audited", "exact_raw_private_visibility", "explicit_import_all"):
        require(audit_check[key] is True, "Incomplete audit scope flag: " + key)

    replayed = []
    for module in modules:
        check = receipt["kernel_checks"][module]
        command = ["/usr/bin/stdbuf", "-oL", "-eL", toolchain["checker_path"], "-v", module]
        log = process(check, module + ".kernel", command)
        actual = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$", log, re.M)
        require(actual == [module] == check["replayed_modules"]
                and check["exact_singleton_target"] is True,
                "Kernel target inventory differs: " + module)
        gate.exact_singleton(modules, module)
        replayed.extend(actual)
    replay = receipt["kernel_replay"]
    require(replayed == modules == replay["replayed_modules"], "Incomplete stock target coverage")
    for key in ("exact_project_closure", "all_modules_replayed_as_targets", "fresh_process_per_module"):
        require(replay[key] is True, "Incomplete stock replay flag: " + key)
    require(replay["seconds"] == round(sum(c["seconds"] for c in receipt["kernel_checks"].values()), 3)
            and replay["peak_rss_kib"] == max(c["peak_rss_kib"] for c in receipt["kernel_checks"].values()),
            "Aggregated stock replay resource record differs")

    expected_members = {"receipt.json", "declaration-inventory.json",
                        "src/LiExactStatements.lean", "src/LiExactAudit.lean"}
    for module in modules:
        stem = module.replace(".", "/")
        expected_members.add("src/" + stem + ".lean")
        expected_members.update("lib/lean/" + stem + suffix for suffix in objects[module])
        for phase in ("source", "kernel"):
            expected_members.add("logs/" + module + "." + phase + ".log")
            expected_members.add("progress/" + module + "." + phase + ".json")
    for phase in ("literal-statements", "all-owned-audit"):
        expected_members.add("logs/" + phase + ".log")
        expected_members.add("progress/" + phase + ".json")
    require(set(members) == expected_members, "Unexpected original artifact file inventory")
    actual_members = {path.relative_to(original).as_posix()
                      for path in original.rglob("*") if path.is_file()}
    require(actual_members == set(members), "Extraction gained or lost files")
    for name, record in members.items():
        path = original / name
        require(not path.is_symlink() and path.stat().st_size == record["bytes"]
                and digest(path) == record["sha256"], "Original member changed: " + name)
    for path, expected in controls.items():
        require(digest(frozen / path) == expected, "Frozen control changed: " + path)
    for module, expected in model["source_sha256"].items():
        require(digest(frozen / "lean" / (module.replace(".", "/") + ".lean")) == expected,
                "Frozen proof source changed: " + module)
    require(digest(archive_path) == ARCHIVE_SHA256 and digest(Path(__file__)) == script_sha,
            "Archive or authenticator changed during verification")

    save_new(output / "archive-members.json", encoded(members))
    result = {
        "schema": "li-hosted44-authentication-v1", "status": "passed",
        "run_id": RUN_ID, "job_id": JOB_ID, "artifact_id": ARTIFACT_ID, "head_sha": HEAD,
        "metadata": {"run_id": RUN_ID, "job_id": JOB_ID,
                     "artifact_id": ARTIFACT_ID, "head_sha": HEAD},
        "metadata_basis": "fixed GitHub API and upload-log identity; offline digest verification",
        "archive_sha256": ARCHIVE_SHA256, "archive_bytes": ARCHIVE_BYTES,
        "archive_member_count": ARCHIVE_MEMBERS, "expanded_bytes": EXPANDED_BYTES,
        "archive_path": str(archive_path), "artifact_dir": str(original),
        "original_receipt_sha256": RECEIPT_SHA256,
        "artifact_files_sha256": {name: record["sha256"] for name, record in members.items()},
        "frozen_repository_dir": str(frozen), "control_files_sha256": controls,
        "model_sha256": MODEL_SHA256, "gate_sha256": GATE_SHA256,
        "project_modules": modules, "required_theorems": required,
        "source_sha256": model["source_sha256"], "artifact_sha256": objects,
        "source_count": 44, "literal_contract_count": 25, "required_theorem_count": 71,
        "audit_summary": EXPECTED_SUMMARY, "exact_singleton_kernel_replays": 44,
        "compiler_sha256": LEAN_SHA256, "checker_sha256": CHECKER_SHA256,
        "literal_statements_sha256": LITERAL_SHA256,
        "source_object_log_profile_and_direct_import_hashes_validated": True,
        "source_and_controls_match_original_git_blobs": True,
        "literal_source_and_generated_audit_match_original_gate": True,
        "original_receipt_bytes_unchanged": True,
        "baseline_verification_authenticated": True,
        "raw_proof_occurrence_coverage": False,
        "baseline_audit_scope": "selected environment bodies for every owned name, including all raw/private names",
        "fresh_source_compilation_performed_by_authenticator": False,
        "kernel_replay_performed_by_authenticator": False,
        "accepted_registry_changed": False, "complete_li_acceptance_claimed": False,
        "authentication_script_sha256": script_sha,
    }
    save_new(output / "authentication.json", encoded(result))
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--archive", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--repository", type=Path, default=Path(__file__).resolve().parents[1],
                        help="Git repository containing original commit20e0e95 (defaults to script's repository)")
    args = parser.parse_args()
    result = authenticate(args.archive.resolve(), args.output_dir.resolve(), args.repository.resolve())
    print(json.dumps({key: result[key] for key in (
        "status", "run_id", "artifact_id", "archive_sha256", "original_receipt_sha256",
        "source_count", "literal_contract_count", "required_theorem_count", "audit_summary",
        "exact_singleton_kernel_replays", "raw_proof_occurrence_coverage",
        "authentication_script_sha256",
    )}, indent=2))


if __name__ == "__main__":
    main()
