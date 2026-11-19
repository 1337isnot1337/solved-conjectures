#!/usr/bin/env python3
"""Preserve one fixed, already-passed fixed-hyperplane proof archive without rerunning Lean."""
from __future__ import annotations

import argparse
import hashlib
import importlib
import io
import json
import os
from pathlib import Path, PurePosixPath
import re
import stat
import subprocess
import sys
import tempfile
import urllib.parse
import urllib.request
import zipfile

ROOT = Path(__file__).resolve().parents[1]
REPO = "1337isnot1337/solved-conjectures"
API = "https://api.github.com/repos/" + REPO
MODEL = "docs/hyperplane-main-exact-sources.json"
GATE_PATHS = (
    "scripts/verify_hyperplane_main_exact.py",
    ".github/workflows/lean-hyperplane-main-exact.yml",
    MODEL,
)
ALLOWED = ("propext", "Classical.choice", "Quot.sound")
FACETS = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig")
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
AUDIT_SHA256 = "53c289baad523164bbef5561910fcdc44bc40efba2b8efe8e7212c30db3a663f"
RECORD = {
    "run": 44531509741,
    "head": "ee1f018fef258cdd54f73af31cdaf6485fd151cb",
    "workflow": "Lean complete fixed-hyperplane theorem",
    "attempt": 1,
    "artifact": 14535236819,
    "name": "hyperplane-main-exact",
    "zip_bytes": 7554780,
    "zip_sha256": "27d65f3b5d667260dfad8d639f6d1182a3b5e54c032a2e2954d7764e060fe638",
    "receipt_sha256": "1c0d6a6fbe2ea16bbcfa88808ec8d83f0e412217e76c03803780ff0737fa1c15"
}
PROFILE_FIELDS = {
    "command", "exit_code", "seconds", "peak_rss_kib", "user_seconds",
    "system_seconds", "timed_out", "log", "log_sha256",
}
MAX_ZIP = 32 * 1024 * 1024
MAX_UNCOMPRESSED = 256 * 1024 * 1024


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


def git_bytes(commit, path):
    result = subprocess.run(
        ["git", "show", commit + ":" + path], cwd=ROOT, stdout=subprocess.PIPE,
        stderr=subprocess.PIPE, check=False)
    return result.stdout if result.returncode == 0 else None


class TokenSafeRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, request, fp, code, message, headers, newurl):
        require(urllib.parse.urlsplit(newurl).scheme == "https", "Non-HTTPS artifact redirect")
        redirected = super().redirect_request(request, fp, code, message, headers, newurl)
        if redirected is not None and (
                urllib.parse.urlsplit(request.full_url).netloc !=
                urllib.parse.urlsplit(newurl).netloc):
            redirected.remove_header("Authorization")
        return redirected


def request(url, limit):
    parsed = urllib.parse.urlsplit(url)
    require(parsed.scheme == "https" and parsed.netloc == "api.github.com",
            "Only the fixed GitHub API may initiate a request")
    token = os.environ.get("GH_TOKEN") or os.environ.get("GITHUB_TOKEN")
    require(token, "A GitHub Actions token is required")
    headers = {
        "Authorization": "Bearer " + token,
        "Accept": "application/vnd.github+json",
        "X-GitHub-Api-Version": "2022-11-28",
        "User-Agent": "fixed-hyperplane-main-exact-proof-preserver",
    }
    opener = urllib.request.build_opener(TokenSafeRedirect())
    with opener.open(urllib.request.Request(url, headers=headers), timeout=120) as response:
        raw = response.read(limit + 1)
    require(len(raw) <= limit, "Response exceeds its fixed size bound")
    return raw


def api(path):
    return json.loads(request(API + path, 8 * 1024 * 1024))


def safe_archive(payload):
    require(len(payload) <= MAX_ZIP, "Compressed archive exceeds bound")
    archive = zipfile.ZipFile(io.BytesIO(payload))
    infos = archive.infolist()
    names = [info.filename for info in infos]
    require(len(names) == len(set(names)), "Duplicate ZIP member")
    require(sum(info.file_size for info in infos) <= MAX_UNCOMPRESSED,
            "Uncompressed archive exceeds bound")
    for info in infos:
        path = PurePosixPath(info.filename)
        require(not path.is_absolute() and ".." not in path.parts
                and "\\" not in info.filename and "\x00" not in info.filename
                and str(path) == info.filename.rstrip("/"),
                "Unsafe or noncanonical ZIP member")
        require(not stat.S_ISLNK(info.external_attr >> 16), "ZIP symlink")
        require(not info.flag_bits & 1, "Encrypted ZIP member")
        require(info.compress_type in (zipfile.ZIP_STORED, zipfile.ZIP_DEFLATED),
                "Unsupported ZIP compression")
    return archive, names


def singleton_log(raw, module):
    text = raw.decode()
    targets = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$", text, re.M)
    require(targets == [module], "Stock replay log is not an exact singleton: " + module)
    return targets


def source_command(check, lean, module, stage):
    expected = [
        lean, "-j1", "-M4500", "-DwarningAsError=true", "-o",
        stage + "/lib/lean/" + module.replace(".", "/") + ".olean",
        module.replace(".", "/") + ".lean",
    ]
    require(check["command"] == expected, "Strict source command differs: " + module)


def kernel_command(check, checker, module):
    command = check["command"]
    if len(command) == 6 and PurePosixPath(command[0]).name == "stdbuf":
        require(PurePosixPath(command[0]).is_absolute()
                and command[1:3] == ["-oL", "-eL"], "Unexpected stock replay wrapper")
        command = command[3:]
    require(command == [checker, "-v", module], "Stock checker command differs: " + module)


def frozen_inputs():
    raw = git_bytes(RECORD["head"], MODEL)
    require(raw is not None, "Frozen source model is unavailable")
    model = json.loads(raw)
    require(model["schema"] == "hyperplane-main-exact-v1", "Wrong source model")
    require(model["legacy_prefixes"] == ["Loneliness."], "Ownership fallback differs")
    require(model["source_policy"] == {
        "warning_as_error": True, "linter_override": False, "fresh_project_objects": True},
        "Strict source policy differs")
    controls = {}
    for path, digest in {**model["configuration_sha256"], **model["helper_sha256"]}.items():
        value = git_bytes(RECORD["head"], path)
        require(value is not None and sha(value) == digest, "Frozen helper/configuration differs: " + path)
        controls[path] = value
    require(sha(controls["scripts/audit_lean_all_owned.py"]) == AUDIT_SHA256,
            "All-owned audit helper differs from the reviewed version")
    require(controls["lean/lean-toolchain"] == b"leanprover/lean4:v4.35.0\n",
            "Pinned Lean version differs")
    for path in GATE_PATHS:
        value = git_bytes(RECORD["head"], path)
        require(value is not None, "Frozen gate source is unavailable: " + path)
        controls[path] = value
    return model, controls


def check_archive(payload, model, controls):
    archive, names = safe_archive(payload)
    receipts = [name for name in names if PurePosixPath(name).name == "receipt.json"]
    require(len(receipts) == 1, "Expected one unambiguous original receipt")
    receipt_member = receipts[0]
    prefix = receipt_member[:-len("receipt.json")]
    raw_receipt = archive.read(receipt_member)
    require(sha(raw_receipt) == RECORD["receipt_sha256"], "Frozen raw receipt digest differs")
    receipt = json.loads(raw_receipt)
    require(receipt["schema"] == "hyperplane-main-exact-receipt-v1"
            and receipt["status"] == "passed" and receipt["git_commit"] == RECORD["head"],
            "Original passed receipt identity differs")
    require(receipt["all_frozen_hashes_unchanged"] is True
            and receipt["original_theorem_scope_checked"] is True
            and receipt["accepted_registry_changed"] is False,
            "Original gate completion assertions differ")
    require(receipt["source_workers"] == receipt["kernel_threads"] == 1,
            "Original execution policy differs")
    require(receipt["source_policy"] == model["source_policy"]
            and receipt["scope"] == model["scope"]
            and receipt["roots"] == model["roots"], "Original theorem scope differs")
    require(receipt["axiom_whitelist"] == list(ALLOWED), "Axiom whitelist differs")
    require(receipt["gate_sha256"] == {p: sha(v) for p, v in controls.items()},
            "Complete frozen gate/configuration/helper inventory differs")
    toolchain = receipt["toolchain"]
    require(toolchain["lean_sha256"] == LEAN_SHA256
            and toolchain["checker_sha256"] == CHECKER_SHA256
            and re.match(r"Lean \(version 4\.35\.0(?:,|\))", toolchain["lean_version"]),
            "Pinned compiler/checker/version differs")
    lean, checker = toolchain["lean_path"], toolchain["checker_path"]
    require(PurePosixPath(lean).is_absolute() and PurePosixPath(checker).is_absolute()
            and PurePosixPath(lean).name == "lean" and PurePosixPath(checker).name == "leanchecker",
            "Unexpected recorded executable path")
    modules, required = receipt["project_modules"], receipt["required_theorems"]
    require(len(modules) == len(set(modules)) == 72
            and set(modules) == set(model["source_sha256"]), "Exact source closure differs")
    require(required == model["required_theorems"] and len(required) == len(set(required)) == 106,
            "Required theorem endpoints differ")
    require(receipt["source_sha256"] == model["source_sha256"]
            and set(receipt["artifact_sha256"]) == set(modules),
            "Source or proof-object inventory differs")
    require(set(receipt["source_checks"]) == set(modules)
            and set(receipt["kernel_checks"]) == set(modules), "Incomplete process inventory")

    preserved = {"receipt.json": raw_receipt}
    validated_members = set()
    def read(relative):
        member = prefix + relative
        require(member in names and not member.endswith("/"), "Missing archive member: " + member)
        validated_members.add(member)
        return archive.read(member)

    with tempfile.TemporaryDirectory(prefix="hyperplane-main-original-evidence-") as directory:
        temporary = Path(directory)
        helper_dir = temporary / "helpers"
        helper_dir.mkdir()
        for path, value in controls.items():
            if path.startswith("scripts/"):
                (helper_dir / PurePosixPath(path).name).write_bytes(value)
        sys.path.insert(0, str(helper_dir))
        try:
            audit = importlib.import_module("audit_lean_all_owned")
            replay = importlib.import_module("replay_lean")
            require(Path(audit.__file__).resolve().parent == helper_dir.resolve()
                    and Path(replay.__file__).resolve().parent == helper_dir.resolve(),
                    "Historical audit/parser helper was not loaded from the frozen bytes")
            sources, modern, graph, expected_objects = {}, {}, {}, set()
            for module in modules:
                stem = module.replace(".", "/")
                value = read("src/" + stem + ".lean")
                require(sha(value) == model["source_sha256"][module]
                        and value == git_bytes(RECORD["head"], "lean/" + stem + ".lean"),
                        "Actual archived/source-commit bytes differ: " + module)
                path = temporary / "src" / (stem + ".lean")
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_bytes(value)
                sources[module] = value
                modern[module] = next(replay.header_tokens(value.decode()), None) == "module"
                imports = list(replay.imports_of(path))
                graph[module] = [name for name in imports if name == "Conjectures"
                    or name.startswith("Conjectures.") or name == "Solitaire" or name.startswith("Solitaire.")]
                require(set(graph[module]) <= set(modules), "Unrecorded project dependency")
                facets = receipt["artifact_sha256"][module]
                needed = set(FACETS[:3]) if modern[module] else {".olean"}
                require(needed <= set(facets) <= set(FACETS), "Missing or unexpected object facets")
                require((".olean.private" in facets) == (".olean.server" in facets),
                        "Partial optional private/server facet pair")
                for suffix, digest in facets.items():
                    name = "lib/lean/" + stem + suffix
                    require(sha(read(name)) == digest, "Actual archived proof object differs: " + name)
                    expected_objects.add(prefix + name)
            require(modern == receipt["modern_modules"], "Recorded modern/private inventory differs")
            actual_objects = {name for name in names if name.startswith(prefix + "lib/lean/")
                              and name.endswith(FACETS)}
            require(actual_objects == expected_objects, "Extra or missing staged project object facet")
            actual_sources = {name for name in names if name.startswith(prefix + "src/Conjectures/")
                              and name.endswith(".lean")}
            require(actual_sources == {prefix + "src/" + m.replace(".", "/") + ".lean" for m in modules},
                    "Extra or missing staged project source")
            reachable, todo = set(), list(model["roots"])
            while todo:
                module = todo.pop()
                require(module in graph, "A root/dependency is outside the exact closure")
                if module not in reachable:
                    reachable.add(module)
                    todo.extend(graph[module])
            require(reachable == set(modules), "Archived proof closure is not exactly root-reachable")
            positions = {module: index for index, module in enumerate(modules)}
            for module, dependencies in graph.items():
                require(all(positions[dependency] < positions[module] for dependency in dependencies),
                        "Original proof/replay order is not topological")
                require([m for m in modules if m == module or m.startswith(module + ".")] == [module],
                        "A stock replay module is not a singleton Lean Name-prefix")

            first = modules[0]
            first_log = receipt["source_checks"][first]["log"]
            ending = "/logs/" + first + ".source.log"
            require(first_log.endswith(ending), "Unexpected recorded source log layout")
            stage = first_log[:-len(ending)]
            require(PurePosixPath(stage).is_absolute() and ".." not in PurePosixPath(stage).parts,
                    "Unexpected recorded stage path")
            expected_logs, expected_progress = set(), set()
            def process(check, logname):
                require(check["exit_code"] == 0 and check["timed_out"] is False
                        and check["log"] == stage + "/logs/" + logname,
                        "Recorded process did not pass or used another stage")
                raw = read("logs/" + logname)
                require(sha(raw) == check["log_sha256"], "Actual process log digest differs")
                progress_name = logname[:-len(".log")] + ".json"
                progress_raw = read("progress/" + progress_name)
                progress = json.loads(progress_raw)
                require(set(progress) == PROFILE_FIELDS
                        and all(progress[key] == check[key] for key in PROFILE_FIELDS),
                        "Original process progress receipt disagrees")
                expected_logs.add(prefix + "logs/" + logname)
                expected_progress.add(prefix + "progress/" + progress_name)
                preserved["logs/" + logname] = raw
                preserved["progress/" + progress_name] = progress_raw
                return raw

            for module in modules:
                check = receipt["source_checks"][module]
                source_command(check, lean, module, stage)
                process(check, module + ".source.log")

            audit_check = receipt["axiom_audit"]
            require(audit_check["command"] == [
                lean, "-j1", "-M4500", "-DwarningAsError=true", "HyperplaneMainExactAudit.lean"],
                "Original all-owned audit command differs")
            require(audit_check["all_owned_declarations_audited"] is True
                    and audit_check["exact_raw_private_visibility"] is True
                    and audit_check["complete_serialized_private_import"] is True,
                    "Original complete raw/private declaration audit is missing")
            audit_raw = read("src/HyperplaneMainExactAudit.lean")
            expected_audit = audit.audit_source(modules, required, model["legacy_prefixes"]).encode()
            require(audit_raw == expected_audit
                    and sha(audit_raw) == audit_check["audit_source_sha256"],
                    "Original audit source differs from the pinned complete audit")
            audit_log = process(audit_check, "all-owned-audit.log")
            spec = {"modules": modules, "required": required, "legacy_prefixes": model["legacy_prefixes"]}
            inventory = audit.validate_log(audit_log.decode(), spec, modern)
            inventory_raw = read("declaration-inventory.json")
            require(sha(inventory_raw) == audit_check["declaration_inventory_sha256"]
                    and inventory_raw == encoded(inventory)
                    and inventory["summary"] == audit_check["summary"],
                    "Original declaration inventory differs from raw audited evidence")
            require(all(inventory["declarations"][name]["kind"] == "theorem" for name in required),
                    "A required endpoint was not audited as a theorem")
            summary = inventory["summary"]
            require(summary["modules"] == 72 and summary["declarations"] == 1403
                    and summary["theorems"] == 1149 and summary["private_declarations"] == 44
                    and summary["required"] == 106, "Expected complete audit counts differ")
            preserved["HyperplaneMainExactAudit.lean"] = audit_raw
            preserved["declaration-inventory.json"] = inventory_raw
            targets = []
            for module in modules:
                check = receipt["kernel_checks"][module]
                kernel_command(check, checker, module)
                actual = singleton_log(process(check, module + ".kernel.log"), module)
                require(check["replayed_modules"] == actual and check["exact_singleton_target"] is True,
                        "Original exact target inventory differs")
                targets.extend(actual)
            kernel = receipt["kernel_replay"]
            require(targets == modules and len(set(targets)) == 72
                    and kernel["replayed_modules"] == modules
                    and kernel["exact_project_closure"] is True
                    and kernel["all_modules_replayed_as_targets"] is True
                    and kernel["fresh_process_per_module"] is True,
                    "Original stock replay did not cover every exact module target")
            require(kernel["seconds"] == round(sum(c["seconds"] for c in receipt["kernel_checks"].values()), 3)
                    and kernel["peak_rss_kib"] == max(c["peak_rss_kib"] for c in receipt["kernel_checks"].values()),
                    "Original replay measurements disagree")
            require({n for n in names if n.startswith(prefix + "logs/") and not n.endswith("/")} == expected_logs,
                    "Extra or missing process log")
            require({n for n in names if n.startswith(prefix + "progress/") and not n.endswith("/")} == expected_progress,
                    "Extra or missing process-progress receipt")
        finally:
            sys.path.remove(str(helper_dir))

    require({name for name in names if not name.endswith("/")} == validated_members | {receipt_member},
            "Archive has unvalidated or missing files")
    require(len(validated_members | {receipt_member}) == 437, "Fixed archive member count differs")
    for path, raw in controls.items():
        preserved["controls/" + path] = raw
    metadata = {
        "schema": "hyperplane-main-exact-preservation-v1",
        "status": "original_passed_evidence_authenticated",
        "binding": RECORD, "receipt_bytes_unchanged": True,
        "receipt_member": receipt_member, "receipt_sha256": sha(raw_receipt),
        "project_modules": modules, "required_theorems": required,
        "actual_archived_sources_rehashed": len(modules),
        "actual_archived_facets_rehashed": len(expected_objects),
        "actual_process_logs_rehashed": len(expected_logs),
        "actual_progress_receipts_validated": len(expected_progress),
        "root_reachable_exact_import_closure": True, "strict_commands_validated": True,
        "all_owned_raw_private_inventory_validated": True,
        "complete_serialized_private_import": True,
        "original_visibility_label": "The original complete_serialized_private_import field records complete serialized declaration visibility for this legacy closure.",
        "all_required_endpoints_are_theorems": True,
        "exact_singleton_stock_targets": targets, "audit_summary": summary,
        "source_sha256": receipt["source_sha256"], "artifact_sha256": receipt["artifact_sha256"],
        "toolchain": toolchain, "original_gate_sha256": receipt["gate_sha256"],
        "preserver_sha256": sha(Path(__file__).read_bytes()),
        "preserved_file_sha256": {name: sha(raw) for name, raw in sorted(preserved.items())},
        "new_source_compilation": False, "new_axiom_audit": False, "new_kernel_replay": False,
        "accepted_registry_changed": False,
        "scope": "Authenticate and preserve the original strict source, all-owned/private audit and exact stock replay evidence; this exporter runs no new Lean proof check.",
    }
    preserved["preservation.json"] = encoded(metadata)
    return preserved, receipt


def publish(files, sources):
    for attempt in range(4):
        subprocess.run(["git", "fetch", "origin", "main"], cwd=ROOT, check=True)
        latest = subprocess.check_output(["git", "rev-parse", "FETCH_HEAD"], cwd=ROOT, text=True).strip()
        for path, digest in sources.items():
            require(sha(git_bytes(latest, path) or b"") == digest,
                    "Current proof source differs from preserved proof: " + path)
        for path, raw in files.items():
            existing = git_bytes(latest, path)
            require(existing is None or existing == raw, "Refuse to overwrite different preserved evidence: " + path)
        if all(git_bytes(latest, path) == raw for path, raw in files.items()):
            print("All fixed-hyperplane evidence is already preserved", flush=True)
            return
        with tempfile.TemporaryDirectory(prefix="hyperplane-main-preservation-index-") as directory:
            environment = {
                **os.environ, "GIT_INDEX_FILE": str(Path(directory) / "index"),
                "GIT_AUTHOR_NAME": "github-actions[bot]", "GIT_COMMITTER_NAME": "github-actions[bot]",
                "GIT_AUTHOR_EMAIL": "41898282+github-actions[bot]@users.noreply.github.com",
                "GIT_COMMITTER_EMAIL": "41898282+github-actions[bot]@users.noreply.github.com",
            }
            subprocess.run(["git", "read-tree", latest], cwd=ROOT, env=environment, check=True)
            for path, raw in files.items():
                blob = subprocess.check_output(["git", "hash-object", "-w", "--stdin"],
                                               cwd=ROOT, input=raw).decode().strip()
                subprocess.run(["git", "update-index", "--add", "--cacheinfo", "100644", blob, path],
                               cwd=ROOT, env=environment, check=True)
            tree = subprocess.check_output(["git", "write-tree"], cwd=ROOT, env=environment, text=True).strip()
            commit = subprocess.check_output(
                ["git", "commit-tree", tree, "-p", latest], cwd=ROOT, env=environment, text=True,
                input="Preserve authenticated exact fixed-hyperplane proof evidence\n\nOriginal raw receipt, all-owned audit, declaration inventory and process logs. No new Lean proof check or registry change.\n").strip()
            pushed = subprocess.run(["git", "push", "origin", commit + ":refs/heads/main"], cwd=ROOT)
            if pushed.returncode == 0:
                print(json.dumps({"receipt_commit": commit, "parent": latest, "files": sorted(files)}), flush=True)
                return
        require(api("/git/ref/heads/main")["object"]["sha"] != latest,
                "Publication failed without a concurrent main update")
    raise RuntimeError("Main moved during every bounded preservation-publication attempt")


def self_test():
    def rejects(action):
        try:
            action()
        except (RuntimeError, ValueError, zipfile.BadZipFile):
            return
        raise AssertionError("Invalid preservation evidence was accepted")
    def zipped(entries):
        buffer = io.BytesIO()
        with zipfile.ZipFile(buffer, "w") as archive:
            for name, raw in entries:
                archive.writestr(name, raw)
        return buffer.getvalue()
    require(singleton_log(b"replaying Conjectures.Sample\n", "Conjectures.Sample") == ["Conjectures.Sample"],
            "Valid singleton fixture failed")
    rejects(lambda: singleton_log(b"", "Conjectures.Sample"))
    rejects(lambda: singleton_log(b"replaying Conjectures.Sample\nreplaying Conjectures.Sample\n", "Conjectures.Sample"))
    rejects(lambda: singleton_log(b"replaying Conjectures.Sample.Child\n", "Conjectures.Sample"))
    safe_archive(zipped([("receipt.json", b"{}")]))
    rejects(lambda: safe_archive(zipped([("../receipt.json", b"{}")])))
    rejects(lambda: safe_archive(zipped([("/receipt.json", b"{}")])))
    rejects(lambda: safe_archive(zipped([("a/./receipt.json", b"{}")])))
    rejects(lambda: safe_archive(zipped([("receipt.json", b"{}"), ("receipt.json", b"{}")])))
    good = {"command": ["/lean", "-j1", "-M4500", "-DwarningAsError=true",
                        "-o", "/stage/lib/lean/Conjectures/Sample.olean", "Conjectures/Sample.lean"]}
    source_command(good, "/lean", "Conjectures.Sample", "/stage")
    rejects(lambda: source_command({"command": [x for x in good["command"] if x != "-DwarningAsError=true"]},
                                   "/lean", "Conjectures.Sample", "/stage"))
    rejects(lambda: source_command({"command": good["command"] + ["-DwarningAsError=false"]},
                                   "/lean", "Conjectures.Sample", "/stage"))
    kernel_command({"command": ["/bin/stdbuf", "-oL", "-eL", "/checker", "-v", "Conjectures.Sample"]},
                   "/checker", "Conjectures.Sample")
    rejects(lambda: kernel_command({"command": ["/checker", "-v", "Conjectures"]},
                                   "/checker", "Conjectures.Sample"))
    print("Fixed preservation protocol fixtures passed", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if args.self_test:
        self_test()
        return
    run = api("/actions/runs/" + str(RECORD["run"]))
    require(run["id"] == RECORD["run"] and run["head_sha"] == RECORD["head"]
            and run["name"] == RECORD["workflow"] and run["run_attempt"] == RECORD["attempt"]
            and run["head_branch"] == "main" and run["head_repository"]["full_name"] == REPO
            and run["status"] == "completed" and run["conclusion"] == "success",
            "Fixed original run identity/completion differs")
    artifact = api("/actions/artifacts/" + str(RECORD["artifact"]))
    require(artifact["id"] == RECORD["artifact"] and artifact["name"] == RECORD["name"]
            and artifact["expired"] is False and artifact["workflow_run"]["id"] == RECORD["run"]
            and artifact["workflow_run"]["head_sha"] == RECORD["head"]
            and artifact["size_in_bytes"] == RECORD["zip_bytes"]
            and artifact["digest"] == "sha256:" + RECORD["zip_sha256"]
            and artifact["archive_download_url"] ==
                API + "/actions/artifacts/" + str(RECORD["artifact"]) + "/zip",
            "Fixed archive identity/digest differs")
    payload = request(artifact["archive_download_url"], MAX_ZIP)
    require(len(payload) == RECORD["zip_bytes"] and sha(payload) == RECORD["zip_sha256"],
            "Actual original archive bytes differ")
    model, controls = frozen_inputs()
    preserved, receipt = check_archive(payload, model, controls)
    directory = "docs/verification/hyperplane-main-exact-" + str(RECORD["run"]) + "/"
    files = {directory + name: raw for name, raw in preserved.items()}
    local = ROOT / ".candidate-artifacts/hyperplane-main-preservation"
    for path, raw in files.items():
        output = local / path
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_bytes(raw)
    print(json.dumps({
        "source_run": RECORD["run"], "receipt_sha256": RECORD["receipt_sha256"],
        "preservation_sha256": sha(preserved["preservation.json"]),
        "sources": 72, "required_theorems": 106, "audit": receipt["axiom_audit"]["summary"],
        "preserved_files": len(files),
    }), flush=True)
    sources = {"lean/" + module.replace(".", "/") + ".lean": digest
               for module, digest in model["source_sha256"].items()}
    sources.update(model["configuration_sha256"])
    publish(files, sources)


if __name__ == "__main__":
    main()
