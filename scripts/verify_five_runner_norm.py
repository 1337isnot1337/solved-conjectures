#!/usr/bin/env python3
"""Fresh current-source verification of the five-runner norm component only.

This gate checks the norm ceiling and the selected-prime avoidance theorem.
It does not accept the complete five-runner bound or either classification.
All project objects are compiled afresh; development caches are not accepted.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import sys


ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / "lean"
ROOT_MODULE = "Conjectures.LonelinessFiveRunnerNorm"
SELF = "scripts/verify_five_runner_norm.py"
WORKFLOW = ".github/workflows/lean-five-runner-norm.yml"
SCOPE = ("The squared-norm bound 347142 and prime avoidance for positive primitive "
         "Fin 5 speed vectors whose value is at most 1/6. This component does not "
         "claim the complete five-runner lower bound or either classification.")

# Every repository Python module imported by the frozen full controller,
# including imports used only to initialize its shared audit/runtime helpers.
# Check these bytes before importing any of those modules.
PINNED_PYTHON = {
    "scripts/audit_lean_all_owned.py": "53c289baad523164bbef5561910fcdc44bc40efba2b8efe8e7212c30db3a663f",
    "scripts/build_lean_parallel.py": "65f2584b2bf16c4323ff03e5a7c85fd3b8bad1cf92e8fae3bcbe93662c66cbcd",
    "scripts/generate_five_runner_arithmetic.py": "f001aff8f746545c672a306b0871fe8bf0805853b60784cf0d284576795ee9d1",
    "scripts/generate_five_runner_assembly.py": "e6e2764762169bce63466c5971f9c03c57be748f6e4d33512b4419e5f920a8e9",
    "scripts/generate_five_runner_certificates.py": "bc54d202e0ecdac9d68f798158fc9087fbedb24c7bfe1eafdbcdaddf4207bb15",
    "scripts/generate_five_runner_fast.py": "2281d1995df2d5554d7212b03d97a7a64779633cbf69b70726f685c843ed293b",
    "scripts/generate_five_runner_fuel.py": "8860c07ad0de2b51cdec8d5e3b8e785dd37ca2809a69c86974892e56eb39ae1e",
    "scripts/generate_six_speed_late_prime_batches.py": "305bd241ed671ceef255bc53552c177744c7b35d37afbca7365d71a03dbad4ca",
    "scripts/generate_six_speed_prime_arithmetic.py": "f02b0ba31fa89fa4da574c2e134a0a457f7918a3dbba6e939a792c1492e2709f",
    "scripts/generate_six_speed_prime_certificates.py": "9cfca45e42eece7690a424de54e551a75139651944f14ee3f7772f506971deb7",
    "scripts/generate_six_speed_prime_fast.py": "9aaebac57c4f9e32839a21daa4c3a393322997c6db9c75b0de50aae9371ff59f",
    "scripts/plan_accepted_lean.py": "608243da7a46971a3b00c6f04854fc9a7ce3cb1534309bd8221c4a53f5f10842",
    "scripts/plan_lean_candidates.py": "4cd0cf01d5094a108d22c0a36fd151113d4dd717a97770f04e3fb0224f19d4e0",
    "scripts/replay_lean.py": "ff396676b7d4cb19200cc2b84b6a709ff50f45e5f02fb77074a0a6861eb15a1c",
    "scripts/verify_five_runner_exact.py": "e94986ee4f3de024100d9904c14e99af293256d566f382e62e3beea4557c09eb",
    "scripts/verify_frankl_orbit_batches.py": "078252c8a8298cae564b6646be15eaa6432a4890d1dba7a1f6916a131797e7cf",
    "scripts/verify_lean_candidate.py": "f82848c84354d76f596de3013059d1d19ccb3e26128f8f5784c3a37481975f2c",
}
CONTROLS = tuple(sorted({*PINNED_PYTHON, SELF, WORKFLOW,
                         "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json"}))
REQUIRED = ["Loneliness.FiveRunnerNorm.Data." + name for name in (
    "rows_valid", "prefix_eq", "increment_positive", "product_value",
    "numerical_margin", "product_lower_bound")]
REQUIRED += ["Loneliness.FiveRunnerNorm." + name for name in (
    "lower_runner_bound", "squared_norm_le", "all_primes", "all_primes_gt_135",
    "prime_product", "forced_divisor", "prime_product_coprime",
    "prime_product_margin", "exists_prime_avoiding")]


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def write_json(path, value):
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def source(module):
    return LEAN / (module.replace(".", "/") + ".lean")


def load_helpers():
    for path, digest in PINNED_PYTHON.items():
        require(sha(ROOT / path) == digest, "Frozen controller dependency differs: " + path)
    full = importlib.import_module("verify_five_runner_exact")
    loaded = {}
    for module in tuple(sys.modules.values()):
        filename = getattr(module, "__file__", None)
        if not filename:
            continue
        path = Path(filename).resolve()
        if path.is_relative_to(ROOT) and path.suffix == ".py":
            relative = str(path.relative_to(ROOT))
            if relative != SELF:
                loaded[relative] = sha(path)
    require(loaded == PINNED_PYTHON,
            "Imported repository controller inventory differs from the frozen dependency set")
    require(full.ROOT.resolve() == ROOT and full.LEAN.resolve() == LEAN,
            "Shared controller resolved a different source tree")
    return full


def expected_trigger_paths(modules):
    return {"lean/" + module.replace(".", "/") + ".lean" for module in modules} | set(CONTROLS)


def preflight():
    full = load_helpers()
    modules = full.runtime.dependency_order([ROOT_MODULE])
    require(ROOT_MODULE in modules and "Conjectures.LonelinessFiveRunnerNormData" in modules,
            "The norm component is missing from its own dependency closure")
    component = {module for module in modules if module.startswith("Conjectures.LonelinessFiveRunner")}
    require(component == {ROOT_MODULE, "Conjectures.LonelinessFiveRunnerNormData"},
            "The norm-only closure imports a five-runner finite classifier or complete result")
    require(len(REQUIRED) == len(set(REQUIRED)), "Repeated component theorem obligation")
    workflow = (ROOT / WORKFLOW).read_text()
    events = dict(re.findall(r"^  (push|pull_request):\n((?:    .*\n)*)", workflow, re.M))
    require(set(events) == {"push", "pull_request"}, "Missing norm-component workflow trigger")
    triggers = expected_trigger_paths(modules)
    for event, body in events.items():
        paths = re.findall(r"^      - '([^']+)'$", body, re.M)
        require(len(paths) == len(set(paths)) and set(paths) == triggers,
                "Workflow trigger paths differ from the exact component/control closure: " + event)
    return full, {
        "root": ROOT_MODULE, "scope": SCOPE, "modules": modules, "required": REQUIRED,
        "source_sha256": {module: sha(source(module)) for module in modules},
        "modern": {module: next(full.header_tokens(source(module).read_text()), None) == "module"
                   for module in modules},
        "controls_sha256": {path: sha(ROOT / path) for path in CONTROLS},
        "imported_controller_sha256": PINNED_PYTHON,
    }


def semantic_assertions():
    """Check the actual quantified endpoints and the literal selected primes."""
    return '''
open scoped BigOperators

example :
    ∀ (v : Fin 5 → ℕ), (∀ i, 0 < v i) →
      (List.ofFn v).foldr Nat.gcd 0 = 1 →
      Loneliness.value (List.ofFn v) ≤ (1 / 6 : ℝ) →
        (∑ i : Fin 5, (v i)^2) ≤ 347142 :=
  Loneliness.FiveRunnerNorm.squared_norm_le

example :
    ∀ (v : Fin 5 → ℕ), (∀ i, 0 < v i) →
      (List.ofFn v).foldr Nat.gcd 0 = 1 →
      Loneliness.value (List.ofFn v) ≤ (1 / 6 : ℝ) →
        ∃ p ∈ ([149, 151, 163, 167, 173] : List ℕ).toFinset,
          ∀ i, ¬ p ∣ v i :=
  Loneliness.FiveRunnerNorm.exists_prime_avoiding

example : ∀ m : ℕ, m < 5 → Loneliness.CoordinateSubspace.LonelyRunnerBound m :=
  Loneliness.FiveRunnerNorm.lower_runner_bound

example : ∀ p ∈ ([149, 151, 163, 167, 173] : List ℕ).toFinset, p.Prime :=
  Loneliness.FiveRunnerNorm.all_primes

example : ∀ p ∈ ([149, 151, 163, 167, 173] : List ℕ).toFinset, 135 < p :=
  Loneliness.FiveRunnerNorm.all_primes_gt_135
'''


def staged_objects(full, stage, spec):
    for module in spec["modules"]:
        stem = stage / "lib/lean" / module.replace(".", "/")
        for suffix in full.FACETS:
            require(not Path(str(stem) + suffix).is_symlink(),
                    "A fresh project artifact is not materialized: " + module + suffix)
    return full.object_hashes(stage, spec)


def verify(full, spec, stage):
    require(not stage.exists() or not any(stage.iterdir()), "Norm proof stage must be empty")
    for name in ("src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    receipt = {
        "schema": "five-runner-norm-component-receipt-v1", "status": "running",
        "root": ROOT_MODULE, "scope": SCOPE, "component_only": True,
        "project_modules": spec["modules"], "required_theorems": spec["required"],
        "source_sha256": spec["source_sha256"], "controls_sha256": spec["controls_sha256"],
        "imported_controller_sha256": spec["imported_controller_sha256"],
        "git_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "source_mode": "fresh_compilation", "fresh_source_compilation_required": True,
        "fresh_source_compilation_passed": False, "development_cache_reuse": False,
        "source_checks": {}, "kernel_checks": {}, "commands": [],
        "kernel_mode": "stock-prefix-exact-staged-closure", "kernel_prefixes": ["Conjectures"],
        "lean_sha256": full.LEAN_SHA256, "checker_sha256": full.CHECKER_SHA256,
        "axiom_whitelist": list(full.audit.ALLOWED), "source_workers": 1, "kernel_threads": 1,
        "norm_bound": 347142, "selected_primes": [149, 151, 163, 167, 173],
        "complete_five_runner_bound_claimed": False,
        "complete_five_runner_classification_claimed": False,
        "five_runner_finite_prime_classification_checked": False,
        "accepted_registry_changed": False,
    }

    def save():
        write_json(stage / "receipt.json", receipt)

    def checked(command, kind, name, timeout):
        result = full.runtime.profile(command, stage / "src", environment,
            stage / "logs" / f"{name}.{kind}.log",
            stage / "progress" / f"{name}.{kind}.json", timeout)
        receipt["commands"].append({"kind": kind, "name": name, **result})
        save()
        require(result["exit_code"] == 0 and result["timed_out"] is False,
                f"{kind} failed for {name}:\n" + Path(result["log"]).read_text()[-12000:])
        return result

    save()
    try:
        compiler, environment, pins = full.resolve_environment(stage)
        receipt["dependency_revisions"] = pins
        receipt["environment"] = {key: environment[key]
                                  for key in ("LEAN_PATH", "LEAN_SYSROOT", "LEAN_NUM_THREADS", "UV_USE_IO_URING")}
        save()
        for module in spec["modules"]:
            stem = module.replace(".", "/")
            copied = stage / "src" / (stem + ".lean")
            copied.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source(module), copied)
            require(sha(copied) == spec["source_sha256"][module], "Copied norm dependency source changed")
            output = stage / "lib/lean" / (stem + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            receipt["source_checks"][module] = checked(
                [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                 "-o", str(output), stem + ".lean"], "source", module, 1800)
            save()
        frozen = staged_objects(full, stage, spec)
        receipt["artifact_sha256"] = frozen
        receipt["fresh_source_compilation_passed"] = True
        audit_path = stage / "src/FiveRunnerNormAudit.lean"
        audit_path.write_text(full.audit.audit_source(spec["modules"], spec["required"], ["Loneliness."])
                              + semantic_assertions())
        result = checked([str(compiler / "bin/lean"), "-j1", "-M4500",
                          "-DwarningAsError=true", audit_path.name], "audit", "all-owned", 1800)
        audit_spec = {"modules": spec["modules"], "required": spec["required"],
                      "legacy_prefixes": ["Loneliness."]}
        inventory = full.audit.validate_log(Path(result["log"]).read_text(), audit_spec, spec["modern"])
        require(all(inventory["declarations"][name]["kind"] == "theorem" for name in spec["required"]),
                "A required norm component endpoint is not a theorem")
        write_json(stage / "declaration-inventory.json", inventory)
        receipt["axiom_audit"] = {**result, "summary": inventory["summary"],
            "all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
            "inventory_sha256": sha(stage / "declaration-inventory.json"),
            "audit_source_sha256": sha(audit_path),
            "explicit_quantified_statement_checks_passed": True}
        save()
        require(staged_objects(full, stage, spec) == frozen, "Staged objects changed before exact-prefix replay")
        command = [str(compiler / "bin/leanchecker"), "-v", "Conjectures"]
        if buffer := shutil.which("stdbuf"):
            command = [buffer, "-oL", "-eL", *command]
        result = checked(command, "kernel", "Conjectures-exact-norm-closure", 18000)
        replayed = re.findall(r"^replaying (\S+)$", Path(result["log"]).read_text(), re.M)
        require(len(replayed) == len(spec["modules"]) and len(replayed) == len(set(replayed))
                and set(replayed) == set(spec["modules"]),
                "Stock replay omitted, repeated, or added a norm dependency module")
        receipt["kernel_checks"]["Conjectures"] = {**result, "replayed_modules": replayed}
        save()
        require(staged_objects(full, stage, spec) == frozen, "Staged norm proof objects changed")
        for module, digest in spec["source_sha256"].items():
            copied = stage / "src" / (module.replace(".", "/") + ".lean")
            require(sha(source(module)) == digest and sha(copied) == digest,
                    "Norm dependency source changed: " + module)
        for path, digest in spec["controls_sha256"].items():
            require(sha(ROOT / path) == digest, "Norm verification control changed: " + path)
        require(sha(compiler / "bin/lean") == full.LEAN_SHA256
                and sha(compiler / "bin/leanchecker") == full.CHECKER_SHA256,
                "Pinned compiler or stock checker changed")
        require(set(receipt["source_checks"]) == set(spec["modules"]),
                "Fresh source compilation inventory is incomplete")
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
            "all_owned_axioms_and_exact_stock_replay_passed": True,
            "norm_and_prime_avoidance_component_replayed": True})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({"status": "passed", "root": ROOT_MODULE, "component_only": True,
                      "modules": len(spec["modules"]), "source_mode": "fresh_compilation",
                      "complete_five_runner_bound_claimed": False,
                      "complete_five_runner_classification_claimed": False,
                      "receipt_sha256": sha(stage / "receipt.json")}))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", type=Path)
    parser.add_argument("--plan", action="store_true")
    args = parser.parse_args()
    full, spec = preflight()
    if args.plan:
        print(json.dumps({"root": ROOT_MODULE, "scope": SCOPE, "component_only": True,
                          "modules": spec["modules"], "required_theorems": spec["required"],
                          "source_mode": "fresh_compilation",
                          "controls_sha256": spec["controls_sha256"],
                          "imported_controller_sha256": spec["imported_controller_sha256"]}, indent=2))
        return
    stage = args.stage or ROOT / ".candidate-artifacts/five-runner-norm"
    verify(full, spec, stage.resolve())


if __name__ == "__main__":
    main()
