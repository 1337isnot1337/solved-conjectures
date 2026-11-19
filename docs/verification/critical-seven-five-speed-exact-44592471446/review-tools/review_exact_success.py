#!/usr/bin/env python3
"""Read-only, fail-closed review of a successful Li or lattice hosted gate.

This verifies already-produced evidence. It never invokes Lean or claims to
repeat the kernel's work. The caller must authenticate the archive digest and
run/head relationship against GitHub before using this review for acceptance.
"""
from __future__ import annotations

import argparse
import ast
from collections import Counter
import datetime
import hashlib
import json
from pathlib import Path
import re
import subprocess
import zipfile

ALLOWED = ["propext", "Classical.choice", "Quot.sound"]
FACETS = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig")
LEAN = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
AUDIT_HELPER = "53c289baad523164bbef5561910fcdc44bc40efba2b8efe8e7212c30db3a663f"
KINDS = {"axiom", "definition", "theorem", "opaque", "quotient", "constructor", "recursor", "inductive"}


def require(value, message):
    if not value:
        raise ValueError(message)


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def file_sha(path):
    require(path.is_file() and not path.is_symlink(), "Expected regular file: " + str(path))
    return sha(path.read_bytes())


def header(text):
    """Only tokenize the Lean import header, including nested block comments."""
    i = 0
    while i < len(text):
        if text[i].isspace():
            i += 1
        elif text.startswith("--", i):
            end = text.find("\n", i)
            i = len(text) if end < 0 else end
        elif text.startswith("/-", i):
            depth = 1
            i += 2
            while depth and i < len(text):
                if text.startswith("/-", i):
                    depth += 1
                    i += 2
                elif text.startswith("-/", i):
                    depth -= 1
                    i += 2
                else:
                    i += 1
            require(depth == 0, "Unterminated Lean header comment")
        else:
            start = i
            while i < len(text) and not text[i].isspace() and not text.startswith(("--", "/-"), i):
                i += 1
            yield text[start:i]


def imports(text):
    tokens = iter(header(text))
    token = next(tokens, None)
    if token == "module":
        token = next(tokens, None)
    if token == "prelude":
        token = next(tokens, None)
    while token is not None:
        if token == "public":
            token = next(tokens, None)
        if token == "meta":
            token = next(tokens, None)
        if token != "import":
            break
        module = next(tokens, None)
        if module == "all":
            module = next(tokens, None)
        require(isinstance(module, str) and re.fullmatch(r"[A-Za-z0-9_]+(?:\.[A-Za-z0-9_]+)*", module), "Invalid import")
        yield module
        token = next(tokens, None)


def audit_inventory(log, inventory, modules, modern, required, prefixes):
    rows = []
    for line in log.splitlines():
        if "ALL-OWNED-JSON " in line:
            rows.append(json.loads(line.split("ALL-OWNED-JSON ", 1)[1]))
    tags = {kind: [] for kind in ("module", "declaration", "required", "passed")}
    for row in rows:
        require(row.get("tag") in tags, "Unexpected audit record")
        tags[row["tag"]].append(row)
    module_rows = {r["module"]: r for r in tags["module"]}
    declarations = {r["name"]: r for r in tags["declaration"]}
    require(len(module_rows) == len(tags["module"]) and set(module_rows) == set(modules), "Audit module inventory differs")
    require(len(declarations) == len(tags["declaration"]), "Duplicate audited declaration")
    raw = set()
    for name, row in module_rows.items():
        require(row["modern"] == modern[name] and row["import_all"] is True and row["has_data"] is True, "Missing raw/private module data")
        require(len(row["names"]) == len(set(row["names"])), "Duplicate raw declaration")
        raw.update(row["names"])
    require(raw <= set(declarations), "Raw declaration escaped the audit")
    private = {}
    for name, row in declarations.items():
        user = row["private_user_name"] or name
        expected = [row["owner"] in module_rows, name in raw, any(user.startswith(p) for p in prefixes)]
        actual = [row[k] for k in ("by_module", "by_serialized", "by_legacy_prefix")]
        require(any(expected) and actual == expected, "Declaration ownership differs: " + name)
        require(row["kind"] in KINDS and set(row["axioms"]) <= set(ALLOWED), "Unapproved kind/axioms: " + name)
        require(row["kind"] != "axiom" or name in ALLOWED, "Direct project axiom: " + name)
        if row["private_user_name"] is not None:
            private[name] = row["private_user_name"]
    for row in module_rows.values():
        require(row["private_count"] == sum(n in private for n in row["names"]), "Private declaration count differs")
    required_rows = [r["name"] for r in tags["required"]]
    require(len(required_rows) == len(set(required_rows)) and set(required_rows) == set(required), "Required endpoint inventory differs")
    require(all(n in declarations and declarations[n]["kind"] == "theorem" for n in required), "Required endpoint is absent or not a theorem")
    kinds = dict(Counter(r["kind"] for r in declarations.values()))
    summary = {"tag": "passed", "modules": len(modules), "declarations": len(declarations), "theorems": kinds.get("theorem", 0), "private_declarations": len(private), "raw_declarations": len(raw), "required": len(required), "allowed_axioms": ALLOWED}
    require(tags["passed"] == [summary], "Audit summary is not exact")
    expected_inventory = {"summary": summary, "modules": module_rows, "declarations": declarations, "private_declarations": private, "required": required_rows, "kind_counts": kinds, "all_owned_declarations_audited": True, "exact_raw_private_visibility": True}
    require(inventory == expected_inventory, "Stored inventory differs from audit log")
    return summary


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("artifact_directory", type=Path)
    parser.add_argument("--kind", choices=("li", "rectangular", "four-speed", "seven-five-speed", "radius"), required=True)
    parser.add_argument("--git-store", type=Path, required=True)
    parser.add_argument("--head-sha", required=True)
    parser.add_argument("--archive-sha256", required=True)
    parser.add_argument("--run-id", type=int, required=True)
    parser.add_argument("--artifact-id", type=int, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    stage = args.artifact_directory.resolve()
    require(args.output.resolve() != stage and stage not in args.output.resolve().parents,
            "Review output must not modify the authenticated extraction")
    archive = stage.parent / "artifact.zip"
    require(file_sha(archive) == args.archive_sha256, "Archive digest differs")
    with zipfile.ZipFile(archive) as z:
        names = z.namelist()
        require(len(names) == len(set(names)), "Duplicate ZIP member")
        archive_files = set()
        for name in names:
            rel = Path(name)
            require(not rel.is_absolute() and ".." not in rel.parts, "Unsafe ZIP member")
            if not name.endswith("/"):
                require(rel.as_posix() == name and name not in archive_files, "Noncanonical ZIP member")
                archive_files.add(name)
                require(file_sha(stage / rel) == sha(z.read(name)), "Extracted member differs: " + name)
        extracted = list(stage.rglob("*"))
        require(not any(p.is_symlink() for p in extracted), "Symlink in extracted evidence")
        require({p.relative_to(stage).as_posix() for p in extracted if p.is_file()} == archive_files,
                "Extraction contains evidence outside authenticated ZIP inventory")

    receipt = json.loads((stage / "receipt.json").read_text())
    require(receipt["status"] == "passed" and receipt.get("all_frozen_hashes_unchanged") is True, "Gate did not completely pass")
    require(receipt["git_commit"] == args.head_sha, "Gate commit differs")
    require(receipt["toolchain"]["lean_sha256"] == LEAN and receipt["toolchain"]["checker_sha256"] == CHECKER, "Compiler or checker digest differs")
    require(receipt["axiom_whitelist"] == ALLOWED, "Axiom whitelist differs")
    require(receipt["source_workers"] == receipt["kernel_threads"] == 1, "Worker policy differs")
    require(receipt["source_policy"] == {"warning_as_error": True, "linter_override": False, "fresh_project_objects": True}, "Source policy differs")
    settings = {
        "li": ("li", None, "li-exact", "LiExactAudit.lean"),
        "rectangular": ("rectangular-lattice", "algebra", "rectangular-lattice-algebra", "RectangularLatticeAudit.lean"),
        "four-speed": ("lattice-norm-four-speed", "bounds", "lattice-norm-four-speed-bounds", "LatticeNormFourSpeedAudit.lean"),
        "seven-five-speed": ("critical-seven-five-speed", "bounds", "critical-seven-five-speed-bounds", "CriticalSevenFiveSpeedAudit.lean"),
        "radius": ("two-parameter-radius", "bound", "two-parameter-radius-bound", "TwoParameterRadiusAudit.lean"),
    }
    kind, task, stage_name, audit_name = settings[args.kind]
    require(receipt["schema"] == kind + "-exact-receipt-v1", "Receipt schema differs")
    require(receipt["accepted_registry_changed"] is False, "Candidate receipt claims an accepted-registry change")
    model_name = "docs/" + kind + "-exact-sources.json"
    gate_name = "scripts/verify_" + kind.replace("-", "_") + "_exact.py"
    workflow_name = ".github/workflows/lean-" + kind + "-exact.yml"

    def committed(path):
        return subprocess.check_output(["git", "show", args.head_sha + ":" + path], cwd=args.git_store)

    model = json.loads(committed(model_name))
    if task is not None:
        require(model["schema"] == kind + "-exact-model-v1", "Model packet schema differs")
        model = model["tasks"][task]
    require(model["schema"] == kind + "-exact-v1", "Source model schema differs")
    expected_controls = {**model["configuration_sha256"], **model["helper_sha256"], **{p: sha(committed(p)) for p in (model_name, gate_name, workflow_name)}}
    require(receipt["gate_sha256"] == expected_controls, "Control inventory differs")
    for path, digest in expected_controls.items():
        require(sha(committed(path)) == digest, "Committed control differs: " + path)
    require(receipt["roots"] == model["roots"] and receipt["required_theorems"] == model["required_theorems"], "Root or endpoint inventory differs")
    require(receipt["source_sha256"] == model["source_sha256"], "Source inventory differs")
    modules = receipt["project_modules"]
    required = receipt["required_theorems"]
    require(len(modules) == len(set(modules)) == model["project_module_count"] and set(modules) == set(model["source_sha256"]), "Module inventory is not exact")
    require(len(required) == len(set(required)) == model["required_theorem_count"] and required, "Endpoint inventory is not exact")
    require(set(receipt["source_checks"]) == set(receipt["kernel_checks"]) == set(modules), "Missing source or replay target")
    require(not receipt.get("source_failures") and not receipt.get("blocked_sources"), "Source failures or blocked modules remain")
    prefix = "/home/runner/work/solved-conjectures/solved-conjectures/.candidate-artifacts/" + stage_name + "/"

    def relocated(remote):
        require(remote.startswith(prefix), "Evidence path outside hosted stage")
        rel = Path(remote[len(prefix):])
        require(not rel.is_absolute() and ".." not in rel.parts, "Invalid evidence path")
        return stage / rel

    def process(check, expected_command, progress_name):
        require(check["exit_code"] == 0 and check["timed_out"] is False, "Recorded process did not pass")
        require(check["command"] == expected_command, "Recorded command differs")
        log = relocated(check["log"])
        require(file_sha(log) == check["log_sha256"], "Process log differs")
        progress = stage / "progress" / progress_name
        raw = json.loads(progress.read_text())
        require({"command", "exit_code", "timed_out", "log", "log_sha256", "seconds", "peak_rss_kib"} <= set(raw),
                "Incomplete process profile")
        require(all(check.get(k) == v for k, v in raw.items()), "Profile disagrees with receipt")
        if "progress" in check:
            require(relocated(check["progress"]) == progress and file_sha(progress) == check["progress_sha256"], "Profile digest differs")
        return log.read_text()

    compiler = receipt["toolchain"]["lean_path"]
    options = [compiler, "-j1", "-M4500", "-DwarningAsError=true"]
    objects = {}
    dependencies = {}
    for module in modules:
        stem = module.replace(".", "/")
        source = stage / "src" / (stem + ".lean")
        digest = model["source_sha256"][module]
        require(file_sha(source) == digest == sha(committed("lean/" + stem + ".lean")), "Source differs: " + module)
        text = source.read_text()
        require(receipt["modern_modules"][module] == (next(header(text), None) == "module"), "Module format differs")
        dependencies[module] = [d for d in imports(text) if d.startswith(("Conjectures.", "Solitaire.")) or d in {"Conjectures", "Solitaire"}]
        require(all(d in modules[:modules.index(module)] for d in dependencies[module]), "Missing or out-of-order project dependency")
        check = receipt["source_checks"][module]
        process(check, options + ["-o", prefix + "lib/lean/" + stem + ".olean", stem + ".lean"], module + ".source.json")
        facets = {suffix: file_sha(stage / "lib/lean" / (stem + suffix)) for suffix in FACETS if (stage / "lib/lean" / (stem + suffix)).exists()}
        needed = set(FACETS[:3]) if receipt["modern_modules"][module] else {".olean"}
        require(needed <= set(facets) and ((".olean.private" in facets) == (".olean.server" in facets)), "Object facets incomplete")
        if args.kind == "li":
            require(check["source_sha256"] == digest and check["artifact_sha256"] == facets,
                    "Per-source Li input/output receipt differs")
            expected_imports = {dep: {"source_sha256": model["source_sha256"][dep], "artifact_sha256": objects[dep]}
                                for dep in dependencies[module]}
            require(check["direct_project_imports"] == expected_imports,
                    "Li direct-import source/object snapshot differs")
        objects[module] = facets
    present = {".".join(p.relative_to(stage / "lib/lean").with_suffix("").parts) for p in (stage / "lib/lean").rglob("*.olean")}
    require(present == set(modules) and objects == receipt["artifact_sha256"], "Object closure differs")
    closure = set()
    def visit(name):
        if name not in closure:
            require(name in dependencies, "Root dependency missing")
            closure.add(name)
            for dep in dependencies[name]:
                visit(dep)
    for root in model["roots"]:
        visit(root)
    require(closure == set(modules), "Extra module outside root import closure")

    audit_check = receipt["axiom_audit"]
    audit_log = process(audit_check, options + [audit_name], "all-owned-audit.json")
    require(all(audit_check.get(k) is True for k in ("all_owned_declarations_audited", "exact_raw_private_visibility", "explicit_import_all")), "Incomplete audit claims")
    require(file_sha(stage / "src" / audit_name) == audit_check["audit_source_sha256"], "Audit source differs")
    # Evaluate only the already-reviewed, digest-pinned pure generator function.
    # Repository top-level code and imports are never executed.
    helper = committed("scripts/audit_lean_all_owned.py")
    require(sha(helper) == AUDIT_HELPER, "Audit helper changed; review it before accepting new evidence")
    generator = [n for n in ast.parse(helper).body if isinstance(n, ast.FunctionDef) and n.name == "audit_source"]
    require(len(generator) == 1, "No unique audit source generator")
    namespace = {"json": json, "ALLOWED": tuple(ALLOWED), "MODULE": re.compile(r"[A-Za-z0-9_]+(?:\.[A-Za-z0-9_]+)*")}
    exec(compile(ast.Module(body=generator, type_ignores=[]), "reviewed-audit-generator", "exec"), namespace)
    audit_raw = namespace["audit_source"](modules, required, model["legacy_prefixes"]).encode()
    require((stage / "src" / audit_name).read_bytes() == audit_raw, "Actual audit source differs from exact reviewed generator")
    require(file_sha(stage / "declaration-inventory.json") == audit_check["declaration_inventory_sha256"], "Audit inventory digest differs")
    inventory = json.loads((stage / "declaration-inventory.json").read_text())
    summary = audit_inventory(audit_log, inventory, modules, receipt["modern_modules"], required, model["legacy_prefixes"])
    require(summary == audit_check["summary"], "Audit summary differs")

    # The reviewed controller generates the exact statements from this literal;
    # extract its AST value without executing repository code.
    if args.kind == "li":
        values = [n.value for n in ast.parse(committed(gate_name)).body if isinstance(n, ast.Assign) and any(isinstance(t, ast.Name) and t.id == "STATEMENTS" for t in n.targets)]
        require(len(values) == 1, "No unique literal statement contract")
        statements = ast.literal_eval(values[0]).encode()
        require((stage / "src/LiExactStatements.lean").read_bytes() == statements, "Literal statement source differs")
        require(sha(statements) == receipt["literal_statements_sha256"] == model["literal_statements_sha256"], "Literal statement digest differs")
        process(receipt["literal_statements"], options + ["LiExactStatements.lean"], "literal-statements.json")
        require(receipt.get("literal_li_scope_checked") is True and receipt.get("infinite_variable_ring_constructed") is False, "Li scope flags differ")
    else:
        require(receipt.get("stated_component_scope_checked") is True and receipt.get("universal_classification_claimed") is False, "Rectangular scope flags differ")

    for module in modules:
        check = receipt["kernel_checks"][module]
        command = [receipt["toolchain"]["checker_path"], "-v", module]
        recorded = check["command"]
        if len(recorded) == len(command) + 3:
            require(Path(recorded[0]).name == "stdbuf" and recorded[1:3] == ["-oL", "-eL"], "Unknown replay wrapper")
            command = recorded[:3] + command
        log = process(check, command, module + ".kernel.json")
        actual = re.findall(r"^replaying ((?:Conjectures|Solitaire)(?:\.[A-Za-z0-9_]+)*)$", log, re.M)
        require(actual == check["replayed_modules"] == [module] and check["exact_singleton_target"] is True, "Replay target differs")
        require([m for m in modules if m == module or m.startswith(module + ".")] == [module], "Replay prefix selects multiple modules")
    replay = receipt["kernel_replay"]
    require(replay["replayed_modules"] == modules and all(replay[k] is True for k in ("exact_project_closure", "all_modules_replayed_as_targets", "fresh_process_per_module")), "Replay summary is incomplete")
    result = {"schema": "hosted-exact-success-independent-review-v1", "reviewed_at_utc": datetime.datetime.now(datetime.timezone.utc).isoformat(), "reviewer_sha256": file_sha(Path(__file__).resolve()), "status": "evidence_review_passed", "kind": args.kind, "run_id": args.run_id, "artifact_id": args.artifact_id, "head_sha": args.head_sha, "archive_sha256": args.archive_sha256, "receipt_sha256": file_sha(stage / "receipt.json"), "project_modules": len(modules), "required_theorems": len(required), "direct_project_import_edges": sum(map(len, dependencies.values())), "source_control_object_log_progress_bytes_match": True, "raw_private_declaration_inventory_match": True, "standard_axiom_whitelist": ALLOWED, "all_required_endpoints_are_theorems": True, "stock_replay_targets_match_exact_closure": True, "audit_summary": summary, "new_lean_processes_run_by_review": 0, "accepted_registry_changes_authorized_by_review": False, "external_authentication_obligation": "Caller must separately authenticate the GitHub run/head association and artifact archive SHA-256."}
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
