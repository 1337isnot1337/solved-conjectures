#!/usr/bin/env python3
"""Build, audit, and independently replay one unregistered Lean candidate lane.

These checks do not register a result as complete. Accepted results must also be
added to the root imports, ProofAudit, and the ordinary verify_lean.sh gate.
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


ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / "lean"
BUILD = LEAN / ".lake/build"
PRIMES = (17, 29, 31, 37, 41, 43, 47, 53, 59, 61)
KZ_NAMES = {9: "Nine", 10: "Ten", 11: "Eleven", 12: "Twelve", 13: "Thirteen"}
def task_spec(task: str) -> tuple[list[str], list[str]]:
    if task.startswith("four-") and task != "four-assembly":
        p = int(task.removeprefix("four-"))
        if p not in PRIMES:
            raise ValueError(f"unsupported prime: {p}")
        return [
            f"Conjectures.LonelinessFourSpeedCertificate{p}",
            f"Conjectures.LonelinessFourSpeedLift{p}",
        ], [
            f"Loneliness.Modular.FourSpeed.Prime{p}.residue_cover",
            f"Loneliness.Modular.FourSpeed.Lifts.Prime{p}.all_checked",
            f"Loneliness.Modular.FourSpeed.Lifts.Prime{p}.roots_injective",
            f"Loneliness.Modular.FourSpeed.Lifts.Prime{p}.retained_eq",
        ]
    if task.startswith("kz-") and task != "kz-assembly":
        k = int(task.removeprefix("kz-"))
        name = KZ_NAMES[k]
        required = [f"Loneliness.KZProduct.{name}.rows_valid"]
        if k == 13:
            required.append("Loneliness.KZProduct.fast_valid_correct")
        return [f"Conjectures.LonelinessKZProductData{name}"], required
    if task == "base":
        return [
            "Conjectures.Graffiti318Sharpness",
            "Conjectures.LonelinessHigherExamples",
            "Conjectures.LonelinessConsecutiveFamilyCertificates",
            "Conjectures.LonelinessExceptionalEightFamilyCertificates",
            "Conjectures.LonelinessPrefixProductTables",
            "Conjectures.LonelinessModularSearchDirections",
            "Conjectures.LonelinessModularPrimes",
        ], [
            "Graffiti318.conjecture318", "Graffiti318.sharpness",
            "Loneliness.ConsecutiveFamily.family_value",
            "Loneliness.ConsecutiveFamily.family_realizes",
            "Loneliness.ExceptionalEightFamily.first_all_positive_parameters",
            "Loneliness.ExceptionalEightFamily.second_all_positive_parameters",
            "Loneliness.PrefixProduct.eight_spectrum_bound",
            "Loneliness.Modular.Search.checked_direction_cover",
            "Loneliness.Modular.exists_prime_avoiding_of_square_bound",
        ]
    if task == "product":
        return ["Conjectures.LonelinessProductFamilyEight"], [
            "Loneliness.ProductFamily.below_threshold_reduction",
            "Loneliness.ProductFamily.consecutive_eight_product_classification",
            "Loneliness.ProductFamily.first_eight_product_classification",
            "Loneliness.ProductFamily.second_eight_product_classification",
            "Loneliness.ProductFamily.consecutive_eight_product_spectrum",
            "Loneliness.ProductFamily.first_eight_product_spectrum",
            "Loneliness.ProductFamily.second_eight_product_spectrum",
        ]
    if task == "four-assembly":
        return ["Conjectures.LonelinessFourSpeedClassificationFinite"], [
            "Loneliness.Modular.FourSpeed.bounded_four_speed_classification",
            "Loneliness.Modular.FourSpeed.bounded_four_speed_list_classification",
            "Loneliness.CoordinateSubspace.four_speed_gap_of_cutoff",
        ]
    if task == "kz-assembly":
        return ["Conjectures.LonelinessKZProduct"], [
            "Loneliness.KZProduct.dual_sound",
            "Loneliness.KZProduct.exists_mask",
            "Loneliness.KZProduct.all_masks_sound",
            "Loneliness.KZProduct.constraints_of_prefix_ratio",
            "Loneliness.KZProduct.prod_le_of_subset_sums",
            "Loneliness.KZProduct.subset_sums_of_certificate",
            "Loneliness.KZProduct.product_of_certificate",
            "Loneliness.KZProduct.fast_valid_correct",
            "Loneliness.KZProduct.product_lower_bound",
            "Loneliness.KZProduct.increments_feasible",
            "Loneliness.KZProduct.product_minimizer",
        ]
    raise ValueError(f"unknown candidate task: {task}")


def source(module: str) -> Path:
    return LEAN / (module.replace(".", "/") + ".lean")


def dependency_order(targets: list[str]) -> list[str]:
    """Topologically order project sources; Mathlib comes from its pinned cache."""
    ordered: list[str] = []
    visiting: set[str] = set()
    seen: set[str] = set()

    def visit(module: str) -> None:
        if module in seen:
            return
        if module in visiting:
            raise ValueError(f"cyclic project import: {module}")
        path = source(module)
        if not path.is_file():
            raise ValueError(f"missing project module: {module}")
        visiting.add(module)
        # Project imports are ordinary one-line Lean import declarations.
        for line in path.read_text().splitlines():
            match = re.match(r"^import\s+([^\n]+)", line)
            if match:
                for dep in match.group(1).split("--", 1)[0].split():
                    if source(dep).is_file():
                        visit(dep)
        visiting.remove(module)
        seen.add(module)
        ordered.append(module)

    for target in targets:
        visit(target)
    return ordered


def run(*args: str) -> None:
    print("+ " + " ".join(args), flush=True)
    subprocess.run(args, cwd=LEAN, check=True,
                   env={**os.environ, "LEAN_NUM_THREADS": "1"})


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def revision() -> str:
    return subprocess.check_output(
        ["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()


def source_hashes(modules: list[str]) -> dict[str, str]:
    paths = [source(module) for module in modules]
    paths += [LEAN / "lean-toolchain", LEAN / "lakefile.toml", LEAN / "lake-manifest.json"]
    return {str(path.relative_to(ROOT)): digest(path) for path in paths}


def check_reused_receipts(family: str) -> None:
    tasks = ([f"four-{p}" for p in PRIMES] if family == "four" else
             [f"kz-{k}" for k in KZ_NAMES])
    for task in tasks:
        path = BUILD / "candidate-receipts" / f"{task}.json"
        receipt = json.loads(path.read_text())
        if receipt["task"] != task or receipt["commit"] != revision():
            raise ValueError(f"wrong candidate artifact revision: {task}")
        for rel, expected in receipt["source_sha256"].items():
            if digest(ROOT / rel) != expected:
                raise ValueError(f"candidate source changed: {rel}")
        for rel, expected in receipt["artifact_sha256"].items():
            if digest(BUILD / rel) != expected:
                raise ValueError(f"candidate artifact changed: {rel}")
        print(f"Validated same-commit checked artifacts: {task}", flush=True)


def audit(targets: list[str], required: list[str], modules: list[str], task: str) -> None:
    imports = "\n".join(f"import {module}" for module in targets)
    names = ",\n    ".join("`" + name for name in required)
    owned_modules = ", ".join(json.dumps(module) for module in modules)
    text = f'''{imports}
import Lean.Util.CollectAxioms
open Lean Elab Command in
run_cmd do
  let required : Array Name := #[{names}]
  for name in required do
    let info ← getConstInfo name
    unless info.isTheorem do
      throwError "Required endpoint is not a theorem: {{name}}"
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let ownedModules : Array String := #[{owned_modules}]
  let env ← getEnv
  let mut count : Nat := 0
  for (name, info) in env.constants.toList do
    let owned := match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
      | some mod => ownedModules.contains mod.module.toString
      | none => false
    if owned then
      if let .axiomInfo _ := info then
        unless allowed.contains name do
          throwError "Unapproved project axiom {{name}}"
      if let .thmInfo _ := info then
        count := count + 1
        for axiomName in ← collectAxioms name do
          unless allowed.contains axiomName do
            throwError "Unapproved axiom {{axiomName}} in {{name}}"
  logInfo m!"PASS: {{count}} imported project theorems use only standard axioms"
'''
    path = LEAN / ".lake" / f"CandidateAudit-{task}.lean"
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)
    run("lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true",
        "-Dlinter.all=false", str(path.relative_to(LEAN)))


def export_artifacts(task: str, targets: list[str], modules: list[str]) -> None:
    destination = ROOT / ".candidate-artifacts" / task
    if destination.exists():
        shutil.rmtree(destination)
    hashes: dict[str, str] = {}
    # Include every Lake output facet for each leaf, preserving paths and traces.
    # Shared dependencies are rebuilt normally by the assembly job.
    for module in targets:
        parts = module.split(".")
        suffix = Path(*parts[:-1])
        files = [p for p in BUILD.rglob(parts[-1] + ".*")
                 if p.is_file() and p.parent.parts[-len(suffix.parts):] == suffix.parts]
        if not any(p.suffix == ".olean" for p in files):
            raise ValueError(f"no compiled output for {module}")
        for path in files:
            rel = path.relative_to(BUILD)
            out = destination / rel
            out.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(path, out)
            hashes[str(rel)] = digest(out)
    receipt = {
        "task": task, "commit": revision(), "targets": targets,
        "checked_project_modules": modules,
        "source_sha256": source_hashes(modules), "artifact_sha256": hashes,
        "checks": ["lake source build", "transitive axiom whitelist", "leanchecker"],
    }
    out = destination / "candidate-receipts" / f"{task}.json"
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(f"Exported {len(hashes)} checked output files to {destination}", flush=True)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task")
    parser.add_argument("--plan", action="store_true", help="print dependencies without running Lean")
    parser.add_argument("--export", action="store_true", help="stage checked leaf artifacts")
    parser.add_argument("--reuse", choices=("four", "kz"), help="validate same-run leaf receipts")
    args = parser.parse_args()
    targets, required = task_spec(args.task)
    modules = dependency_order(targets)
    if args.plan:
        print(json.dumps({"task": args.task, "targets": targets, "required": required,
                          "project_modules": modules}, indent=2))
        return
    if args.reuse:
        if args.task != args.reuse + "-assembly":
            parser.error("--reuse is only valid for its corresponding assembly task")
        check_reused_receipts(args.reuse)
    for module in modules:
        run("lake", "build", module)
    audit(targets, required, modules, args.task)
    for module in modules:
        run("lake", "env", "leanchecker", module)
    if args.export:
        export_artifacts(args.task, targets, modules)
    print(f"PASS {args.task}: source build, transitive axiom audit, "
          f"independent kernel replay ({len(modules)} project modules)", flush=True)


if __name__ == "__main__":
    main()
