#!/usr/bin/env python3
"""Verify the unconditional five-runner theorem and its exact source closure.

The default gate regenerates all five prime certificates, compiles every
project source into a fresh stage, audits every owned/private declaration,
checks the explicit mathematical statements, and replays each exact project
module with the pinned unchanged stock kernel checker. --check-built binds
every reused proof object to an actual successful strict source record; it
does not claim that this invocation compiled the original sources.
"""

from __future__ import annotations

import argparse
import contextlib
import hashlib
import io
import json
import os
from pathlib import Path
import re
import shutil
import subprocess

import audit_lean_all_owned as audit
import generate_five_runner_certificates as producer
import generate_five_runner_fuel as fuel
import verify_frankl_orbit_batches as runtime
from replay_lean import header_tokens


ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / "lean"
ROOT_MODULE = "Conjectures.LonelinessFiveRunnerTheorem"
PRIME_FRAMES = {149: 1171, 151: 1478, 163: 1596, 167: 1430, 173: 1395}
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
FACETS = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig")
CONTROLS = (
    "scripts/verify_five_runner_exact.py",
    ".github/workflows/lean-five-runner-exact.yml",
    "scripts/generate_five_runner_certificates.py",
    "scripts/generate_five_runner_arithmetic.py",
    "scripts/generate_five_runner_assembly.py",
    "scripts/generate_five_runner_fast.py",
    "scripts/generate_five_runner_fuel.py",
    "scripts/generate_six_speed_late_prime_batches.py",
    "scripts/generate_six_speed_prime_certificates.py",
    "scripts/generate_six_speed_prime_arithmetic.py",
    "scripts/generate_six_speed_prime_assembly.py",
    "scripts/generate_six_speed_prime_fast.py",
    "scripts/audit_lean_all_owned.py",
    "scripts/verify_frankl_orbit_batches.py",
    "scripts/replay_lean.py",
    "scripts/build_lean_parallel.py",
    "scripts/plan_lean_candidates.py",
    "scripts/verify_lean_candidate.py",
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
)


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def write_json(path, value):
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def source(module):
    return LEAN / (module.replace(".", "/") + ".lean")


def preflight(frame_budget=128, block_size=128, root_budget=8):
    namespace = "Loneliness.Modular.FiveRunner"
    required = [namespace + "." + name for name in (
        "terminal_sound", "retained_direction", "checked_prime_classification",
        "classified_iff", "consecutive_value", "exceptional_value",
        "primitive_list_classification", "normalized_classification",
        "lonelyRunnerBound_of_classification", "primitive_classification",
        "primitive_value_eq", "five_runner_bound", "complete_normalized_classification")]
    required.append("Loneliness.CoordinateSubspace.five_speed_lonelyRunnerBound")
    required.extend("Loneliness.FiveRunnerNorm." + name for name in (
        "lower_runner_bound", "squared_norm_le", "all_primes", "all_primes_gt_135",
        "prime_product", "forced_divisor", "prime_product_coprime",
        "prime_product_margin", "exists_prime_avoiding"))
    required.extend([
        "Loneliness.Modular.SupportSearch.Bits.Fast.count_eq",
        "Loneliness.Modular.SupportSearch.Bits.Fuel.countAux_eq",
        "Loneliness.Modular.SupportSearch.Bits.Fuel.count_eq_fast",
        "Loneliness.Modular.SupportSearch.Bits.Fuel.count_eq",
        "Loneliness.Modular.SupportSearch.Bits.FuelCuts.capacity_eq",
        "Loneliness.Modular.SupportSearch.Bits.FuelCuts.leafCheck_eq",
        "Loneliness.Modular.SupportSearch.Bits.FuelCuts.fragmentCheck_eq",
        "Loneliness.Modular.SupportSearch.Bits.FuelCuts.boundedCheck_eq",
        "Loneliness.Modular.SupportSearch.Bits.FuelCuts.boundedCheck_sound",
    ])
    generation_log = io.StringIO()
    emitted = {}
    inventories = {}
    frame_names = []
    root_names = []
    with contextlib.redirect_stdout(generation_log):
        for prime, expected_frames in PRIME_FRAMES.items():
            data = producer.prime_data(prime)
            data["roots"] = [producer.search_root(data, b)
                             for b in range(2, prime // 2 + 1)]
            require(len(data["rows"]) == 10, "Retained row inventory differs")
            require({tuple(row["direction"]) for row in data["rows"]} ==
                    {(1, 2, 3, 4, 5), (1, 3, 4, 5, 9)}, "Retained directions differ")
            require(all(root["initial"]["slots"] == 3 for root in data["roots"]),
                    "A root does not cover every support of size at most five")
            files, inventory = fuel.render(data, frame_budget, block_size, root_budget)
            require(inventory["complete_prime_rendered"] and
                    inventory["minimum_pairs"] == list(range(2, prime // 2 + 1)),
                    "Incomplete minimum-pair coverage")
            require(inventory["support_frames"] == expected_frames and
                    inventory["transported_frame_proofs"] == expected_frames,
                    "Complete finite frame census differs")
            require(not (set(emitted) & set(files)), "Repeated generated module")
            emitted.update(files)
            inventories[str(prime)] = inventory
            prime_ns = namespace + f".Prime{prime:04d}"
            required.extend(prime_ns + "." + name for name in (
                "inverse_checked", "inverse_valid", "cover_checked", "rows_valid",
                "terminal_sound", "initial_checked", "primitive_classification",
                "primitive_classification_cases"))
            required.extend(prime_ns + f".row{i}_valid" for i in range(10))
            for root in data["roots"]:
                root_ns = prime_ns + f".B{root['b']:03d}"
                root_names.append(root_ns + ".root_checked")
                frame_names.extend(root_ns + f".frame{i:05d}_checked"
                                   for i in range(len(root["frames"])))
    require(len(root_names) == 394 and len(frame_names) == 7070,
            "Complete five-prime root/frame census differs")
    required.extend(root_names)
    required.extend(frame_names)
    require(len(required) == len(set(required)), "Repeated required theorem")
    for module, content in emitted.items():
        require(source(module).read_text() == content,
                "Deterministic complete certificate source differs: " + module)
    modules = runtime.dependency_order([ROOT_MODULE])
    generated = {module for module in modules
                 if module.startswith("Conjectures.LonelinessFiveRunnerPrime")}
    require(generated == set(emitted), "Generated/imported prime-module inventory differs")
    require(not any("EightProbe" in module or "FastRootProbe" in module for module in modules),
            "A performance diagnostic entered the theorem closure")
    expected_triggers = {"lean/" + module.replace(".", "/") + ".lean" for module in modules}
    expected_triggers.update(CONTROLS)
    workflow = (ROOT / ".github/workflows/lean-five-runner-exact.yml").read_text()
    event_blocks = dict(re.findall(
        r"^  (push|pull_request):\n((?:    .*\n)*)", workflow, re.M))
    require(set(event_blocks) == {"push", "pull_request"}, "Missing full-gate event trigger")
    for event, body in event_blocks.items():
        paths = re.findall(r"^      - '([^']+)'$", body, re.M)
        require(len(paths) == len(set(paths)) and set(paths) == expected_triggers,
                "Workflow triggers differ from the exact source/control closure: " + event)
    return {
        "root": ROOT_MODULE, "modules": modules, "required": required,
        "root_theorems": root_names, "frame_theorems": frame_names,
        "source_sha256": {module: sha(source(module)) for module in modules},
        "modern": {module: next(header_tokens(source(module).read_text()), None) == "module"
                   for module in modules},
        "controls_sha256": {path: sha(ROOT / path) for path in CONTROLS},
        "generation": inventories, "generation_log": generation_log.getvalue(),
    }


def resolve_environment(stage):
    compiler = Path(subprocess.check_output(["lean", "--print-prefix"], text=True).strip())
    require(sha(compiler / "bin/lean") == LEAN_SHA256, "Unexpected Lean compiler")
    require(sha(compiler / "bin/leanchecker") == CHECKER_SHA256, "Unexpected stock checker")
    manifest = json.loads((LEAN / "lake-manifest.json").read_text())
    package_cache = Path(os.environ.get("CONJECTURES_PACKAGE_CACHE",
                                       str(LEAN / ".lake/packages"))).resolve()
    require(package_cache.is_dir(), "Missing explicit pinned dependency cache")
    package_roots = {package["name"]: (package_cache / package["name"]).resolve()
                     for package in manifest["packages"]}
    allowed_paths = {(root / ".lake/build/lib/lean").resolve(): name
                     for name, root in package_roots.items()}
    require(len(allowed_paths) == len(package_roots), "Duplicate pinned package object paths")
    standard_library = (compiler / "lib/lean").resolve()
    external = []
    seen = set()
    build = (LEAN / ".lake/build/lib/lean").resolve()
    for entry in os.environ.get("LEAN_PATH", "").split(os.pathsep):
        if not entry:
            continue
        path = Path(entry)
        if not path.is_absolute():
            path = LEAN / path
        path = path.resolve()
        if path == build:
            continue
        require(path not in seen, "Duplicate dependency object path: " + str(path))
        seen.add(path)
        if path == standard_library:
            continue
        require(path in allowed_paths, "Noncanonical dependency object path: " + str(path))
        require(not (path / "Conjectures").exists() and
                not (path / "Conjectures.olean").exists(), "Unstaged external project objects")
        # Lake includes canonical library paths even for unbuilt packages.
        if not path.is_dir():
            continue
        external.append(str(path))
    expected_paths = {path for path in allowed_paths if path.is_dir()}
    require(set(map(Path, external)) == expected_paths,
            "Pinned dependency object-path inventory differs")
    require(any((path / "Mathlib").is_dir() for path in expected_paths),
            "Missing pinned Mathlib objects")
    require(not (standard_library / "Conjectures").exists() and
            not (standard_library / "Conjectures.olean").exists(),
            "Unstaged project objects in the standard library path")
    pins = {}
    for package in manifest["packages"]:
        name = package["name"]
        require(package_roots[name].is_dir(), "Missing pinned dependency checkout: " + name)
        revision = subprocess.check_output(
            ["git", "-C", str(package_roots[name]), "rev-parse", "HEAD"], text=True).strip()
        require(revision == package["rev"], "Dependency revision differs: " + name)
        pins[name] = revision
    external.append(str(standard_library))
    environment = {**os.environ,
        "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
        "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *dict.fromkeys(external)]),
        "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0"}
    return compiler, environment, pins


def checked_source_record(module, spec):
    """Bind reused objects to an actual successful strict source invocation."""
    relative = module.replace(".", "/") + ".lean"
    label = re.sub(r"[^A-Za-z0-9_.-]", "_", relative)
    path = LEAN / ".lake/build/local-source-records" / (label + ".json")
    require(path.is_file(), "Missing strict source record for reused object: " + module)
    record = json.loads(path.read_text())
    output = LEAN / ".lake/build/lib/lean" / (module.replace(".", "/") + ".olean")
    expected = ["lean", "-j1", "-M4500", "-DwarningAsError=true", "-o", str(output), relative]
    require(record["command"] == expected and record["returncode"] == 0,
            "Reused object lacks a successful exact strict command: " + module)
    require(record["compiler_sha256"] == LEAN_SHA256 and
            Path(record["source"]).resolve() == source(module).resolve() and
            record["source_sha256_before"] == spec["source_sha256"][module] and
            record["source_sha256_after"] == spec["source_sha256"][module],
            "Reused object source/compiler binding differs: " + module)
    require(sha(record["stdout_stderr"]) == record["stdout_stderr_sha256"],
            "Strict source log changed: " + module)
    actual = {str(path): sha(path) for suffix in ("", ".private", ".server")
              if (path := Path(str(output) + suffix)).is_file()}
    require(actual and actual == record["object_facets_sha256"],
            "Reused proof object differs from its strict source record: " + module)
    return record


def object_hashes(stage, spec):
    result = {}
    for module in spec["modules"]:
        stem = stage / "lib/lean" / module.replace(".", "/")
        facets = {suffix: sha(path) for suffix in FACETS
                  if (path := Path(str(stem) + suffix)).is_file()}
        needed = set(FACETS[:3]) if spec["modern"][module] else {".olean"}
        require(needed <= set(facets), "Missing object facet: " + module)
        require((".olean.private" in facets) == (".olean.server" in facets),
                "Incomplete private/server facet pair: " + module)
        result[module] = facets
    actual = {".".join(p.relative_to(stage / "lib/lean").with_suffix("").parts)
              for p in (stage / "lib/lean").rglob("*.olean")}
    require(actual == set(spec["modules"]), "Extra or missing staged project object")
    return result


def semantic_assertions():
    """Require the stated quantified goals, including literal retained lists."""
    return '''
example :
    ∀ ds : List ℕ, ds ≠ [] → ds.Nodup → ds.length ≤ 5 →
      (∀ a ∈ ds, 0 < a) → (1 : ℝ) / (5 + 1) ≤ Loneliness.value ds :=
  Loneliness.Modular.FiveRunner.five_runner_bound

example :
    ∀ (v : Fin 5 → ℕ), (∀ i, 0 < v i) →
      (List.ofFn v).foldr Nat.gcd 0 = 1 →
      Loneliness.value (List.ofFn v) ≤ (1 / 6 : ℝ) →
        (List.ofFn v).Perm [1, 2, 3, 4, 5] ∨
          (List.ofFn v).Perm [1, 3, 4, 5, 9] :=
  Loneliness.Modular.FiveRunner.primitive_classification

example :
    ∀ (v : Fin 5 → ℕ), (∀ i, 0 < v i) →
      (List.ofFn v).foldr Nat.gcd 0 = 1 →
      Loneliness.value (List.ofFn v) ≤ (1 / 6 : ℝ) →
        Loneliness.value (List.ofFn v) = (1 / 6 : ℝ) :=
  Loneliness.Modular.FiveRunner.primitive_value_eq

example :
    ∀ (ds : List ℕ), ds.length = 5 → (∀ a ∈ ds, 0 < a) →
      Loneliness.value ds ≤ (1 / 6 : ℝ) →
        (Loneliness.Normalization.normalize ds).Perm [1, 2, 3, 4, 5] ∨
          (Loneliness.Normalization.normalize ds).Perm [1, 3, 4, 5, 9] :=
  Loneliness.Modular.FiveRunner.complete_normalized_classification
'''


def verify(spec, stage, check_built):
    require(not stage.exists() or not any(stage.iterdir()), "Proof stage must be empty")
    for name in ("src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    compiler, environment, pins = resolve_environment(stage)
    receipt = {
        "schema": "five-runner-exact-receipt-v1", "status": "running",
        "root": spec["root"], "project_modules": spec["modules"],
        "source_sha256": spec["source_sha256"], "controls_sha256": spec["controls_sha256"],
        "required_theorems": spec["required"], "prime_frames": PRIME_FRAMES,
        "minimum_pair_count": len(spec["root_theorems"]),
        "support_frames": len(spec["frame_theorems"]),
        "git_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "source_mode": "existing_objects" if check_built else "fresh_compilation",
        "fresh_source_compilation_claimed": not check_built,
        "source_checks": {}, "kernel_checks": {},
        "kernel_mode": "stock-prefix-exact-staged-closure", "kernel_prefixes": ["Conjectures"],
        "lean_sha256": LEAN_SHA256, "checker_sha256": CHECKER_SHA256,
        "dependency_revisions": pins,
        "axiom_whitelist": list(audit.ALLOWED), "source_workers": 1, "kernel_threads": 1,
        "lower_runner_hypotheses_discharged": False,
        "accepted_registry_changed": False,
    }

    def save():
        write_json(stage / "receipt.json", receipt)

    def checked(command, kind, name, timeout):
        result = runtime.profile(command, stage / "src", environment,
            stage / "logs" / f"{name}.{kind}.log",
            stage / "progress" / f"{name}.{kind}.json", timeout)
        require(result["exit_code"] == 0 and result["timed_out"] is False,
                f"{kind} failed for {name}:\n" + Path(result["log"]).read_text()[-12000:])
        return result

    try:
        (stage / "logs/generation.log").write_text(spec["generation_log"])
        write_json(stage / "generation-inventory.json", spec["generation"])
        for module in spec["modules"]:
            stem = module.replace(".", "/")
            copied = stage / "src" / (stem + ".lean")
            copied.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source(module), copied)
            require(sha(copied) == spec["source_sha256"][module], "Copied source changed")
            output = stage / "lib/lean" / (stem + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            if check_built:
                record = checked_source_record(module, spec)
                receipt["source_checks"][module] = record
                shutil.copy2(record["stdout_stderr"], stage / "logs" / (module + ".source.log"))
                write_json(stage / "progress" / (module + ".source-record.json"), record)
                for suffix in FACETS:
                    original = LEAN / ".lake/build/lib/lean" / (stem + suffix)
                    if original.is_file():
                        shutil.copy2(original, stage / "lib/lean" / (stem + suffix))
            else:
                receipt["source_checks"][module] = checked(
                    [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                     "-o", str(output), stem + ".lean"], "source", module, 1800)
            save()
        frozen = object_hashes(stage, spec)
        receipt["artifact_sha256"] = frozen
        raw_audit = audit.audit_source(spec["modules"], spec["required"], ["Loneliness."])
        raw_audit += semantic_assertions()
        audit_path = stage / "src/FiveRunnerExactAudit.lean"
        audit_path.write_text(raw_audit)
        result = checked([str(compiler / "bin/lean"), "-j1", "-M4500",
                          "-DwarningAsError=true", audit_path.name], "audit", "all-owned", 1800)
        audit_spec = {"modules": spec["modules"], "required": spec["required"],
                      "legacy_prefixes": ["Loneliness."]}
        inventory = audit.validate_log(Path(result["log"]).read_text(), audit_spec, spec["modern"])
        require(all(inventory["declarations"][name]["kind"] == "theorem"
                    for name in spec["required"]), "A required endpoint is not a theorem")
        write_json(stage / "declaration-inventory.json", inventory)
        receipt["axiom_audit"] = {**result, "summary": inventory["summary"],
            "all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
            "inventory_sha256": sha(stage / "declaration-inventory.json"),
            "audit_source_sha256": sha(audit_path),
            "explicit_quantified_statement_checks_passed": True}
        save()
        require(object_hashes(stage, spec) == frozen,
                "Staged proof inventory changed before the complete prefix replay")
        command = [str(compiler / "bin/leanchecker"), "-v", "Conjectures"]
        if buffer := shutil.which("stdbuf"):
            command = [buffer, "-oL", "-eL", *command]
        result = checked(command, "kernel", "Conjectures-exact-closure", 18000)
        replayed = re.findall(r"^replaying (\S+)$", Path(result["log"]).read_text(), re.M)
        require(len(replayed) == len(spec["modules"]) and
                len(replayed) == len(set(replayed)) and set(replayed) == set(spec["modules"]),
                "Stock replay omitted, repeated, or added a project module")
        receipt["kernel_checks"]["Conjectures"] = {**result, "replayed_modules": replayed}
        save()
        require(object_hashes(stage, spec) == frozen, "Staged proof objects changed")
        for module, digest in spec["source_sha256"].items():
            copied = stage / "src" / (module.replace(".", "/") + ".lean")
            require(sha(source(module)) == digest and sha(copied) == digest,
                    "Proof source changed: " + module)
            if check_built:
                require(checked_source_record(module, spec) == receipt["source_checks"][module],
                        "Strict source provenance changed during replay: " + module)
        for path, digest in spec["controls_sha256"].items():
            require(sha(ROOT / path) == digest, "Verification control changed: " + path)
        require(sha(compiler / "bin/lean") == LEAN_SHA256 and
                sha(compiler / "bin/leanchecker") == CHECKER_SHA256, "Compiler/checker changed")
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
            "all_owned_axioms_and_exact_stock_replay_passed": True,
            "unconditional_five_runner_bound_replayed": True,
            "complete_primitive_classification_replayed": True,
            "complete_normalized_classification_replayed": True,
            "lower_runner_hypotheses_discharged": True})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({"status": "passed", "root": spec["root"],
                      "modules": len(spec["modules"]), "support_frames": 7070,
                      "source_mode": receipt["source_mode"],
                      "receipt_sha256": sha(stage / "receipt.json")}))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--frame-budget", type=int, default=128)
    parser.add_argument("--block-size", type=int, default=128)
    parser.add_argument("--root-budget", type=int, default=8)
    parser.add_argument("--stage", type=Path)
    parser.add_argument("--check-built", action="store_true",
                        help="audit/replay objects with exact strict source records; no source rebuild claimed")
    parser.add_argument("--plan", action="store_true")
    args = parser.parse_args()
    spec = preflight(args.frame_budget, args.block_size, args.root_budget)
    if args.plan:
        print(json.dumps({"root": spec["root"], "modules": spec["modules"],
                          "required_theorem_count": len(spec["required"]),
                          "minimum_pairs": len(spec["root_theorems"]),
                          "support_frames": len(spec["frame_theorems"]),
                          "prime_frames": PRIME_FRAMES,
                          "controls_sha256": spec["controls_sha256"]}, indent=2))
        return
    stage = args.stage or ROOT / ".candidate-artifacts/five-runner-exact"
    verify(spec, stage.resolve(), args.check_built)


if __name__ == "__main__":
    main()
