#!/usr/bin/env python3
"""Fresh strict-source, private-declaration and stock-kernel five-speed gate.

This candidate targets the unconditional five-speed bound. A receipt confirms
that bound only after all checks pass. This gate does not edit accepted registries.
Every project dependency is rebuilt and replayed as an exact kernel target.
"""
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
import verify_frankl_orbit_batches as runtime
from replay_lean import header_tokens, imports_of


ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/renault-five-speed-sources.json"
CONTROLLER = "scripts/verify_renault_five_speed.py"
WORKFLOW = ".github/workflows/lean-renault-five-speed.yml"
PRODUCERS = (
    "scripts/generate_renault_phase_certificates.py",
    "scripts/generate_renault_small_phase_certificates.py",
)
HELPERS = (
    "scripts/audit_lean_all_owned.py", "scripts/verify_frankl_orbit_batches.py",
    "scripts/replay_lean.py", "scripts/plan_lean_candidates.py",
    "scripts/verify_lean_candidate.py", "scripts/build_lean_parallel.py",
    "scripts/plan_accepted_lean.py",
)
CONFIGURATION = ("lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json")
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
ALLOWED = ("propext", "Classical.choice", "Quot.sound")
POLICY = {"warning_as_error": True, "linter_override": False, "fresh_project_objects": True}
SCOPE = {"checkpoint": "complete_renault_five_speed_target", "complete_five_speed_bound_target": True,
         "accepted_registry_changed": False}
FACETS = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig")
TIMEOUT = 1800
MEMORY = 4500
ROOT_ENDPOINTS = {'PhaseCells': ('distance_strict_of_cell', 'distance_eq_min_fract', 'distance_nat_mul_distance', 'distance_mul_fract_eq', 'distance_of_unit_interval', 'distance_add_half', 'three_five_distance_band', 'double_half_strict_of_outer', 'two_odd_phase_improvement', 'PhaseAction.good_fract_iff', 'phaseActionCheck_sound', 'phaseMaskCheck_sound', 'PhaseCover.check_sound', 'exists_set_bit', 'phaseTripleCheck_sound', 'phase_three_covers'), 'PhaseCertificates': ('phase_lemma_5_1', 'phase_lemma_5_2', 'phase_lemma_5_3', 'phase_lemma_6_1', 'phase_lemma_6_2', 'phase_lemma_6_3', 'phase_lemma_6_4', 'phase_lemma_6_5'), 'SmallPhases': ('exists_small_multiplier_unsafe', 'three_even_shift_phase'), 'Maximizer': ('exists_constrained_maximum', 'exists_positive_feasible', 'exists_positive_maximizer', 'maximizer_has_upper_boundary', 'exists_maximizer_with_upper_boundary'), 'Affine': ('distance_time_affine_six', 'fract_time_affine_six', 'fract_int_mul_fract', 'fract_nat_mul_fract', 'distance_time_add_of_dvd', 'fract_time_add_of_dvd'), 'TwoMultiples': ('exists_phase_fiber_maximum', 'distance_div_nat_eq_zero_iff', 'phase_fiber_zero_divisibility', 'two_multiple_final_times'), 'TwoMultiplesPhase': ('small_multiple_distance_gt', 'ordered_phase_band', 'phase_fiber_affine_six', 'phase_fiber_odd_multiple', 'phase_fiber_multiplier_distance'), 'Preliminaries': ('exists_nearby_safe', 'distance_rational_shift_of_dvd', 'distance_third_shift_of_dvd', 'third_unsafe_unique', 'endpoint_third_shift_safe', 'endpoint_runner_third_shift_safe', 'exists_third_shift_of_at_most_two', 'exists_third_shift_of_two_unsafe', 'exists_third_shift_of_endpoint'), 'GcdOrbit': ('gcd_orbit_point',), 'ThirdObstructions': ('third_shift_safe_of_initial_le', 'exists_third_shift_of_three_close'), 'Reindex': ('allSafe_reindex_iff', 'exists_allSafe_reindex_iff', 'foldr_gcd_ofFn_reindex', 'primitive_reindex_iff', 'card_filter_equiv', 'exists_reindex_two'), 'TwoMultiplesCase': ('ordered_phase_fiber_zero',), 'RationalOrbit': ('exists_four_safe_on', 'exists_four_safe_except', 'exists_strict_safe_except', 'exists_allSafe_of_fast', 'exists_allSafe_of_four_multiples', 'divisibility_card_le_three', 'divisibility_card_pos', 'divisibility_card_bounds', 'exists_allSafe_of_three_multiples'), 'TwoMultiplesFinal': ('fiveSafe_iff_allSafe', 'two_multiple_forced_divisibility', 'exists_allSafe_of_first_two_multiples', 'exists_allSafe_of_two_multiples'), 'ParityCases': ('unique_even_safe_time_of_phase_lemmas', 'two_even_safe_time_of_phase_lemmas', 'unique_even_safe_time', 'two_even_safe_time'), 'ThreeEven': ('no_double_middle_distance', 'odd_divides_of_middle_condition', 'three_even_safe_time_of_signed_residues', 'three_even_safe_time'), 'Ordering': ('caseOrder_bijective', 'caseOrder_zero', 'caseEquiv_zero', 'exists_caseOrder'), 'Assembly': ('allSafe_of_residue_cases',), 'Normalization': ('five_list_value_lower_of_primitive', 'bounded_list_value_lower_of_primitive', 'runner_bound_five_of_primitive'), 'FiveSpeed': ('primitive_five_safe_time_of_four', 'five_speed_common_time_of_four', 'five_speed_bound_of_four')}
ROOTS = ['Conjectures.LonelinessRenaultPhaseCells', 'Conjectures.LonelinessRenaultPhaseCertificates', 'Conjectures.LonelinessRenaultSmallPhases', 'Conjectures.LonelinessRenaultMaximizer', 'Conjectures.LonelinessRenaultAffine', 'Conjectures.LonelinessRenaultTwoMultiples', 'Conjectures.LonelinessRenaultTwoMultiplesPhase', 'Conjectures.LonelinessRenaultPreliminaries', 'Conjectures.LonelinessRenaultGcdOrbit', 'Conjectures.LonelinessRenaultThirdObstructions', 'Conjectures.LonelinessRenaultReindex', 'Conjectures.LonelinessRenaultTwoMultiplesCase', 'Conjectures.LonelinessRenaultRationalOrbit', 'Conjectures.LonelinessRenaultTwoMultiplesFinal', 'Conjectures.LonelinessRenaultParityCases', 'Conjectures.LonelinessRenaultThreeEven', 'Conjectures.LonelinessRenaultOrdering', 'Conjectures.LonelinessRenaultAssembly', 'Conjectures.LonelinessRenaultNormalization', 'Conjectures.LonelinessRenaultFiveSpeed', 'Conjectures.LonelinessFiveSpeedBound']
COMMON = set(['Conjectures.HaralambisCounting', 'Conjectures.HaralambisDefects', 'Conjectures.HaralambisDensity', 'Conjectures.HaralambisFaces', 'Conjectures.HaralambisIntervals', 'Conjectures.HaralambisOrientation', 'Conjectures.HaralambisPairSum', 'Conjectures.HaralambisPeriods', 'Conjectures.HaralambisTheorem', 'Conjectures.Loneliness', 'Conjectures.LonelinessCertificate', 'Conjectures.LonelinessCoalescence', 'Conjectures.LonelinessCoalescenceAvoiding', 'Conjectures.LonelinessCoalescenceValue', 'Conjectures.LonelinessContinuity', 'Conjectures.LonelinessCoordinateClasses', 'Conjectures.LonelinessCoordinateSubspace', 'Conjectures.LonelinessCriticalBase', 'Conjectures.LonelinessCriticalFamilies', 'Conjectures.LonelinessCriticalSecond', 'Conjectures.LonelinessExamples', 'Conjectures.LonelinessFiveFamily', 'Conjectures.LonelinessFourSpeedCertificate', 'Conjectures.LonelinessFourSpeedCertificate17', 'Conjectures.LonelinessFourSpeedCertificate29', 'Conjectures.LonelinessFourSpeedCertificate31', 'Conjectures.LonelinessFourSpeedCertificate37', 'Conjectures.LonelinessFourSpeedCertificate41', 'Conjectures.LonelinessFourSpeedCertificate43', 'Conjectures.LonelinessFourSpeedCertificate47', 'Conjectures.LonelinessFourSpeedCertificate53', 'Conjectures.LonelinessFourSpeedCertificate59', 'Conjectures.LonelinessFourSpeedCertificate61', 'Conjectures.LonelinessFourSpeedCertificateAll', 'Conjectures.LonelinessFourSpeedCertificateChunks', 'Conjectures.LonelinessFourSpeedClassification', 'Conjectures.LonelinessFourSpeedClassificationFinite', 'Conjectures.LonelinessFourSpeedCutoff', 'Conjectures.LonelinessFourSpeedEnumeration', 'Conjectures.LonelinessFourSpeedFastEnumeration', 'Conjectures.LonelinessFourSpeedFinite', 'Conjectures.LonelinessFourSpeedFoldedGeometry', 'Conjectures.LonelinessFourSpeedGap', 'Conjectures.LonelinessFourSpeedGeometry', 'Conjectures.LonelinessFourSpeedLift17', 'Conjectures.LonelinessFourSpeedLift29', 'Conjectures.LonelinessFourSpeedLift31', 'Conjectures.LonelinessFourSpeedLift37', 'Conjectures.LonelinessFourSpeedLift41', 'Conjectures.LonelinessFourSpeedLift43', 'Conjectures.LonelinessFourSpeedLift47', 'Conjectures.LonelinessFourSpeedLift53', 'Conjectures.LonelinessFourSpeedLift59', 'Conjectures.LonelinessFourSpeedLift61', 'Conjectures.LonelinessFourSpeedLiftDirections', 'Conjectures.LonelinessFourSpeedLiftSound', 'Conjectures.LonelinessIntegerDirection', 'Conjectures.LonelinessMax', 'Conjectures.LonelinessModularDirections', 'Conjectures.LonelinessModularFoldedSearch', 'Conjectures.LonelinessModularLift', 'Conjectures.LonelinessModularNormalize', 'Conjectures.LonelinessModularPrimes', 'Conjectures.LonelinessModularRationalWitness', 'Conjectures.LonelinessModularSearch', 'Conjectures.LonelinessModularShortVector', 'Conjectures.LonelinessModularWitness', 'Conjectures.LonelinessNormalization', 'Conjectures.LonelinessPacking', 'Conjectures.LonelinessPackingLower', 'Conjectures.LonelinessPairBridge', 'Conjectures.LonelinessPigeonhole', 'Conjectures.LonelinessPigeonholePlane', 'Conjectures.LonelinessPlaneDirections', 'Conjectures.LonelinessPlaneGap', 'Conjectures.LonelinessProductFamily', 'Conjectures.LonelinessRational', 'Conjectures.LonelinessRationalSubspace', 'Conjectures.LonelinessSmallRunner', 'Conjectures.LonelinessSubspaceDensity', 'Conjectures.LonelinessSubspaceExtension', 'Conjectures.LonelinessTwoDirections', 'Conjectures.NonmixedGapDensity', 'Conjectures.NonmixedGapPeriodic', 'Conjectures.NonmixedGapResidues'])
REQUIRED = ['Loneliness.Renault.PhaseAction.good_fract_iff', 'Loneliness.Renault.PhaseCover.check_sound', 'Loneliness.Renault.allSafe_of_residue_cases', 'Loneliness.Renault.allSafe_reindex_iff', 'Loneliness.Renault.bounded_list_value_lower_of_primitive', 'Loneliness.Renault.card_filter_equiv', 'Loneliness.Renault.caseEquiv_zero', 'Loneliness.Renault.caseOrder_bijective', 'Loneliness.Renault.caseOrder_zero', 'Loneliness.Renault.distance_add_half', 'Loneliness.Renault.distance_div_nat_eq_zero_iff', 'Loneliness.Renault.distance_eq_min_fract', 'Loneliness.Renault.distance_mul_fract_eq', 'Loneliness.Renault.distance_nat_mul_distance', 'Loneliness.Renault.distance_of_unit_interval', 'Loneliness.Renault.distance_rational_shift_of_dvd', 'Loneliness.Renault.distance_strict_of_cell', 'Loneliness.Renault.distance_third_shift_of_dvd', 'Loneliness.Renault.distance_time_add_of_dvd', 'Loneliness.Renault.distance_time_affine_six', 'Loneliness.Renault.divisibility_card_bounds', 'Loneliness.Renault.divisibility_card_le_three', 'Loneliness.Renault.divisibility_card_pos', 'Loneliness.Renault.double_half_strict_of_outer', 'Loneliness.Renault.endpoint_runner_third_shift_safe', 'Loneliness.Renault.endpoint_third_shift_safe', 'Loneliness.Renault.exists_allSafe_of_fast', 'Loneliness.Renault.exists_allSafe_of_first_two_multiples', 'Loneliness.Renault.exists_allSafe_of_four_multiples', 'Loneliness.Renault.exists_allSafe_of_three_multiples', 'Loneliness.Renault.exists_allSafe_of_two_multiples', 'Loneliness.Renault.exists_allSafe_reindex_iff', 'Loneliness.Renault.exists_caseOrder', 'Loneliness.Renault.exists_constrained_maximum', 'Loneliness.Renault.exists_four_safe_except', 'Loneliness.Renault.exists_four_safe_on', 'Loneliness.Renault.exists_maximizer_with_upper_boundary', 'Loneliness.Renault.exists_nearby_safe', 'Loneliness.Renault.exists_phase_fiber_maximum', 'Loneliness.Renault.exists_positive_feasible', 'Loneliness.Renault.exists_positive_maximizer', 'Loneliness.Renault.exists_reindex_two', 'Loneliness.Renault.exists_set_bit', 'Loneliness.Renault.exists_small_multiplier_unsafe', 'Loneliness.Renault.exists_strict_safe_except', 'Loneliness.Renault.exists_third_shift_of_at_most_two', 'Loneliness.Renault.exists_third_shift_of_endpoint', 'Loneliness.Renault.exists_third_shift_of_three_close', 'Loneliness.Renault.exists_third_shift_of_two_unsafe', 'Loneliness.Renault.fiveSafe_iff_allSafe', 'Loneliness.Renault.five_list_value_lower_of_primitive', 'Loneliness.Renault.five_speed_bound_of_four', 'Loneliness.Renault.five_speed_common_time', 'Loneliness.Renault.five_speed_common_time_of_four', 'Loneliness.Renault.five_speed_lonelyRunnerBound', 'Loneliness.Renault.foldr_gcd_ofFn_reindex', 'Loneliness.Renault.fract_int_mul_fract', 'Loneliness.Renault.fract_nat_mul_fract', 'Loneliness.Renault.fract_time_add_of_dvd', 'Loneliness.Renault.fract_time_affine_six', 'Loneliness.Renault.gcd_orbit_point', 'Loneliness.Renault.maximizer_has_upper_boundary', 'Loneliness.Renault.no_double_middle_distance', 'Loneliness.Renault.odd_divides_of_middle_condition', 'Loneliness.Renault.ordered_phase_band', 'Loneliness.Renault.ordered_phase_fiber_zero', 'Loneliness.Renault.phaseActionCheck_sound', 'Loneliness.Renault.phaseMaskCheck_sound', 'Loneliness.Renault.phaseTripleCheck_sound', 'Loneliness.Renault.phase_fiber_affine_six', 'Loneliness.Renault.phase_fiber_multiplier_distance', 'Loneliness.Renault.phase_fiber_odd_multiple', 'Loneliness.Renault.phase_fiber_zero_divisibility', 'Loneliness.Renault.phase_lemma_5_1', 'Loneliness.Renault.phase_lemma_5_2', 'Loneliness.Renault.phase_lemma_5_3', 'Loneliness.Renault.phase_lemma_6_1', 'Loneliness.Renault.phase_lemma_6_2', 'Loneliness.Renault.phase_lemma_6_3', 'Loneliness.Renault.phase_lemma_6_4', 'Loneliness.Renault.phase_lemma_6_5', 'Loneliness.Renault.phase_three_covers', 'Loneliness.Renault.primitive_five_safe_time', 'Loneliness.Renault.primitive_five_safe_time_of_four', 'Loneliness.Renault.primitive_reindex_iff', 'Loneliness.Renault.runner_bound_five_of_primitive', 'Loneliness.Renault.small_multiple_distance_gt', 'Loneliness.Renault.third_shift_safe_of_initial_le', 'Loneliness.Renault.third_unsafe_unique', 'Loneliness.Renault.three_even_safe_time', 'Loneliness.Renault.three_even_safe_time_of_signed_residues', 'Loneliness.Renault.three_even_shift_phase', 'Loneliness.Renault.three_five_distance_band', 'Loneliness.Renault.two_even_safe_time', 'Loneliness.Renault.two_even_safe_time_of_phase_lemmas', 'Loneliness.Renault.two_multiple_final_times', 'Loneliness.Renault.two_multiple_forced_divisibility', 'Loneliness.Renault.two_odd_phase_improvement', 'Loneliness.Renault.unique_even_safe_time', 'Loneliness.Renault.unique_even_safe_time_of_phase_lemmas']


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


def source(base, module):
    return base / (module.replace(".", "/") + ".lean")


def validate_model(model):
    require(model["schema"] == "renault-five-speed-sources-v1", "Unexpected source model")
    require(model["source_policy"] == POLICY and model["proof_scope"] == SCOPE,
            "Five-speed policy or claimed scope changed")
    require(model["roots"] == ROOTS and model["required_theorems"] == REQUIRED,
            "Frozen roots or required theorem inventory changed")
    require(len(REQUIRED) == len(set(REQUIRED)), "Duplicate required theorem")
    require(tuple(audit.ALLOWED) == ALLOWED, "Standard axiom whitelist changed")
    require(model["runtime_sha256"] == {"lean": LEAN_SHA256, "leanchecker": CHECKER_SHA256},
            "Pinned runtime model changed")
    modules = runtime.dependency_order(ROOTS)
    require(set(modules) == set(ROOTS) | COMMON, "Unreviewed five-speed dependency closure")
    require(set(model["source_sha256"]) == set(modules), "Source model has missing or extra modules")
    for module in modules:
        path = source(ROOT / "lean", module)
        require(path.is_file() and not path.is_symlink(), "Missing or linked source: " + module)
        require(sha(path) == model["source_sha256"][module], "Frozen source changed: " + module)
    controls = set(PRODUCERS + HELPERS + CONFIGURATION + (CONTROLLER, WORKFLOW))
    require(set(model["control_sha256"]) == controls, "Gate control inventory changed")
    for path, digest in model["control_sha256"].items():
        actual = ROOT / path
        require(actual.is_file() and not actual.is_symlink(), "Missing or linked control: " + path)
        require(sha(actual) == digest, "Frozen gate control changed: " + path)
    return modules


def object_hashes(stage, modules, modern):
    result = {}
    for module in modules:
        stem = stage / "lib/lean" / module.replace(".", "/")
        result[module] = {}
        for facet in FACETS:
            path = Path(str(stem) + facet)
            require(not path.is_symlink(), "Linked project object: " + str(path))
            if path.is_file():
                result[module][facet] = sha(path)
        expected = set(FACETS[:3]) if modern[module] else {".olean"}
        require(expected <= set(result[module]), "Missing object facets: " + module)
        require((".olean.private" in result[module]) == (".olean.server" in result[module]),
                "Incomplete private/server pair: " + module)
    found = set()
    for path in (stage / "lib/lean/Conjectures").rglob("*"):
        require(not path.is_symlink(), "Linked entry in project object tree: " + str(path))
        if path.is_file():
            for facet in FACETS:
                if path.name.endswith(facet):
                    name = str(path.relative_to(stage / "lib/lean"))[:-len(facet)]
                    found.add(name.replace(os.sep, "."))
                    break
    require(found == set(modules), "Project object closure has missing or extra modules")
    return result


def verify(model, modules, model_digest, stage, runtime_path):
    require(not stage.is_symlink(), "Artifact directory must not be a symlink")
    require(not stage.exists() or not any(stage.iterdir()), "Use a fresh empty artifact directory")
    for name in ("controls", "src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    receipt = {
        "schema": "renault-five-speed-receipt-v1", "status": "running", "proof_scope": SCOPE,
        "source_policy": POLICY, "roots": ROOTS, "project_modules": modules,
        "required_theorems": REQUIRED, "axiom_whitelist": list(ALLOWED),
        "source_workers": 1, "kernel_threads": 1, "memory_megabytes": MEMORY,
        "phase_timeout_seconds": TIMEOUT, "source_checks": {}, "kernel_checks": {},
        "reproduction_checks": {}, "complete_five_speed_bound_verified": False,
        "accepted_registry_changed": False,
    }

    def save():
        (stage / "receipt.json").write_bytes(encoded(receipt))

    def check(command, cwd, environment, label):
        log = stage / "logs" / (label + ".log")
        progress = stage / "progress" / (label + ".json")
        result = runtime.profile(command, cwd, environment, log, progress, TIMEOUT)
        result.update({"progress": str(progress), "progress_sha256": sha(progress)})
        return result

    def successful(result, label):
        require(result["exit_code"] == 0 and result["timed_out"] is False,
                label + " failed:\n" + Path(result["log"]).read_text()[-12000:])

    save()
    try:
        require(sha(ROOT / MODEL) == model_digest, "Source model changed after preflight")
        controls = {**model["control_sha256"], MODEL: model_digest}
        commit = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
        inputs = {**controls, **{"lean/" + module.replace(".", "/") + ".lean": digest
                                for module, digest in model["source_sha256"].items()}}
        for path, digest in inputs.items():
            blob = subprocess.check_output(["git", "show", commit + ":" + path], cwd=ROOT)
            require(hashlib.sha256(blob).hexdigest() == digest, "Input differs from recorded commit: " + path)
        receipt.update({"git_commit": commit, "commit_input_sha256": inputs, "gate_sha256": controls})
        for path, digest in controls.items():
            require(sha(ROOT / path) == digest, "Control changed after preflight: " + path)
            destination = stage / "controls" / path
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(ROOT / path, destination)
            require(sha(destination) == digest, "Copied control differs: " + path)
        source_hashes, modern = {}, {}
        for module in modules:
            origin, destination = source(ROOT / "lean", module), source(stage / "src", module)
            digest = model["source_sha256"][module]
            require(sha(origin) == digest, "Source changed after preflight: " + module)
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(origin, destination)
            require(sha(destination) == digest, "Copied source differs from model: " + module)
            source_hashes[module] = digest
            modern[module] = next(header_tokens(destination.read_text()), None) == "module"
        receipt.update({"source_sha256": source_hashes, "modern_modules": modern})
        compiler, external, identity = runtime.resolve_runtime(runtime_path)
        require(identity["lean_sha256"] == LEAN_SHA256 and identity["checker_sha256"] == CHECKER_SHA256,
                "Compiler or unchanged stock checker differs from pinned binary")
        receipt.update({"toolchain": identity, "external_lean_path": external})
        environment = {**os.environ,
            "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
            "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
            "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0"}
        save()
        for path in PRODUCERS:
            result = check([sys.executable, str(ROOT / path), "--repo", str(ROOT), "--check"],
                           ROOT, environment, Path(path).stem + ".reproduction")
            receipt["reproduction_checks"][path] = result
            save()
            successful(result, "Certificate payload reproduction")
        failed_modules, blocked_modules, passed_modules = [], [], set()
        for module in modules:
            dependencies = [name for name in imports_of(source(stage / "src", module))
                            if name.startswith("Conjectures.")]
            blocked = sorted(set(dependencies) - passed_modules)
            if blocked:
                receipt["source_checks"][module] = {"status": "blocked", "dependencies": blocked}
                blocked_modules.append(module)
                save()
                continue
            output = stage / "lib/lean" / (module.replace(".", "/") + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            command = [str(compiler / "bin/lean"), "-j1", "-M" + str(MEMORY), "-DwarningAsError=true",
                       "-o", str(output), module.replace(".", "/") + ".lean"]
            result = check(command, stage / "src", environment, module + ".source")
            receipt["source_checks"][module] = result
            save()
            if result["exit_code"] == 0 and result["timed_out"] is False:
                passed_modules.add(module)
            else:
                failed_modules.append(module)
                for facet in FACETS:
                    Path(str(output)[:-len(".olean")] + facet).unlink(missing_ok=True)
                print("Strict source failed: " + module + "\n" +
                      Path(result["log"]).read_text()[-12000:], flush=True)
        receipt["source_failures"] = failed_modules
        receipt["source_blocked"] = blocked_modules
        save()
        require(not failed_modules and not blocked_modules and passed_modules == set(modules),
                "Source closure incomplete; failed=" + repr(failed_modules) +
                "; blocked=" + repr(blocked_modules))
        frozen_objects = object_hashes(stage, modules, modern)
        receipt["artifact_sha256"] = frozen_objects
        audit_text = audit.audit_source(modules, REQUIRED, ["Loneliness."])
        audit_path = stage / "src/RenaultFiveSpeedAudit.lean"
        audit_path.write_text(audit_text)
        result = check([str(compiler / "bin/lean"), "-j1", "-M" + str(MEMORY),
                        "-DwarningAsError=true", audit_path.name], stage / "src", environment, "all-owned-audit")
        receipt["axiom_audit"] = result
        save()
        successful(result, "All-owned private declaration audit")
        spec = {"modules": modules, "required": REQUIRED, "legacy_prefixes": ["Loneliness."]}
        inventory = audit.validate_log(Path(result["log"]).read_text(), spec, modern, allowed=ALLOWED)
        require(all(inventory["declarations"][name]["kind"] == "theorem" for name in REQUIRED),
                "Required endpoint is not a theorem")
        inventory_path = stage / "declaration-inventory.json"
        inventory_path.write_bytes(encoded(inventory))
        result.update({"all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
                       "complete_serialized_private_import": True, "summary": inventory["summary"],
                       "audit_source_sha256": sha(audit_path),
                       "declaration_inventory_sha256": sha(inventory_path)})
        save()
        replayed = []
        for module in modules:
            require([name for name in modules if name == module or name.startswith(module + ".")] == [module],
                    "Stock checker target is not an exact singleton")
            command = [str(compiler / "bin/leanchecker"), "-v", module]
            if buffer := shutil.which("stdbuf"):
                command = [buffer, "-oL", "-eL", *command]
            result = check(command, stage / "src", environment, module + ".kernel")
            receipt["kernel_checks"][module] = result
            save()
            successful(result, "Stock kernel replay " + module)
            actual = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$", Path(result["log"]).read_text(), re.M)
            require(actual == [module], "Stock checker replay inventory differs: " + module)
            result.update({"replayed_modules": actual, "exact_singleton_target": True})
            replayed.extend(actual)
        require(replayed == modules, "Incomplete exact kernel closure")
        require(object_hashes(stage, modules, modern) == frozen_objects, "Compiled object bytes changed")
        found_sources = {".".join(path.relative_to(stage / "src").with_suffix("").parts)
                         for path in (stage / "src/Conjectures").rglob("*.lean")}
        require(found_sources == set(modules), "Copied source inventory changed")
        for module, digest in source_hashes.items():
            require(sha(source(stage / "src", module)) == digest, "Copied source changed: " + module)
            require(sha(source(ROOT / "lean", module)) == digest, "Original source changed: " + module)
        for path, digest in controls.items():
            require(sha(ROOT / path) == digest and sha(stage / "controls" / path) == digest,
                    "Gate control changed: " + path)
        all_checks = [*receipt["reproduction_checks"].values(), *receipt["source_checks"].values(),
                      receipt["axiom_audit"], *receipt["kernel_checks"].values()]
        for result in all_checks:
            require(sha(result["log"]) == result["log_sha256"], "Verification log changed")
            require(sha(result["progress"]) == result["progress_sha256"], "Verification profile changed")
        require(audit_path.read_text() == audit_text and sha(inventory_path) ==
                receipt["axiom_audit"]["declaration_inventory_sha256"], "Audit evidence changed")
        require(sha(compiler / "bin/lean") == LEAN_SHA256 and sha(compiler / "bin/leanchecker") == CHECKER_SHA256,
                "Compiler or unchanged stock checker changed")
        require(subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip() == commit,
                "Frozen checkout commit changed")
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "complete_five_speed_bound_verified": True,
                        "kernel_replay": {"replayed_modules": replayed, "exact_project_closure": True,
                                          "all_modules_replayed_as_targets": True, "fresh_process_per_module": True}})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({"status": "passed", "roots": len(ROOTS), "modules": len(modules),
                      "required_theorems": len(REQUIRED), "complete_five_speed_bound_verified": True,
                      "receipt_sha256": sha(stage / "receipt.json")}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--artifact-dir", type=Path)
    parser.add_argument("--runtime", type=Path)
    args = parser.parse_args()
    model_bytes = (ROOT / MODEL).read_bytes()
    model = json.loads(model_bytes)
    modules = validate_model(model)
    if args.preflight:
        print(json.dumps({"status": "preflight_passed", "roots": len(ROOTS), "modules": len(modules),
                          "required_theorems": len(REQUIRED), "complete_five_speed_bound_verified": False}))
        return
    stage = args.artifact_dir or ROOT / ".candidate-artifacts/renault-five-speed"
    verify(model, modules, hashlib.sha256(model_bytes).hexdigest(), stage.resolve(), args.runtime)


if __name__ == "__main__":
    main()
