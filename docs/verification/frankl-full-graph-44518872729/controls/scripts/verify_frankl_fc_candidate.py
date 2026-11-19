#!/usr/bin/env python3
"""Strict source, axiom and pinned-kernel gates for finite FC components.

Vaughan is a dependency of the span-four result, not its completion. The small
cyclic results for periods seven through ten retain their residual-graph
hypotheses. Accepted registration and the full-package gate remain separate.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import subprocess

from plan_lean_candidates import changed_sources

from verify_lean_candidate import (
    ROOT, LEAN, digest, revision, run, source_hashes,
)
from verify_line_size_candidate import check_sources, dependency_order


TASKS = {
    "share-flow": ("Conjectures.FranklShareFlowPointwise", [
        "Frankl.ShareSearch.check_sound",
        "Frankl.ShareFlow.sum_transfer_le",
        "Frankl.ShareFlow.plan_nonnegative",
        "Frankl.ShareFlow.certificate_nonnegative",
        "Frankl.ShareFlow.adjustPointwise_eq_adjust",
        "Frankl.ShareFlow.check_leaf_of_pointwise",
    ]),
    "finite-domain": ("Conjectures.FranklFCFiniteDomain", [
        "Frankl.FC.image_pullDomainFamily",
        "Frankl.FC.pullDomainFamily_closedFor",
        "Frankl.FC.sum_pullDomainFamily",
        "Frankl.FC.extension_shares_of_finite_domain_certificate",
    ]),
    "bit-code": ("Conjectures.FranklFCBitCode", [
        "Frankl.FC.BitCode.decode_injOn",
        "Frankl.FC.BitCode.image_domain",
        "Frankl.FC.BitCode.decode_or",
        "Frankl.FC.BitCode.or_mem_domain",
    ]),
    "embedding": ("Conjectures.FranklFCEmbedding", [
        "Frankl.FC.abundant_of_extension_shares",
        "Frankl.FC.abundant_of_embedded_extension_shares",
    ]),
    "classification": ("Conjectures.FranklVaughanClassification", [
        "Frankl.Vaughan.three_triples_classification",
    ]),
    "vaughan": ("Conjectures.FranklFCVaughan", [
        "Frankl.Vaughan.three_triples_abundant",
        "Frankl.Vaughan.three_generator_triples_abundant",
    ]),
    "family": ("Conjectures.FranklFCFamily", [
        "Frankl.FC.Family.generatedUnions_eq_family",
        "Frankl.FC.Family.abundant_iff_abundant",
        "Frankl.FC.Family.generated_abundant_iff",
        "Frankl.FC.Family.three_generator_triples_abundant",
    ]),
    "pasch": ("Conjectures.FranklSmallCyclicPaschCertificate", [
        "Frankl.FC.SmallCyclicPasch.checked",
        "Frankl.FC.SmallCyclicPasch.extension_share_nonnegative",
        "Frankl.FC.SmallCyclicPasch.abundant",
    ]),
    "small-cyclic-components": ("Conjectures.FranklSmallCyclicResults", [
        "FranklSmallCyclic.check_sound",
        "FranklSmallCyclic.obstruction_le_six",
        "FranklSmallCyclic.pasch_abundant",
        "FranklSmallCyclic.pasch_generators_abundant",
        "FranklSmallCyclic.cyclic_abundance_le_six",
        "FranklSmallCyclic.cyclic_abundance_le_six_zmod",
        "FranklSmallCyclic.residual_period_seven",
        "FranklSmallCyclic.residual_period_eight",
        "FranklSmallCyclic.residual_period_ten",
        "FranklSmallCyclic.validMaskTable_eq",
        "FranklSmallCyclic.maskCertificate_abundant",
        "FranklSmallCyclic.nineCandidates_complete",
        "FranklSmallCyclic.nine_candidate_abundant",
        "FranklSmallCyclic.tileMaskNine_decode",
        "FranklSmallCyclic.residual_nine_abundant",
    ]),
}

for name, title in (
    ("triangle", "Triangle"), ("star", "Star"), ("path", "Path"),
    ("path-edge", "PathEdge"), ("matching", "Matching"),
):
    TASKS["vaughan-" + name] = (
        "Conjectures.FranklVaughan" + title,
        ["Frankl.FC.Vaughan" + title + ".checked",
         "Frankl.FC.Vaughan" + title + ".extension_share_nonnegative",
         "Frankl.FC.Vaughan" + title + ".abundant"],
    )

# This import-only root receives the union of every contained task's required
# endpoints through task_spec; it adds no mathematical assumption or theorem.
TASKS["packet"] = ("Conjectures.FranklFCResults", [])

GATE_INPUTS = (
    "scripts/verify_frankl_fc_candidate.py",
    "scripts/test_frankl_fc_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/verify_line_size_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    ".github/workflows/lean-frankl-fc-candidates.yml",
)


def gate_hashes():
    return {path: digest(ROOT / path) for path in GATE_INPUTS}


def task_closures():
    return {task: frozenset(dependency_order([target]))
            for task, (target, _) in TASKS.items()}


def contained_tasks(task, closures):
    return sorted(name for name in TASKS if closures[name] <= closures[task])


def required_endpoints(tasks):
    return sorted({name for task in tasks for name in TASKS[task][1]})


def maximal_tasks(affected, closures):
    """Keep maximal closures; equal closures use one deterministic label."""
    return sorted(task for task in affected if not any(
        closures[task] < closures[other]
        or (closures[task] == closures[other] and other < task)
        for other in affected if other != task))


def ci_plan(changed):
    closures = task_closures()
    global_inputs = set(GATE_INPUTS) | {
        "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
    }
    affected = []
    for task, modules in closures.items():
        paths = {"lean/" + module.replace(".", "/") + ".lean" for module in modules}
        if changed is None or changed & (global_inputs | paths):
            affected.append(task)
    retained = maximal_tasks(affected, closures)
    covered = {task: sorted(name for name in affected if closures[name] <= closures[task])
               for task in retained}
    # A retained job checks all contained endpoints, including those of every
    # affected task suppressed here. The workflow needs only the task label.
    required = {task: required_endpoints(contained_tasks(task, closures))
                for task in retained}
    return {"tasks": retained, "affected_tasks": sorted(affected),
            "covered_affected_tasks": covered, "required_theorems": required}


def task_spec(task):
    closures = task_closures()
    covered = contained_tasks(task, closures)
    required = required_endpoints(covered)
    if not required:
        raise ValueError(f"task {task} has no required theorem endpoints")
    target = TASKS[task][0]
    return target, dependency_order([target]), covered, required


def private_certificate_nodes(modules):
    """List each generated private checkedN theorem, including Pasch nodes.

    The emitters use one named namespace per certificate module. Reject a
    different layout instead of silently weakening the visibility assertion.
    Other private theorems remain covered by the all-declaration axiom scan.
    """
    result = {}
    for module in modules:
        source = LEAN / (module.replace(".", "/") + ".lean")
        text = source.read_text()
        names = re.findall(r"^private theorem (checked\d+)\b", text, re.MULTILINE)
        if not names:
            continue
        namespaces = re.findall(r"^namespace ([A-Za-z0-9_.]+)\s*$", text, re.MULTILINE)
        if len(namespaces) != 1 or len(set(names)) != len(names):
            raise ValueError(f"unsupported private certificate namespace layout: {module}")
        result[module] = [namespaces[0] + "." + name for name in names]
    return result


def audit_source(modules, required, private_nodes):
    imports = "\n".join("import all " + module for module in modules)
    names = ",\n    ".join("`" + name for name in required)
    private_names = ",\n    ".join(
        "`" + name for names in private_nodes.values() for name in names)
    owned = ",\n    ".join(json.dumps(module) for module in modules)
    counts = json.dumps({module: len(names) for module, names in private_nodes.items()},
                        sort_keys=True)
    return f'''module
{imports}
import Lean.Util.CollectAxioms
import Lean.PrivateName

open Lean Elab Command in
run_cmd do
  let required : Array Name := #[{names}]
  for name in required do
    let info ← getConstInfo name
    unless info.isTheorem do
      throwError "Required endpoint is not a theorem: {{name}}"
  let expectedPrivate : Array Name := #[{private_names}]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let modules : Array String := #[{owned}]
  let env ← getEnv
  let mut count : Nat := 0
  let mut seenPrivate : Array Name := #[]
  for (name, info) in env.constants.toList do
    let owned := match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
      | some mod => modules.contains mod.module.toString
      | none => false
    if owned then
      if let .axiomInfo _ := info then
        unless allowed.contains name do
          throwError "Unapproved project axiom {{name}}"
      if let .thmInfo _ := info then
        count := count + 1
        if let some userName := privateToUserName? name then
          if expectedPrivate.contains userName then
            seenPrivate := seenPrivate.push userName
        for axiomName in ← collectAxioms name do
          unless allowed.contains axiomName do
            throwError "Unapproved axiom {{axiomName}} in {{name}}"
  for name in expectedPrivate do
    unless seenPrivate.contains name do
      throwError "Missing private certificate theorem: {{name}}"
  unless seenPrivate.size == expectedPrivate.size do
    throwError "Private certificate theorem count mismatch"
  logInfo m!"PASS: {{count}} project theorems audited; all {{expectedPrivate.size}} private certificate-node proofs visible; only standard logical axioms"
  logInfo {json.dumps("Private certificate-node counts by module: " + counts)}
'''


def audit_exact_closure(modules, required, destination):
    private_nodes = private_certificate_nodes(modules)
    path = destination / "AxiomAudit.lean"
    log_path = destination / "axiom-audit.log"
    path.write_text(audit_source(modules, required, private_nodes))
    command = ["lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true", str(path)]
    print("+ " + " ".join(command), flush=True)
    output = []
    with log_path.open("w") as log:
        process = subprocess.Popen(command, cwd=LEAN, text=True,
                                   stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                   env={**os.environ, "LEAN_NUM_THREADS": "1"})
        assert process.stdout is not None
        for line in process.stdout:
            print(line, end="", flush=True)
            log.write(line)
            output.append(line)
        result = process.wait()
    if result:
        raise subprocess.CalledProcessError(result, command)
    match = re.search(r"PASS: (\d+) project theorems audited; all (\d+) private "
                      r"certificate-node proofs visible", "".join(output))
    expected = sum(map(len, private_nodes.values()))
    if match is None or int(match[2]) != expected:
        raise RuntimeError("axiom audit did not report the complete private-node count")
    return {"explicit_import_all": True, "project_theorems": int(match[1]),
            "private_certificate_nodes_visible": int(match[2]),
            "private_certificate_nodes_by_module": {
                module: len(names) for module, names in private_nodes.items()},
            "log": str(log_path.relative_to(ROOT))}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task", nargs="?", choices=TASKS)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--plan-ci", action="store_true")
    parser.add_argument("--files", nargs="*", help="explicit changed paths for --plan-ci")
    args = parser.parse_args()
    if args.plan_ci:
        changed = set(args.files) if args.files is not None else changed_sources()
        plan = ci_plan(changed)
        print(json.dumps(plan, indent=2))
        if output := os.environ.get("GITHUB_OUTPUT"):
            with open(output, "a") as handle:
                handle.write("tasks=" + json.dumps(plan["tasks"], separators=(",", ":")) + "\n")
        return
    if args.task is None:
        parser.error("a task or --plan-ci is required")
    if args.files is not None:
        parser.error("--files requires --plan-ci")
    target, modules, covered, required = task_spec(args.task)
    if args.plan:
        print(json.dumps({"task": args.task, "target": target,
                          "covered_tasks": covered, "required": required,
                          "project_modules": modules}, indent=2))
        return
    initial = source_hashes(modules)
    initial_gate = gate_hashes()
    receipt = {
        "task": args.task, "commit": revision(), "target": target,
        "project_modules": modules, "source_sha256": initial,
        "gate_sha256": initial_gate, "required_theorems": required,
        "covered_tasks": covered,
        "status": "running", "completed_checks": [],
    }
    destination = ROOT / ".candidate-artifacts" / ("frankl-fc-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        receipt["axiom_audit"] = audit_exact_closure(modules, required, destination)
        receipt["completed_checks"].append(
            "explicit import-all axiom whitelist and exact private-node visibility")
        run("lake", "env", "python3", "../scripts/replay_lean.py", "--root", target)
        receipt["completed_checks"].append("independent exact-closure kernel replay")
        if source_hashes(modules) != initial or gate_hashes() != initial_gate:
            raise RuntimeError("source or gate changed during verification")
        receipt["status"] = "passed"
    except BaseException as exc:
        receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        (destination / "receipt.json").write_text(
            json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(f"PASS frankl-{args.task}: strict source, axiom and pinned kernel gates", flush=True)


if __name__ == "__main__":
    main()
