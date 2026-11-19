#!/usr/bin/env python3
"""Fresh strict source, all-owned and stock-kernel gates for finite six-plane certificates."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess

import audit_lean_all_owned as audit
import authenticate_six_plane_groups as groups
import verify_frankl_orbit_batches as runtime
from replay_lean import header_tokens

ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/six-plane-data-exact-sources.json"
OWN_INPUTS = (
    "scripts/verify_six_plane_data_exact.py",
    "scripts/authenticate_six_plane_groups.py",
    "scripts/generate_six_plane_source_model.py",
    ".github/workflows/lean-six-plane-data-exact.yml",
    MODEL,
)
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
    return ROOT / "lean" / (module.replace(".", "/") + ".lean")


def exact_singleton(modules, target):
    selected = [m for m in modules if m == target or m.startswith(target + ".")]
    require(selected == [target], "Stock checker prefix is not an exact singleton: " + target)


ROOTS = {
    "coverage": [
        "Conjectures.LonelinessSixPlaneDataCoverage",
        "Conjectures.LonelinessSixPlaneChunkSoundness"
    ],
    "pattern-0": [
        "Conjectures.LonelinessSixPlaneDataBlock00_00",
        "Conjectures.LonelinessSixPlaneDataBlock00_01",
        "Conjectures.LonelinessSixPlaneDataBlock00_02",
        "Conjectures.LonelinessSixPlaneDataBlock00_03",
        "Conjectures.LonelinessSixPlaneDataBlock00_04",
        "Conjectures.LonelinessSixPlaneDataBlock00_05",
        "Conjectures.LonelinessSixPlaneDataBlock00_06",
        "Conjectures.LonelinessSixPlaneDataBlock00_07",
        "Conjectures.LonelinessSixPlaneDataBlock00_08",
        "Conjectures.LonelinessSixPlaneDataBlock00_09"
    ],
    "pattern-1": [
        "Conjectures.LonelinessSixPlaneDataBlock01_00",
        "Conjectures.LonelinessSixPlaneDataBlock01_01",
        "Conjectures.LonelinessSixPlaneDataBlock01_02",
        "Conjectures.LonelinessSixPlaneDataBlock01_03",
        "Conjectures.LonelinessSixPlaneDataBlock01_04",
        "Conjectures.LonelinessSixPlaneDataBlock01_05",
        "Conjectures.LonelinessSixPlaneDataBlock01_06",
        "Conjectures.LonelinessSixPlaneDataBlock01_07",
        "Conjectures.LonelinessSixPlaneDataBlock01_08",
        "Conjectures.LonelinessSixPlaneDataBlock01_09"
    ],
    "pattern-2": [
        "Conjectures.LonelinessSixPlaneDataBlock02_00",
        "Conjectures.LonelinessSixPlaneDataBlock02_01",
        "Conjectures.LonelinessSixPlaneDataBlock02_02",
        "Conjectures.LonelinessSixPlaneDataBlock02_03",
        "Conjectures.LonelinessSixPlaneDataBlock02_04",
        "Conjectures.LonelinessSixPlaneDataBlock02_05",
        "Conjectures.LonelinessSixPlaneDataBlock02_06",
        "Conjectures.LonelinessSixPlaneDataBlock02_07",
        "Conjectures.LonelinessSixPlaneDataBlock02_08",
        "Conjectures.LonelinessSixPlaneDataBlock02_09"
    ],
    "pattern-3": [
        "Conjectures.LonelinessSixPlaneDataBlock03_00",
        "Conjectures.LonelinessSixPlaneDataBlock03_01",
        "Conjectures.LonelinessSixPlaneDataBlock03_02",
        "Conjectures.LonelinessSixPlaneDataBlock03_03",
        "Conjectures.LonelinessSixPlaneDataBlock03_04",
        "Conjectures.LonelinessSixPlaneDataBlock03_05",
        "Conjectures.LonelinessSixPlaneDataBlock03_06",
        "Conjectures.LonelinessSixPlaneDataBlock03_07",
        "Conjectures.LonelinessSixPlaneDataBlock03_08",
        "Conjectures.LonelinessSixPlaneDataBlock03_09"
    ],
    "pattern-4": [
        "Conjectures.LonelinessSixPlaneDataBlock04_00",
        "Conjectures.LonelinessSixPlaneDataBlock04_01",
        "Conjectures.LonelinessSixPlaneDataBlock04_02",
        "Conjectures.LonelinessSixPlaneDataBlock04_03",
        "Conjectures.LonelinessSixPlaneDataBlock04_04",
        "Conjectures.LonelinessSixPlaneDataBlock04_05",
        "Conjectures.LonelinessSixPlaneDataBlock04_06",
        "Conjectures.LonelinessSixPlaneDataBlock04_07",
        "Conjectures.LonelinessSixPlaneDataBlock04_08",
        "Conjectures.LonelinessSixPlaneDataBlock04_09"
    ],
    "pattern-5": [
        "Conjectures.LonelinessSixPlaneDataBlock05_00",
        "Conjectures.LonelinessSixPlaneDataBlock05_01",
        "Conjectures.LonelinessSixPlaneDataBlock05_02",
        "Conjectures.LonelinessSixPlaneDataBlock05_03",
        "Conjectures.LonelinessSixPlaneDataBlock05_04",
        "Conjectures.LonelinessSixPlaneDataBlock05_05",
        "Conjectures.LonelinessSixPlaneDataBlock05_06",
        "Conjectures.LonelinessSixPlaneDataBlock05_07",
        "Conjectures.LonelinessSixPlaneDataBlock05_08",
        "Conjectures.LonelinessSixPlaneDataBlock05_09"
    ],
    "pattern-6": [
        "Conjectures.LonelinessSixPlaneDataBlock06_00",
        "Conjectures.LonelinessSixPlaneDataBlock06_01",
        "Conjectures.LonelinessSixPlaneDataBlock06_02",
        "Conjectures.LonelinessSixPlaneDataBlock06_03",
        "Conjectures.LonelinessSixPlaneDataBlock06_04",
        "Conjectures.LonelinessSixPlaneDataBlock06_05",
        "Conjectures.LonelinessSixPlaneDataBlock06_06",
        "Conjectures.LonelinessSixPlaneDataBlock06_07",
        "Conjectures.LonelinessSixPlaneDataBlock06_08",
        "Conjectures.LonelinessSixPlaneDataBlock06_09"
    ],
    "pattern-7": [
        "Conjectures.LonelinessSixPlaneDataBlock07_00",
        "Conjectures.LonelinessSixPlaneDataBlock07_01",
        "Conjectures.LonelinessSixPlaneDataBlock07_02",
        "Conjectures.LonelinessSixPlaneDataBlock07_03",
        "Conjectures.LonelinessSixPlaneDataBlock07_04",
        "Conjectures.LonelinessSixPlaneDataBlock07_05",
        "Conjectures.LonelinessSixPlaneDataBlock07_06",
        "Conjectures.LonelinessSixPlaneDataBlock07_07",
        "Conjectures.LonelinessSixPlaneDataBlock07_08",
        "Conjectures.LonelinessSixPlaneDataBlock07_09"
    ],
    "pattern-8": [
        "Conjectures.LonelinessSixPlaneDataBlock08_00",
        "Conjectures.LonelinessSixPlaneDataBlock08_01",
        "Conjectures.LonelinessSixPlaneDataBlock08_02",
        "Conjectures.LonelinessSixPlaneDataBlock08_03",
        "Conjectures.LonelinessSixPlaneDataBlock08_04",
        "Conjectures.LonelinessSixPlaneDataBlock08_05",
        "Conjectures.LonelinessSixPlaneDataBlock08_06",
        "Conjectures.LonelinessSixPlaneDataBlock08_07",
        "Conjectures.LonelinessSixPlaneDataBlock08_08",
        "Conjectures.LonelinessSixPlaneDataBlock08_09"
    ],
    "pattern-9": [
        "Conjectures.LonelinessSixPlaneDataBlock09_00",
        "Conjectures.LonelinessSixPlaneDataBlock09_01",
        "Conjectures.LonelinessSixPlaneDataBlock09_02",
        "Conjectures.LonelinessSixPlaneDataBlock09_03",
        "Conjectures.LonelinessSixPlaneDataBlock09_04",
        "Conjectures.LonelinessSixPlaneDataBlock09_05",
        "Conjectures.LonelinessSixPlaneDataBlock09_06",
        "Conjectures.LonelinessSixPlaneDataBlock09_07",
        "Conjectures.LonelinessSixPlaneDataBlock09_08",
        "Conjectures.LonelinessSixPlaneDataBlock09_09"
    ],
    "assembly": [
        "Conjectures.LonelinessSixPlaneDataComplete"
    ]
}

REQUIRED = {
    "coverage": [
        "Loneliness.SixPlane.Data.directions_complete",
        "Loneliness.SixPlane.Data.directionCoverageCheck_of_fixed_chunks",
        "Loneliness.SixPlane.Data.partialCheck_sound",
        "Loneliness.SixPlane.Data.enumeratedPairsChecked_of_partialChecks",
        "Loneliness.SixPlane.Data.enumeratedPairsChecked_of_fixed_chunks",
        "Loneliness.SixPlane.Data.candidatePairsChecked_of_fixed_chunks"
    ],
    "pattern-0": [
        "Loneliness.SixPlane.Data.pair_cases_00_00",
        "Loneliness.SixPlane.Data.pair_cases_00_01",
        "Loneliness.SixPlane.Data.pair_cases_00_02",
        "Loneliness.SixPlane.Data.pair_cases_00_03",
        "Loneliness.SixPlane.Data.pair_cases_00_04",
        "Loneliness.SixPlane.Data.pair_cases_00_05",
        "Loneliness.SixPlane.Data.pair_cases_00_06",
        "Loneliness.SixPlane.Data.pair_cases_00_07",
        "Loneliness.SixPlane.Data.pair_cases_00_08",
        "Loneliness.SixPlane.Data.pair_cases_00_09"
    ],
    "pattern-1": [
        "Loneliness.SixPlane.Data.pair_cases_01_00",
        "Loneliness.SixPlane.Data.pair_cases_01_01",
        "Loneliness.SixPlane.Data.pair_cases_01_02",
        "Loneliness.SixPlane.Data.pair_cases_01_03",
        "Loneliness.SixPlane.Data.pair_cases_01_04",
        "Loneliness.SixPlane.Data.pair_cases_01_05",
        "Loneliness.SixPlane.Data.pair_cases_01_06",
        "Loneliness.SixPlane.Data.pair_cases_01_07",
        "Loneliness.SixPlane.Data.pair_cases_01_08",
        "Loneliness.SixPlane.Data.pair_cases_01_09"
    ],
    "pattern-2": [
        "Loneliness.SixPlane.Data.pair_cases_02_00",
        "Loneliness.SixPlane.Data.pair_cases_02_01",
        "Loneliness.SixPlane.Data.pair_cases_02_02",
        "Loneliness.SixPlane.Data.pair_cases_02_03",
        "Loneliness.SixPlane.Data.pair_cases_02_04",
        "Loneliness.SixPlane.Data.pair_cases_02_05",
        "Loneliness.SixPlane.Data.pair_cases_02_06",
        "Loneliness.SixPlane.Data.pair_cases_02_07",
        "Loneliness.SixPlane.Data.pair_cases_02_08",
        "Loneliness.SixPlane.Data.pair_cases_02_09"
    ],
    "pattern-3": [
        "Loneliness.SixPlane.Data.pair_cases_03_00",
        "Loneliness.SixPlane.Data.pair_cases_03_01",
        "Loneliness.SixPlane.Data.pair_cases_03_02",
        "Loneliness.SixPlane.Data.pair_cases_03_03",
        "Loneliness.SixPlane.Data.pair_cases_03_04",
        "Loneliness.SixPlane.Data.pair_cases_03_05",
        "Loneliness.SixPlane.Data.pair_cases_03_06",
        "Loneliness.SixPlane.Data.pair_cases_03_07",
        "Loneliness.SixPlane.Data.pair_cases_03_08",
        "Loneliness.SixPlane.Data.pair_cases_03_09"
    ],
    "pattern-4": [
        "Loneliness.SixPlane.Data.pair_cases_04_00",
        "Loneliness.SixPlane.Data.pair_cases_04_01",
        "Loneliness.SixPlane.Data.pair_cases_04_02",
        "Loneliness.SixPlane.Data.pair_cases_04_03",
        "Loneliness.SixPlane.Data.pair_cases_04_04",
        "Loneliness.SixPlane.Data.pair_cases_04_05",
        "Loneliness.SixPlane.Data.pair_cases_04_06",
        "Loneliness.SixPlane.Data.pair_cases_04_07",
        "Loneliness.SixPlane.Data.pair_cases_04_08",
        "Loneliness.SixPlane.Data.pair_cases_04_09"
    ],
    "pattern-5": [
        "Loneliness.SixPlane.Data.pair_cases_05_00",
        "Loneliness.SixPlane.Data.pair_cases_05_01",
        "Loneliness.SixPlane.Data.pair_cases_05_02",
        "Loneliness.SixPlane.Data.pair_cases_05_03",
        "Loneliness.SixPlane.Data.pair_cases_05_04",
        "Loneliness.SixPlane.Data.pair_cases_05_05",
        "Loneliness.SixPlane.Data.pair_cases_05_06",
        "Loneliness.SixPlane.Data.pair_cases_05_07",
        "Loneliness.SixPlane.Data.pair_cases_05_08",
        "Loneliness.SixPlane.Data.pair_cases_05_09"
    ],
    "pattern-6": [
        "Loneliness.SixPlane.Data.pair_cases_06_00",
        "Loneliness.SixPlane.Data.pair_cases_06_01",
        "Loneliness.SixPlane.Data.pair_cases_06_02",
        "Loneliness.SixPlane.Data.pair_cases_06_03",
        "Loneliness.SixPlane.Data.pair_cases_06_04",
        "Loneliness.SixPlane.Data.pair_cases_06_05",
        "Loneliness.SixPlane.Data.pair_cases_06_06",
        "Loneliness.SixPlane.Data.pair_cases_06_07",
        "Loneliness.SixPlane.Data.pair_cases_06_08",
        "Loneliness.SixPlane.Data.pair_cases_06_09"
    ],
    "pattern-7": [
        "Loneliness.SixPlane.Data.pair_cases_07_00",
        "Loneliness.SixPlane.Data.pair_cases_07_01",
        "Loneliness.SixPlane.Data.pair_cases_07_02",
        "Loneliness.SixPlane.Data.pair_cases_07_03",
        "Loneliness.SixPlane.Data.pair_cases_07_04",
        "Loneliness.SixPlane.Data.pair_cases_07_05",
        "Loneliness.SixPlane.Data.pair_cases_07_06",
        "Loneliness.SixPlane.Data.pair_cases_07_07",
        "Loneliness.SixPlane.Data.pair_cases_07_08",
        "Loneliness.SixPlane.Data.pair_cases_07_09"
    ],
    "pattern-8": [
        "Loneliness.SixPlane.Data.pair_cases_08_00",
        "Loneliness.SixPlane.Data.pair_cases_08_01",
        "Loneliness.SixPlane.Data.pair_cases_08_02",
        "Loneliness.SixPlane.Data.pair_cases_08_03",
        "Loneliness.SixPlane.Data.pair_cases_08_04",
        "Loneliness.SixPlane.Data.pair_cases_08_05",
        "Loneliness.SixPlane.Data.pair_cases_08_06",
        "Loneliness.SixPlane.Data.pair_cases_08_07",
        "Loneliness.SixPlane.Data.pair_cases_08_08",
        "Loneliness.SixPlane.Data.pair_cases_08_09"
    ],
    "pattern-9": [
        "Loneliness.SixPlane.Data.pair_cases_09_00",
        "Loneliness.SixPlane.Data.pair_cases_09_01",
        "Loneliness.SixPlane.Data.pair_cases_09_02",
        "Loneliness.SixPlane.Data.pair_cases_09_03",
        "Loneliness.SixPlane.Data.pair_cases_09_04",
        "Loneliness.SixPlane.Data.pair_cases_09_05",
        "Loneliness.SixPlane.Data.pair_cases_09_06",
        "Loneliness.SixPlane.Data.pair_cases_09_07",
        "Loneliness.SixPlane.Data.pair_cases_09_08",
        "Loneliness.SixPlane.Data.pair_cases_09_09"
    ],
    "assembly": [
        "Loneliness.SixPlane.Data.all_pair_chunks",
        "Loneliness.SixPlane.Data.candidate_pairs_checked"
    ]
}


def preflight(model, task):
    require(model["schema"] == "six-plane-data-exact-v1", "Unexpected source model")
    require(model["roots"] == ROOTS[task],
            "Unexpected theorem root")
    require(model["legacy_prefixes"] == ["Loneliness."], "Unexpected legacy ownership prefix")
    require(model["source_policy"] == {
        "warning_as_error": True, "linter_override": False, "fresh_project_objects": True},
        "Unexpected strict source policy")
    modules = runtime.dependency_order(model["roots"])
    require(len(modules) == model["project_module_count"] and set(modules) == set(model["source_sha256"]),
            "Exact finite six-plane proof closure differs")
    required = model["required_theorems"]
    require(required == REQUIRED[task], "Exact theorem endpoint inventory differs")
    require(model["finite_pair_coverage_complete"] is (task == "assembly"),
            "Only the closed assembly may claim complete finite coverage")
    require(len(required) == len(set(required)) == model["required_theorem_count"] and len(required) > 0, "Required theorem inventory differs")
    for module in modules:
        require(sha(source(module)) == model["source_sha256"][module],
                "Pinned proof source differs: " + module)
        exact_singleton(modules, module)
    for path, digest in {**model["configuration_sha256"], **model["helper_sha256"]}.items():
        require(sha(ROOT / path) == digest, "Pinned configuration/helper differs: " + path)
    modern = {m: next(header_tokens(source(m).read_text()), None) == "module" for m in modules}
    return modules, required, modern


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
                "Partial optional private/server facet pair: " + module)
        result[module] = facets
    present = {".".join(p.relative_to(stage / "lib/lean").with_suffix("").parts)
               for p in (stage / "lib/lean/Conjectures").rglob("*.olean")}
    require(present == set(modules), "Extra or missing staged project object")
    return result


def verify(model, modules, required, modern, stage, task, packet, group_evidence=None):
    require(not stage.exists() or not any(stage.iterdir()), "Choose a fresh proof stage")
    for name in ("src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    compiler, external, toolchain = runtime.resolve_runtime(None)
    require(toolchain["lean_sha256"] == LEAN_SHA256
            and toolchain["checker_sha256"] == CHECKER_SHA256,
            "Compiler or stock checker is not the pinned binary")
    controls = {**model["configuration_sha256"], **model["helper_sha256"],
                **{path: sha(ROOT / path) for path in OWN_INPUTS}}
    receipt = {
        "schema": "six-plane-data-exact-receipt-v1",
        "status": "running", "scope": model["scope"],
        "git_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "roots": model["roots"], "project_modules": modules,
        "required_theorems": required, "source_sha256": model["source_sha256"],
        "gate_sha256": controls, "toolchain": toolchain,
        "source_workers": 1, "kernel_threads": 1,
        "source_checks": {}, "kernel_checks": {}, "source_policy": model["source_policy"],
        "axiom_whitelist": list(audit.ALLOWED), "modern_modules": modern,
        "accepted_registry_changed": False,
        "task": task,
        "execution_mode": "distributed-assembly" if group_evidence else "fresh-exact-component",
        "github_repository": os.environ.get("GITHUB_REPOSITORY"),
        "github_run_id": os.environ.get("GITHUB_RUN_ID"),
        "github_run_attempt": os.environ.get("GITHUB_RUN_ATTEMPT"),
        "source_checks_fresh_in_this_job": [],
        "kernel_checks_fresh_in_this_job": [],
    }
    def save():
        (stage / "receipt.json").write_bytes(encoded(receipt))
    environment = {
        **os.environ, "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
        "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
        "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0",
    }
    try:
        if group_evidence is not None:
            import sys
            inherited_sources, inherited_kernels, origins, summaries = groups.authenticated_groups(
                sys.modules[__name__], packet, group_evidence, stage, modules, controls,
                receipt["git_commit"])
            receipt["source_checks"].update(inherited_sources)
            receipt["kernel_checks"].update(inherited_kernels)
            receipt["authenticated_group_checks"] = summaries
            receipt["module_evidence_groups"] = origins
            save()
        for module in modules:
            if module in receipt["source_checks"]:
                continue
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
            receipt["source_checks_fresh_in_this_job"].append(module)
            save()
            require(check["exit_code"] == 0 and check["timed_out"] is False,
                    "Strict source failed: " + module + "\n" + Path(check["log"]).read_text()[-12000:])
        frozen_objects = objects(stage, modules, modern)
        receipt["artifact_sha256"] = frozen_objects
        spec = {"modules": modules, "required": required,
                "legacy_prefixes": model["legacy_prefixes"]}
        audit_path = stage / "src/SixPlaneDataAudit.lean"
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
            "explicit_import_all": True, "summary": inventory["summary"],
            "audit_source_sha256": hashlib.sha256(audit_raw).hexdigest(),
            "declaration_inventory_sha256": sha(stage / "declaration-inventory.json"),
        })
        replayed = []
        for module in modules:
            exact_singleton(modules, module)
            if module in receipt["kernel_checks"]:
                replayed.append(module)
                continue
            command = [str(compiler / "bin/leanchecker"), "-v", module]
            if buffer := shutil.which("stdbuf"):
                command = [buffer, "-oL", "-eL", *command]
            check = runtime.profile(command, stage / "src", environment,
                stage / "logs" / (module + ".kernel.log"),
                stage / "progress" / (module + ".kernel.json"), 1800)
            receipt["kernel_checks"][module] = check
            receipt["kernel_checks_fresh_in_this_job"].append(module)
            save()
            require(check["exit_code"] == 0 and check["timed_out"] is False,
                    "Stock kernel replay failed: " + module + "\n" + Path(check["log"]).read_text()[-12000:])
            actual = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$",
                                Path(check["log"]).read_text(), re.M)
            require(actual == [module], "Kernel target differs: " + module)
            check.update({"replayed_modules": actual, "exact_singleton_target": True})
            replayed.extend(actual)
        require(replayed == modules, "Complete original-theorem replay inventory differs")
        receipt["kernel_replay"] = {
            "replayed_modules": replayed, "exact_project_closure": True,
            "all_modules_replayed_as_targets": True, "fresh_process_per_module": True,
            "all_targets_fresh_in_this_job": group_evidence is None,
            "seconds": round(sum(c["seconds"] for c in receipt["kernel_checks"].values()), 3),
            "peak_rss_kib": max(c["peak_rss_kib"] for c in receipt["kernel_checks"].values()),
        }
        require(objects(stage, modules, modern) == frozen_objects, "Proof object bytes changed")
        for module, digest in model["source_sha256"].items():
            require(sha(source(module)) == digest and
                    sha(stage / "src" / (module.replace(".", "/") + ".lean")) == digest,
                    "Proof source changed during the gate")
        for path, digest in controls.items():
            require(sha(ROOT / path) == digest, "Gate input changed during the check: " + path)
        for check in [*receipt["source_checks"].values(), receipt["axiom_audit"],
                      *receipt["kernel_checks"].values()]:
            require(sha(check["log"]) == check["log_sha256"], "Recorded process log changed")
        for item in receipt.get("authenticated_group_checks", {}).values():
            require(sha(stage / item["relative_path"] / "receipt.json") == item["receipt_sha256"],
                    "Preserved original component receipt changed")
        require(audit_path.read_bytes() == audit_raw
                and sha(stage / "declaration-inventory.json") ==
                    receipt["axiom_audit"]["declaration_inventory_sha256"],
                "Axiom audit evidence changed")
        require(sha(compiler / "bin/lean") == LEAN_SHA256
                and sha(compiler / "bin/leanchecker") == CHECKER_SHA256,
                "Compiler or stock checker changed")
        require(subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
                == receipt["git_commit"], "Frozen checkout commit changed")
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "stated_component_scope_checked": True,
                        "universal_classification_claimed": False,
                        "finite_candidate_pair_coverage_checked": model["finite_pair_coverage_complete"],
                        "mathematical_plane_gap_claimed": False})
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
    parser.add_argument("task", choices=tuple(ROOTS))
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--artifact-dir", type=Path,
                        default=None)
    parser.add_argument("--group-evidence", type=Path, default=None,
                        help="Authenticate all component artifacts from this Actions run before assembly")
    args = parser.parse_args()
    packet = json.loads((ROOT / MODEL).read_text())
    require(packet["schema"] == "six-plane-data-exact-model-v1", "Unexpected packet schema")
    require(args.task in packet["tasks"], "Task has no published source inventory")
    model = packet["tasks"][args.task]
    require(args.group_evidence is None or args.task == "assembly",
            "Only the closed assembly can import component evidence")
    modules, required, modern = preflight(model, args.task)
    if args.plan:
        print(json.dumps({"modules": modules, "required": required, "modern": modern,
                          "source_policy": model["source_policy"]}, indent=2))
        return
    stage = (args.artifact_dir or ROOT / ".candidate-artifacts" / ("six-plane-data-" + args.task)).resolve()
    verify(model, modules, required, modern, stage, args.task, packet, args.group_evidence)


if __name__ == "__main__":
    main()
