#!/usr/bin/env python3
"""Fresh strict sources, complete raw-body audit and stock replay for the four-minimum runner case."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys

import audit_lean_all_owned as audit
import audit_lean_raw_occurrences as raw_audit
import verify_frankl_orbit_batches as runtime
from replay_lean import header_tokens, imports_of

ROOT = Path(__file__).resolve().parents[1]
MODEL = 'docs/prime-filtering-four-minimum-exact-sources.json'
OWN_INPUTS = ('scripts/verify_prime_filtering_four_minimum_exact.py', 'docs/prime-filtering-four-minimum-exact-sources.json', '.github/workflows/lean-prime-filtering-four-minimum-exact.yml')
FACETS = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig")
CONFIGURATION_INPUTS = (
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
)
HELPER_INPUTS = ('scripts/audit_lean_all_owned.py', 'scripts/build_lean_parallel.py', 'scripts/plan_accepted_lean.py', 'scripts/plan_lean_candidates.py', 'scripts/replay_lean.py', 'scripts/verify_frankl_orbit_batches.py', 'scripts/verify_lean_candidate.py', 'scripts/audit_lean_raw_occurrences.py')
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


ROOTS = ['Conjectures.LonelinessPrimeFilteringFourMinimum']
SOURCE_PRIORITY_ROOTS = []
MODULE_COUNT = 31
LEGACY_PREFIXES = ['Loneliness.']
REQUIRED = ['Loneliness.PrimeFilteringFourProfiles.canonical_checks_verified', 'Loneliness.PrimeFilteringFourProfiles.every_four_profiles_good', 'Loneliness.PrimeFilteringFourProfiles.four_filter', 'Loneliness.PrimeFilteringFourProfiles.folded_bound_of_quotient', 'Loneliness.PrimeFilteringFourProfiles.shifted_multiplier_coprime', 'Loneliness.PrimeFilteringFourProfiles.shifted_residue_of_seven_dvd', 'Loneliness.PrimeFilteringFourProfiles.four_prime_power_filter', 'Loneliness.PrimeFilteringTwoHigher.exists_coprime_multiplier', 'Loneliness.PrimeFilteringTwoHigher.coprime_seven_power', 'Loneliness.PrimeFilteringTwoHigher.exists_lower_level_target', 'Loneliness.PrimeFilteringTwoHigher.lower_level_target_multiples', 'Loneliness.PrimeFilteringTwoHigher.top_level_folded', 'Loneliness.PrimeFilteringTwoHigher.top_level_multiples', 'Loneliness.PrimeFilteringTwoHigher.two_level_seed', 'Loneliness.PrimeFilteringTwoHigher.coprime_seven_power_mod_ne', 'Loneliness.PrimeFilteringTwoHigher.four_plus_two_grid', 'Loneliness.PrimeFilteringFourMinimumData.exists_four_low_two_high_data', 'Loneliness.PrimeFilteringFourMinimum.folded_mul_scale', 'Loneliness.PrimeFilteringFourMinimum.witness_of_four_two_representation', 'Loneliness.PrimeFilteringFourMinimum.four_minimum_witness', 'Loneliness.PrimeFilteringFourMinimum.four_minimum_value', 'Loneliness.Modular.witness_value_lower']

STATEMENTS = r'''import Conjectures.LonelinessPrimeFilteringFourMinimum

open Loneliness.PrimeFilteringFourProfiles

example {M : ℕ} (hM : 0 < M) (ns : Fin 4 → ℕ) (hn : ∀ i, ns i % 7 ≠ 0) :
    ∃ (j : Fin 5) (k : Fin 7), ∀ i : Fin 4,
      ((j.val + 1 + k.val * M) * ns i / M) % 7 ≠ 0 ∧
      ((j.val + 1 + k.val * M) * ns i / M) % 7 ≠ 6 :=
  four_filter hM ns hn

example (m : ℕ) (ns : Fin 4 → ℕ) (hn : ∀ i, ns i % 7 ≠ 0) :
    ∃ (j : Fin 5) (k : Fin 7),
      Nat.Coprime (j.val + 1 + k.val * 7 ^ m) (7 ^ (m + 1)) ∧
      (∀ i : Fin 4, 7 ^ m ≤
        min (((j.val + 1 + k.val * 7 ^ m) * ns i) % 7 ^ (m + 1))
          (7 ^ (m + 1) - ((j.val + 1 + k.val * 7 ^ m) * ns i) % 7 ^ (m + 1))) ∧
      (∀ d : ℕ, 7 ∣ d →
        ((j.val + 1 + k.val * 7 ^ m) * d) % 7 ^ (m + 1) =
          ((j.val + 1) * d) % 7 ^ (m + 1)) :=
  four_prime_power_filter m ns hn

example {M x : ℕ} (hM : 0 < M)
    (h0 : (x / M) % 7 ≠ 0) (h6 : (x / M) % 7 ≠ 6) :
    M ≤ min (x % (7 * M)) (7 * M - x % (7 * M)) :=
  folded_bound_of_quotient hM h0 h6

example (M j k d : ℕ) (hd : 7 ∣ d) :
    ((j + k * M) * d) % (7 * M) = (j * d) % (7 * M) :=
  shifted_residue_of_seven_dvd M j k d hd

example {N u target : ℕ} (hN : 0 < N)
    (hu : Nat.Coprime u N) (ht : Nat.Coprime target N) :
    ∃ a : ℕ, Nat.Coprime a N ∧ (a * u) % N = target % N :=
  Loneliness.PrimeFilteringTwoHigher.exists_coprime_multiplier hN hu ht

example {u : ℕ} (hu : u % 7 ≠ 0) (n : ℕ) :
    Nat.Coprime u (7 ^ n) :=
  Loneliness.PrimeFilteringTwoHigher.coprime_seven_power hu n

example {i m u : ℕ} (him : i < m) (hu : u % 7 ≠ 0) :
    ∃ a : ℕ, Nat.Coprime a (7 ^ (m + 1)) ∧
      (a * (7 ^ i * u)) % 7 ^ (m + 1) = 7 ^ i + 7 ^ m :=
  Loneliness.PrimeFilteringTwoHigher.exists_lower_level_target him hu

example {i m x : ℕ} (him : i < m)
    (hx : x % 7 ^ (m + 1) = 7 ^ i + 7 ^ m)
    {j : ℕ} (hj : 1 ≤ j) (hj5 : j ≤ 5) :
    7 ^ m ≤ min ((j * x) % 7 ^ (m + 1))
      (7 ^ (m + 1) - (j * x) % 7 ^ (m + 1)) :=
  Loneliness.PrimeFilteringTwoHigher.lower_level_target_multiples him hx hj hj5

example (m q : ℕ) (hq : q % 7 ≠ 0) :
    7 ^ m ≤ min ((7 ^ m * q) % 7 ^ (m + 1))
      (7 ^ (m + 1) - (7 ^ m * q) % 7 ^ (m + 1)) :=
  Loneliness.PrimeFilteringTwoHigher.top_level_folded m q hq

example {m a v : ℕ} (ha : Nat.Coprime a (7 ^ (m + 1)))
    (hv : v % 7 ≠ 0) {j : ℕ} (hj : 1 ≤ j) (hj5 : j ≤ 5) :
    7 ^ m ≤ min ((j * (a * (7 ^ m * v))) % 7 ^ (m + 1))
      (7 ^ (m + 1) - (j * (a * (7 ^ m * v))) % 7 ^ (m + 1)) :=
  Loneliness.PrimeFilteringTwoHigher.top_level_multiples ha hv hj hj5

example {i m u v : ℕ} (him : i ≤ m) (hu : u % 7 ≠ 0) (hv : v % 7 ≠ 0) :
    ∃ a : ℕ, Nat.Coprime a (7 ^ (m + 1)) ∧
      ∀ j : ℕ, 1 ≤ j → j ≤ 5 →
        (7 ^ m ≤ min ((j * (a * (7 ^ i * u))) % 7 ^ (m + 1))
          (7 ^ (m + 1) - (j * (a * (7 ^ i * u))) % 7 ^ (m + 1))) ∧
        (7 ^ m ≤ min ((j * (a * (7 ^ m * v))) % 7 ^ (m + 1))
          (7 ^ (m + 1) - (j * (a * (7 ^ m * v))) % 7 ^ (m + 1))) :=
  Loneliness.PrimeFilteringTwoHigher.two_level_seed him hu hv

example {i m u v : ℕ} (hi : 1 ≤ i) (him : i ≤ m)
    (hu : u % 7 ≠ 0) (hv : v % 7 ≠ 0)
    (ns : Fin 4 → ℕ) (hn : ∀ x, ns x % 7 ≠ 0) :
    ∃ a : ℕ, Nat.Coprime a (7 ^ (m + 1)) ∧
      (∀ x : Fin 4, 7 ^ m ≤ min ((a * ns x) % 7 ^ (m + 1))
        (7 ^ (m + 1) - (a * ns x) % 7 ^ (m + 1))) ∧
      (7 ^ m ≤ min ((a * (7 ^ i * u)) % 7 ^ (m + 1))
        (7 ^ (m + 1) - (a * (7 ^ i * u)) % 7 ^ (m + 1))) ∧
      (7 ^ m ≤ min ((a * (7 ^ m * v)) % 7 ^ (m + 1))
        (7 ^ (m + 1) - (a * (7 ^ m * v)) % 7 ^ (m + 1))) :=
  Loneliness.PrimeFilteringTwoHigher.four_plus_two_grid hi him hu hv ns hn

example (ds : List ℕ) (r : ℕ)
    (hpos : ∀ d ∈ ds, 0 < d)
    (hminimum : ∀ d ∈ ds, r ≤ padicValNat 7 d)
    (hlowcard : (ds.toFinset.filter (fun d => padicValNat 7 d = r)).card = 4)
    (hhighcard : (ds.toFinset.filter (fun d => r < padicValNat 7 d)).card = 2) :
    ∃ ns : Fin 4 → ℕ, ∃ i m u v : ℕ,
      1 ≤ i ∧ i ≤ m ∧ (∀ x, ns x % 7 ≠ 0) ∧ u % 7 ≠ 0 ∧ v % 7 ≠ 0 ∧
      ∀ d ∈ ds, (∃ x, d = 7 ^ r * ns x) ∨
        d = 7 ^ r * (7 ^ i * u) ∨ d = 7 ^ r * (7 ^ m * v) :=
  Loneliness.PrimeFilteringFourMinimumData.exists_four_low_two_high_data
    ds r hpos hminimum hlowcard hhighcard

example (c N x : ℕ) :
    min ((c * x) % (c * N)) (c * N - (c * x) % (c * N)) =
      c * min (x % N) (N - x % N) :=
  Loneliness.PrimeFilteringFourMinimum.folded_mul_scale c N x

example (ds : List ℕ) (c : ℕ) {i m u v : ℕ} (hi : 1 ≤ i) (him : i ≤ m)
    (hu : u % 7 ≠ 0) (hv : v % 7 ≠ 0) (ns : Fin 4 → ℕ)
    (hn : ∀ x, ns x % 7 ≠ 0)
    (hrepresentation : ∀ d ∈ ds, (∃ x, d = c * ns x) ∨
      d = c * (7 ^ i * u) ∨ d = c * (7 ^ m * v)) :
    ∃ a : ℕ, Nat.Coprime a (7 ^ (m + 1)) ∧
      ∀ d ∈ ds, c * 7 ^ (m + 1) ≤
        7 * min ((a * d) % (c * 7 ^ (m + 1)))
          (c * 7 ^ (m + 1) - (a * d) % (c * 7 ^ (m + 1))) :=
  Loneliness.PrimeFilteringFourMinimum.witness_of_four_two_representation
    ds c hi him hu hv ns hn hrepresentation

example (ds : List ℕ) (r : ℕ)
    (hpos : ∀ d ∈ ds, 0 < d)
    (hminimum : ∀ d ∈ ds, r ≤ padicValNat 7 d)
    (hlowcard : (ds.toFinset.filter (fun d => padicValNat 7 d = r)).card = 4)
    (hhighcard : (ds.toFinset.filter (fun d => r < padicValNat 7 d)).card = 2) :
    ∃ m a : ℕ, 1 ≤ m ∧ Nat.Coprime a (7 ^ (m + 1)) ∧
      ∀ d ∈ ds, 7 ^ r * 7 ^ (m + 1) ≤
        7 * min ((a * d) % (7 ^ r * 7 ^ (m + 1)))
          (7 ^ r * 7 ^ (m + 1) - (a * d) % (7 ^ r * 7 ^ (m + 1))) :=
  Loneliness.PrimeFilteringFourMinimum.four_minimum_witness
    ds r hpos hminimum hlowcard hhighcard

example (ds : List ℕ) (r : ℕ)
    (hpos : ∀ d ∈ ds, 0 < d)
    (hminimum : ∀ d ∈ ds, r ≤ padicValNat 7 d)
    (hlowcard : (ds.toFinset.filter (fun d => padicValNat 7 d = r)).card = 4)
    (hhighcard : (ds.toFinset.filter (fun d => r < padicValNat 7 d)).card = 2) :
    (1 : ℝ) / 7 ≤ Loneliness.value ds :=
  Loneliness.PrimeFilteringFourMinimum.four_minimum_value
    ds r hpos hminimum hlowcard hhighcard

example {k N a : ℕ} {ds : List ℕ} (hk : 2 ≤ k) (hN : 0 < N)
    (hw : ∀ d ∈ ds, N ≤ k * min ((a * d) % N) (N - (a * d) % N)) :
    (1 : ℝ) / k ≤ Loneliness.value ds :=
  Loneliness.Modular.witness_value_lower hk hN hw
'''


def profile(command, cwd, environment, log, progress, timeout):
    result = runtime.profile(command, cwd, environment, log, progress, timeout)
    result.update({"progress": str(progress), "progress_sha256": sha(progress)})
    return result

def check_imported_helpers():
    actual = {str(Path(module.__file__).resolve().relative_to(ROOT))
              for module in tuple(sys.modules.values()) if getattr(module, "__file__", None)
              and Path(module.__file__).resolve().is_relative_to(ROOT / "scripts")}
    require(actual <= set(HELPER_INPUTS) | set(OWN_INPUTS),
            "An imported repository Python helper is not pinned")


def preflight(model):
    check_imported_helpers()
    require(model["schema"] == "prime-filtering-four-minimum-exact-v1", "Unexpected source model")
    require(model.get("sealed") is True, "Four-minimum source manifest is not sealed")
    require(model["roots"] == ROOTS,
            "Unexpected theorem root")
    require(model["source_priority_roots"] == SOURCE_PRIORITY_ROOTS,
            "Unexpected source scheduling priority")
    require(model["legacy_prefixes"] == LEGACY_PREFIXES, "Unexpected legacy ownership prefix")
    require(model["source_policy"] == {
        "warning_as_error": True, "linter_override": False, "fresh_project_objects": True},
        "Unexpected strict source policy")
    require(set(model["configuration_sha256"]) == set(CONFIGURATION_INPUTS),
            "Pinned configuration inventory differs")
    require(set(model["helper_sha256"]) == set(HELPER_INPUTS),
            "Pinned helper inventory differs")
    require(model["literal_statements_sha256"] == hashlib.sha256(STATEMENTS.encode()).hexdigest(),
            "Literal theorem contracts differ")
    require(model["literal_contract_count"] == len(re.findall(r"^example\b", STATEMENTS, re.M)) == 18,
            "Literal contract count differs")
    modules = runtime.dependency_order(model["roots"])
    priority_modules = runtime.dependency_order(SOURCE_PRIORITY_ROOTS)
    require(set(priority_modules) <= set(modules), "Source priority extends the proof closure")
    modules = priority_modules + [module for module in modules if module not in priority_modules]
    require(len(modules) == model["project_module_count"] == MODULE_COUNT and set(modules) == set(model["source_sha256"]),
            "Exact four-minimum runner proof closure differs")
    required = model["required_theorems"]
    require(required == REQUIRED, "Exact four-minimum runner theorem inventory differs")
    require(len(required) == len(set(required)) == model["required_theorem_count"] and len(required) > 0, "Required theorem inventory differs")
    for module in modules:
        require(sha(source(module)) == model["source_sha256"][module],
                "Pinned proof source differs: " + module)
        exact_singleton(modules, module)
    for path, digest in {**model["configuration_sha256"], **model["helper_sha256"]}.items():
        require(sha(ROOT / path) == digest, "Pinned configuration/helper differs: " + path)
    require(audit.ALLOWED == ("propext", "Classical.choice", "Quot.sound"),
            "Standard-axiom whitelist changed")
    modern = {m: next(header_tokens(source(m).read_text()), None) == "module" for m in modules}
    return modules, required, modern


def module_objects(stage, module, modern):
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
    return facets


def objects(stage, modules, modern):
    result = {module: module_objects(stage, module, modern) for module in modules}
    present = {".".join(p.relative_to(stage / "lib/lean").with_suffix("").parts)
               for p in (stage / "lib/lean/Conjectures").rglob("*.olean")}
    require(present == set(modules), "Extra or missing staged project object")
    return result


def verify(model, modules, required, modern, stage, runtime_path):
    require(not stage.exists() or not any(stage.iterdir()), "Choose a fresh proof stage")
    for name in ("src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    compiler, external, toolchain = runtime.resolve_runtime(runtime_path)
    require(toolchain["lean_sha256"] == LEAN_SHA256
            and toolchain["checker_sha256"] == CHECKER_SHA256,
            "Compiler or stock checker is not the pinned binary")
    controls = {**model["configuration_sha256"], **model["helper_sha256"],
                **{path: sha(ROOT / path) for path in OWN_INPUTS}}
    receipt = {
        "schema": "prime-filtering-four-minimum-exact-receipt-v1",
        "status": "running", "scope": model["scope"],
        "git_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "roots": model["roots"], "project_modules": modules,
        "required_theorems": required, "source_sha256": model["source_sha256"],
        "gate_sha256": controls, "toolchain": toolchain,
        "source_workers": 1, "kernel_threads": 1,
        "source_checks": {}, "source_failures": {}, "blocked_sources": {},
        "kernel_checks": {}, "source_policy": model["source_policy"],
        "axiom_whitelist": list(audit.ALLOWED), "modern_modules": modern,
        "external_lean_path": external,
        "contribution": model["contribution"],
        "accepted_registry_changed": False,
        "positive_speed_list_required": True,
        "minimum_level_distinct_count": 4,
        "higher_level_distinct_count": 2,
        "representation_premises_discharged": True,
        "computational_hypothesis_discharged": True,
        "full_six_speed_bound_claimed": False,
    }
    def save():
        (stage / "receipt.json").write_bytes(encoded(receipt))
    environment = {
        **os.environ, "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
        "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
        "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0",
    }
    try:
        built_objects = {}
        for module in modules:
            stem = module.replace(".", "/")
            copied = stage / "src" / (stem + ".lean")
            copied.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source(module), copied)
            require(sha(copied) == model["source_sha256"][module], "Copied proof source differs")
            project_imports = [dep for dep in imports_of(copied) if dep in modules]
            unavailable = [dep for dep in project_imports if dep not in built_objects]
            if unavailable:
                require(all(dep in receipt["source_failures"] or dep in receipt["blocked_sources"]
                            for dep in unavailable), "Source dependency order differs: " + module)
                receipt["blocked_sources"][module] = {
                    "blocked_by": unavailable, "source_sha256": sha(copied),
                }
                save()
                print(json.dumps({"phase": module + ".source", "status": "blocked",
                                  "blocked_by": unavailable}), flush=True)
                continue
            output = stage / "lib/lean" / (stem + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            for dep in project_imports:
                require(module_objects(stage, dep, modern) == built_objects[dep],
                        "Imported project object changed before compilation: " + dep)
                require(sha(stage / "src" / (dep.replace(".", "/") + ".lean"))
                        == model["source_sha256"][dep],
                        "Imported project source changed before compilation: " + dep)
            direct_imports = {
                dep: {"source_sha256": model["source_sha256"][dep],
                      "artifact_sha256": dict(built_objects[dep])}
                for dep in project_imports
            }
            command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                       "-o", str(output), stem + ".lean"]
            check = profile(command, stage / "src", environment,
                stage / "logs" / (module + ".source.log"),
                stage / "progress" / (module + ".source.json"), 1800)
            check["source_sha256"] = sha(copied)
            check["direct_project_imports"] = direct_imports
            receipt["source_checks"][module] = check
            save()
            require(sha(copied) == model["source_sha256"][module],
                    "Proof source changed during compilation: " + module)
            for dep, dependency in direct_imports.items():
                require(module_objects(stage, dep, modern) == dependency["artifact_sha256"],
                        "Imported project object changed during compilation: " + dep)
                require(sha(stage / "src" / (dep.replace(".", "/") + ".lean"))
                        == dependency["source_sha256"],
                        "Imported project source changed during compilation: " + dep)
            if check["exit_code"] != 0 or check["timed_out"] is not False:
                receipt["source_failures"][module] = {
                    "exit_code": check["exit_code"], "timed_out": check["timed_out"],
                    "log": check["log"],
                }
                save()
                continue
            built_objects[module] = module_objects(stage, module, modern)
            check["artifact_sha256"] = built_objects[module]
            save()
        if receipt["source_failures"] or receipt["blocked_sources"]:
            diagnostics = "\n\n".join(
                module + "\n" + Path(check["log"]).read_text()[-12000:]
                for module, check in receipt["source_failures"].items())
            raise RuntimeError("Strict source failed: " + ", ".join(receipt["source_failures"])
                               + "\nBlocked source modules: " + ", ".join(receipt["blocked_sources"])
                               + "\n" + diagnostics)
        require(list(built_objects) == modules, "Not every exact source module was compiled")
        frozen_objects = objects(stage, modules, modern)
        require(frozen_objects == built_objects, "A compiled project object was replaced")
        receipt["artifact_sha256"] = frozen_objects
        statements = stage / "src/PrimeFilteringFourMinimumExactStatements.lean"
        statements.write_text(STATEMENTS)
        command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                   statements.name]
        check = profile(command, stage / "src", environment,
            stage / "logs/literal-statements.log", stage / "progress/literal-statements.json", 900)
        receipt["literal_statements"] = check
        receipt["literal_statements_sha256"] = sha(statements)
        save()
        require(check["exit_code"] == 0 and check["timed_out"] is False,
                "Literal theorem statements failed:\n" + Path(check["log"]).read_text()[-12000:])
        spec = {"modules": modules, "required": required,
                "legacy_prefixes": model["legacy_prefixes"]}
        audit_path = stage / "src/PrimeFilteringFourMinimumExactAudit.lean"
        audit_raw = raw_audit.augment_source(
            audit.audit_source(modules, required, model["legacy_prefixes"]),
            modules, modern, flavor="all_owned", legacy_prefixes=model["legacy_prefixes"]).encode()
        audit_path.write_bytes(audit_raw)
        command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true", "-t0", audit_path.name]
        check = profile(command, stage / "src", environment,
            stage / "logs/all-owned-audit.log", stage / "progress/all-owned-audit.json", 900)
        receipt["axiom_audit"] = check
        save()
        require(check["exit_code"] == 0 and check["timed_out"] is False,
                "All-owned audit failed:\n" + Path(check["log"]).read_text()[-12000:])
        inventory = raw_audit.validate_all_owned_log(Path(check["log"]).read_text(), spec, modern)
        require(all(inventory["declarations"][name]["kind"] == "theorem" for name in required),
                "A required theorem endpoint is not a theorem declaration")
        (stage / "declaration-inventory.json").write_bytes(encoded(inventory))
        check.update({
            "all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
            "explicit_import_all": True, "summary": inventory["summary"],
            "all_reachable_raw_variants_audited": True,
            "raw_occurrence_summary": inventory["raw_occurrence_graph"]["summary"],
            "audit_source_sha256": hashlib.sha256(audit_raw).hexdigest(),
            "declaration_inventory_sha256": sha(stage / "declaration-inventory.json"),
        })
        replayed = []
        for module in modules:
            exact_singleton(modules, module)
            command = [str(compiler / "bin/leanchecker"), "-v", module]
            if buffer := shutil.which("stdbuf"):
                command = [buffer, "-oL", "-eL", *command]
            check = profile(command, stage / "src", environment,
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
            save()
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
        for check in [*receipt["source_checks"].values(), receipt["literal_statements"], receipt["axiom_audit"],
                      *receipt["kernel_checks"].values()]:
            require(sha(check["log"]) == check["log_sha256"], "Recorded process log changed")
            require(sha(check["progress"]) == check["progress_sha256"],
                    "Recorded process profile changed")
        require(statements.read_text() == STATEMENTS, "Literal theorem statements changed")
        require(audit_path.read_bytes() == audit_raw
                and sha(stage / "declaration-inventory.json") ==
                    receipt["axiom_audit"]["declaration_inventory_sha256"],
                "Axiom audit evidence changed")
        require(sha(compiler / "bin/lean") == LEAN_SHA256
                and sha(compiler / "bin/leanchecker") == CHECKER_SHA256,
                "Compiler or stock checker changed")
        require(subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
                == receipt["git_commit"], "Frozen checkout commit changed")
        check_imported_helpers()
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "literal_four_minimum_witness_and_value_scope_checked": True,
                        "full_six_speed_bound_claimed": False})
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
    parser.add_argument("--artifact-dir", type=Path)
    parser.add_argument("--runtime", type=Path)
    args = parser.parse_args()
    model = json.loads((ROOT / MODEL).read_text())
    modules, required, modern = preflight(model)
    if args.plan:
        print(json.dumps({"modules": modules, "required": required, "modern": modern,
                          "source_policy": model["source_policy"]}, indent=2))
        return
    stage = (args.artifact_dir or ROOT / ".candidate-artifacts/prime-filtering-four-minimum-exact").resolve()
    verify(model, modules, required, modern, stage, args.runtime)


if __name__ == "__main__":
    main()
