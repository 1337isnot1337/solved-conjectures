#!/usr/bin/env python3
"""Fresh strict source, complete axiom audit and stock replay for Li's finite-colour counterexample."""
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
from replay_lean import header_tokens, imports_of

ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/li-exact-sources.json"
OWN_INPUTS = (
    "scripts/verify_li_exact.py",
    ".github/workflows/lean-li-exact.yml",
    MODEL,
)
FACETS = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig")
CONFIGURATION_INPUTS = (
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
)
HELPER_INPUTS = (
    "scripts/audit_lean_all_owned.py", "scripts/build_lean_parallel.py",
    "scripts/plan_accepted_lean.py", "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py", "scripts/verify_frankl_orbit_batches.py",
    "scripts/verify_lean_candidate.py",
)
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


ROOTS = ['Conjectures.LiFullCoeffTrunc', 'Conjectures.LiTriplesFinal', 'Conjectures.LiPartitionsFinal', 'Conjectures.LiPartitionsCount']
MODULE_COUNT = 38
LEGACY_PREFIXES = ['Li.', 'LiBridge.', 'LiCompute.', 'LiElim.', 'LiEmap.', 'LiFinal.', 'LiFull.', 'LiMonomial.', 'LiTrunc.', 'LiWeighted.']
REQUIRED = [
    "Li.LiFinal325.IsMatchingOf.unique",
    "Li.LiFinal325.b_triple_pairs",
    "Li.LiFinal325.card_goodTripleData",
    "Li.LiFinal325.goodTripleData_iff",
    "Li.LiFinal325.hasPM_iff",
    "Li.T_isTree",
    "Li.coeff_eq_29",
    "Li.full_li_coefficient",
    "Li.full_li_coefficient_fin",
    "Li.full_li_coefficient_of_card",
    "Li.leaf_neighbors_zero",
    "Li.li_coefficient",
    "Li.not_caterpillar",
    "Li.not_spider",
    "Li.specialization_coeff",
    "LiCompute.coeff_29",
    "LiElim.partFunOn_erase",
    "LiEmap.aeval_esymm_vec",
    "LiFinal.T_hasAllPartitionTypes",
    "LiFinal.all_partition_types",
    "LiFinal.card_partitions_31",
    "LiFinal.certificate_ok",
    "LiFinal.certificate_parts",
    "LiFinal.cutGraph_adj_T",
    "LiFinal.partsAux_31_exact",
    "LiFinal.partsAux_31_nodup",
    "LiFinal.sizes_eq_components",
    "LiFull.aeval_restrict3_fullChromPoly_T",
    "LiFull.fullChromPolyOn_T_isHomogeneous_31",
    "LiFull.full_coeff_eq_three_variable_coeff",
    "LiFull.kill31_fullECoords",
    "LiFull.killMN_fullECoords",
    "LiMonomial.snd_aeval_of_weighted",
    "LiWeighted.weightedHomogeneous_of_aeval",
    "LiWeighted.weightedHomogeneous_symm"
]

STATEMENTS = r'''import Conjectures.LiFullCoeffTrunc
import Conjectures.LiTriplesFinal
import Conjectures.LiPartitionsFinal
import Conjectures.LiPartitionsCount

open scoped BigOperators

noncomputable section

attribute [local instance] Classical.propDecidable

-- The polynomial is the genuine proper-colouring sum.
example {σ : Type*} [Fintype σ] [DecidableEq σ] :
    LiFull.fullChromPolyOn (σ := σ) Li.T =
      ∑ κ ∈ (Finset.univ : Finset (Fin 31 → σ)).filter
        (fun κ => ∀ u v, Li.T.Adj u v → κ u ≠ κ v),
        ∏ v : Fin 31, (MvPolynomial.X (κ v) : MvPolynomial σ ℚ) := by
  classical
  unfold LiFull.fullChromPolyOn
  refine Finset.sum_congr ?_ ?_
  · ext κ <;> simp only [Finset.mem_filter, LiFull.fullProperOn]
  · intro κ _
    rfl

example : Li.T.IsTree := Li.T_isTree

example : ∀ v : Fin 31, Li.T.degree v ≤ 4 := Li.degree_le_four

example : ∃! v : Fin 31, Li.T.degree v = 4 := Li.unique_degree_four

example : (Li.T.neighborFinset 0).filter (fun w => Li.T.degree w = 1) = {1} :=
  Li.leaf_neighbors_zero

example : ¬ Li.IsSpider Li.T := Li.not_spider

example : ¬ Li.IsCaterpillar Li.T := Li.not_caterpillar

-- The component list is complete and has no repetitions.
example (p : List Nat) (hp : LiFinal.IsPartitionOf 31 p) :
    ∃ (mask : Nat) (C : List ((LiFinal.cutGraph mask).ConnectedComponent)),
      C.Nodup ∧
      (∀ D : (LiFinal.cutGraph mask).ConnectedComponent, D ∈ C) ∧
      p = LiFinal.sortDesc (C.map (LiFinal.componentCard (LiFinal.cutGraph mask))) :=
  LiFinal.all_partition_types p hp

example (mask : Nat) (u v : Fin 31)
    (h : (LiFinal.cutGraph mask).Adj u v) : Li.T.Adj u v :=
  LiFinal.cutGraph_adj_T mask u v h

example : Fintype.card {p : List Nat // LiFinal.IsPartitionOf 31 p} = 6842 :=
  LiFinal.card_partitions_31

-- The counted objects are connected vertex partitions of type (3, 2^14).
example (P : Finset (Finset (Fin 31))) :
    Li.LiBridge.Partition325 P ↔
      ((∀ B ∈ P, B.Nonempty) ∧
        (∀ B ∈ P, ∀ C ∈ P, B ≠ C → Disjoint B C) ∧
        P.biUnion id = Finset.univ) ∧
      ((P.filter (fun B => B.card = 3)).card = 1 ∧
        (∀ B ∈ P, B.card = 3 ∨ B.card = 2)) ∧
      (∀ B ∈ P, B.Nonempty ∧ ∀ u ∈ B, ∀ v ∈ B,
        ∃ q : Li.T.Walk u v, ∀ x ∈ q.support, x ∈ B) := Iff.rfl

example :
    Fintype.card {P : Finset (Finset (Fin 31)) // Li.LiBridge.Partition325 P} = 8 :=
  Li.LiFinal325.b_triple_pairs

-- The coefficient is in the full elementary basis for any sufficient colour set.
example {σ : Type*} [Fintype σ] [DecidableEq σ]
    (hσ : 31 ≤ Fintype.card σ) :
    ((MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).symm
      ⟨LiFull.fullChromPolyOn (σ := σ) Li.T,
        LiFull.fullChromPolyOn_isSymmetric Li.T⟩).coeff
      (Finsupp.single (⟨1, by omega⟩ : Fin (Fintype.card σ)) 14 +
        Finsupp.single (⟨2, by omega⟩ : Fin (Fintype.card σ)) 1) = 29 :=
  Li.full_li_coefficient_of_card hσ

end
'''


def profile(command, cwd, environment, log, progress, timeout):
    result = runtime.profile(command, cwd, environment, log, progress, timeout)
    result.update({"progress": str(progress), "progress_sha256": sha(progress)})
    return result

def preflight(model):
    require(model["schema"] == "li-exact-v1", "Unexpected source model")
    require(model.get("sealed") is True, "Li source manifest is not sealed")
    require(model["roots"] == ROOTS,
            "Unexpected theorem root")
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
    modules = runtime.dependency_order(model["roots"])
    require(len(modules) == model["project_module_count"] == MODULE_COUNT and set(modules) == set(model["source_sha256"]),
            "Exact Li proof closure differs")
    required = model["required_theorems"]
    require(required == REQUIRED, "Exact Li theorem inventory differs")
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
        "schema": "li-exact-receipt-v1",
        "status": "running", "scope": model["scope"],
        "git_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "roots": model["roots"], "project_modules": modules,
        "required_theorems": required, "source_sha256": model["source_sha256"],
        "gate_sha256": controls, "toolchain": toolchain,
        "source_workers": 1, "kernel_threads": 1,
        "source_checks": {}, "kernel_checks": {}, "source_policy": model["source_policy"],
        "axiom_whitelist": list(audit.ALLOWED), "modern_modules": modern,
        "external_lean_path": external,
        "contribution": model["contribution"],
        "accepted_registry_changed": False,
        "supplementary_negative_coefficient_included": False,
        "finite_colour_scope": True,
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
            output = stage / "lib/lean" / (stem + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            direct_imports = {
                dep: {"source_sha256": model["source_sha256"][dep],
                      "artifact_sha256": module_objects(stage, dep, modern)}
                for dep in imports_of(copied) if dep in modules
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
            require(check["exit_code"] == 0 and check["timed_out"] is False,
                    "Strict source failed: " + module + "\n" + Path(check["log"]).read_text()[-12000:])
            require(sha(copied) == model["source_sha256"][module],
                    "Proof source changed during compilation: " + module)
            for dep, dependency in direct_imports.items():
                require(module_objects(stage, dep, modern) == dependency["artifact_sha256"],
                        "Imported project object changed during compilation: " + dep)
            built_objects[module] = module_objects(stage, module, modern)
            check["artifact_sha256"] = built_objects[module]
            save()
        frozen_objects = objects(stage, modules, modern)
        require(frozen_objects == built_objects, "A compiled project object was replaced")
        receipt["artifact_sha256"] = frozen_objects
        statements = stage / "src/LiExactStatements.lean"
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
        audit_path = stage / "src/LiExactAudit.lean"
        audit_raw = audit.audit_source(modules, required, model["legacy_prefixes"]).encode()
        audit_path.write_bytes(audit_raw)
        command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true", audit_path.name]
        check = profile(command, stage / "src", environment,
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
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "literal_li_scope_checked": True,
                        "infinite_variable_ring_constructed": False})
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
    stage = (args.artifact_dir or ROOT / ".candidate-artifacts/li-exact").resolve()
    verify(model, modules, required, modern, stage, args.runtime)


if __name__ == "__main__":
    main()
