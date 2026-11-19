#!/usr/bin/env python3
"""Recover exact public proof evidence from three authenticated completed artifacts.

This is transport, not a proof gate. It never writes to a repository or extracts
archive members to disk. The token is sent only to api.github.com. Signed
artifact redirects are fetched separately without authentication headers.
"""
from __future__ import annotations

import argparse
import base64
import gzip
import hashlib
import io
import json
import os
import stat
import sys
import tarfile
import urllib.error
import urllib.parse
import urllib.request
import zipfile

REPOSITORY = "1337isnot1337/solved-conjectures"
RECOVERY_REF = "refs/heads/verification/recover-verified-44567771879"
API = "https://api.github.com"
SPECS = json.loads(r'''{
  "multiplicities": {
    "run_id": 44567771879,
    "job_id": 135714122710,
    "artifact_id": 14552957354,
    "source_commit": "fc8fbb962e9bbd37610e082f1d9223b0d92985ef",
    "zip_bytes": 6759497,
    "zip_sha256": "4282de9ac998a59af0a4d7fefbcb5ac36cc493d33f8915af51774146741cb4f6",
    "receipt_sha256": "da8d42734b30cdc94349d1a945e68aeb402d2277e94463e2dc8b72b161214dfb",
    "model_path": "controls/docs/modular-support-multiplicities-sources.json",
    "model_sha256": "0abcf9a0f9f8c18fc73c86b9acf3ba3032b0d24e0f5847037eb5bf3fdb6c292c",
    "source_count": 98,
    "generated_count": 55,
    "file_count": 488
  },
  "orbits": {
    "run_id": 44567771805,
    "job_id": 135714119991,
    "artifact_id": 14553690910,
    "source_commit": "fc8fbb962e9bbd37610e082f1d9223b0d92985ef",
    "zip_bytes": 3827717,
    "zip_sha256": "05aa9198c7c17faa6da53da48362fe2c00cdfdeb0674a8d94c1815bb9d310a54",
    "receipt_sha256": "86c6f541dfad9f1ca491ba2c620fb0d1a6f0a8396bdf2e36d548544c32837f88",
    "model_path": "controls/docs/modular-support-orbits-sources.json",
    "model_sha256": "050e0e467499a9ed3b5bd03da7d69bf89d501a922212f898d96bb45115c3080a",
    "source_count": 26,
    "generated_count": null,
    "file_count": 175
  },
  "tight-seven": {
    "run_id": 44565549252,
    "job_id": 135706157756,
    "artifact_id": 14551214198,
    "source_commit": "c16ee4b3acd686497c20653885670a297994c175",
    "zip_bytes": 7378667,
    "zip_sha256": "a2f1301d1d52f8b26de82281f475ca790e4a5fac11860e8fa28c24792bdab768",
    "receipt_sha256": "29d3f33317f1296937c76121875915bf6a98422b5195c45e5fcae6f098023132",
    "model_path": "controls/docs/tight-seven-binary-roots-sources.json",
    "model_sha256": "41bbab0f459fb3710927c64f4766d7da64ec306265d5219f83de2732138695a1",
    "source_count": 34,
    "generated_count": null,
    "file_count": null
  }
}''')

MAX_API_BYTES = 2 * 1024 * 1024
MAX_ZIP_BYTES = 16 * 1024 * 1024
MAX_ARCHIVE_BYTES = 256 * 1024 * 1024
MAX_MEMBER_BYTES = 64 * 1024 * 1024
MAX_MEMBERS = 1024
MAX_SELECTED_BYTES = 32 * 1024 * 1024
MAX_BUNDLE_BYTES = 6_500_000
MAX_PROTOCOL_BYTES = 9_000_000
CHUNK_SIZE = 8192
RECEIPT_NAMES = {"receipt.json", "receipt.sha256"}
OBJECT_SUFFIXES = (
    ".olean", ".olean.server", ".olean.private", ".ilean", ".o", ".a",
    ".so", ".dll", ".dylib", ".bc", ".ir", ".ir.sig", ".ltar",
)


class RecoveryError(Exception):
    """An error whose message contains no token or signed download URL."""


def require(condition, message):
    if not condition:
        raise RecoveryError(message)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":"),
                      ensure_ascii=True).encode("ascii") + b"\n"


class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        return None


OPENER = urllib.request.build_opener(NoRedirect())


def read_bounded(response, limit):
    length = response.headers.get("Content-Length")
    if length is not None:
        require(length.isdigit() and int(length) <= limit,
                "HTTP response exceeds the byte limit")
    chunks = []
    total = 0
    while True:
        chunk = response.read(min(65536, limit + 1 - total))
        if not chunk:
            break
        total += len(chunk)
        require(total <= limit, "HTTP response exceeds the byte limit")
        chunks.append(chunk)
    return b"".join(chunks)


def signed_url(value):
    require(isinstance(value, str) and 0 < len(value) <= 16384,
            "Missing or oversized artifact redirect")
    try:
        parsed = urllib.parse.urlsplit(value)
        port = parsed.port
    except ValueError:
        raise RecoveryError("Invalid artifact redirect") from None
    host = parsed.hostname or ""
    require(parsed.scheme == "https" and port in (None, 443)
            and parsed.username is None and parsed.password is None
            and not parsed.fragment,
            "Artifact redirect is not an ordinary HTTPS URL")
    require(host.endswith(".blob.core.windows.net")
            or host.endswith(".githubusercontent.com")
            or host.endswith(".amazonaws.com"),
            "Artifact redirect has an unexpected storage host")
    return value


def api_request(token, suffix, *, want_redirect=False):
    # suffix is constructed solely from fixed repository/run/artifact constants.
    request = urllib.request.Request(
        API + "/repos/" + REPOSITORY + suffix,
        headers={"Authorization": "Bearer " + token,
                 "Accept": "application/vnd.github+json",
                 "X-GitHub-Api-Version": "2022-11-28",
                 "User-Agent": "public-proof-artifact-recovery"})
    try:
        response = OPENER.open(request, timeout=30)
    except urllib.error.HTTPError as error:
        code = error.code
        location = error.headers.get("Location")
        error.close()
        if want_redirect and code in (301, 302, 303, 307, 308):
            return signed_url(location)
        raise RecoveryError("GitHub API request failed") from None
    with response:
        require(not want_redirect, "Artifact API did not return a redirect")
        require(response.status == 200, "Unexpected GitHub API response")
        data = read_bounded(response, MAX_API_BYTES)
    try:
        result = json.loads(data)
    except (ValueError, UnicodeDecodeError):
        raise RecoveryError("GitHub API returned invalid JSON") from None
    require(isinstance(result, dict), "GitHub API returned a non-object")
    return result


def fetch_archive(token, spec):
    run = api_request(token, "/actions/runs/" + str(spec["run_id"]))
    require(run.get("id") == spec["run_id"]
            and run.get("status") == "completed"
            and run.get("conclusion") == "success"
            and run.get("head_sha") == spec["source_commit"],
            "Completed source run identity does not match")
    require(run.get("repository", {}).get("full_name") == REPOSITORY,
            "Completed source run repository does not match")
    job = api_request(token, "/actions/jobs/" + str(spec["job_id"]))
    require(job.get("id") == spec["job_id"]
            and job.get("run_id") == spec["run_id"]
            and job.get("status") == "completed"
            and job.get("conclusion") == "success",
            "Completed source job identity does not match")
    artifact = api_request(token, "/actions/artifacts/" + str(spec["artifact_id"]))
    provenance = artifact.get("workflow_run", {})
    require(artifact.get("id") == spec["artifact_id"]
            and artifact.get("expired") is False
            and provenance.get("id") == spec["run_id"]
            and provenance.get("head_sha") == spec["source_commit"],
            "Artifact identity or provenance does not match")
    location = api_request(
        token, "/actions/artifacts/" + str(spec["artifact_id"]) + "/zip",
        want_redirect=True)
    # A new request and an opener with redirects disabled prevent Authorization
    # from reaching storage or any subsequent redirect.
    request = urllib.request.Request(
        location, headers={"Accept": "application/octet-stream",
                           "User-Agent": "public-proof-artifact-recovery"})
    with OPENER.open(request, timeout=60) as response:
        require(response.status == 200, "Unexpected artifact storage response")
        archive = read_bounded(response, MAX_ZIP_BYTES)
    require(len(archive) == spec["zip_bytes"], "Artifact ZIP size mismatch")
    require(digest(archive) == spec["zip_sha256"], "Artifact ZIP digest mismatch")
    return archive


def member_name(info):
    name = info.filename
    require(isinstance(name, str) and name and "\\" not in name
            and ":" not in name and not name.startswith("/")
            and all(ord(char) >= 32 and ord(char) != 127 for char in name),
            "Unsafe ZIP member name")
    clean = name[:-1] if info.is_dir() else name
    require(clean and all(part not in ("", ".", "..")
                          for part in clean.split("/")),
            "Unsafe ZIP member path")
    require(not info.flag_bits & 1, "Encrypted ZIP member")
    kind = stat.S_IFMT(info.external_attr >> 16)
    require(kind in ((0, stat.S_IFDIR) if info.is_dir()
                     else (0, stat.S_IFREG)),
            "Symlink or special file in ZIP")
    require(info.compress_type in (zipfile.ZIP_STORED, zipfile.ZIP_DEFLATED),
            "Unsupported ZIP compression")
    require(0 <= info.file_size <= MAX_MEMBER_BYTES
            and 0 <= info.compress_size <= MAX_ZIP_BYTES,
            "ZIP member exceeds a size limit")
    return name, clean


def selected_member(name):
    if name in RECEIPT_NAMES or name == "declaration-inventory.json":
        return True
    if name.startswith(("src/", "generated/")) and name.endswith(".lean"):
        return True
    if name.startswith("controls/") and not name.endswith(OBJECT_SUFFIXES):
        return True
    if name.startswith(("producer-data/", "progress/")) and name.endswith(".json"):
        return True
    if name.startswith("logs/") and name.endswith(".log"):
        return True
    require(name.startswith("lib/lean/") and name.endswith(OBJECT_SUFFIXES),
            "Unexpected non-evidence archive member")
    return False


def compressed_bytes(data):
    output = io.BytesIO()
    with gzip.GzipFile(filename="", mode="wb", fileobj=output,
                       compresslevel=9, mtime=0) as stream:
        stream.write(data)
    return output.getvalue()


def preservation_archives(chosen):
    tar_bytes = io.BytesIO()
    with tarfile.open(fileobj=tar_bytes, mode="w",
                      format=tarfile.USTAR_FORMAT) as archive:
        for name in sorted(chosen):
            member = tarfile.TarInfo(name)
            member.size = len(chosen[name])
            member.mode = 0o644
            member.uid = member.gid = 0
            member.uname = member.gname = ""
            member.mtime = 0
            member.type = tarfile.REGTYPE
            archive.addfile(member, io.BytesIO(chosen[name]))
    payloads = {
        "evidence.tar.gz": compressed_bytes(tar_bytes.getvalue()),
        "declaration-inventory.json.gz":
            compressed_bytes(chosen["declaration-inventory.json"]),
    }
    return {
        name: {"bytes": len(data), "sha256": digest(data),
               "base64": base64.b64encode(data).decode("ascii")}
        for name, data in sorted(payloads.items())
    }


def recover_bundle(component, spec, archive):
    # Authenticate compressed bytes before invoking the ZIP decompressor.
    require(len(archive) == spec["zip_bytes"], "Artifact ZIP size mismatch")
    require(digest(archive) == spec["zip_sha256"], "Artifact ZIP digest mismatch")
    chosen = {}
    inventory = {}
    selected_bytes = 0
    with zipfile.ZipFile(io.BytesIO(archive)) as zipped:
        members = zipped.infolist()
        require(0 < len(members) <= MAX_MEMBERS, "Unexpected ZIP member count")
        require(sum(info.file_size for info in members) <= MAX_ARCHIVE_BYTES,
                "Archive exceeds the uncompressed byte limit")
        seen = set()
        file_paths = set()
        checked = []
        for info in members:
            name, clean = member_name(info)
            require(clean not in seen, "Duplicate ZIP member path")
            seen.add(clean)
            if not info.is_dir():
                file_paths.add(clean)
                checked.append((info, name, selected_member(name)))
        for path in file_paths:
            parts = path.split("/")
            require(not any("/".join(parts[:i]) in file_paths
                            for i in range(1, len(parts))),
                    "ZIP file conflicts with a directory path")
        for info, name, selected in checked:
            h = hashlib.sha256()
            data_parts = []
            count = 0
            with zipped.open(info, "r") as stream:
                while True:
                    chunk = stream.read(65536)
                    if not chunk:
                        break
                    count += len(chunk)
                    require(count <= info.file_size, "ZIP size declaration mismatch")
                    h.update(chunk)
                    if selected:
                        selected_bytes += len(chunk)
                        require(selected_bytes <= MAX_SELECTED_BYTES,
                                "Selected evidence exceeds the byte limit")
                        data_parts.append(chunk)
            require(count == info.file_size, "ZIP size declaration mismatch")
            inventory[name] = {"bytes": count, "sha256": h.hexdigest(),
                               "selected": selected}
            if selected:
                chosen[name] = b"".join(data_parts)
    require("receipt.json" in chosen and "declaration-inventory.json" in chosen,
            "Missing raw receipt or declaration inventory")
    require(digest(chosen["receipt.json"]) == spec["receipt_sha256"],
            "Raw receipt digest mismatch")
    try:
        receipt = json.loads(chosen["receipt.json"])
        declarations = json.loads(chosen["declaration-inventory.json"])
    except (ValueError, UnicodeDecodeError):
        raise RecoveryError("Invalid evidence JSON") from None
    require(isinstance(receipt, dict)
            and isinstance(declarations, (dict, list)),
            "Unexpected evidence JSON structure")
    if spec["file_count"] is not None:
        require(len(inventory) == spec["file_count"],
                "Original artifact file count mismatch")
    require(spec["model_path"] in chosen
            and digest(chosen[spec["model_path"]]) == spec["model_sha256"],
            "Frozen source model digest mismatch")
    sources = [name for name in chosen
               if name.startswith("src/Conjectures/") and name.endswith(".lean")]
    generated = [name for name in chosen
                 if name.startswith("generated/Conjectures/")
                 and name.endswith(".lean")]
    require(len(sources) == spec["source_count"], "Proof-source count mismatch")
    if spec["generated_count"] is not None:
        require(len(generated) == spec["generated_count"],
                "Generated-source count mismatch")
    for name in generated:
        source_name = "src/" + name.removeprefix("generated/")
        require(source_name in chosen and chosen[source_name] == chosen[name],
                "Generated and compiled source bytes differ")
    evidence = receipt.get("evidence_sha256")
    if evidence is not None:
        require(isinstance(evidence, dict)
                and set(evidence) == set(inventory) - RECEIPT_NAMES,
                "Sealed evidence inventory membership mismatch")
        require(all(inventory[name]["sha256"] == expected
                    for name, expected in evidence.items()),
                "Sealed evidence inventory digest mismatch")
    archives = preservation_archives(chosen)
    priority = ["receipt.json", "declaration-inventory.json"]
    required_raw = set(priority) | set(sources)
    order = priority + sorted(set(chosen) - set(priority))
    all_files = [{"name": name, **inventory[name],
                  "base64": base64.b64encode(chosen[name]).decode("ascii")}
                 for name in order]
    result = {
        "schema": "verified-public-artifact-recovery-v1",
        "transport_only": True,
        "component": component,
        "repository": REPOSITORY,
        "source_run_id": spec["run_id"],
        "source_job_id": spec["job_id"],
        "source_commit": spec["source_commit"],
        "artifact_id": spec["artifact_id"],
        "original_zip_bytes": len(archive),
        "original_zip_sha256": spec["zip_sha256"],
        "raw_receipt_sha256": spec["receipt_sha256"],
        "original_file_count": len(inventory),
        "non_object_evidence_file_count": len(chosen),
        "non_object_evidence_raw_bytes": selected_bytes,
        "omitted_object_file_count": len(inventory) - len(chosen),
        "original_file_inventory": {
            name: inventory[name] for name in sorted(inventory)},
        "preservation": {
            "newly_reproduced_archives": True,
            "old_preservation_archive_hashes_claimed": False,
            "evidence_members": sorted(chosen),
            "tar_format": "USTAR",
            "tar_uid": 0, "tar_gid": 0, "tar_mode": "0644", "tar_mtime": 0,
            "tar_uname": "", "tar_gname": "",
            "gzip_filename": "", "gzip_mtime": 0, "gzip_compresslevel": 9,
            "archives": archives,
        },
    }
    # Every non-object byte remains in evidence.tar.gz. Prefer all raw evidence
    # too; if the log cap requires it, omit duplicate/generated bytes and then
    # raw logs or controls. Raw receipts, inventory, and every compiled source
    # are mandatory, including all 55 generated multiplicity source modules.
    raw_names = set(chosen)
    omissions = []
    tiers = [
        lambda name: False,
        lambda name: name.startswith("generated/"),
        lambda name: name.startswith(("logs/", "progress/")),
        lambda name: name.startswith(("controls/", "producer-data/")),
    ]
    for should_omit in tiers:
        removed = {name for name in raw_names
                   if name not in required_raw and should_omit(name)}
        raw_names -= removed
        omissions.extend(sorted(removed))
        result["raw_payload_omissions"] = sorted(omissions)
        result["raw_payload_file_count"] = len(raw_names)
        result["files"] = [entry for entry in all_files
                           if entry["name"] in raw_names]
        bundle = canonical(result)
        if len(bundle) <= MAX_BUNDLE_BYTES:
            return bundle
    raise RecoveryError("Mandatory recovery bundle exceeds the byte limit")


def emit(component, bundle):
    encoded = base64.b64encode(bundle).decode("ascii")
    pieces = [encoded[i:i + CHUNK_SIZE]
              for i in range(0, len(encoded), CHUNK_SIZE)]
    checksum = digest(bundle)
    begin = ("RECOVERY_BEGIN " + component + " " + str(len(bundle)) + " "
             + checksum + " " + str(len(pieces)))
    lines = [begin]
    lines.extend("RECOVERY_CHUNK " + component + " " + f"{i:06d}" + " " + piece
                 for i, piece in enumerate(pieces))
    lines.append("RECOVERY_END " + component + " " + checksum)
    require(sum(len(line) + 1 for line in lines) <= MAX_PROTOCOL_BYTES,
            "Recovery log exceeds the byte limit")
    # No partial bundle is emitted before all authentication and bound checks.
    for line in lines:
        print(line, flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--component", choices=sorted(SPECS), required=True)
    args = parser.parse_args()
    require(os.environ.get("GITHUB_REPOSITORY") == REPOSITORY
            and os.environ.get("GITHUB_REF") == RECOVERY_REF
            and os.environ.get("GITHUB_EVENT_NAME") == "push",
            "Recovery is restricted to the fixed public branch push")
    token = os.environ.pop("GH_TOKEN", "")
    require(bool(token), "Missing read-only GitHub token")
    spec = SPECS[args.component]
    archive = fetch_archive(token, spec)
    bundle = recover_bundle(args.component, spec, archive)
    emit(args.component, bundle)


if __name__ == "__main__":
    try:
        main()
    except RecoveryError as error:
        print("RECOVERY_ERROR " + str(error), file=sys.stderr)
        sys.exit(1)
    except Exception as error:
        # In particular, urllib exceptions can contain signed URLs. Never print
        # their text or traceback; the exception type is enough to identify the
        # failed transport class without disclosing a credential-bearing URL.
        print("RECOVERY_ERROR unexpected-" + type(error).__name__, file=sys.stderr)
        sys.exit(1)
