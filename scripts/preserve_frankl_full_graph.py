#!/usr/bin/env python3
"""Authenticate and preserve the fixed full-graph source/audit/kernel evidence."""
from __future__ import annotations

import argparse
import gzip
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
MODEL = "docs/frankl-full-graph-sources.json"
ALLOWED = ("propext", "Classical.choice", "Quot.sound")
FACETS = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig")
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
GATE_INPUTS = (
    "scripts/verify_frankl_full_graph.py",
    "scripts/verify_frankl_graph_pilot.py",
    "scripts/verify_frankl_graph_helpers.py",
    "scripts/verify_frankl_orbit_batches.py",
    "scripts/verify_frankl_fc_candidate.py",
    "scripts/verify_line_size_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    ".github/workflows/lean-frankl-full-graph.yml",
    "docs/frankl-full-graph-sources.json",
    "docs/frankl-graph-helpers-sources.json",
    "lean/Conjectures/FranklSpanFourGraphHelpers.lean",
    "results/frankl-generator-families/generate_span_four_full_graph_lean.py",
    "results/frankl-generator-families/generate_span_four_graph_certificate.py",
    "results/frankl-generator-families/span_four.py",
    "results/frankl-generator-families/window_filter.cpp",
    "results/frankl-generator-families/window_replay.cpp",
    "results/frankl-generator-families/width_four_weight_candidates.json",
    "lean/lean-toolchain",
    "lean/lakefile.toml",
    "lean/lake-manifest.json",
)
RECORD = {
    "run": 44518872729,
    "head": "2fa3e1206c82e89210f608016c669a5316a7b831",
    "workflow": "Lean Frankl full initial graph",
    "attempt": 1,
    "artifact": 14531096618,
    "name": "frankl-full-initial-graph",
    "zip_bytes": 41338718,
    "zip_sha256": "54088c6bdac3acb1ebafb1aae015c9fd868c2739f1f35788a533f5d3441eef04",
    "receipt_sha256": "344520299255ff2b162ed518d066f5de4afb4f311392f25bca4bc856b939403d"
}
PROFILE_FIELDS = {
    "command", "exit_code", "seconds", "peak_rss_kib", "user_seconds",
    "system_seconds", "timed_out", "log", "log_sha256",
}
MAX_ZIP = 128 * 1024 * 1024
MAX_UNCOMPRESSED = 1024 * 1024 * 1024

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
        "User-Agent": "fixed-frankl-full-graph-preserver",
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
    controls = {}
    for path in GATE_INPUTS:
        value = git_bytes(RECORD["head"], path)
        require(value is not None, "Frozen graph input is unavailable: " + path)
        controls[path] = value
    model = json.loads(controls[MODEL])
    require(model["schema"] == "frankl-span-four-full-graph-v1"
            and model["root"] == "Conjectures.FranklSpanFourGraphCertificate",
            "Unexpected complete graph model")
    require(len(model["source_sha256"]) == 124
            and len(model["required_theorems"]) == 344
            and len(model["required_explicit_private_proofs"]) == 285
            and len(model["rendered_sources"]) == 84, "Frozen graph inventories differ")
    require(controls["lean/lean-toolchain"] == b"leanprover/lean4:v4.35.0\n",
            "Pinned Lean version differs")
    for path, digest in model["engine_sha256"].items():
        require(path in controls and sha(controls[path]) == digest, "Pinned graph engine differs: " + path)
    return model, controls


def check_archive(payload, model, controls):
    archive, names = safe_archive(payload)
    require(len([name for name in names if not name.endswith("/")]) == 1334,
            "Fixed original archive member count differs")
    prefix = "frankl-full-graph/"
    reproduced = "frankl-full-graph-reproduction/"
    validated = set()
    def read(member):
        require(member in names and not member.endswith("/"), "Missing archived evidence: " + member)
        validated.add(member)
        return archive.read(member)
    raw_receipt = read(prefix + "receipt.json")
    require(sha(raw_receipt) == RECORD["receipt_sha256"], "Frozen original receipt digest differs")
    receipt = json.loads(raw_receipt)
    require(receipt["status"] == "passed" and receipt["git_commit"] == RECORD["head"]
            and receipt["all_frozen_hashes_unchanged"] is True,
            "Original graph gate did not complete with frozen bytes")
    require(receipt["root"] == model["root"] and receipt["scope"] == model["scope"],
            "Original graph theorem scope differs")
    require(receipt["gate_sha256"] == {path: sha(raw) for path, raw in controls.items()},
            "Complete original gate/source/control inventory differs")
    require(receipt["axiom_whitelist"] == list(ALLOWED)
            and receipt["source_workers"] == 4 and receipt["kernel_threads"] == 1
            and receipt["kernel_mode"] == "fresh singleton stock-checker process for each exact project module",
            "Original audit/execution policy differs")
    toolchain = receipt["toolchain"]
    require(toolchain["lean_sha256"] == LEAN_SHA256
            and toolchain["checker_sha256"] == CHECKER_SHA256
            and re.match(r"Lean \(version 4\.35\.0(?:,|\))", toolchain["lean_version"]),
            "Pinned compiler/checker/version differs")
    lean, checker = toolchain["lean_path"], toolchain["checker_path"]
    require(PurePosixPath(lean).is_absolute() and PurePosixPath(checker).is_absolute()
            and PurePosixPath(lean).name == "lean" and PurePosixPath(checker).name == "leanchecker",
            "Recorded executable paths differ")
    modules = receipt["project_modules"]
    required, private = receipt["required_endpoints"], receipt["required_private_endpoints"]
    require(len(modules) == len(set(modules)) == 124
            and set(modules) == set(model["source_sha256"]), "Exact graph module inventory differs")
    require(required == model["required_theorems"] == sorted(set(required))
            and private == model["required_explicit_private_proofs"] == sorted(set(private)),
            "Required public/private theorem inventories differ")
    require(receipt["source_sha256"] == model["source_sha256"]
            and set(receipt["artifact_sha256"]) == set(modules)
            and set(receipt["source_checks"]) == set(modules)
            and set(receipt["kernel_checks"]) == set(modules),
            "Source/object/process inventories differ")
    preserved = {"receipt.json": raw_receipt}
    expected_objects, expected_logs, expected_progress = set(), set(), set()
    sources, graph = {}, {}

    with tempfile.TemporaryDirectory(prefix="frankl-original-graph-") as directory:
        temporary = Path(directory)
        for path, raw in controls.items():
            target = temporary / path
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(raw)
        sys.path.insert(0, str(temporary / "scripts"))
        try:
            original = importlib.import_module("verify_frankl_full_graph")
            helpers = importlib.import_module("verify_frankl_graph_helpers")
            pilot = importlib.import_module("verify_frankl_graph_pilot")
            replay = importlib.import_module("replay_lean")
            for helper in (original, helpers, pilot, replay):
                require(Path(helper.__file__).resolve().parent == (temporary / "scripts").resolve(),
                        "A historical helper was not loaded from its frozen bytes")
            require(original.GATE_INPUTS == GATE_INPUTS, "Original gate inputs differ from preservation scope")
            for module in modules:
                stem = module.replace(".", "/")
                raw = read(prefix + "src/" + stem + ".lean")
                require(sha(raw) == model["source_sha256"][module]
                        and raw == git_bytes(RECORD["head"], "lean/" + stem + ".lean"),
                        "Actual archived/source-commit bytes differ: " + module)
                sources[module] = raw
                target = temporary / "lean" / (stem + ".lean")
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes(raw)
                require(next(replay.header_tokens(raw.decode()), None) == "module",
                        "The frozen graph expected modern private-facet modules")
                graph[module] = [name for name in replay.imports_of(target)
                    if name == "Conjectures" or name.startswith("Conjectures.")
                    or name == "Solitaire" or name.startswith("Solitaire.")]
                require(set(graph[module]) <= set(modules), "Unrecorded local proof dependency")
                facets = receipt["artifact_sha256"][module]
                require(set(FACETS[:3]) <= set(facets) <= set(FACETS), "Incomplete modern proof facets")
                for suffix, digest in facets.items():
                    member = prefix + "lib/lean/" + stem + suffix
                    require(sha(read(member)) == digest, "Actual proof-object facet differs: " + member)
                    expected_objects.add(member)
            require({name for name in names if name.startswith(prefix + "lib/lean/")
                    and name.endswith(FACETS)} == expected_objects,
                    "Extra or missing project proof-object facet")
            require({name for name in names if name.startswith(prefix + "src/Conjectures/")
                    and name.endswith(".lean")} ==
                    {prefix + "src/" + m.replace(".", "/") + ".lean" for m in modules},
                    "Extra or missing staged project source")
            reachable, todo = set(), [model["root"]]
            while todo:
                module = todo.pop()
                require(module in graph, "A root/dependency is outside the exact closure")
                if module not in reachable:
                    reachable.add(module)
                    todo.extend(graph[module])
            require(reachable == set(modules), "Proof closure is not exactly root-reachable")
            positions = {module: index for index, module in enumerate(modules)}
            for module, dependencies in graph.items():
                require(all(positions[dependency] < positions[module] for dependency in dependencies),
                        "Original module order is not topological")
                require([m for m in modules if m == module or m.startswith(module + ".")] == [module],
                        "Stock checker prefix is not an exact singleton")
            explicit = helpers.explicit_private_proofs(modules)
            require(sorted(name for group in explicit.values() for name in group) == private,
                    "Source-level explicit private proof inventory differs")

            first = modules[0]
            suffix = "/logs/" + first + ".source.log"
            first_log = receipt["source_checks"][first]["log"]
            require(first_log.endswith(suffix), "Unexpected original process-log path")
            stage = first_log[:-len(suffix)]
            require(PurePosixPath(stage).is_absolute() and ".." not in PurePosixPath(stage).parts,
                    "Unexpected original proof stage")
            def process(check, logname):
                require(check["exit_code"] == 0 and check["timed_out"] is False
                        and check["log"] == stage + "/logs/" + logname,
                        "Original process failed, timed out, or used another stage")
                raw = read(prefix + "logs/" + logname)
                require(sha(raw) == check["log_sha256"], "Original process log differs")
                progress_name = logname[:-len(".log")] + ".json"
                progress_raw = read(prefix + "progress/" + progress_name)
                progress = json.loads(progress_raw)
                require(set(progress) == PROFILE_FIELDS
                        and all(progress[key] == check[key] for key in PROFILE_FIELDS),
                        "Original process progress receipt differs")
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
                lean, "-j1", "-M4500", "-DwarningAsError=true", "FullGraphAudit.lean"],
                "Original complete audit command differs")
            require(audit_check["all_declarations_audited"] is True
                    and audit_check["explicit_import_all"] is True,
                    "Original complete owned-declaration audit is missing")
            audit_raw = read(prefix + "src/FullGraphAudit.lean")
            require(audit_raw == pilot.audit_source(modules, required, private).encode()
                    and sha(audit_raw) == receipt["audit_source_sha256"]
                    and sha(audit_raw) == audit_check["audit_source_sha256"],
                    "Original audit source differs from the frozen generated audit")
            audit_log = process(audit_check, "axiom-audit.log")
            audit_stage = temporary / "audit-reconstruction"
            (audit_stage / "logs").mkdir(parents=True)
            (audit_stage / "logs/axiom-audit.log").write_bytes(audit_log)
            inventory_record = pilot.declaration_inventory(audit_stage, modules, required, private)
            inventory_raw = read(prefix + "declaration-inventory.json")
            require(inventory_record == receipt["declaration_inventory"]
                    and inventory_raw == (audit_stage / "declaration-inventory.json").read_bytes(),
                    "Original all-owned declaration/private inventory differs")
            inventory = json.loads(inventory_raw)
            declarations = inventory["declarations"]
            private_rows = inventory["private_declarations"]
            theorem_rows = inventory["private_theorems"]
            require(len(theorem_rows) == len(set(theorem_rows))
                    and set(theorem_rows) <= set(private_rows), "Repeated or unowned private theorem")
            require(all(row.split(" ", 1)[0] in declarations for row in private_rows),
                    "A private declaration is outside the owned declaration audit")
            require(set(private) <= {row.split(" ", 1)[1] for row in theorem_rows},
                    "An explicitly required private theorem is missing")
            preserved["FullGraphAudit.lean"] = audit_raw
            preserved["declaration-inventory.json"] = inventory_raw
            targets = []
            for module in modules:
                check = receipt["kernel_checks"][module]
                kernel_command(check, checker, module)
                actual = singleton_log(process(check, module + ".kernel.log"), module)
                require(check["replayed_modules"] == actual and check["exact_singleton_target"] is True,
                        "Original singleton target assertion differs")
                targets.extend(actual)
            kernel = receipt["kernel_replay"]
            require(targets == modules and len(set(targets)) == 124
                    and kernel["replayed_modules"] == modules
                    and kernel["exact_project_closure"] is True
                    and kernel["all_modules_replayed_as_targets"] is True
                    and kernel["fresh_process_per_module"] is True
                    and kernel["singleton_target_guards"] is True,
                    "Original stock replay missed an exact module target")
            require(kernel["seconds"] == round(sum(c["seconds"] for c in receipt["kernel_checks"].values()), 3)
                    and kernel["peak_rss_kib"] == max(c["peak_rss_kib"] for c in receipt["kernel_checks"].values()),
                    "Original replay measurements disagree")
            require({n for n in names if n.startswith(prefix + "logs/") and not n.endswith("/")} == expected_logs
                    and {n for n in names if n.startswith(prefix + "progress/") and not n.endswith("/")} == expected_progress,
                    "Extra or missing original process evidence")
        finally:
            sys.path.remove(str(temporary / "scripts"))

    reproduction_raw = read(reproduced + "receipt.json")
    reproduction = json.loads(reproduction_raw)
    require(reproduction == receipt["reproduction"] and reproduction["status"] == "reproduced"
            and reproduction["formal_status"] == "Untrusted witness reproduction only."
            and reproduction["rendered_source_sha256"] == model["rendered_sources"]
            and reproduction["candidate_snapshot_sha256"] == model["candidate_snapshot_sha256"],
            "Original untrusted reproduction evidence differs")
    for name, digest in model["rendered_sources"].items():
        raw = read(reproduced + "Conjectures/" + name)
        module = "Conjectures." + name[:-len(".lean")]
        require(sha(raw) == digest and raw == sources[module], "Original regenerated source differs")
    candidate_raw = read(reproduced + "candidate.json.gz")
    with gzip.GzipFile(fileobj=io.BytesIO(candidate_raw)) as stream:
        decoded = stream.read(128 * 1024 * 1024 + 1)
    require(len(decoded) <= 128 * 1024 * 1024
            and sha(decoded) == model["candidate_snapshot_sha256"],
            "Original candidate snapshot differs")
    report_raw = read(reproduced + "producer-report.json")
    require(sha(report_raw) == reproduction["report_sha256"], "Original producer report differs")
    report = json.loads(report_raw)["full_graph"]
    require({key: report[key] for key in model["producer_layout"]} == model["producer_layout"]
            and report["root"] == model["root"]
            and sorted(report["required_endpoints"]) == model["generated_endpoints"],
            "Original producer report layout differs")
    producer = reproduction["producer"]
    require(producer["exit_code"] == 0 and producer["timed_out"] is False,
            "Original witness producer failed")
    reproduction_stage = stage + "-reproduction"
    require(producer["log"] == reproduction_stage + "/producer.log"
            and len(producer["command"]) == 18
            and PurePosixPath(producer["command"][0]).is_absolute(),
            "Original witness producer process layout differs")
    repository = stage.rsplit("/.candidate-artifacts/", 1)[0]
    expected_command = [
        producer["command"][0],
        repository + "/results/frankl-generator-families/generate_span_four_full_graph_lean.py",
        "--output", reproduction_stage + "/candidate.json.gz",
        "--report", reproduction_stage + "/producer-report.json",
        "--full-dir", reproduction_stage + "/Conjectures",
        "--checks-per-module", "8", "--extension-limit", "12000",
        "--table-leaf-size", "255", "--table-module-nodes", "4096",
        "--edge-limit", "1024",
    ]
    require(producer["command"] == expected_command, "Original witness producer command differs")
    producer_log = read(reproduced + "producer.log")
    producer_progress = read(reproduced + "producer-progress.json")
    require(sha(producer_log) == producer["log_sha256"] and json.loads(producer_progress) == producer,
            "Original producer log/progress differs")
    preserved.update({
        "reproduction/receipt.json": reproduction_raw,
        "reproduction/producer-report.json": report_raw,
        "reproduction/producer.log": producer_log,
        "reproduction/producer-progress.json": producer_progress,
    })
    require({name for name in names if not name.endswith("/")} == validated,
            "Original archive has unvalidated or missing files")
    for path, raw in controls.items():
        preserved["controls/" + path] = raw
    metadata = {
        "schema": "frankl-full-graph-preservation-v1",
        "status": "original_passed_evidence_authenticated",
        "binding": RECORD, "receipt_bytes_unchanged": True,
        "receipt_member": prefix + "receipt.json", "receipt_sha256": sha(raw_receipt),
        "project_modules": modules, "required_theorems": required,
        "required_explicit_private_proofs": private,
        "actual_archive_files_validated": len(validated),
        "actual_archived_sources_rehashed": len(modules),
        "actual_archived_facets_rehashed": len(expected_objects),
        "actual_process_logs_rehashed": len(expected_logs),
        "actual_progress_receipts_validated": len(expected_progress),
        "original_audit_inventory": inventory_record,
        "owned_declarations": len(inventory["declarations"]),
        "private_declarations": len(inventory["private_declarations"]),
        "private_theorems": len(inventory["private_theorems"]),
        "root_reachable_exact_import_closure": True, "strict_commands_validated": True,
        "required_theorem_kind_checks_in_original_audit": True,
        "exact_singleton_stock_targets": targets,
        "source_sha256": receipt["source_sha256"], "artifact_sha256": receipt["artifact_sha256"],
        "toolchain": toolchain, "original_gate_sha256": receipt["gate_sha256"],
        "original_reproduction_sha256": sha(reproduction_raw),
        "candidate_gzip_sha256": sha(candidate_raw),
        "preserver_sha256": sha(Path(__file__).read_bytes()),
        "preserved_file_sha256": {name: sha(raw) for name, raw in sorted(preserved.items())},
        "new_source_compilation": False, "new_axiom_audit": False, "new_kernel_replay": False,
        "accepted_registry_changed": False,
        "scope": "Preserve the original full graph gate: strict source, module-owned declaration audit with explicit private proof inventory, and exact singleton stock replay. Witness reproduction remains untrusted computation. This exporter runs no new Lean proof check.",
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
            print("All fixed full-graph evidence is already preserved", flush=True)
            return
        with tempfile.TemporaryDirectory(prefix="frankl-full-graph-preservation-index-") as directory:
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
                input="Preserve authenticated complete initial-graph proof evidence\n\nOriginal raw receipt, all-owned audit, declaration inventory and process logs. No new Lean proof check or registry change.\n").strip()
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
            "Fixed original graph run identity/completion differs")
    artifact = api("/actions/artifacts/" + str(RECORD["artifact"]))
    require(artifact["id"] == RECORD["artifact"] and artifact["name"] == RECORD["name"]
            and artifact["expired"] is False and artifact["workflow_run"]["id"] == RECORD["run"]
            and artifact["workflow_run"]["head_sha"] == RECORD["head"]
            and artifact["size_in_bytes"] == RECORD["zip_bytes"]
            and artifact["digest"] == "sha256:" + RECORD["zip_sha256"]
            and artifact["archive_download_url"] ==
                API + "/actions/artifacts/" + str(RECORD["artifact"]) + "/zip",
            "Fixed graph archive identity/digest differs")
    payload = request(artifact["archive_download_url"], MAX_ZIP)
    require(len(payload) == RECORD["zip_bytes"] and sha(payload) == RECORD["zip_sha256"],
            "Actual original graph archive bytes differ")
    model, controls = frozen_inputs()
    preserved, receipt = check_archive(payload, model, controls)
    directory = "docs/verification/frankl-full-graph-" + str(RECORD["run"]) + "/"
    files = {directory + name: raw for name, raw in preserved.items()}
    local = ROOT / ".candidate-artifacts/frankl-full-graph-preservation"
    for path, raw in files.items():
        output = local / path
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_bytes(raw)
    metadata = json.loads(preserved["preservation.json"])
    print(json.dumps({
        "source_run": RECORD["run"], "receipt_sha256": RECORD["receipt_sha256"],
        "preservation_sha256": sha(preserved["preservation.json"]),
        "sources": len(receipt["project_modules"]),
        "required_theorems": len(receipt["required_endpoints"]),
        "explicit_private_proofs": len(receipt["required_private_endpoints"]),
        "owned_declarations": metadata["owned_declarations"],
        "private_declarations": metadata["private_declarations"],
        "actual_archived_facets": metadata["actual_archived_facets_rehashed"],
        "preserved_files": len(files),
    }), flush=True)
    sources = {"lean/" + module.replace(".", "/") + ".lean": digest
               for module, digest in model["source_sha256"].items()}
    sources.update({path: sha(controls[path]) for path in (
        "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json")})
    publish(files, sources)


if __name__ == "__main__":
    main()
