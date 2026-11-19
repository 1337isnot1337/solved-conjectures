#!/usr/bin/env python3
"""Compose exact passed transport objects and freshly verify the Results root.

Dependencies retain their original strict-source, all-owned axiom, and exact
stock-kernel receipts. Reused objects are validated before staging; overlapping
modules must have identical sources and complete facet hashes. Only Results is
newly compiled, audited and replayed. This is not an accepted-package replay.
"""

from __future__ import annotations

import argparse
from contextlib import contextmanager
import importlib.util
import io
import json
import os
from pathlib import Path, PurePosixPath
import re
import shutil
import stat
import subprocess
import zipfile

import preserve_frankl_transport_receipts as evidence

ROOT = Path(__file__).resolve().parents[1]
RESULTS_ROOT = "Conjectures.FranklSmallCyclicTransportResults"
RESULTS_SHA256 = "06e816de01b4d9db57a3c12562a213dc9d756906641002800684cd07a7512b4f"
COVERAGE_ROOT = "Conjectures.FranklSmallCyclicTransportCoverage"
COVERAGE_RUN = 44514908813
COVERAGE_HEAD = "f24465a8513c7506f5b4526673dba722c05b90b6"
COVERAGE_ARTIFACT = 14524744595
COVERAGE_DIGEST = "6a8b4249436590ba23ad5c6ffefda1e3fb09f361ac0c3819211e88e537b11063"
COVERAGE_GATE_SHA256 = "9316b53ffe142930dbcf06c9eea0d7eb8a33daf151a7cc03dce9baab19328500"
EVIDENCE_SHA256 = "2509cf8ff29420abeedb5df247f31529938387eb272a788349fb36056cb05ef7"
RESULTS_NAMESPACE = "FranklSmallCyclic.TransportBatches"
RESULTS_REQUIRED = [
    RESULTS_NAMESPACE + f".period{period}" + suffix
    for period in (7, 8, 9, 10)
    for suffix in ("_chunk_checks", "_chunks_checked", "_checked", "_checked_entry_for_index")
]
OWN_INPUTS = (
    "scripts/verify_frankl_transport_results.py",
    "scripts/test_frankl_transport_results.py",
    ".github/workflows/lean-frankl-transport-results.yml",
    "scripts/preserve_frankl_transport_receipts.py",
    "scripts/test_frankl_transport_receipts.py",
)
SCOPE = (
    "Four transported 9088-entry lists are integrated using exact validated "
    "dependency objects. Dependencies keep their original strict-source, all-owned "
    "axiom and exact stock-kernel evidence. Results is freshly compiled and its "
    "owned declarations audited and stock-replayed. Canonical graph coverage and "
    "the final span-four theorem remain separate. This is not an accepted-package replay."
)
sha = evidence.sha
require = evidence.require
encoded = evidence.encoded


def source_path(module):
    return "lean/" + module.replace(".", "/") + ".lean"


def strict_profile(check, toolchain, target):
    command = check["command"]
    require(check["exit_code"] == 0 and check["timed_out"] is False,
            "A required strict process did not finish successfully")
    require(command[0] == toolchain["lean_path"] and command[1:4] ==
            ["-j1", "-M4500", "-DwarningAsError=true"] and command[-1] == target,
            "Strict source/audit command differs from the frozen profile")


def validate_toolchain(toolchain):
    require(toolchain["lean_sha256"] == evidence.LEAN_SHA256
            and toolchain["checker_sha256"] == evidence.CHECKER_SHA256
            and toolchain["lean_version"] == evidence.LEAN_VERSION,
            "Compiler or stock checker identity differs")


@contextmanager
def model_context():
    require(sha((ROOT / OWN_INPUTS[3]).read_bytes()) == EVIDENCE_SHA256,
            "The reviewed dependency-evidence validator changed")
    with evidence.frozen_gate() as (gate, manifest, snapshot):
        model = evidence.expected_model(gate, manifest, snapshot)
        path = ROOT / "scripts/verify_frankl_transport_coverage.py"
        require(sha(path.read_bytes()) == COVERAGE_GATE_SHA256,
                "The reviewed exact row-coverage gate changed")
        spec = importlib.util.spec_from_file_location("frozen_results_coverage", path)
        coverage = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(coverage)
        group, modules, required, private = coverage.coverage_spec(manifest)
        source_hashes = {m: sha((snapshot / source_path(m)).read_bytes()) for m in modules}
        for module, digest in source_hashes.items():
            require(sha(evidence.git_bytes(COVERAGE_HEAD, source_path(module)) or b"") == digest,
                    "Coverage and transport snapshots disagree about a source")
        coverage_model = {
            "group": group, "modules": modules, "required": required, "private": private,
            "source_sha256": source_hashes,
            "gate_sha256": {
                p: sha(evidence.git_bytes(COVERAGE_HEAD, p) or b"") for p in coverage.GATE_INPUTS
            },
            "audit_source": coverage.audit_source(modules, required, private).encode(),
        }
        all_modules = gate.arithmetic.dependency_order([RESULTS_ROOT])
        dependencies = set(modules)
        for item in model["groups"].values():
            dependencies.update(item["modules"])
        require(set(all_modules) == dependencies | {RESULTS_ROOT}
                and RESULTS_ROOT not in dependencies and len(all_modules) == 903,
                "The exact integration import closure changed")
        declared = manifest["separate_integration_gate"]
        require(declared["root"] == RESULTS_ROOT
                and set(declared["required_endpoints"]) == set(RESULTS_REQUIRED)
                and len(declared["required_endpoints"]) == len(RESULTS_REQUIRED),
                "An integration endpoint is omitted or duplicated")
        all_sources = {m: sha((snapshot / source_path(m)).read_bytes()) for m in all_modules}
        require(all_sources[RESULTS_ROOT] == RESULTS_SHA256, "The frozen Results source changed")
        for module, digest in all_sources.items():
            require(sha((ROOT / source_path(module)).read_bytes()) == digest,
                    "Current source differs from the immutable packet: " + module)
        gate_hashes = dict(model["gate_sha256"])
        for path, digest in coverage_model["gate_sha256"].items():
            require(gate_hashes.setdefault(path, digest) == digest,
                    "Coverage and transport configurations disagree")
        for path, digest in gate_hashes.items():
            require(sha((ROOT / path).read_bytes()) == digest,
                    "Current frozen configuration differs: " + path)
        private = gate.private_nodes(all_modules)
        required_union = set(RESULTS_REQUIRED) | set(required)
        dependency_private = set()
        for item in model["groups"].values():
            required_union.update(item["required"])
            dependency_private.update(item["private"])
        require(set(private) == dependency_private and len(private) == 41866,
                "The complete private arithmetic/transport inventory changed")
        yield {
            "gate": gate, "manifest": manifest, "snapshot": snapshot,
            "groups": model, "coverage": coverage, "coverage_model": coverage_model,
            "modules": all_modules, "sources": all_sources, "gate_hashes": gate_hashes,
            "required": sorted(required_union), "private": private,
        }


def check_run_identities(fetch=evidence.api):
    transport = fetch("/actions/runs/" + str(evidence.SOURCE_RUN_ID))
    require(transport["id"] == evidence.SOURCE_RUN_ID
            and transport["head_sha"] == evidence.WORKFLOW_HEAD
            and transport["name"] == evidence.SOURCE_WORKFLOW
            and transport["head_branch"] == "main"
            and transport["head_repository"]["full_name"] == evidence.REPO,
            "The frozen transport run identity differs")
    coverage = fetch("/actions/runs/" + str(COVERAGE_RUN))
    require(coverage["id"] == COVERAGE_RUN and coverage["head_sha"] == COVERAGE_HEAD
            and coverage["head_branch"] == "main"
            and coverage["head_repository"]["full_name"] == evidence.REPO,
            "The frozen coverage run identity differs")
    require(coverage["status"] == "completed" and coverage["conclusion"] == "success",
            "The exact row-coverage job has not passed")
    if transport["status"] != "completed":
        return False, transport
    require(transport["conclusion"] == "success", "The complete transport run did not pass")
    return True, transport


def safe_archive(payload, limit=2 * 1024 * 1024 * 1024):
    archive = zipfile.ZipFile(io.BytesIO(payload))
    infos = archive.infolist()
    names = [item.filename for item in infos]
    require(len(infos) <= 20000 and len(names) == len(set(names)),
            "Too many or duplicate archive members")
    require(sum(item.file_size for item in infos) <= limit,
            "Uncompressed evidence exceeds the reviewed bound")
    for item in infos:
        path = PurePosixPath(item.filename)
        require(not path.is_absolute() and ".." not in path.parts
                and "\\" not in item.filename and path.as_posix() == item.filename.rstrip("/")
                and str(path) != "." and not stat.S_ISLNK(item.external_attr >> 16),
                "Unsafe evidence archive member")
        require(item.compress_type in (zipfile.ZIP_STORED, zipfile.ZIP_DEFLATED),
                "Unsupported evidence compression")
    return archive, names


def receipt_member(names):
    matches = [name for name in names if PurePosixPath(name).name == "receipt.json"]
    require(len(matches) == 1, "Expected exactly one original receipt")
    path = matches[0]
    parent = str(PurePosixPath(path).parent)
    return path, "" if parent == "." else parent + "/"


def validate_coverage(artifact, payload, expected, coverage_gate):
    require(artifact["id"] == COVERAGE_ARTIFACT
            and artifact["name"] == "frankl-transport-row-coverage"
            and artifact["workflow_run"]["id"] == COVERAGE_RUN
            and artifact["workflow_run"]["head_sha"] == COVERAGE_HEAD
            and artifact["expired"] is False
            and artifact["digest"] == "sha256:" + COVERAGE_DIGEST
            and sha(payload) == COVERAGE_DIGEST,
            "The immutable row-coverage artifact differs")
    archive, names = safe_archive(payload)
    path, prefix = receipt_member(names)
    raw = archive.read(path)
    receipt = json.loads(raw)
    require(receipt["status"] == "passed" and receipt["all_frozen_hashes_unchanged"] is True
            and receipt["git_commit"] == COVERAGE_HEAD
            and receipt["coverage_manifest_sha256"] == evidence.MANIFEST_SHA256,
            "Coverage receipt identity or passed state differs")
    require(receipt["group"] == expected["group"]
            and receipt["project_modules"] == expected["modules"]
            and receipt["required_endpoints"] == expected["required"]
            and receipt["required_private_endpoints"] == expected["private"]
            and receipt["source_sha256"] == expected["source_sha256"]
            and receipt["gate_sha256"] == expected["gate_sha256"],
            "Coverage source/configuration/endpoint inventories differ")
    require(receipt["axiom_whitelist"] == ["propext", "Classical.choice", "Quot.sound"]
            and receipt["source_workers"] == 4 and receipt["kernel_threads"] == 4,
            "Coverage checking profile differs")
    require(receipt["row_coverage_checked"] is True
            and receipt["all_owned_private_declarations_audited"] is True
            and receipt["numeric_proof_modules_imported"] is False
            and receipt["numeric_weight_validity_checked"] is False
            and receipt["numeric_integration_checked"] is False
            and receipt["canonical_graph_coverage_checked"] is False
            and receipt["period_chunks"] == coverage_gate.PERIOD_CHUNKS,
            "Coverage receipt scope differs")
    validate_toolchain(receipt["toolchain"])
    require(set(receipt["source_checks"]) == set(expected["modules"])
            and set(receipt["artifact_sha256"]) == set(expected["modules"]),
            "Coverage source/object inventory is incomplete")
    for module in expected["modules"]:
        strict_profile(receipt["source_checks"][module], receipt["toolchain"],
                       module.replace(".", "/") + ".lean")
        source = archive.read(prefix + "src/" + module.replace(".", "/") + ".lean")
        require(sha(source) == expected["source_sha256"][module],
                "Archived coverage source differs: " + module)
        facets = receipt["artifact_sha256"][module]
        require(evidence.REQUIRED_FACETS <= set(facets) <= evidence.ALLOWED_FACETS,
                "Coverage modern object facets are incomplete")
        for suffix, digest in facets.items():
            require(sha(archive.read(prefix + "lib/lean/" +
                                    module.replace(".", "/") + suffix)) == digest,
                    "Archived coverage object differs: " + module + suffix)
        log = archive.read(prefix + "logs/" + module + ".source.log")
        require(sha(log) == receipt["source_checks"][module]["log_sha256"],
                "Archived coverage source log differs")
    audit = receipt["axiom_audit"]
    strict_profile(audit, receipt["toolchain"], "OrbitGroupAudit.lean")
    audit_source = archive.read(prefix + "src/OrbitGroupAudit.lean")
    audit_log = archive.read(prefix + "logs/axiom-audit.log")
    require(audit_source == expected["audit_source"]
            and sha(audit_source) == audit["audit_source_sha256"]
            and sha(audit_log) == audit["log_sha256"]
            and audit["explicit_import_all"] is True and audit["all_declarations_audited"] is True
            and audit["project_module_count"] == len(expected["modules"])
            and audit["required_endpoint_count"] == len(expected["required"])
            and audit["private_arithmetic_chunks_visible"] == 0,
            "Coverage all-owned audit evidence differs")
    matches = re.findall(evidence.AUDIT_PATTERN, audit_log.decode())
    require(len(matches) == 1 and tuple(map(int, matches[0])) == (
        len(expected["modules"]), audit["declaration_count"], audit["theorem_count"],
        len(expected["required"]), 0), "Coverage audit counts differ")
    private_rows = re.findall(
        r"COVERAGE-PRIVATE (\S+) USER (\S+) THEOREM (true|false)(?:\r?\n|$)", audit_log.decode())
    require(audit_log.decode().count("COVERAGE-PRIVATE ") == len(private_rows)
            and len({row[0] for row in private_rows}) == len(private_rows),
            "Coverage private declaration log is malformed")
    parsed_private = [{"name": name, "user_name": user, "is_theorem": theorem == "true"}
                      for name, user, theorem in sorted(private_rows)]
    require(receipt["owned_private_declarations"] == parsed_private,
            "Coverage all-private inventory differs")
    replay = receipt["kernel_replay"]
    command = replay["command"]
    require(replay["exit_code"] == 0 and replay["timed_out"] is False
            and replay["exact_project_closure"] is True
            and (command == [receipt["toolchain"]["checker_path"], "-v", "Conjectures"]
                 or command == ["/usr/bin/stdbuf", "-oL", "-eL",
                                receipt["toolchain"]["checker_path"], "-v", "Conjectures"]),
            "Coverage stock replay command or status differs")
    kernel_log = archive.read(prefix + "logs/kernel-replay.log")
    require(sha(kernel_log) == replay["log_sha256"], "Coverage kernel log hash differs")
    replayed = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$", kernel_log.decode(), re.M)
    require(replayed == replay["replayed_modules"]
            and len(replayed) == len(set(replayed))
            and sorted(replayed) == sorted(expected["modules"]),
            "Coverage exact stock replay set differs")
    return {"raw": raw, "receipt": receipt, "audit_source": audit_source,
            "audit_log": audit_log, "kernel_log": kernel_log,
            "archive_sha256": sha(payload), "group": "complete-row-coverage"}


def merge_identity(identities, module, source_digest, facets, provider):
    require(evidence.REQUIRED_FACETS <= set(facets) <= evidence.ALLOWED_FACETS,
            "Missing or unknown object facet")
    current = {"source_sha256": source_digest, "facets": dict(sorted(facets.items()))}
    if module in identities:
        require(identities[module]["identity"] == current,
                "Overlapping verified artifacts disagree: " + module)
        identities[module]["providers"].append(provider)
        return False
    identities[module] = {"identity": current, "providers": [provider]}
    return True


def freeze_bytes(stage, relative, raw, frozen):
    path = PurePosixPath(relative)
    require(not path.is_absolute() and ".." not in path.parts and "\\" not in relative
            and path.as_posix() == relative and str(path) != ".",
            "Unsafe path for frozen evidence")
    digest = sha(raw)
    require(frozen.setdefault(relative, digest) == digest,
            "A frozen evidence path was offered different bytes")
    target = stage / relative
    require(not target.is_symlink(), "Frozen evidence cannot be a symlink")
    if target.exists():
        require(target.read_bytes() == raw, "A frozen evidence path already differs")
    else:
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(raw)
    require(sha(target.read_bytes()) == digest, "Evidence changed while it was written")


def assert_frozen(stage, frozen):
    for relative, digest in frozen.items():
        path = stage / relative
        require(path.is_file() and not path.is_symlink()
                and sha(path.read_bytes()) == digest,
                "Frozen evidence changed: " + relative)


def stage_checked(stage, artifact, payload, checked, identities, allowed):
    archive, names = safe_archive(payload)
    _path, prefix = receipt_member(names)
    receipt = checked["receipt"]
    provider = {"artifact_id": artifact["id"], "group": checked["group"],
                "receipt_sha256": sha(checked["raw"])}
    for module in receipt["project_modules"]:
        require(module in allowed, "An unrelated module was offered for integration")
        facets = receipt["artifact_sha256"][module]
        fresh = merge_identity(identities, module, receipt["source_sha256"][module],
                               facets, provider)
        if fresh:
            source = stage / "src" / (module.replace(".", "/") + ".lean")
            source.parent.mkdir(parents=True, exist_ok=True)
            raw = archive.read(prefix + "src/" + module.replace(".", "/") + ".lean")
            require(sha(raw) == receipt["source_sha256"][module], "Source changed during staging")
            source.write_bytes(raw)
            for suffix, digest in facets.items():
                raw = archive.read(prefix + "lib/lean/" + module.replace(".", "/") + suffix)
                require(sha(raw) == digest, "Object changed during staging")
                target = stage / "lib/lean" / (module.replace(".", "/") + suffix)
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes(raw)
    destination = stage / "dependencies" / str(artifact["id"])
    destination.mkdir(parents=True)
    frozen = {}
    for filename, field in (("receipt.json", "raw"), ("audit.lean", "audit_source"),
                            ("axiom-audit.log", "audit_log"), ("kernel-replay.log", "kernel_log")):
        freeze_bytes(stage, str((destination / filename).relative_to(stage)), checked[field], frozen)
    reference = {
        **provider, "run_id": artifact["workflow_run"]["id"],
        "artifact_name": artifact["name"], "archive_sha256": checked["archive_sha256"],
        "receipt": str((destination / "receipt.json").relative_to(stage)),
        "audit_source_sha256": sha(checked["audit_source"]),
        "audit_log_sha256": sha(checked["audit_log"]),
        "kernel_log_sha256": sha(checked["kernel_log"]),
        "original_replayed_modules": receipt["kernel_replay"]["replayed_modules"],
        "original_required_endpoints": receipt["required_endpoints"],
        "original_private_endpoints": receipt["required_private_endpoints"],
        "original_source_commit": receipt["git_commit"],
    }
    freeze_bytes(stage, str((destination / "evidence.json").relative_to(stage)), encoded(reference), frozen)
    reference["preserved_files_sha256"] = frozen
    return reference


def validate_group_metadata(artifact):
    require(type(artifact["id"]) is int and artifact["id"] > 0, "Invalid artifact identifier")
    require(artifact["workflow_run"]["id"] == evidence.SOURCE_RUN_ID
            and artifact["workflow_run"]["head_sha"] == evidence.WORKFLOW_HEAD
            and artifact["archive_download_url"] ==
            evidence.API + "/actions/artifacts/" + str(artifact["id"]) + "/zip",
            "A transport artifact belongs to the wrong run or URL")


def import_audit(modules):
    names = lambda values: ",\n    ".join(chr(96) + value for value in values)
    return ("module\n" + "".join("import all " + module + "\n" for module in modules) +
            "import Lean.Util.CollectAxioms\nimport Lean.PrivateName\n\n"
            "set_option maxRecDepth 100000\nset_option maxHeartbeats 0\n\n" +
            "open Lean Elab Command in\nrun_cmd do\n"
            "  let modules : Array String := #[" +
            ", ".join(json.dumps(m) for m in modules) + "]\n"
            "  let required : Array Name := #[" + names(RESULTS_REQUIRED) + "]\n" +
            r'''  let ownedModule := "Conjectures.FranklSmallCyclicTransportResults"
  let allowed : Array Name := #[@BT@propext, @BT@Classical.choice, @BT@Quot.sound]
  let env ← getEnv
  let imported := env.header.modules.filter fun m => m.module.toString.startsWith "Conjectures."
  unless imported.size == modules.size do
    throwError "Integration project import closure count mismatch"
  for m in imported do
    unless modules.contains m.module.toString do
      throwError "Unexpected project import: {m.module}"
  for name in required do
    let info ← getConstInfo name
    unless info.isTheorem do
      throwError "Required integration endpoint is not a theorem: {name}"
    let owner := env.getModuleIdxFor? name |>.bind (env.header.modules[·]?)
    unless owner.any (fun m => m.module.toString == ownedModule) do
      throwError "Integration endpoint is owned by another module: {name}"
  let mut declarations : Nat := 0
  let mut theorems : Nat := 0
  let mut privateCount : Nat := 0
  for (name, info) in env.constants.toList do
    let owned := match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
      | some m => m.module.toString == ownedModule
      | none => false
    if owned then
      declarations := declarations + 1
      if info.isTheorem then
        theorems := theorems + 1
      if let some userName := privateToUserName? name then
        privateCount := privateCount + 1
        logInfo m!"RESULTS-PRIVATE {name} USER {userName} THEOREM {info.isTheorem}"
      if let .axiomInfo _ := info then
        throwError "Unapproved integration axiom: {name}"
      for axiomName in ← collectAxioms name do
        unless allowed.contains axiomName do
          throwError "Unapproved axiom {axiomName} in {name}"
  logInfo m!"PASS RESULTS: {modules.size} imported project modules; {declarations} owned declarations; {theorems} owned theorems; {required.size} required endpoints; {privateCount} private declarations"
''').replace("@BT@", chr(96))


def exact_selector(modules, target):
    selected = [module for module in modules
                if module == target or module.startswith(target + ".")]
    require(selected == [target], "Stock Name-prefix selection is not a singleton")
    return selected


def plan(model):
    exact_selector(model["modules"], RESULTS_ROOT)
    return {
        "schema": "frankl-transport-results-plan-v1", "scope": SCOPE,
        "root": RESULTS_ROOT, "project_modules": model["modules"],
        "project_module_count": len(model["modules"]),
        "source_sha256": model["sources"], "required_endpoints": RESULTS_REQUIRED,
        "dependency_required_endpoint_count": len(set(model["required"]) - set(RESULTS_REQUIRED)),
        "dependency_private_count": len(model["private"]),
        "dependency_inventory_sha256": sha(encoded({
            "required_endpoints": model["required"], "private_endpoints": model["private"]})),
        "coverage_run": COVERAGE_RUN, "coverage_artifact": COVERAGE_ARTIFACT,
        "transport_run": evidence.SOURCE_RUN_ID, "transport_groups": 103,
        "fresh_source_modules": [RESULTS_ROOT], "fresh_replay_modules": [RESULTS_ROOT],
        "accepted_package_replay": False,
    }


def runtime(arithmetic):
    previous = arithmetic.LEAN
    try:
        arithmetic.LEAN = ROOT / "lean"
        directory, external, toolchain = arithmetic.resolve_runtime(None)
    finally:
        arithmetic.LEAN = previous
    validate_toolchain(toolchain)
    return directory, external, toolchain


def verify(model, stage):
    ready, _ = check_run_identities()
    require(ready, "All frozen transport groups must pass before integration")
    require(not stage.exists() or not any(stage.iterdir()), "Choose a fresh evidence directory")
    for path in ("src", "lib/lean", "logs", "progress", "dependencies"):
        (stage / path).mkdir(parents=True, exist_ok=True)
    arithmetic = model["gate"].arithmetic
    compiler, external, toolchain = runtime(arithmetic)
    own_hashes = {path: sha((ROOT / path).read_bytes()) for path in OWN_INPUTS}
    receipt = {
        "schema": "frankl-transport-results-composed-v1", "status": "running", "scope": SCOPE,
        "git_commit": subprocess.check_output(
            ["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "root": RESULTS_ROOT, "project_modules": model["modules"],
        "source_sha256": model["sources"], "gate_sha256": own_hashes,
        "original_gate_sha256": model["gate_hashes"],
        "required_endpoints": RESULTS_REQUIRED, "toolchain": toolchain,
        "manifest_sha256": evidence.MANIFEST_SHA256, "dependency_replays": [],
        "frozen_evidence_sha256": {},
        "fresh_source_modules": [RESULTS_ROOT], "fresh_replay_modules": [RESULTS_ROOT],
        "axiom_whitelist": ["propext", "Classical.choice", "Quot.sound"],
        "source_workers": 1, "kernel_threads": 1,
        "canonical_graph_coverage_checked": False, "accepted_package_replay": False,
    }

    def save():
        (stage / "receipt.json").write_bytes(encoded(receipt))

    try:
        allowed = set(model["modules"]) - {RESULTS_ROOT}
        identities = {}
        artifact = evidence.api("/actions/artifacts/" + str(COVERAGE_ARTIFACT))
        require(artifact["archive_download_url"] ==
                evidence.API + "/actions/artifacts/" + str(COVERAGE_ARTIFACT) + "/zip",
                "Coverage artifact URL differs")
        payload = evidence.request(artifact["archive_download_url"], limit=256 * 1024 * 1024)
        checked = validate_coverage(artifact, payload, model["coverage_model"], model["coverage"])
        receipt["dependency_replays"].append(
            stage_checked(stage, artifact, payload, checked, identities, allowed))
        print(json.dumps({"staged": "complete-row-coverage", "modules": len(identities),
                          "receipt_sha256": sha(checked["raw"])}), flush=True)
        del payload, checked
        by_name = {}
        for artifact in evidence.list_artifacts():
            if re.fullmatch(r"frankl-transport-g\d{3}", artifact["name"]):
                validate_group_metadata(artifact)
                if not artifact["expired"]:
                    by_name.setdefault(artifact["name"].removeprefix("frankl-transport-"), []).append(artifact)
        require(set(by_name) == set(model["groups"]["groups"]),
                "The completed run lacks an exact unexpired artifact group partition")
        for name in sorted(model["groups"]["groups"]):
            selected = None
            for artifact in sorted(by_name[name], key=lambda item: item["id"]):
                payload = evidence.request(artifact["archive_download_url"])
                checked = evidence.validate_artifact(artifact, payload, model["groups"])
                if checked is None:
                    continue
                selected = stage_checked(stage, artifact, payload, checked, identities, allowed)
                break
            require(selected is not None, "No passed exact artifact for " + name)
            receipt["dependency_replays"].append(selected)
            print(json.dumps({"staged": name, "modules": len(identities),
                              "receipt_sha256": selected["receipt_sha256"]}), flush=True)
            del payload, checked
        require(set(identities) == allowed, "Reused objects do not cover the exact dependency closure")
        require(set().union(*(set(item["original_replayed_modules"])
                              for item in receipt["dependency_replays"])) == allowed,
                "Original stock replay sets do not cover the exact dependency closure")
        require(set().union(*(set(item["original_private_endpoints"])
                              for item in receipt["dependency_replays"])) == set(model["private"]),
                "Dependency private proof audits do not cover the complete inventory")
        for module, item in identities.items():
            require(item["identity"]["source_sha256"] == model["sources"][module],
                    "A staged dependency differs from the frozen source")
        objects = arithmetic.artifact_hashes(stage, sorted(allowed))
        require(objects == {module: item["identity"]["facets"] for module, item in identities.items()},
                "Staged complete object-facet inventory differs")
        frozen = receipt["frozen_evidence_sha256"]
        for reference in receipt["dependency_replays"]:
            for relative, digest in reference["preserved_files_sha256"].items():
                require(frozen.setdefault(relative, digest) == digest,
                        "Conflicting dependency evidence identity")
        assert_frozen(stage, frozen)
        freeze_bytes(stage, "dependency-inventory.json", encoded({
            "modules": identities, "required_endpoints": model["required"],
            "private_endpoints": model["private"]}), frozen)
        receipt["dependency_inventory_sha256"] = frozen["dependency-inventory.json"]
        receipt["validated_dependency_modules"] = len(allowed)
        receipt["validated_dependency_private_proofs"] = len(model["private"])
        source = stage / "src" / (RESULTS_ROOT.replace(".", "/") + ".lean")
        source.write_bytes((model["snapshot"] / source_path(RESULTS_ROOT)).read_bytes())
        environment = {**os.environ, "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
                       "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
                       "LEAN_NUM_THREADS": "1"}
        output = stage / "lib/lean" / (RESULTS_ROOT.replace(".", "/") + ".olean")
        command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                   "-o", str(output), RESULTS_ROOT.replace(".", "/") + ".lean"]
        result = arithmetic.profile(command, stage / "src", environment,
                                    stage / "logs/results-source.log", stage / "progress/results-source.json", 1800)
        receipt["source_check"] = result
        strict_profile(result, toolchain, RESULTS_ROOT.replace(".", "/") + ".lean")
        frozen["logs/results-source.log"] = result["log_sha256"]
        assert_frozen(stage, frozen)
        final_objects = arithmetic.artifact_hashes(stage, model["modules"])
        require({m: f for m, f in final_objects.items() if m != RESULTS_ROOT} == objects,
                "A reused object changed during Results compilation")
        receipt["artifact_sha256"] = final_objects
        save()
        audit_source = stage / "src/ResultsAudit.lean"
        audit_raw = import_audit(model["modules"]).encode()
        freeze_bytes(stage, "src/ResultsAudit.lean", audit_raw, frozen)
        audit_digest = sha(audit_raw)
        command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true", audit_source.name]
        result = arithmetic.profile(command, stage / "src", environment,
                                    stage / "logs/results-audit.log", stage / "progress/results-audit.json", 1800)
        receipt["axiom_audit"] = result
        strict_profile(result, toolchain, audit_source.name)
        frozen["logs/results-audit.log"] = result["log_sha256"]
        assert_frozen(stage, frozen)
        audit_text = Path(result["log"]).read_text(encoding="utf-8")
        matches = re.findall(
            r"PASS RESULTS: (\d+) imported project modules; (\d+) owned declarations; "
            r"(\d+) owned theorems; (\d+) required endpoints; (\d+) private declarations", audit_text)
        require(len(matches) == 1, "Missing unique all-owned Results audit")
        counts = list(map(int, matches[0]))
        require(counts[0] == len(model["modules"]) and counts[1] >= counts[2] >= 16
                and counts[3] == len(RESULTS_REQUIRED), "Results audit counts differ")
        private_rows = re.findall(
            r"RESULTS-PRIVATE (\S+) USER (\S+) THEOREM (true|false)(?:\r?\n|$)", audit_text)
        require(audit_text.count("RESULTS-PRIVATE ") == len(private_rows) == counts[4]
                and len({row[0] for row in private_rows}) == len(private_rows),
                "Malformed Results private declaration inventory")
        result.update({
            "imported_project_modules": counts[0], "owned_declarations": counts[1],
            "owned_theorems": counts[2], "required_endpoint_count": counts[3],
            "owned_private_declarations": private_rows, "all_owned_declarations_audited": True,
            "owned_module": RESULTS_ROOT, "explicit_import_all": True,
            "source_sha256": audit_digest,
        })
        selected = exact_selector(model["modules"], RESULTS_ROOT)
        command = [str(compiler / "bin/leanchecker"), "-v", RESULTS_ROOT]
        if buffer := shutil.which("stdbuf"):
            command = [buffer, "-oL", "-eL", *command]
        result = arithmetic.profile(command, stage / "src", environment,
                                    stage / "logs/results-kernel.log", stage / "progress/results-kernel.json", 1800)
        receipt["kernel_replay"] = result
        require(result["exit_code"] == 0 and result["timed_out"] is False,
                "Stock singleton Results replay failed")
        replayed = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$",
                              Path(result["log"]).read_text(), re.M)
        require(replayed == selected, "Results replay target set differs")
        frozen["logs/results-kernel.log"] = result["log_sha256"]
        assert_frozen(stage, frozen)
        result.update({"replayed_modules": replayed, "exact_singleton_selection": True,
                       "dependency_replays_recorded_separately": True})
        require(final_objects == arithmetic.artifact_hashes(stage, model["modules"]),
                "A materialized object changed during verification")
        for module, digest in model["sources"].items():
            require(sha((ROOT / source_path(module)).read_bytes()) == digest
                    and sha((stage / "src" / (module.replace(".", "/") + ".lean")).read_bytes()) == digest,
                    "A source changed during verification")
        for path, digest in {**model["gate_hashes"], **own_hashes}.items():
            require(sha((ROOT / path).read_bytes()) == digest, "A gate input changed")
        require(sha((compiler / "bin/lean").read_bytes()) == evidence.LEAN_SHA256
                and sha((compiler / "bin/leanchecker").read_bytes()) == evidence.CHECKER_SHA256,
                "Compiler/checker changed during verification")
        assert_frozen(stage, frozen)
        receipt["status"] = "passed"
        receipt["all_frozen_hashes_unchanged"] = True
        receipt["all_period_entries_checked"] = True
        receipt["row_coverage_checked"] = True
    except BaseException as error:
        receipt["status"] = "failed"
        receipt["error"] = str(error)
        raise
    finally:
        save()
    print(json.dumps({"status": "passed", "root": RESULTS_ROOT,
                      "modules": len(model["modules"]), "new_endpoints": len(RESULTS_REQUIRED),
                      "dependency_private_proofs": len(model["private"]),
                      "receipt_sha256": sha((stage / "receipt.json").read_bytes())}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--plan-output", type=Path)
    parser.add_argument("--readiness", action="store_true")
    parser.add_argument("--artifact-dir", type=Path,
                        default=ROOT / ".candidate-artifacts/frankl-transport-results")
    args = parser.parse_args()
    if args.readiness:
        ready, run = check_run_identities()
        print(json.dumps({"ready": ready, "source_run_id": evidence.SOURCE_RUN_ID,
                          "source_status": run["status"], "source_conclusion": run["conclusion"]}))
        if output := os.environ.get("GITHUB_OUTPUT"):
            with open(output, "a") as handle:
                handle.write("ready=" + str(ready).lower() + "\n")
        return
    with model_context() as model:
        if args.plan:
            value = plan(model)
            if args.plan_output:
                args.plan_output.parent.mkdir(parents=True, exist_ok=True)
                args.plan_output.write_bytes(encoded(value))
            print(json.dumps(value, indent=2, sort_keys=True))
        else:
            verify(model, args.artifact_dir.resolve())


if __name__ == "__main__":
    main()
