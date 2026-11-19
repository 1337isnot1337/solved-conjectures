#!/usr/bin/env python3
"""Preserve two frozen original Frankl artifacts without changing their audit schema."""
from __future__ import annotations
import io
import json
from pathlib import PurePosixPath
import stat
import zipfile
from preserve_frankl_arithmetic_receipts import api, request, require, sha, encoded, REPO
from preserve_frankl_component_receipts import publish

RECORDS = [
    {
        "run": 44514908813,
        "head": "f24465a8513c7506f5b4526673dba722c05b90b6",
        "workflow": "Lean Frankl complete row coverage",
        "artifact": 14524744595,
        "name": "frankl-transport-row-coverage",
        "zip_sha256": "6a8b4249436590ba23ad5c6ffefda1e3fb09f361ac0c3819211e88e537b11063",
        "zip_bytes": 161507573,
        "compressed_limit": 256 * 1024 * 1024,
        "uncompressed_limit": 2 * 1024 * 1024 * 1024,
        "modules": 464,
        "root": "Conjectures.FranklSmallCyclicTransportCoverage",
        "slug": "transport-row-coverage",
        "full_objects": True,
        "audit_schema": "all-owned declarations with explicit import-all and private inventory",
    },
    {
        "run": 44492632854,
        "head": "77fa9a758cb5753693e66c78f8cde44a09fb4a24",
        "workflow": "Lean Frankl span-four candidate proofs",
        "artifact": 14515060734,
        "name": "frankl-span-four-weight-batches-receipt",
        "zip_sha256": "f53d311c2a828e5ecf28b60d19b79845c7a1bcd87ff98bbefb351b0638582d1c",
        "zip_bytes": 28001,
        "compressed_limit": 4 * 1024 * 1024,
        "uncompressed_limit": 32 * 1024 * 1024,
        "modules": 76,
        "root": "Conjectures.FranklSpanFourWeightBatches",
        "slug": "weight-batches",
        "full_objects": False,
        "audit_schema": "historical theorem-branch transitive audit; not relabeled all-owned",
    },
]

def safe_archive(payload, record):
    archive = zipfile.ZipFile(io.BytesIO(payload))
    infos = archive.infolist()
    names = [info.filename for info in infos]
    require(len(names) == len(set(names)), "Duplicate archive member")
    total = sum(info.file_size for info in infos)
    require(total <= record["uncompressed_limit"], "Uncompressed archive exceeds profile bound")
    for info in infos:
        path = PurePosixPath(info.filename)
        require(not path.is_absolute() and ".." not in path.parts
                and "\\" not in info.filename and "\x00" not in info.filename,
                "Unsafe archive member")
        require(not stat.S_ISLNK(info.external_attr >> 16), "Archive symlink")
        require(not info.flag_bits & 1, "Encrypted archive member")
        require(info.compress_type in (zipfile.ZIP_STORED, zipfile.ZIP_DEFLATED),
                "Unexpected archive compression")
    return archive, names, total

def preserve(record):
    run = api("/actions/runs/" + str(record["run"]))
    require(run["head_sha"] == record["head"] and run["name"] == record["workflow"],
            "Frozen run identity differs")
    require(run["status"] == "completed" and run["conclusion"] == "success",
            "Source run did not pass")
    require(run["head_branch"] == "main" and run["head_repository"]["full_name"] == REPO,
            "Source run belongs to a different branch or repository")
    artifact = api("/actions/artifacts/" + str(record["artifact"]))
    require(artifact["id"] == record["artifact"] and artifact["name"] == record["name"],
            "Frozen artifact identity differs")
    require(not artifact["expired"], "Original evidence expired")
    require(artifact["workflow_run"]["id"] == record["run"]
            and artifact["workflow_run"]["head_sha"] == record["head"],
            "Artifact source differs")
    require(artifact["size_in_bytes"] == record["zip_bytes"]
            and artifact["digest"] == "sha256:" + record["zip_sha256"],
            "Artifact metadata differs")
    payload = request(artifact["archive_download_url"], limit=record["compressed_limit"])
    require(len(payload) == record["zip_bytes"] and sha(payload) == record["zip_sha256"],
            "Original ZIP digest differs")
    archive, names, uncompressed = safe_archive(payload, record)
    candidates = []
    for name in names:
        if not name.endswith(".json"):
            continue
        info = archive.getinfo(name)
        if info.file_size > 16 * 1024 * 1024:
            continue
        raw = archive.read(name)
        try:
            receipt = json.loads(raw)
        except (ValueError, UnicodeDecodeError):
            continue
        if (isinstance(receipt, dict) and receipt.get("status") == "passed"
                and receipt.get("git_commit", receipt.get("commit")) == record["head"]
                and record["root"] in receipt.get("project_modules", [])):
            candidates.append((name, raw, receipt))
    require(len(candidates) == 1, "Expected one unambiguous original passed receipt")
    name, raw, receipt = candidates[0]
    modules = receipt["project_modules"]
    require(len(modules) == len(set(modules)) == record["modules"],
            "Original module inventory differs")
    require(set(receipt["source_sha256"]) == set(modules)
            and set(receipt["artifact_sha256"]) == set(modules),
            "Recorded source/object module inventories differ")
    object_members = [item for item in names
                      if item.endswith((".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig"))]
    checked_sources, checked_facets = 0, 0
    if record["full_objects"]:
        prefix = str(PurePosixPath(name).parent)
        prefix = "" if prefix == "." else prefix + "/"
        for module in modules:
            path = module.replace(".", "/")
            require(sha(archive.read(prefix + "src/" + path + ".lean"))
                    == receipt["source_sha256"][module], "Archived source digest differs")
            checked_sources += 1
            facets = receipt["artifact_sha256"][module]
            require({".olean", ".olean.private", ".olean.server"} <= set(facets),
                    "Missing modern object facets")
            for suffix, expected in facets.items():
                require(suffix in (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig"),
                        "Unexpected object facet")
                require(sha(archive.read(prefix + "lib/lean/" + path + suffix)) == expected,
                        "Archived proof-object digest differs")
                checked_facets += 1
    else:
        require(not object_members, "Receipt-only profile unexpectedly contains objects")
    directory = "docs/verification/frankl-original-artifacts-" + str(record["run"]) + "/"
    destination = directory + record["slug"] + "-receipt.json"
    metadata = {
        "schema": "frankl-original-artifact-preservation-v1",
        "source_run_id": record["run"],
        "source_commit": record["head"],
        "source_workflow": record["workflow"],
        "source_run_attempt": run["run_attempt"],
        "artifact_id": record["artifact"],
        "artifact_name": record["name"],
        "archive_sha256": record["zip_sha256"],
        "archive_compressed_bytes": len(payload),
        "archive_uncompressed_bytes": uncompressed,
        "archive_member_count": len(names),
        "archive_object_member_count": len(object_members),
        "receipt_member": name,
        "receipt": destination,
        "receipt_sha256": sha(raw),
        "receipt_bytes_unchanged": True,
        "audit_schema": record["audit_schema"],
        "project_modules": modules,
        "source_sha256": receipt["source_sha256"],
        "artifact_sha256": receipt["artifact_sha256"],
        "toolchain": receipt.get("toolchain"),
        "checker": receipt.get("checker"),
        "gate_sha256": receipt.get("gate_sha256"),
        "archived_sources_rehashed": checked_sources,
        "archived_object_facets_rehashed": checked_facets,
        "recorded_object_facets": sum(len(value) for value in receipt["artifact_sha256"].values()),
        "new_source_compilation": False,
        "new_axiom_audit": False,
        "new_kernel_replay": False,
        "scope": "Preserve the original passed evidence. This export does not upgrade its audit schema or establish a new composed proof gate.",
    }
    print(json.dumps({key: metadata[key] for key in (
        "source_run_id", "receipt", "receipt_sha256", "archive_compressed_bytes",
        "archive_uncompressed_bytes", "archived_sources_rehashed",
        "archived_object_facets_rehashed")}), flush=True)
    return {destination: raw, directory + record["slug"] + "-metadata.json": encoded(metadata)}

def main():
    files = {}
    for record in RECORDS:
        files.update(preserve(record))
    publish(files, {})

if __name__ == "__main__":
    main()
