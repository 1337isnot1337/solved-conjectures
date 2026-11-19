#!/usr/bin/env python3
"""Fresh verification of the conditional gcd shift test and its transports.

This gate checks the arbitrary-modulus nine-speed shift theorem together with
signed-unit residue transport, folded representations, and the exact finite
shiftReject soundness statement. The bound for at most eight speeds and the
finite modular-unit hypotheses remain explicit. It does not establish a
complete nine-speed classification or a complete finite lift census.
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
ROOT_MODULE = "Conjectures.LonelinessGcdShiftTransport"
SELF = "scripts/verify_gcd_shift_transport.py"
WORKFLOW = ".github/workflows/lean-gcd-shift-transport.yml"
SCOPE = ("The arbitrary-modulus gcd-weighted shift test for nine positive distinct "
         "integer speeds and its signed-unit residue, folded-representation, and "
         "finite shiftReject transports. The literal positive floor cost and "
         "nonempty-exception ceiling cost are checked. The bound for at most "
         "eight speeds and the finite modular-unit hypotheses remain explicit. "
         "No unconditional nine-speed result, complete nine-speed classification, "
         "or complete finite lift census is claimed.")

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
ORIGINAL_REQUIRED = ["Loneliness.GcdShift." + name for name in (
    "integer_mem_slots", "integer_slots_card", "openBadShifts_card_le",
    "openBadShifts_card_le_ninthShiftWeight", "distance_ne_rat_of_irrational",
    "shifted_distance_ne_tenth", "exists_irrational_nearby_clearance",
    "distance_shift_of_dvd", "value_gt_tenth_of_divisible_value",
    "nine_speed_shift_test", "nine_speed_shift_test_explicit",
    "ninthShiftWeight_eq_of_modEq", "ninthShiftCost_eq_of_modEq",
    "nine_speed_shift_test_of_residues", "ceil_two_mul_tenth",
    "ninthShiftWeight_eq_ceiling", "nine_speed_shift_test_ceiling",
    "ninthShiftWeight_pos", "ninthShiftCost_pos_of_exception",
    "nine_speed_shift_test_of_exception")]
TRANSPORT_REQUIRED = [
    'Loneliness.GcdShift.dvd_mul_iff_of_unit_mod',
    'Loneliness.GcdShift.dvd_iff_of_signed_residue',
    'Loneliness.GcdShift.dvd_iff_of_signed_unit_residue',
    'Loneliness.GcdShift.gcd_eq_of_signed_unit_residue',
    'Loneliness.GcdShift.ninthShiftWeight_eq_of_signed_unit_residue',
    'Loneliness.GcdShift.ninthShiftCost_eq_of_signed_unit',
    'Loneliness.GcdShift.nine_speed_shift_test_of_signed_unit_cost',
    'Loneliness.GcdShift.nine_speed_shift_test_of_signed_unit_floor',
    'Loneliness.GcdShift.nine_speed_shift_test_of_signed_unit',
    'Loneliness.GcdShift.folded_signed_residue',
    'Loneliness.GcdShift.ninthShiftCost_eq_of_folded_represents',
    'Loneliness.GcdShift.nine_speed_shift_test_of_folded_represents',
    'Loneliness.GcdShift.shiftReject_eq_true_iff',
    'Loneliness.GcdShift.shiftReject_eq_true_iff_explicit',
    'Loneliness.GcdShift.shiftReject_sound_of_signed_unit',
    'Loneliness.GcdShift.shiftReject_sound_of_folded_represents',
]
REQUIRED = ORIGINAL_REQUIRED + TRANSPORT_REQUIRED
EXPECTED_MODULES = [
    'Conjectures.Loneliness',
    'Conjectures.LonelinessCoalescence',
    'Conjectures.LonelinessContinuity',
    'Conjectures.LonelinessFiveFamily',
    'Conjectures.LonelinessGcdShiftCounting',
    'Conjectures.LonelinessCoordinateSubspace',
    'Conjectures.LonelinessRational',
    'Conjectures.LonelinessCriticalBase',
    'Conjectures.LonelinessCriticalSecond',
    'Conjectures.LonelinessCoordinateClasses',
    'Conjectures.LonelinessModularWitness',
    'Conjectures.LonelinessSubspaceDensity',
    'Conjectures.LonelinessCriticalFamilies',
    'Conjectures.LonelinessIntegerDirection',
    'Conjectures.LonelinessModularLift',
    'Conjectures.LonelinessModularNormalize',
    'Conjectures.LonelinessModularRationalWitness',
    'Conjectures.LonelinessNormalization',
    'Conjectures.LonelinessRationalSubspace',
    'Conjectures.LonelinessModularStrictWitness',
    'Conjectures.LonelinessModularSearch',
    'Conjectures.LonelinessCoalescenceValue',
    'Conjectures.LonelinessModularFoldedSearch',
    'Conjectures.LonelinessGcdShift',
    'Conjectures.LonelinessGcdShiftTransport',
]
ORIGINAL_ASSERTIONS_SHA256 = '64cd9e44e4a74febdb2e9964fe4102f2c1e0d6cc48fd693cdcd51e45dfd2df40'
TRANSPORT_ASSERTIONS_SHA256 = '3b8ed7c5973acd16d2b732050f3f50ec89052f75527d97fd93dc1ecddb5dd569'


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
    component = {module for module in modules
                 if module.startswith("Conjectures.LonelinessGcdShift")}
    require(component == {ROOT_MODULE, "Conjectures.LonelinessGcdShift",
                          "Conjectures.LonelinessGcdShiftCounting"},
            "The combined gcd shift component is missing a required source")
    require(modules == EXPECTED_MODULES and len(modules) == 25,
            "The combined gcd shift transport dependency closure differs from its exact 25 modules")
    require(len(ORIGINAL_REQUIRED) == 20 and len(TRANSPORT_REQUIRED) == 16,
            "The combined gcd shift endpoint inventory differs")
    for label, assertions, count, digest in (
            ("original", original_semantic_assertions(), 5, ORIGINAL_ASSERTIONS_SHA256),
            ("transport", transport_semantic_assertions(), 7, TRANSPORT_ASSERTIONS_SHA256)):
        require(len(re.findall(r"^example\b", assertions, re.M)) == count
                and hashlib.sha256(assertions.encode()).hexdigest() == digest,
                "The explicit quantified statement inventory differs: " + label)
    require(len(REQUIRED) == len(set(REQUIRED)), "Repeated component theorem obligation")
    workflow = (ROOT / WORKFLOW).read_text()
    events = dict(re.findall(r"^  (push|pull_request):\n((?:    .*\n)*)", workflow, re.M))
    require(set(events) == {"push", "pull_request"}, "Missing gcd-shift-transport workflow trigger")
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


def original_semantic_assertions():
    """Check the quantified hypotheses and literal floor/ceiling statements."""
    return '''
open scoped BigOperators

example :
    Loneliness.CoordinateSubspace.LonelyRunnerBound 8 →
    ∀ (v : Fin 9 → ℕ), (∀ i, 0 < v i) → (List.ofFn v).Nodup →
      ∀ d : ℕ, 2 ≤ d → (∃ i, ¬ d ∣ v i) →
        (∑ i ∈ Finset.univ.filter (fun i => ¬ d ∣ v i),
          Nat.gcd (v i) d * ⌈(2 : ℝ) * d / (10 * (Nat.gcd (v i) d : ℕ))⌉₊) < d →
        (1 / 10 : ℝ) < Loneliness.value (List.ofFn v) :=
  Loneliness.GcdShift.nine_speed_shift_test_of_exception

example :
    Loneliness.CoordinateSubspace.LonelyRunnerBound 8 →
    ∀ (v : Fin 9 → ℕ), (∀ i, 0 < v i) → (List.ofFn v).Nodup →
      ∀ d : ℕ, 2 ≤ d →
        0 < (∑ i ∈ Finset.univ.filter (fun i => ¬ d ∣ v i),
          Nat.gcd (v i) d * ((2 * (d / Nat.gcd (v i) d) + 9) / 10)) →
        (∑ i ∈ Finset.univ.filter (fun i => ¬ d ∣ v i),
          Nat.gcd (v i) d * ((2 * (d / Nat.gcd (v i) d) + 9) / 10)) < d →
        (1 / 10 : ℝ) < Loneliness.value (List.ofFn v) :=
  Loneliness.GcdShift.nine_speed_shift_test_explicit

example :
    Loneliness.CoordinateSubspace.LonelyRunnerBound 8 →
    ∀ (v : Fin 9 → ℕ), (∀ i, 0 < v i) → (List.ofFn v).Nodup →
      ∀ d : ℕ, 2 ≤ d →
        0 < (∑ i ∈ Finset.univ.filter (fun i => ¬ d ∣ v i),
          Nat.gcd (v i) d * ⌈(2 : ℝ) * d / (10 * (Nat.gcd (v i) d : ℕ))⌉₊) →
        (∑ i ∈ Finset.univ.filter (fun i => ¬ d ∣ v i),
          Nat.gcd (v i) d * ⌈(2 : ℝ) * d / (10 * (Nat.gcd (v i) d : ℕ))⌉₊) < d →
        (1 / 10 : ℝ) < Loneliness.value (List.ofFn v) :=
  Loneliness.GcdShift.nine_speed_shift_test_ceiling

example :
    Loneliness.CoordinateSubspace.LonelyRunnerBound 8 →
    ∀ (v c : Fin 9 → ℕ), (∀ i, 0 < v i) → (List.ofFn v).Nodup →
      ∀ q d : ℕ, 2 ≤ d → d ∣ q → (∀ i, Nat.ModEq q (v i) (c i)) →
        0 < (∑ i ∈ Finset.univ.filter (fun i => ¬ d ∣ c i),
          Nat.gcd (c i) d * ((2 * (d / Nat.gcd (c i) d) + 9) / 10)) →
        (∑ i ∈ Finset.univ.filter (fun i => ¬ d ∣ c i),
          Nat.gcd (c i) d * ((2 * (d / Nat.gcd (c i) d) + 9) / 10)) < d →
        (1 / 10 : ℝ) < Loneliness.value (List.ofFn v) :=
  Loneliness.GcdShift.nine_speed_shift_test_of_residues

example :
    ∀ (a d : ℕ), 0 < d → ∀ (x r : ℝ) (N : ℕ),
      2 * (d / Nat.gcd a d : ℕ) * r ≤ (N : ℝ) →
        ((Finset.range d).filter fun j : ℕ =>
          Loneliness.distance (x + (a : ℝ) * j / d) < r).card ≤ Nat.gcd a d * N :=
  Loneliness.GcdShift.openBadShifts_card_le
'''


def transport_semantic_assertions():
    """Preserve the seven reviewed typed transport contracts verbatim."""
    return '''
open scoped BigOperators
open Loneliness Loneliness.GcdShift

example {q d u uinv a c : ℕ} (hdq : d ∣ q)
    (hunit : (u * uinv) % q = 1 % q)
    (hsigned : c % q = (u * a) % q ∨ (c + u * a) % q = 0) :
    d ∣ c ↔ d ∣ a :=
  dvd_iff_of_signed_unit_residue hdq hunit hsigned

example {q d u uinv a c : ℕ} (hdq : d ∣ q)
    (hunit : (u * uinv) % q = 1 % q)
    (hsigned : c % q = (u * a) % q ∨ (c + u * a) % q = 0) :
    Nat.gcd c d = Nat.gcd a d :=
  gcd_eq_of_signed_unit_residue hdq hunit hsigned

example (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v c : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup)
    (q d u uinv : ℕ) (hq : 0 < q) (hd : 2 ≤ d) (hdq : d ∣ q)
    (hunit : (u * uinv) % q = 1 % q)
    (hsigned : ∀ i, c i % q = (u * v i) % q ∨ (c i + u * v i) % q = 0)
    (hcostpos : 0 < ∑ i ∈ Finset.univ.filter (fun i : Fin 9 => ¬d ∣ c i),
      Nat.gcd (c i) d * ((2 * (d / Nat.gcd (c i) d) + 9) / 10))
    (hcost : (∑ i ∈ Finset.univ.filter (fun i : Fin 9 => ¬d ∣ c i),
      Nat.gcd (c i) d * ((2 * (d / Nat.gcd (c i) d) + 9) / 10)) < d) :
    (1 / 10 : ℝ) < value (List.ofFn v) :=
  nine_speed_shift_test_of_signed_unit_floor hLRC8 v c hpositive hnodup
    q d u uinv hq hd hdq hunit hsigned hcostpos hcost

example (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v c : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup)
    (q d u uinv : ℕ) (hq : 0 < q) (hd : 2 ≤ d) (hdq : d ∣ q)
    (hunit : (u * uinv) % q = 1 % q)
    (hsigned : ∀ i, c i % q = (u * v i) % q ∨ (c i + u * v i) % q = 0)
    (hexception : ∃ i, ¬d ∣ c i)
    (hcost : (∑ i ∈ Finset.univ.filter (fun i : Fin 9 => ¬d ∣ c i),
      Nat.gcd (c i) d * ⌈(2 : ℝ) * d / (10 * (Nat.gcd (c i) d : ℕ))⌉₊) < d) :
    (1 / 10 : ℝ) < value (List.ofFn v) :=
  nine_speed_shift_test_of_signed_unit hLRC8 v c hpositive hnodup
    q d u uinv hq hd hdq hunit hsigned hexception hcost

example {n : ℕ} (q : ℕ) (c : Fin n → ℕ) :
    shiftReject q c = true ↔ ∃ d : ℕ, 2 ≤ d ∧ d ≤ q ∧ q % d = 0 ∧
      0 < (∑ i ∈ Finset.univ.filter (fun i : Fin n => c i % d ≠ 0),
        Nat.gcd (c i) d * ((2 * (d / Nat.gcd (c i) d) + 9) / 10)) ∧
      (∑ i ∈ Finset.univ.filter (fun i : Fin n => c i % d ≠ 0),
        Nat.gcd (c i) d * ((2 * (d / Nat.gcd (c i) d) + 9) / 10)) < d :=
  shiftReject_eq_true_iff_explicit q c

example (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v c : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup)
    (q u uinv : ℕ) (hq : 0 < q)
    (hunit : (u * uinv) % q = 1 % q)
    (hsigned : ∀ i, c i % q = (u * v i) % q ∨ (c i + u * v i) % q = 0)
    (hcheck : shiftReject q c = true) : (1 / 10 : ℝ) < value (List.ofFn v) :=
  shiftReject_sound_of_signed_unit hLRC8 v c hpositive hnodup q u uinv hq
    hunit hsigned hcheck

example (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v c : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup) (q : ℕ) (hq : 0 < q)
    (hrep : ∃ u uinv : ℕ, (u * uinv) % q = 1 % q ∧
      ∀ i, Modular.folded q (u * v i) = c i)
    (hcheck : shiftReject q c = true) : (1 / 10 : ℝ) < value (List.ofFn v) :=
  shiftReject_sound_of_folded_represents hLRC8 v c hpositive hnodup q hq hrep hcheck
'''


def semantic_assertions():
    return original_semantic_assertions() + transport_semantic_assertions()


def staged_objects(full, stage, spec):
    for module in spec["modules"]:
        stem = stage / "lib/lean" / module.replace(".", "/")
        for suffix in full.FACETS:
            require(not Path(str(stem) + suffix).is_symlink(),
                    "A fresh project artifact is not materialized: " + module + suffix)
    result = full.object_hashes(stage, spec)
    expected = {module.replace(".", "/") + suffix
                for module, facets in result.items() for suffix in facets}
    actual = set()
    for path in (stage / "lib/lean").rglob("*"):
        require(not path.is_symlink(), "An object-stage entry is a symlink")
        if path.is_file():
            actual.add(path.relative_to(stage / "lib/lean").as_posix())
    require(actual == expected, "Unexpected staged object facet")
    return result


def frozen_commit_inputs(spec, commit):
    inputs = {**spec["controls_sha256"],
              **{"lean/" + module.replace(".", "/") + ".lean": digest
                 for module, digest in spec["source_sha256"].items()}}
    for name, digest in inputs.items():
        path = ROOT / name
        require(not path.is_symlink() and sha(path) == digest,
                "Frozen input differs: " + name)
        raw = subprocess.check_output(["git", "show", commit + ":" + name], cwd=ROOT)
        require(hashlib.sha256(raw).hexdigest() == digest,
                "Proof input does not match the recorded Git commit: " + name)
    return inputs


def verify(full, spec, stage):
    require(not stage.is_symlink(), "Gcd shift transport proof stage is a symlink")
    require(not stage.exists() or not any(stage.iterdir()), "Gcd shift transport proof stage must be empty")
    for name in ("src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    receipt = {
        "schema": "gcd-shift-transport-component-receipt-v1", "status": "running",
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
        "speed_count": 9, "threshold": {"numerator": 1, "denominator": 10},
        "modulus_lower_bound": 2, "nonempty_exception_required": True,
        "remaining_mathematical_hypotheses": ["Loneliness.CoordinateSubspace.LonelyRunnerBound 8"],
        "eight_speed_bound_discharged": False,
        "unconditional_nine_speed_result_claimed": False,
        "complete_nine_speed_classification_claimed": False,
        "original_shift_endpoint": "Loneliness.GcdShift.nine_speed_shift_test_of_exception",
        "final_endpoints": ["Loneliness.GcdShift.shiftReject_sound_of_signed_unit",
                            "Loneliness.GcdShift.shiftReject_sound_of_folded_represents"],
        "finite_decidable_definition": "Loneliness.GcdShift.shiftReject",
        "finite_modular_unit_hypotheses_retained": True,
        "signed_unit_residue_or_folded_representation_required": True,
        "positive_shift_cost_required": True,
        "complete_finite_lift_census_claimed": False,
        "explicit_quantified_statement_count": 12,
        "original_statement_count": 5, "transport_statement_count": 7,
        "original_assertions_sha256": ORIGINAL_ASSERTIONS_SHA256,
        "transport_assertions_sha256": TRANSPORT_ASSERTIONS_SHA256,
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
        receipt["committed_input_sha256"] = frozen_commit_inputs(spec, receipt["git_commit"])
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
            require(sha(copied) == spec["source_sha256"][module], "Copied gcd shift transport dependency source changed")
            output = stage / "lib/lean" / (stem + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            receipt["source_checks"][module] = checked(
                [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                 "-o", str(output), stem + ".lean"], "source", module, 1800)
            save()
        frozen = staged_objects(full, stage, spec)
        receipt["artifact_sha256"] = frozen
        receipt["fresh_source_compilation_passed"] = True
        audit_path = stage / "src/GcdShiftTransportAudit.lean"
        audit_path.write_text(full.audit.audit_source(spec["modules"], spec["required"], ["Loneliness."])
                              + semantic_assertions())
        result = checked([str(compiler / "bin/lean"), "-j1", "-M4500",
                          "-DwarningAsError=true", audit_path.name], "audit", "all-owned", 1800)
        audit_spec = {"modules": spec["modules"], "required": spec["required"],
                      "legacy_prefixes": ["Loneliness."]}
        inventory = full.audit.validate_log(Path(result["log"]).read_text(), audit_spec, spec["modern"])
        require(all(inventory["declarations"][name]["kind"] == "theorem" for name in spec["required"]),
                "A required gcd shift transport component endpoint is not a theorem")
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
        result = checked(command, "kernel", "Conjectures-exact-gcd-shift-transport-closure", 18000)
        replayed = re.findall(r"^replaying (\S+)$", Path(result["log"]).read_text(), re.M)
        require(len(replayed) == len(spec["modules"]) and len(replayed) == len(set(replayed))
                and set(replayed) == set(spec["modules"]),
                "Stock replay omitted, repeated, or added a gcd shift transport dependency module")
        receipt["kernel_checks"]["Conjectures"] = {**result, "replayed_modules": replayed}
        save()
        require(staged_objects(full, stage, spec) == frozen, "Staged gcd shift transport proof objects changed")
        for module, digest in spec["source_sha256"].items():
            copied = stage / "src" / (module.replace(".", "/") + ".lean")
            require(sha(source(module)) == digest and sha(copied) == digest,
                    "Gcd shift transport dependency source changed: " + module)
        for path, digest in spec["controls_sha256"].items():
            require(sha(ROOT / path) == digest, "Gcd shift transport verification control changed: " + path)
        require(sha(compiler / "bin/lean") == full.LEAN_SHA256
                and sha(compiler / "bin/leanchecker") == full.CHECKER_SHA256,
                "Pinned compiler or stock checker changed")
        require(set(receipt["source_checks"]) == set(spec["modules"]),
                "Fresh source compilation inventory is incomplete")
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
            "all_owned_axioms_and_exact_stock_replay_passed": True,
            "conditional_gcd_shift_transport_component_replayed": True})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({"status": "passed", "root": ROOT_MODULE, "component_only": True,
                      "modules": len(spec["modules"]), "source_mode": "fresh_compilation",
                      "eight_speed_bound_discharged": False,
                      "unconditional_nine_speed_result_claimed": False,
                      "complete_nine_speed_classification_claimed": False,
                      "complete_finite_lift_census_claimed": False,
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
                          "source_mode": "fresh_compilation", "explicit_quantified_statement_count": 12,
                          "original_statement_count": 5, "transport_statement_count": 7,
                          "controls_sha256": spec["controls_sha256"],
                          "imported_controller_sha256": spec["imported_controller_sha256"]}, indent=2))
        return
    stage = args.stage or ROOT / ".candidate-artifacts/gcd-shift-transport"
    require(not stage.is_symlink(), "Gcd shift transport proof stage is a symlink")
    verify(full, spec, stage.resolve())


if __name__ == "__main__":
    main()
