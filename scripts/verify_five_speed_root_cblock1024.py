#!/usr/bin/env python3
"""Regenerate and freshly verify the same p199 theorem with contiguous C1024 leaves."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
from graphlib import TopologicalSorter
import re
import shutil
import subprocess
import sys
import tempfile

import audit_lean_all_owned as audit
import verify_frankl_orbit_batches as runtime
from replay_lean import header_tokens, imports_of

ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/five-speed-root-cblock1024-inputs.json"
OWN_INPUTS = (
    "scripts/verify_five_speed_root_cblock1024.py",
    ".github/workflows/lean-five-speed-root-cblock1024.yml",
    MODEL,
)
GENERATED = {}
GENERATION_ROOT = None
GENERATION_FILES = {}
FACETS = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig")
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


def source(module):
    return GENERATED.get(module, ROOT / "lean" / (module.replace(".", "/") + ".lean"))


def exact_singleton(modules, target):
    selected = [m for m in modules if m == target or m.startswith(target + ".")]
    require(selected == [target], "Stock checker prefix is not an exact singleton: " + target)


def check_inputs(model):
    require(model["schema"] == "five-speed-root-cblock1024-inputs-v1", "Unexpected input model")
    require(model["roots"] == ["Conjectures.LonelinessFiveSpeedRootCBlockP0199B1024"],
            "Wrong prime-specific theorem root")
    require(len(model["existing_source_sha256"]) == 31
            and len(model["generated_modules"]) == 15
            and len(set(model["generated_modules"])) == 15
            and len(model["expected_project_modules"]) == 46
            and len(set(model["expected_project_modules"])) == 46,
            "Prime-specific source inventory differs")
    require(set(model["expected_project_modules"]) ==
            set(model["existing_source_sha256"]) | set(model["generated_modules"]),
            "Existing/generated module union differs")
    require(not set(model["existing_source_sha256"]) & set(model["generated_modules"]),
            "Generated candidate overlaps an existing pinned dependency")
    require(len(model["root_required_theorems"]) == 50
            and len(model["required_theorems"]) == len(set(model["required_theorems"])) == 53,
            "Required theorem inventory differs")
    require(model["source_policy"] == {
        "warning_as_error": True, "linter_override": False, "fresh_project_objects": True},
        "Strict source policy differs")
    require(model["generation"] == {
        "prime": 199, "budget": 1024, "bases_per_module": 4, "use_prefix": False,
        "root_module_count": 14, "base_part_count": 12, "finite_leaf_count": 95,
        "d_leaf_count": 0, "c_leaf_count": 78, "cd_prefix_count": 46610},
        "The fixed contiguous-C layout parameters differ")
    for module, digest in model["existing_source_sha256"].items():
        path = ROOT / "lean" / (module.replace(".", "/") + ".lean")
        require(path.is_file() and not path.is_symlink() and sha(path) == digest,
                "Pinned existing proof source differs: " + module)
    for path, digest in {**model["configuration_sha256"], **model["helper_sha256"],
                         **model["producer_sha256"]}.items():
        require(sha(ROOT / path) == digest, "Pinned configuration/helper/producer differs: " + path)


def generate_once(model, directory):
    directory.mkdir(parents=True, exist_ok=False)
    lean = directory / "lean"
    conjectures = lean / "Conjectures"
    conjectures.mkdir(parents=True)
    scalar = "Conjectures.LonelinessFiveSpeedScalarTreeMask0199"
    copied = conjectures / "LonelinessFiveSpeedScalarTreeMask0199.lean"
    shutil.copy2(source(scalar), copied)
    require(sha(copied) == model["existing_source_sha256"][scalar], "Scalar input copy differs")
    packed = "results/five-speed-spectrum/generate_lean_packed_scalar.py"
    quick = "results/five-speed-spectrum/generate_lean_root_cblock_budget.py"
    commands = [
        ("packed", [sys.executable, str(ROOT / packed), "199", "--lean-root", str(lean)]),
        ("quick", [sys.executable, str(ROOT / quick), "--prime", "199", "--budget", "1024",
            "--lean-dir", str(conjectures), "--bases-per-module", "4", "--write",
            "--manifest", str(directory / "root-generated.json")]),
    ]
    for name, command in commands:
        result = subprocess.run(command, cwd=ROOT, capture_output=True, text=True, timeout=120)
        (directory / (name + ".stdout")).write_text(result.stdout)
        (directory / (name + ".stderr")).write_text(result.stderr)
        require(result.returncode == 0, "Pinned layout/scalar producer failed: " + name + "\n" + result.stderr)
    root_manifest = json.loads((directory / "root-generated.json").read_text())
    packed_manifest = json.loads((directory / "packed.stdout").read_text())
    expected = model["generation"]
    for key in ("prime", "budget", "bases_per_module", "use_prefix", "finite_leaf_count",
                "d_leaf_count", "c_leaf_count", "cd_prefix_count"):
        require(root_manifest[key] == expected[key], "Generated layout differs: " + key)
    require(root_manifest["module_count"] == expected["root_module_count"]
            and len(root_manifest["base_parts"]) == expected["base_part_count"],
            "Generated module/part count differs")
    require(root_manifest["generator_sha256"] == model["producer_sha256"][quick]
            and root_manifest["original_generator_sha256"] ==
                model["producer_sha256"]["results/five-speed-spectrum/generate_lean_root_quick.py"]
            and root_manifest["scalar_source_sha256"] == model["existing_source_sha256"][scalar],
            "Layout producer, unchanged original producer or scalar provenance differs")
    intervals = root_manifest["intervals"]
    require(len(intervals) == 78 and sum(row["cd_prefixes"] for row in intervals) == 46610
            and all(0 <= row["cd_prefixes"] <= 1024 and row["count"] > 0 for row in intervals),
            "Recorded C interval work inventory differs")
    for base in sorted({row["base"] for row in intervals}):
        rows = [row for row in intervals if row["base"] == base]
        cursor = 0
        for row in rows:
            require(row["start"] == cursor, "A generated C interval partition has a gap")
            cursor += row["count"]
        require(cursor == 100, "A generated base omits part of its C interval")
    require(root_manifest["required"] == model["root_required_theorems"],
            "Generated root endpoint inventory differs")
    root_modules = [record["module"] for record in root_manifest["modules"]]
    require(len(root_modules) == len(set(root_modules)) == 14,
            "Generated root module list is not exact")
    require(packed_manifest["module"] == "Conjectures.LonelinessFiveSpeedPackedScalar199"
            and packed_manifest["prime"] == 199 and packed_manifest["blocks"] == 100
            and packed_manifest["tree_source_sha256"] == model["existing_source_sha256"][scalar],
            "Packed oracle provenance differs")
    generated = {module: lean / (module.replace(".", "/") + ".lean")
                 for module in [*root_modules, packed_manifest["module"]]}
    require(set(generated) == set(model["generated_modules"]), "Generated source inventory differs")
    actual = {".".join(p.relative_to(lean).with_suffix("").parts)
              for p in conjectures.glob("*.lean")}
    require(actual == {scalar, *generated}, "Extra or missing producer output")
    for record in root_manifest["modules"]:
        path = generated[record["module"]]
        require(sha(path) == record["source_sha256"] and path.stat().st_size == record["source_bytes"],
                "Generated root source differs from manifest")
    require(sha(generated[packed_manifest["module"]]) == packed_manifest["generated_source_sha256"],
            "Generated packed source differs from manifest")
    return generated, root_manifest, packed_manifest


def preflight(model, generation_dir):
    global GENERATED, GENERATION_ROOT, GENERATION_FILES
    check_inputs(model)
    first, root_manifest, packed_manifest = generate_once(model, generation_dir / "first")
    second, root_again, packed_again = generate_once(model, generation_dir / "second")
    generated_hashes = {module: sha(path) for module, path in first.items()}
    require(generated_hashes == {module: sha(path) for module, path in second.items()}
            and root_manifest == root_again and packed_manifest == packed_again,
            "Two independent pinned-producer renderings differ")
    for module, path in first.items():
        published = ROOT / "lean" / (module.replace(".", "/") + ".lean")
        require(not published.exists() or
                (published.is_file() and not published.is_symlink() and sha(published) == sha(path)),
                "Existing candidate source conflicts with pinned layout producer: " + module)
    GENERATED = first
    graph = {}
    pending = list(model["roots"])
    while pending:
        module = pending.pop()
        if module in graph:
            continue
        require(module in model["expected_project_modules"], "Unexpected project import: " + module)
        dependencies = []
        for imported in imports_of(source(module)):
            require(imported != "Solitaire" and not imported.startswith("Solitaire."),
                    "Unexpected Solitaire project import")
            if imported == "Conjectures" or imported.startswith("Conjectures."):
                dependencies.append(imported)
        graph[module] = sorted(set(dependencies))
        pending.extend(dependencies)
    modules = list(TopologicalSorter({m: graph[m] for m in sorted(graph)}).static_order())
    require(len(modules) == 46 and set(modules) == set(model["expected_project_modules"]),
            "Actual generated root import closure differs")
    for module in modules:
        exact_singleton(modules, module)
    modern = {m: next(header_tokens(source(m).read_text()), None) == "module" for m in modules}
    live = dict(model)
    live["source_sha256"] = {**model["existing_source_sha256"], **generated_hashes}
    live["reproduction"] = {
        "original_predicates_and_scalar": True, "unchanged_original_generator_dependency": True,
        "two_renderings_equal": True,
        "root_manifest": root_manifest, "packed_manifest": packed_manifest,
        "generated_source_sha256": generated_hashes,
        "computational_output_is_proof": False,
    }
    GENERATION_ROOT = generation_dir
    GENERATION_FILES = {str(p.relative_to(generation_dir)): sha(p)
                        for p in sorted(generation_dir.rglob("*")) if p.is_file()}
    live["reproduction"]["file_sha256"] = GENERATION_FILES
    return live, modules, model["required_theorems"], modern

def objects(stage, modules, modern):
    result = {}
    for module in modules:
        stem = stage / "lib/lean" / module.replace(".", "/")
        facets = {}
        for suffix in FACETS:
            path = Path(str(stem) + suffix)
            require(not path.is_symlink(), "Proof object must be a regular file")
            if path.is_file():
                facets[suffix] = sha(path)
        needed = set(FACETS[:3]) if modern[module] else {".olean"}
        require(needed <= set(facets), "Missing required object facet: " + module)
        require((".olean.private" in facets) == (".olean.server" in facets),
                "Partial modern private/server facet pair: " + module)
        result[module] = facets
    present = {".".join(p.relative_to(stage / "lib/lean").with_suffix("").parts)
               for p in (stage / "lib/lean/Conjectures").rglob("*.olean")}
    require(present == set(modules), "Extra or missing staged project object")
    return result


def verify(model, modules, required, modern, stage):
    require(not stage.exists() or not any(stage.iterdir()), "Choose a fresh proof stage")
    for name in ("src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    compiler, external, toolchain = runtime.resolve_runtime(None)
    require(toolchain["lean_sha256"] == LEAN_SHA256
            and toolchain["checker_sha256"] == CHECKER_SHA256,
            "Compiler or stock checker is not the pinned binary")
    controls = {**model["configuration_sha256"], **model["helper_sha256"],
                **model["producer_sha256"],
                **{path: sha(ROOT / path) for path in OWN_INPUTS}}
    receipt = {
        "schema": "five-speed-root-cblock1024-receipt-v1",
        "status": "running", "scope": model["scope"],
        "git_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "roots": model["roots"], "project_modules": modules,
        "required_theorems": required, "source_sha256": model["source_sha256"],
        "gate_sha256": controls, "toolchain": toolchain,
        "source_workers": 1, "kernel_threads": 1,
        "source_checks": {}, "kernel_checks": {}, "source_policy": model["source_policy"],
        "axiom_whitelist": list(audit.ALLOWED), "modern_modules": modern,
        "accepted_registry_changed": False, "prime": 199,
        "reproduction": model["reproduction"],
        "generated_inventory": model["generated_inventory"],
        "other_root_primes_checked": False, "complete_five_speed_classification_checked": False,
        "original_predicates_and_scalar": True, "c_work_budget": 1024,
        "baseline_reference": model["baseline"], "speedup_claimed": False,
    }
    def save():
        (stage / "receipt.json").write_bytes(encoded(receipt))
    environment = {
        **os.environ, "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
        "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
        "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0",
    }
    try:
        for path, digest in controls.items():
            copied = stage / "controls" / path
            copied.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(ROOT / path, copied)
            require(sha(copied) == digest, "Copied control input differs")
        for module in modules:
            stem = module.replace(".", "/")
            copied = stage / "src" / (stem + ".lean")
            copied.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source(module), copied)
            require(sha(copied) == model["source_sha256"][module], "Copied proof source differs")
            output = stage / "lib/lean" / (stem + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                       "-o", str(output), stem + ".lean"]
            check = runtime.profile(command, stage / "src", environment,
                stage / "logs" / (module + ".source.log"),
                stage / "progress" / (module + ".source.json"), 1800)
            receipt["source_checks"][module] = check
            save()
            require(check["exit_code"] == 0 and check["timed_out"] is False,
                    "Strict source failed: " + module + "\n" + Path(check["log"]).read_text()[-12000:])
        frozen_objects = objects(stage, modules, modern)
        receipt["artifact_sha256"] = frozen_objects
        spec = {"modules": modules, "required": required,
                "legacy_prefixes": model["legacy_prefixes"]}
        audit_path = stage / "src/RootCBlock1024Audit.lean"
        audit_raw = audit.audit_source(modules, required, model["legacy_prefixes"]).encode()
        audit_path.write_bytes(audit_raw)
        command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true", audit_path.name]
        check = runtime.profile(command, stage / "src", environment,
            stage / "logs/all-owned-audit.log", stage / "progress/all-owned-audit.json", 900)
        receipt["axiom_audit"] = check
        save()
        require(check["exit_code"] == 0 and check["timed_out"] is False,
                "All-owned audit failed:\n" + Path(check["log"]).read_text()[-12000:])
        inventory = audit.validate_log(Path(check["log"]).read_text(), spec, modern)
        require(all(inventory["declarations"][name]["kind"] == "theorem" for name in required),
                "A required theorem endpoint is not a theorem declaration")
        (stage / "declaration-inventory.json").write_bytes(encoded(inventory))
        check.update({
            "all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
            "complete_serialized_private_import": True,
            "explicit_project_module_imports": True, "summary": inventory["summary"],
            "audit_source_sha256": hashlib.sha256(audit_raw).hexdigest(),
            "declaration_inventory_sha256": sha(stage / "declaration-inventory.json"),
        })
        replayed = []
        for module in modules:
            exact_singleton(modules, module)
            command = [str(compiler / "bin/leanchecker"), "-v", module]
            if buffer := shutil.which("stdbuf"):
                command = [buffer, "-oL", "-eL", *command]
            check = runtime.profile(command, stage / "src", environment,
                stage / "logs" / (module + ".kernel.log"),
                stage / "progress" / (module + ".kernel.json"), 1800)
            receipt["kernel_checks"][module] = check
            save()
            require(check["exit_code"] == 0 and check["timed_out"] is False,
                    "Stock kernel replay failed: " + module + "\n" + Path(check["log"]).read_text()[-12000:])
            actual = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$",
                                Path(check["log"]).read_text(), re.M)
            require(actual == [module], "Kernel target differs: " + module)
            check.update({"replayed_modules": actual, "exact_singleton_target": True})
            replayed.extend(actual)
        require(replayed == modules, "Complete prime-specific replay inventory differs")
        receipt["kernel_replay"] = {
            "replayed_modules": replayed, "exact_project_closure": True,
            "all_modules_replayed_as_targets": True, "fresh_process_per_module": True,
            "seconds": round(sum(c["seconds"] for c in receipt["kernel_checks"].values()), 3),
            "peak_rss_kib": max(c["peak_rss_kib"] for c in receipt["kernel_checks"].values()),
        }
        require(objects(stage, modules, modern) == frozen_objects, "Proof object bytes changed")
        for module, digest in model["source_sha256"].items():
            require(sha(source(module)) == digest and
                    sha(stage / "src" / (module.replace(".", "/") + ".lean")) == digest,
                    "Proof source changed during the gate")
        for path, digest in controls.items():
            require(sha(ROOT / path) == digest and sha(stage / "controls" / path) == digest,
                    "Gate input changed during the check: " + path)
        for check in [*receipt["source_checks"].values(), receipt["axiom_audit"],
                      *receipt["kernel_checks"].values()]:
            require(sha(check["log"]) == check["log_sha256"], "Recorded process log changed")
        require(audit_path.read_bytes() == audit_raw
                and sha(stage / "declaration-inventory.json") ==
                    receipt["axiom_audit"]["declaration_inventory_sha256"],
                "Axiom audit evidence changed")
        require(sha(model["generated_inventory"]["path"]) == model["generated_inventory"]["sha256"],
                "Generated source inventory changed")
        require(GENERATION_ROOT is not None and {
            str(p.relative_to(GENERATION_ROOT)): sha(p)
            for p in sorted(GENERATION_ROOT.rglob("*")) if p.is_file()
        } == GENERATION_FILES, "Frozen generated source/evidence changed")
        require(sha(compiler / "bin/lean") == LEAN_SHA256
                and sha(compiler / "bin/leanchecker") == CHECKER_SHA256,
                "Compiler or stock checker changed")
        require(subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
                == receipt["git_commit"], "Git checkout changed during the gate")
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "global_root_cover_199_checked": True})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({
        "status": "passed", "project_modules": len(modules),
        "required_theorems": len(required), "audit_summary": inventory["summary"],
        "receipt_sha256": sha(stage / "receipt.json"),
    }), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--artifact-dir", type=Path,
                        default=ROOT / ".candidate-artifacts/five-speed-root-cblock1024")
    args = parser.parse_args()
    model = json.loads((ROOT / MODEL).read_text())
    if args.plan:
        with tempfile.TemporaryDirectory(prefix="root-cblock1024-plan-") as temporary:
            live, modules, required, modern = preflight(model, Path(temporary) / "generation")
            print(json.dumps({"modules": modules, "required": required, "modern": modern,
                "source_policy": model["source_policy"],
                "generated_source_sha256": live["reproduction"]["generated_source_sha256"],
                "root_manifest": live["reproduction"]["root_manifest"]}, indent=2))
        return
    stage = args.artifact_dir.resolve()
    require(not stage.exists() or not any(stage.iterdir()), "Choose a fresh complete gate directory")
    stage.mkdir(parents=True, exist_ok=True)
    live, modules, required, modern = preflight(model, stage / "generation")
    inventory_path = stage / "generated-source-inventory.json"
    inventory_path.write_bytes(encoded(live))
    live["generated_inventory"] = {"path": str(inventory_path), "sha256": sha(inventory_path)}
    verify(live, modules, required, modern, stage / "checked")


if __name__ == "__main__":
    main()
