#!/usr/bin/env python3
"""Fresh strict/all-owned/stock-kernel gates for spectrum arithmetic and realization components."""
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
import verify_frankl_orbit_batches as runtime
from replay_lean import header_tokens

ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/higher-spectrum-realization-exact-sources.json"
OWN_INPUTS = (
    "scripts/verify_higher_spectrum_realization_exact.py",
    ".github/workflows/lean-higher-spectrum-realization-exact.yml",
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
    "six-arithmetic": ["Conjectures.LonelinessSixSpectrumArithmetic",
                       "Conjectures.LonelinessSixSporadicBounds"],
    "seven-eight": [
        "Conjectures.LonelinessSevenSpectrumRealization",
        "Conjectures.LonelinessEightSpectrumRealization",
        "Conjectures.LonelinessHigherSpectrumBounds",
    ],
    "triangles": ["Conjectures.LonelinessHigherTriangleConsequences"],
    "seven-low-gap": ["Conjectures.LonelinessSevenLowGapInput"],
    "product-plane-speeds": ["Conjectures.LonelinessProductPlaneSpeeds"],
    "six-plane-semantics": [
        "Conjectures.LonelinessSixPlaneClassificationCore",
        "Conjectures.LonelinessSixPlaneFiveInput",
        "Conjectures.LonelinessSixPlaneEnumeration",
    ],
    "six-plane-data-pilots": [
        "Conjectures.LonelinessSixPlaneDataPilotSmall",
        "Conjectures.LonelinessSixPlaneDataPilotEight",
        "Conjectures.LonelinessSixPlaneDataPilotForty",
        "Conjectures.LonelinessSixPlaneDataCoverage",
        "Conjectures.LonelinessSixPlaneChunkSoundness",
    ],
}


def preflight(model, task):
    require(model["schema"] == "higher-spectrum-realization-exact-v1", "Unexpected source model")
    require(model["roots"] == ROOTS[task],
            "Unexpected theorem root")
    require(model["legacy_prefixes"] == ["Loneliness."], "Unexpected legacy ownership prefix")
    require(model["source_policy"] == {
        "warning_as_error": True, "linter_override": False, "fresh_project_objects": True},
        "Unexpected strict source policy")
    modules = runtime.dependency_order(model["roots"])
    require(len(modules) == model["project_module_count"] and set(modules) == set(model["source_sha256"]),
            "Exact spectrum component proof closure differs")
    required = model["required_theorems"]
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


def verify(model, modules, required, modern, stage):
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
        "schema": "higher-spectrum-realization-exact-receipt-v1",
        "status": "running", "scope": model["scope"],
        "git_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "roots": model["roots"], "project_modules": modules,
        "required_theorems": required, "source_sha256": model["source_sha256"],
        "gate_sha256": controls, "toolchain": toolchain,
        "source_workers": 1, "kernel_threads": 1,
        "source_checks": {}, "kernel_checks": {}, "source_policy": model["source_policy"],
        "axiom_whitelist": list(audit.ALLOWED), "modern_modules": modern,
        "accepted_registry_changed": False,
    }
    def save():
        (stage / "receipt.json").write_bytes(encoded(receipt))
    environment = {
        **os.environ, "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
        "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
        "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0",
    }
    try:
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
        audit_path = stage / "src/HigherSpectrumRealizationAudit.lean"
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
        require(replayed == modules, "Complete original-theorem replay inventory differs")
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
            require(sha(ROOT / path) == digest, "Gate input changed during the check: " + path)
        for check in [*receipt["source_checks"].values(), receipt["axiom_audit"],
                      *receipt["kernel_checks"].values()]:
            require(sha(check["log"]) == check["log_sha256"], "Recorded process log changed")
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
                        "universal_classification_claimed": False})
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
    args = parser.parse_args()
    packet = json.loads((ROOT / MODEL).read_text())
    require(packet["schema"] == "higher-spectrum-realization-exact-model-v1", "Unexpected packet schema")
    require(args.task in packet["tasks"], "Task has no published source inventory")
    model = packet["tasks"][args.task]
    modules, required, modern = preflight(model, args.task)
    if args.plan:
        print(json.dumps({"modules": modules, "required": required, "modern": modern,
                          "source_policy": model["source_policy"]}, indent=2))
        return
    stage = (args.artifact_dir or ROOT / ".candidate-artifacts" / ("higher-spectrum-" + args.task)).resolve()
    verify(model, modules, required, modern, stage)


if __name__ == "__main__":
    main()
