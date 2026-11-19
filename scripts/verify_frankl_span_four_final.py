#!/usr/bin/env python3
"""Verify the final span-four theorem from exact passed component objects.

Each dependency keeps its original source, all-owned audit and stock replay.
All reused bytes and every overlap are checked. Only the two assembly modules
are freshly compiled, audited and replayed here. This is a composed theorem
check, not a fresh replay of the complete accepted package.
"""
from __future__ import annotations

import argparse
import io
import json
import os
from pathlib import Path, PurePosixPath
import re
import shutil
import stat
import subprocess
import zipfile

import verify_frankl_transport_results as common
import verify_frankl_orbit_batches as orbit
from replay_lean import imports_of

ROOT = Path(__file__).resolve().parents[1]
MODEL_PATH = "docs/frankl-span-four-composed-model.json"
OWN_INPUTS = (
    "scripts/verify_frankl_span_four_final.py",
    "scripts/test_frankl_span_four_final.py",
    ".github/workflows/lean-frankl-span-four-final.yml",
    MODEL_PATH,
)
ALLOWED = ["propext", "Classical.choice", "Quot.sound"]
REQUIRED_FACETS = {".olean", ".olean.private", ".olean.server"}
ALLOWED_FACETS = REQUIRED_FACETS | {".ir", ".ir.sig"}
MODULE = re.compile(r"Conjectures(?:\.[A-Za-z][A-Za-z0-9_]*)+")
SHA256 = re.compile(r"[0-9a-f]{64}")
sha = common.sha
require = common.require
encoded = common.encoded
evidence = common.evidence


def source_path(module):
    return "lean/" + module.replace(".", "/") + ".lean"


def checked_set(values, expected, label):
    require(isinstance(values, list) and len(values) == len(set(values))
            and set(values) == set(expected), label + " differs or has duplicates")


def valid_digest(value):
    return isinstance(value, str) and SHA256.fullmatch(value) is not None


def safe_relative(value):
    require(isinstance(value, str) and value != "", "Empty archive path")
    path = PurePosixPath(value)
    require(not path.is_absolute() and ".." not in path.parts
            and "\\" not in value and path.as_posix() == value.rstrip("/")
            and str(path) != ".", "Unsafe archive path: " + value)
    return path


def archive_of(payload, profile):
    require(len(payload) <= profile["compressed_limit"], "Compressed archive exceeds bound")
    archive = zipfile.ZipFile(io.BytesIO(payload))
    infos = archive.infolist()
    names = [item.filename for item in infos]
    require(len(infos) <= 50000 and len(names) == len(set(names)),
            "Duplicate or excessive archive entries")
    require(sum(item.file_size for item in infos) <= profile["expanded_limit"],
            "Expanded archive exceeds bound")
    for item in infos:
        safe_relative(item.filename)
        require(not stat.S_ISLNK(item.external_attr >> 16) and not item.flag_bits & 1,
                "Symlink or encrypted archive entry")
        require(item.compress_type in (zipfile.ZIP_STORED, zipfile.ZIP_DEFLATED),
                "Unsupported archive compression")
    return archive, names


def binding_complete(binding):
    if not isinstance(binding, dict):
        return False
    fields = ("run_id", "head_sha", "artifact_id", "artifact_name",
              "archive_sha256", "receipt_sha256")
    return all(binding.get(key) is not None for key in fields)


def validate_binding(binding):
    require(binding_complete(binding), "Dependency artifact identity has not been frozen")
    require(type(binding["run_id"]) is int and binding["run_id"] > 0
            and type(binding["artifact_id"]) is int and binding["artifact_id"] > 0,
            "Invalid run or artifact identifier")
    require(re.fullmatch(r"[0-9a-f]{40}", binding["head_sha"]) is not None
            and isinstance(binding["artifact_name"], str) and binding["artifact_name"],
            "Invalid source commit or artifact name")
    require(valid_digest(binding["archive_sha256"])
            and valid_digest(binding["receipt_sha256"]), "Invalid artifact or receipt digest")


def validate_run(run, binding):
    require(run["id"] == binding["run_id"] and run["head_sha"] == binding["head_sha"]
            and run["head_branch"] == "main"
            and run["head_repository"]["full_name"] == evidence.REPO,
            "Dependency run identity differs")
    if run["status"] != "completed":
        return False
    require(run["conclusion"] == "success", "A frozen dependency run did not pass")
    return True


def validate_artifact_identity(artifact, binding, payload):
    validate_binding(binding)
    require(artifact["id"] == binding["artifact_id"]
            and artifact["name"] == binding["artifact_name"]
            and artifact["workflow_run"]["id"] == binding["run_id"]
            and artifact["workflow_run"]["head_sha"] == binding["head_sha"]
            and artifact["expired"] is False
            and artifact["archive_download_url"] ==
                evidence.API + "/actions/artifacts/" + str(binding["artifact_id"]) + "/zip"
            and artifact["digest"] == "sha256:" + binding["archive_sha256"]
            and sha(payload) == binding["archive_sha256"],
            "Immutable dependency artifact identity differs")


def dependency_order(root):
    done, visiting, result = set(), set(), []
    def visit(module):
        if module in done:
            return
        require(MODULE.fullmatch(module) is not None, "Unexpected project module name")
        require(module not in visiting, "Cyclic project imports")
        visiting.add(module)
        path = ROOT / source_path(module)
        require(path.is_file() and not path.is_symlink(), "Missing source: " + module)
        for imported in imports_of(path):
            if imported == "Conjectures" or imported.startswith("Conjectures."):
                visit(imported)
            elif (ROOT / "lean" / (imported.replace(".", "/") + ".lean")).exists():
                raise RuntimeError("Unexpected local non-Conjectures import: " + imported)
        visiting.remove(module)
        done.add(module)
        result.append(module)
    visit(root)
    return result


def preflight(model):
    require(model["schema"] == "frankl-span-four-composed-model-v1",
            "Unexpected final composition model")
    modules = dependency_order(model["root"])
    require(len(modules) == 1100 and set(modules) == set(model["source_sha256"]),
            "The exact theorem import closure differs: " + json.dumps({
                "actual_count": len(modules), "expected_count": len(model["source_sha256"]),
                "missing_from_model": sorted(set(modules) - set(model["source_sha256"])),
                "outside_actual_closure": sorted(set(model["source_sha256"]) - set(modules))}))
    fresh = [m for m in modules if m in model["required_by_module"]]
    require(len(fresh) == 2 and fresh[-1] == model["root"],
            "Fresh assembly module inventory differs")
    required = [n for m in fresh for n in model["required_by_module"][m]]
    require(len(required) == len(set(required)) == 20, "Final endpoint inventory differs")
    for module, digest in model["source_sha256"].items():
        require(MODULE.fullmatch(module) is not None and valid_digest(digest)
                and sha((ROOT / source_path(module)).read_bytes()) == digest,
                "Frozen theorem source changed: " + module)
    for path, digest in {**model["configuration_sha256"], **model["helper_sha256"]}.items():
        require(valid_digest(digest) and sha((ROOT / path).read_bytes()) == digest,
                "Frozen configuration/helper changed: " + path)
    providers = model["providers"]
    require(set(providers) == {"transport-results", "full-graph", "residual-tail",
                              "literal-weights", "family-relabel"},
            "The complete dependency provider set differs")
    covered = set()
    for name, profile in providers.items():
        sources = profile["source_sha256"]
        excluded = profile["excluded_modules"]
        checked_set(excluded, set(sources) - set(modules), "Excluded provider modules")
        require(set(sources).isdisjoint(fresh), "Fresh module was supplied as a dependency")
        require(profile["root"] in sources, "Provider root is absent")
        require(len(profile["required_endpoints"]) ==
                len(set(profile["required_endpoints"])), "Duplicate provider endpoint")
        for module, digest in sources.items():
            require(MODULE.fullmatch(module) is not None and valid_digest(digest),
                    "Malformed source inventory")
            require(sha((ROOT / source_path(module)).read_bytes()) == digest,
                    "Provider source differs from this checkout: " + module)
            if module not in excluded:
                require(model["source_sha256"][module] == digest,
                        "Provider overlaps disagree: " + module)
                covered.add(module)
        if binding_complete(profile.get("binding")):
            validate_binding(profile["binding"])
    require(covered == set(modules) - set(fresh),
            "Dependency providers do not cover the exact theorem closure")
    for module in fresh:
        common.exact_selector(modules, module)
        text = (ROOT / source_path(module)).read_text()
        require(re.search(r"\b(?:sorry|admit|native_decide)\b", text) is None,
                "Forbidden proof shortcut in a fresh assembly source")
    return modules, fresh


def readiness(model, fetch=evidence.api):
    rows = {}
    for name, profile in model["providers"].items():
        binding = profile.get("binding")
        if not binding_complete(binding):
            rows[name] = {"ready": False, "reason": "immutable artifact binding pending"}
            continue
        validate_binding(binding)
        run = fetch("/actions/runs/" + str(binding["run_id"]))
        ready = validate_run(run, binding)
        rows[name] = {"ready": ready, "run_id": binding["run_id"],
                      "status": run["status"], "conclusion": run["conclusion"]}
    return {"ready": all(row["ready"] for row in rows.values()), "providers": rows}


def locate_receipt(archive, names, profile):
    expected = profile["binding"]["receipt_sha256"]
    matches = [name for name in names if name.endswith("receipt.json")
               and sha(archive.read(name)) == expected]
    if profile["kind"] == "tail":
        matches = [name for name in matches
                   if name.endswith("materialized/evidence/receipt.json")]
    require(len(matches) == 1, "Expected one bound original receipt at its profile location")
    path = matches[0]
    raw = archive.read(path)
    receipt = json.loads(raw)
    prefix = str(PurePosixPath(path).parent)
    prefix = "" if prefix == "." else prefix + "/"
    if profile["kind"] == "tail":
        require(prefix.endswith("materialized/evidence/"), "Unexpected materialized Tail layout")
        prefix = prefix.removesuffix("evidence/")
    return raw, receipt, prefix


def profile_success(check):
    require(check.get("exit_code") == 0 and check.get("timed_out") is False,
            "Recorded process did not finish successfully")


def replay_names(raw):
    return re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$", raw.decode(), re.M)


def kernel_profile(check, toolchain, target):
    profile_success(check)
    command = check["command"]
    expected = [toolchain["checker_path"], "-v", target]
    require(command == expected or command == ["/usr/bin/stdbuf", "-oL", "-eL", *expected],
            "Recorded stock checker command differs")


def read_checked(archive, path, digest, files):
    safe_relative(path)
    require(valid_digest(digest), "Malformed recorded file digest")
    raw = archive.read(path)
    require(sha(raw) == digest, "Archived evidence differs: " + path)
    require(files.setdefault(path, digest) == digest, "Conflicting archive evidence identity")
    return raw


def configurations(receipt, model):
    for path, digest in model["configuration_sha256"].items():
        recorded = receipt.get("gate_sha256", {}).get(path)
        if recorded is None:
            recorded = receipt.get("source_sha256", {}).get(path)
        if recorded is None:
            recorded = receipt.get("original_gate_sha256", {}).get(path)
        require(recorded == digest, "Dependency Lean configuration differs: " + path)


def common_header(receipt, profile, model):
    require(receipt["status"] == "passed", "A dependency receipt has not passed")
    modules = receipt["project_modules"]
    checked_set(modules, profile["source_sha256"], "Dependency module inventory")
    expected = profile["binding"]["head_sha"]
    require(receipt.get("git_commit", receipt.get("commit")) == expected,
            "Receipt source checkout differs")
    required = receipt.get("required_endpoints", receipt.get("required_theorems"))
    require(required == profile["required_endpoints"], "Required dependency endpoints differ")
    if profile["kind"] == "tail":
        sources = {m: receipt["source_sha256"][source_path(m)] for m in modules}
        require(set(receipt["source_sha256"]) ==
                {source_path(m) for m in modules} | set(model["configuration_sha256"]),
                "Tail source/configuration inventory differs")
    else:
        sources = receipt["source_sha256"]
        require(receipt["all_frozen_hashes_unchanged"] is True,
                "Dependency final byte-identity guard did not pass")
        require(receipt["axiom_whitelist"] == ALLOWED, "Dependency axiom whitelist differs")
        common.validate_toolchain(receipt["toolchain"])
    require(sources == profile["source_sha256"], "Dependency source hashes differ")
    require(set(receipt["artifact_sha256"]) == set(modules),
            "Dependency object inventory is incomplete")
    configurations(receipt, model)
    return sources


def validate_objects(archive, prefix, receipt, sources, files):
    for module, digest in sources.items():
        stem = module.replace(".", "/")
        read_checked(archive, prefix + "src/" + stem + ".lean", digest, files)
        facets = receipt["artifact_sha256"][module]
        require(REQUIRED_FACETS <= set(facets) <= ALLOWED_FACETS,
                "Incomplete or unknown modern object facets")
        for suffix, value in facets.items():
            read_checked(archive, prefix + "lib/lean/" + stem + suffix, value, files)


def validate_source_profiles(archive, prefix, receipt, modules, files):
    require(set(receipt["source_checks"]) == set(modules),
            "Fresh strict-source profile inventory differs")
    for module in modules:
        check = receipt["source_checks"][module]
        common.strict_profile(check, receipt["toolchain"], module.replace(".", "/") + ".lean")
        read_checked(archive, prefix + "logs/" + module + ".source.log",
                     check["log_sha256"], files)


def validate_orbit(archive, prefix, receipt, profile, files):
    modules = receipt["project_modules"]
    require(receipt["required_private_endpoints"] == profile["required_private_endpoints"],
            "Explicit private proof inventory differs")
    validate_source_profiles(archive, prefix, receipt, modules, files)
    audit = receipt["axiom_audit"]
    common.strict_profile(audit, receipt["toolchain"], "OrbitGroupAudit.lean")
    require(audit["all_declarations_audited"] is True and audit["explicit_import_all"] is True
            and audit["project_module_count"] == len(modules)
            and audit["required_endpoint_count"] == len(profile["required_endpoints"])
            and audit["private_arithmetic_chunks_visible"] ==
                len(profile["required_private_endpoints"]),
            "Exact all-owned/private audit inventory differs")
    read_checked(archive, prefix + "src/OrbitGroupAudit.lean", audit["audit_source_sha256"], files)
    raw = read_checked(archive, prefix + "logs/axiom-audit.log", audit["log_sha256"], files)
    matches = re.findall(evidence.AUDIT_PATTERN, raw.decode())
    require(len(matches) == 1 and tuple(map(int, matches[0])) ==
            (len(modules), audit["declaration_count"], audit["theorem_count"],
             len(profile["required_endpoints"]), len(profile["required_private_endpoints"])),
            "All-owned audit log counts differ")
    check = receipt["kernel_replay"]
    kernel_profile(check, receipt["toolchain"], "Conjectures")
    require(check["exact_project_closure"] is True, "Missing exact dependency replay guard")
    raw = read_checked(archive, prefix + "logs/kernel-replay.log", check["log_sha256"], files)
    actual = replay_names(raw)
    require(actual == check["replayed_modules"], "Recorded kernel log and target list differ")
    checked_set(actual, modules, "Original dependency stock replay")


def validate_graph(archive, prefix, receipt, profile, files):
    modules = receipt["project_modules"]
    require(receipt["root"] == profile["root"]
            and receipt["required_private_endpoints"] == profile["required_private_endpoints"],
            "Full graph root/private inventory differs")
    validate_source_profiles(archive, prefix, receipt, modules, files)
    audit = receipt["axiom_audit"]
    common.strict_profile(audit, receipt["toolchain"], "FullGraphAudit.lean")
    require(audit["all_declarations_audited"] is True and audit["explicit_import_all"] is True,
            "Full graph all-owned audit is missing")
    read_checked(archive, prefix + "src/FullGraphAudit.lean", audit["audit_source_sha256"], files)
    raw = read_checked(archive, prefix + "logs/axiom-audit.log", audit["log_sha256"], files)
    summary = receipt["declaration_inventory"]
    require(summary["all_owned_declarations_audited"] is True
            and summary["exact_project_import_closure"] is True
            and summary["explicit_private_proofs_visible"] == len(profile["required_private_endpoints"]),
            "Full graph declaration/private coverage differs")
    declarations = json.loads(read_checked(archive, prefix + "declaration-inventory.json",
        summary["declaration_inventory_sha256"], files))
    require(declarations["required_explicit_private_proofs"] == profile["required_private_endpoints"],
            "Full graph explicit private declarations differ")
    for field, tag in (("declarations", "DECL"), ("private_declarations", "PRIVATE_DECL"),
                       ("private_theorems", "PRIVATE_THEOREM")):
        actual = re.findall(r"^" + tag + r" (.+)$", raw.decode(), re.M)
        require(sorted(actual) == declarations[field] and len(actual) == len(set(actual)),
                "Full graph declaration log differs")
    require(set(receipt["kernel_checks"]) == set(modules), "Full graph kernel inventory differs")
    total = []
    for module in modules:
        check = receipt["kernel_checks"][module]
        kernel_profile(check, receipt["toolchain"], module)
        require(check["exact_singleton_target"] is True
                and check["replayed_modules"] == [module], "Graph singleton target guard differs")
        raw = read_checked(archive, prefix + "logs/" + module + ".kernel.log",
                           check["log_sha256"], files)
        require(replay_names(raw) == [module], "Graph singleton replay log differs")
        total.append(module)
    replay = receipt["kernel_replay"]
    require(replay["replayed_modules"] == total
            and all(replay[key] is True for key in (
                "exact_project_closure", "all_modules_replayed_as_targets",
                "fresh_process_per_module", "singleton_target_guards")),
            "Complete graph stock replay union differs")


def validate_tail(archive, prefix, receipt, profile, model, files):
    manifest_raw = archive.read(prefix + "materialization.json")
    manifest = json.loads(manifest_raw)
    require(manifest["schema"] == "frankl-residual-tail-materialized-v1"
            and manifest["status"] == "materialized_from_fresh_pass"
            and manifest["commit"] == profile["binding"]["head_sha"]
            and manifest["gate_receipt_sha256"] == profile["binding"]["receipt_sha256"]
            and manifest["archive_helper_sha256"] == profile["archive_helper_sha256"],
            "Fresh Tail materialization identity differs")
    require(manifest["project_modules"] == receipt["project_modules"]
            and manifest["required_theorems"] == receipt["required_theorems"]
            and manifest["source_sha256"] == receipt["source_sha256"]
            and manifest["artifact_sha256"] == receipt["artifact_sha256"],
            "Copied Tail inventory differs from its fresh raw receipt")
    runtime = manifest["observed_runtime"]
    common.validate_toolchain(runtime)
    require(receipt["checker"]["sha256"] == runtime["checker_sha256"],
            "Tail recorded stock checker differs")
    files[prefix + "materialization.json"] = sha(manifest_raw)
    for relative, digest in manifest["file_sha256"].items():
        read_checked(archive, prefix + relative, digest, files)
    require(manifest["file_sha256"]["evidence/receipt.json"] ==
            profile["binding"]["receipt_sha256"], "Tail raw receipt was not preserved")
    modules = receipt["project_modules"]
    checked_set(receipt["checked_sources"], modules, "Fresh Tail strict-source inventory")
    require(not receipt["source_failures"] and receipt["task"] == "tail"
            and receipt["target"] == profile["root"]
            and receipt["completed_checks"] == [
                "strict source checks, warnings treated as errors",
                "explicit import-all axiom whitelist and exact private-node visibility",
                "independent exact-closure kernel replay"],
            "Tail completed gate inventory differs")
    audit = receipt["axiom_audit"]
    require(audit["all_owned_declarations_audited"] is True and audit["explicit_import_all"] is True
            and audit["project_modules"] == len(modules)
            and audit["required_endpoints"] == len(profile["required_endpoints"])
            and audit["private_certificate_nodes_visible"] == profile["required_private_count"]
            and audit["new_private_certificate_nodes"] == profile["new_private_count"]
            and audit["owned_declarations_audited"] >= audit["project_theorems"] > 0,
            "Exact Tail all-owned/private audit differs")
    read_checked(archive, prefix + "evidence/AxiomAudit.lean", audit["audit_source_sha256"], files)
    read_checked(archive, prefix + "evidence/axiom-audit.log", audit["log_sha256"], files)
    replay = receipt["kernel_replay"]
    require(replay["exact_replay_set"] is True, "Tail exact stock replay guard missing")
    raw = read_checked(archive, prefix + "evidence/kernel-replay.log", replay["log_sha256"], files)
    require(replay_names(raw) == replay["replayed_modules"], "Tail stock replay log differs")
    checked_set(replay["replayed_modules"], modules, "Original Tail stock replay")
    for path, digest in model["configuration_sha256"].items():
        require(manifest["file_sha256"]["configuration/" + path] == digest,
                "Tail copied configuration differs")


def validate_results(archive, prefix, receipt, profile, model, files):
    root = profile["root"]
    modules = receipt["project_modules"]
    dependencies = set(modules) - {root}
    require(receipt["schema"] == "frankl-transport-results-composed-v1"
            and receipt["root"] == root
            and receipt["fresh_source_modules"] == [root]
            and receipt["fresh_replay_modules"] == [root]
            and receipt["validated_dependency_modules"] == len(dependencies)
            and receipt["validated_dependency_private_proofs"] == profile["dependency_private_count"]
            and receipt["all_period_entries_checked"] is True
            and receipt["row_coverage_checked"] is True
            and receipt["canonical_graph_coverage_checked"] is False
            and receipt["accepted_package_replay"] is False
            and receipt["source_workers"] == receipt["kernel_threads"] == 1,
            "Composed transport Results scope differs")
    for relative, digest in receipt["frozen_evidence_sha256"].items():
        read_checked(archive, prefix + relative, digest, files)
    inventory = json.loads(read_checked(archive, prefix + "dependency-inventory.json",
                                        receipt["dependency_inventory_sha256"], files))
    checked_set(inventory["private_endpoints"], set(inventory["private_endpoints"]),
                "Transport private proof list")
    require(len(inventory["private_endpoints"]) == profile["dependency_private_count"]
            and len(inventory["required_endpoints"]) ==
                profile["dependency_required_count"] + len(profile["required_endpoints"])
            and sha(encoded({key: inventory[key] for key in
                             ("required_endpoints", "private_endpoints")})) ==
                profile["endpoint_inventory_sha256"],
            "Frozen complete transport endpoint/private inventory differs")
    require(set(inventory["modules"]) == dependencies,
            "Results dependency identity inventory differs")
    for module, identity in inventory["modules"].items():
        require(identity["identity"] == {
            "source_sha256": receipt["source_sha256"][module],
            "facets": receipt["artifact_sha256"][module]},
            "Results staged module identity differs")
    references = receipt["dependency_replays"]
    require(len(references) == 104
            and {item["group"] for item in references} ==
                {"complete-row-coverage"} | {f"g{i:03d}" for i in range(103)}
            and len({item["artifact_id"] for item in references}) == 104,
            "Results omitted or duplicated an original dependency group")
    replayed, private, required = set(), set(), set(profile["required_endpoints"])
    for reference in references:
        raw = read_checked(archive, prefix + reference["receipt"],
                           reference["receipt_sha256"], files)
        original = json.loads(raw)
        original_modules = original["project_modules"]
        require(original["status"] == "passed"
                and original["all_frozen_hashes_unchanged"] is True
                and original["git_commit"] == reference["original_source_commit"]
                and original["axiom_whitelist"] == ALLOWED,
                "Original transport dependency receipt has not passed exactly")
        checked_set(original_modules, set(original_modules), "Original project modules")
        require(set(original_modules) <= dependencies
                and set(original["source_checks"]) == set(original_modules)
                and set(original["artifact_sha256"]) == set(original_modules)
                and set(original["source_sha256"]) == set(original_modules),
                "Original dependency closure/source/object inventory differs")
        common.validate_toolchain(original["toolchain"])
        configurations(original, model)
        for module in original_modules:
            require(original["source_sha256"][module] == receipt["source_sha256"][module]
                    and original["artifact_sha256"][module] == receipt["artifact_sha256"][module],
                    "An original dependency object differs from the composed Results object")
            common.strict_profile(original["source_checks"][module], original["toolchain"],
                                  module.replace(".", "/") + ".lean")
        for relative, digest in reference["preserved_files_sha256"].items():
            require(receipt["frozen_evidence_sha256"].get(relative) == digest,
                    "An original dependency evidence file was not frozen")
        base = str(PurePosixPath(reference["receipt"]).parent) + "/"
        audit = original["axiom_audit"]
        common.strict_profile(audit, original["toolchain"], "OrbitGroupAudit.lean")
        require(audit["all_declarations_audited"] is True and audit["explicit_import_all"] is True
                and audit["project_module_count"] == len(original_modules)
                and audit["required_endpoint_count"] == len(original["required_endpoints"])
                and audit["private_arithmetic_chunks_visible"] ==
                    len(original["required_private_endpoints"]),
                "Original all-owned/private dependency audit differs")
        require(reference["audit_source_sha256"] == audit["audit_source_sha256"]
                and reference["audit_log_sha256"] == audit["log_sha256"],
                "Original dependency audit identity differs")
        read_checked(archive, prefix + base + "audit.lean", audit["audit_source_sha256"], files)
        audit_raw = read_checked(archive, prefix + base + "axiom-audit.log",
                                 audit["log_sha256"], files)
        matches = re.findall(evidence.AUDIT_PATTERN, audit_raw.decode())
        require(len(matches) == 1 and tuple(map(int, matches[0])) ==
                (len(original_modules), audit["declaration_count"], audit["theorem_count"],
                 len(original["required_endpoints"]), len(original["required_private_endpoints"])),
                "Original all-owned audit counts differ")
        check = original["kernel_replay"]
        kernel_profile(check, original["toolchain"], "Conjectures")
        require(check["exact_project_closure"] is True
                and reference["kernel_log_sha256"] == check["log_sha256"],
                "Original exact stock replay identity differs")
        kernel_raw = read_checked(archive, prefix + base + "kernel-replay.log",
                                  check["log_sha256"], files)
        actual = replay_names(kernel_raw)
        require(actual == check["replayed_modules"] == reference["original_replayed_modules"],
                "Original dependency replay log/record differs")
        checked_set(actual, original_modules, "Original dependency stock replay set")
        require(reference["original_required_endpoints"] == original["required_endpoints"]
                and reference["original_private_endpoints"] == original["required_private_endpoints"],
                "Original dependency endpoint inventory differs")
        replayed.update(actual)
        required.update(original["required_endpoints"])
        private.update(original["required_private_endpoints"])
    require(replayed == dependencies
            and private == set(inventory["private_endpoints"])
            and required == set(inventory["required_endpoints"]),
            "Original dependency evidence does not cover the exact Results closure")
    common.strict_profile(receipt["source_check"], receipt["toolchain"],
                          root.replace(".", "/") + ".lean")
    read_checked(archive, prefix + "logs/results-source.log",
                 receipt["source_check"]["log_sha256"], files)
    audit = receipt["axiom_audit"]
    common.strict_profile(audit, receipt["toolchain"], "ResultsAudit.lean")
    require(audit["all_owned_declarations_audited"] is True
            and audit["explicit_import_all"] is True and audit["owned_module"] == root
            and audit["imported_project_modules"] == len(modules)
            and audit["required_endpoint_count"] == len(profile["required_endpoints"]),
            "Results fresh owned-declaration audit differs")
    read_checked(archive, prefix + "src/ResultsAudit.lean", audit["source_sha256"], files)
    read_checked(archive, prefix + "logs/results-audit.log", audit["log_sha256"], files)
    check = receipt["kernel_replay"]
    kernel_profile(check, receipt["toolchain"], root)
    require(check["exact_singleton_selection"] is True
            and check["dependency_replays_recorded_separately"] is True
            and check["replayed_modules"] == [root], "Results fresh stock replay scope differs")
    raw = read_checked(archive, prefix + "logs/results-kernel.log", check["log_sha256"], files)
    require(replay_names(raw) == [root], "Results fresh replay log differs")


def validate_provider(artifact, payload, profile, model):
    validate_artifact_identity(artifact, profile["binding"], payload)
    archive, names = archive_of(payload, profile)
    try:
        raw, receipt, prefix = locate_receipt(archive, names, profile)
        sources = common_header(receipt, profile, model)
        files = {}
        validate_objects(archive, prefix, receipt, sources, files)
        kind = profile["kind"]
        if kind == "orbit":
            validate_orbit(archive, prefix, receipt, profile, files)
        elif kind == "graph":
            validate_graph(archive, prefix, receipt, profile, files)
        elif kind == "tail":
            validate_tail(archive, prefix, receipt, profile, model, files)
        elif kind == "results":
            validate_results(archive, prefix, receipt, profile, model, files)
        else:
            raise RuntimeError("Unknown dependency evidence profile")
        return archive, prefix, raw, receipt, files
    except BaseException:
        archive.close()
        raise


def stage_provider(stage, name, artifact, payload, profile, model, identities, frozen):
    archive, prefix, raw, receipt, files = validate_provider(artifact, payload, profile, model)
    try:
        provider = {"name": name, **profile["binding"]}
        excluded = set(profile["excluded_modules"])
        for module in receipt["project_modules"]:
            if module in excluded:
                continue
            facets = receipt["artifact_sha256"][module]
            new = common.merge_identity(identities, module, profile["source_sha256"][module],
                                        facets, provider)
            if new:
                stem = module.replace(".", "/")
                for relative, digest in {
                    "src/" + stem + ".lean": profile["source_sha256"][module],
                    **{"lib/lean/" + stem + suffix: value for suffix, value in facets.items()},
                }.items():
                    member = prefix + relative
                    require(files[member] == digest, "Staging an unvalidated source or object")
                    common.freeze_bytes(stage, relative, archive.read(member), frozen)
        base = "dependencies/" + name + "/"
        common.freeze_bytes(stage, base + "receipt.json", raw, frozen)
        kept = {base + "receipt.json": sha(raw)}
        for member, digest in files.items():
            local = member.removeprefix(prefix)
            if member.startswith(prefix) and (
                local.startswith("src/Conjectures/") or local.startswith("lib/lean/Conjectures/")):
                continue
            destination = base + "evidence/" + member
            common.freeze_bytes(stage, destination, archive.read(member), frozen)
            kept[destination] = digest
        reference = {
            **provider, "project_modules": receipt["project_modules"],
            "included_modules": [m for m in receipt["project_modules"] if m not in excluded],
            "excluded_modules": profile["excluded_modules"],
            "required_endpoints": profile["required_endpoints"],
            "preserved_evidence_sha256": kept,
            "scope": "Original strict sources, all-owned audit and stock replay retained; not freshly replayed here",
        }
        common.freeze_bytes(stage, base + "reference.json", encoded(reference), frozen)
        return reference
    finally:
        archive.close()


def assert_sources_and_helpers(model, stage=None):
    for module, digest in model["source_sha256"].items():
        require(sha((ROOT / source_path(module)).read_bytes()) == digest,
                "A theorem source changed during the gate: " + module)
        if stage is not None:
            staged = stage / "src" / (module.replace(".", "/") + ".lean")
            require(staged.is_file() and not staged.is_symlink()
                    and sha(staged.read_bytes()) == digest,
                    "A staged source changed: " + module)
    for path, digest in {**model["helper_sha256"], **model["configuration_sha256"]}.items():
        require(sha((ROOT / path).read_bytes()) == digest,
                "A configuration/helper changed during the gate: " + path)


def verify(model, modules, fresh, stage):
    import audit_lean_owned_extension as owned_audit
    require(readiness(model)["ready"], "All five bound dependency runs must pass")
    require(not stage.exists() or not any(stage.iterdir()), "Choose a fresh evidence directory")
    for path in ("src", "lib/lean", "logs", "progress", "dependencies"):
        (stage / path).mkdir(parents=True, exist_ok=True)
    compiler, external, toolchain = orbit.resolve_runtime(None)
    common.validate_toolchain(toolchain)
    own_hashes = {path: sha((ROOT / path).read_bytes()) for path in OWN_INPUTS}
    frozen, identities = {}, {}
    receipt = {
        "schema": "frankl-span-four-composed-v1", "status": "running",
        "scope": model["scope"], "root": model["root"],
        "git_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "project_modules": modules, "source_sha256": model["source_sha256"],
        "configuration_sha256": model["configuration_sha256"],
        "gate_sha256": own_hashes, "helper_sha256": model["helper_sha256"],
        "required_by_module": model["required_by_module"], "toolchain": toolchain,
        "fresh_source_modules": fresh, "fresh_replay_modules": fresh,
        "dependency_replays": [], "source_checks": {}, "kernel_checks": {},
        "axiom_whitelist": ALLOWED, "source_workers": 1, "kernel_threads": 1,
        "accepted_package_replay": False, "frozen_evidence_sha256": frozen,
    }
    def save():
        (stage / "receipt.json").write_bytes(encoded(receipt))
    try:
        for name, profile in model["providers"].items():
            binding = profile["binding"]
            artifact = evidence.api("/actions/artifacts/" + str(binding["artifact_id"]))
            require(artifact["archive_download_url"] == evidence.API + "/actions/artifacts/" +
                    str(binding["artifact_id"]) + "/zip", "Unexpected dependency download URL")
            payload = evidence.request(artifact["archive_download_url"], limit=profile["compressed_limit"])
            reference = stage_provider(stage, name, artifact, payload, profile, model, identities, frozen)
            receipt["dependency_replays"].append(reference)
            print(json.dumps({"validated_provider": name, "staged_modules": len(identities),
                              "receipt_sha256": binding["receipt_sha256"]}), flush=True)
            del payload
        dependencies = set(modules) - set(fresh)
        require(set(identities) == dependencies, "Dependency stage does not cover exact theorem closure")
        objects = orbit.artifact_hashes(stage, sorted(dependencies))
        require(objects == {m: row["identity"]["facets"] for m, row in identities.items()},
                "Reused complete object inventory differs")
        common.freeze_bytes(stage, "dependency-identities.json", encoded(identities), frozen)
        receipt["dependency_identity_sha256"] = frozen["dependency-identities.json"]
        common.assert_frozen(stage, frozen)
        environment = {
            **os.environ,
            "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
            "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
            "LEAN_SYSROOT": str(compiler),
            "LEAN_NUM_THREADS": "1",
            "UV_USE_IO_URING": "0",
        }
        for module in fresh:
            stem = module.replace(".", "/")
            common.freeze_bytes(stage, "src/" + stem + ".lean",
                                (ROOT / source_path(module)).read_bytes(), frozen)
            output = stage / "lib/lean" / (stem + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                       "-o", str(output), stem + ".lean"]
            check = orbit.profile(command, stage / "src", environment,
                stage / "logs" / (module + ".source.log"),
                stage / "progress" / (module + ".source.json"), 1800)
            receipt["source_checks"][module] = check
            save()
            common.strict_profile(check, toolchain, stem + ".lean")
            frozen["logs/" + module + ".source.log"] = check["log_sha256"]
        final_objects = orbit.artifact_hashes(stage, modules)
        require({m: row for m, row in final_objects.items() if m in dependencies} == objects,
                "A reused proof object changed during compilation")
        receipt["artifact_sha256"] = final_objects
        for module in fresh:
            stem = module.replace(".", "/")
            for suffix, digest in final_objects[module].items():
                frozen["lib/lean/" + stem + suffix] = digest
        audit_name = "FinalSpanFourAudit.lean"
        audit_raw = owned_audit.audit_source(modules, fresh, model["required_by_module"]).encode()
        common.freeze_bytes(stage, "src/" + audit_name, audit_raw, frozen)
        command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true", audit_name]
        audit = orbit.profile(command, stage / "src", environment,
            stage / "logs/final-owned-audit.log", stage / "progress/final-owned-audit.json", 1800)
        receipt["axiom_audit"] = audit
        save()
        common.strict_profile(audit, toolchain, audit_name)
        log_text = Path(audit["log"]).read_text()
        details = owned_audit.validate_log(log_text, modules, fresh, model["required_by_module"])
        audit.update({"source_sha256": sha(audit_raw), "all_owned_declarations_audited": True,
                      "owned_modules": fresh, "imported_project_modules": modules,
                      "explicit_import_all_owned_roots": True, "inventory": details})
        frozen["logs/final-owned-audit.log"] = audit["log_sha256"]
        common.assert_frozen(stage, frozen)
        replayed = []
        for module in fresh:
            selected = common.exact_selector(modules, module)
            command = [str(compiler / "bin/leanchecker"), "-v", module]
            if buffer := shutil.which("stdbuf"):
                command = [buffer, "-oL", "-eL", *command]
            check = orbit.profile(command, stage / "src", environment,
                stage / "logs" / (module + ".kernel.log"),
                stage / "progress" / (module + ".kernel.json"), 1800)
            receipt["kernel_checks"][module] = check
            save()
            kernel_profile(check, toolchain, module)
            require(replay_names(Path(check["log"]).read_bytes()) == selected,
                    "Fresh stock replay did not target exactly its module")
            check.update({"replayed_modules": selected, "exact_singleton_target": True})
            frozen["logs/" + module + ".kernel.log"] = check["log_sha256"]
            replayed.extend(selected)
        require(replayed == fresh, "Fresh replay order/set differs")
        receipt["kernel_replay"] = {
            "replayed_modules": replayed, "exact_singleton_selection": True,
            "fresh_process_per_module": True, "dependency_replays_recorded_separately": True,
            "seconds": round(sum(c["seconds"] for c in receipt["kernel_checks"].values()), 3),
            "peak_rss_kib": max(c["peak_rss_kib"] for c in receipt["kernel_checks"].values()),
        }
        require(final_objects == orbit.artifact_hashes(stage, modules),
                "A proof object changed during final audit/replay")
        assert_sources_and_helpers(model, stage)
        require(own_hashes == {p: sha((ROOT / p).read_bytes()) for p in OWN_INPUTS},
                "The final controller/model/workflow changed")
        require(sha((compiler / "bin/lean").read_bytes()) == evidence.LEAN_SHA256
                and sha((compiler / "bin/leanchecker").read_bytes()) == evidence.CHECKER_SHA256,
                "Compiler or stock checker changed")
        common.assert_frozen(stage, frozen)
        receipt.update({
            "status": "passed", "all_frozen_hashes_unchanged": True,
            "complete_initial_graph_checked": True,
            "complete_period_7_to_10_transport_checked": True,
            "complete_residual_tail_checked": True,
            "unconditional_span_four_theorem_checked": True,
        })
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({"status": "passed", "root": model["root"],
        "imported_modules": len(modules), "fresh_modules": fresh,
        "required_endpoints": sum(map(len, model["required_by_module"].values())),
        "receipt_sha256": sha((stage / "receipt.json").read_bytes())}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--plan-output", type=Path)
    parser.add_argument("--readiness", action="store_true")
    parser.add_argument("--artifact-dir", type=Path,
        default=ROOT / ".candidate-artifacts/frankl-span-four-final")
    args = parser.parse_args()
    model = json.loads((ROOT / MODEL_PATH).read_text())
    if args.readiness:
        result = readiness(model)
        print(json.dumps(result, sort_keys=True))
        if output := os.environ.get("GITHUB_OUTPUT"):
            with open(output, "a") as handle:
                handle.write("ready=" + str(result["ready"]).lower() + "\n")
        return
    modules, fresh = preflight(model)
    if args.plan:
        result = {
            "schema": "frankl-span-four-composed-plan-v1", "root": model["root"],
            "scope": model["scope"], "project_module_count": len(modules),
            "fresh_modules": fresh, "required_by_module": model["required_by_module"],
            "providers": {name: {
                "root": profile["root"], "module_count": len(profile["source_sha256"]),
                "excluded_modules": profile["excluded_modules"],
                "binding_frozen": binding_complete(profile.get("binding")),
            } for name, profile in model["providers"].items()},
            "source_sha256": model["source_sha256"], "accepted_package_replay": False,
        }
        if args.plan_output:
            args.plan_output.parent.mkdir(parents=True, exist_ok=True)
            args.plan_output.write_bytes(encoded(result))
        print(json.dumps(result, indent=2, sort_keys=True))
    else:
        verify(model, modules, fresh, args.artifact_dir.resolve())


if __name__ == "__main__":
    main()
