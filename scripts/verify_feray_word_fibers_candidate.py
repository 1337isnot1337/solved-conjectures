#!/usr/bin/env python3
"""Candidate-only verification; no complete conjecture registration."""
import verify_lean_candidate as gate

TASK = "feray-conjugate-power-word-fibers"
MODULES = ["Conjectures.FerayConjugatePowerWordFibers"]
REQUIRED = [
    "FerayConjugatePowerWord.Permutation.ext",
    "FerayConjugatePowerWord.Permutation.one_forward",
    "FerayConjugatePowerWord.Permutation.one_backward",
    "FerayConjugatePowerWord.Permutation.mul_forward",
    "FerayConjugatePowerWord.Permutation.mul_backward",
    "FerayConjugatePowerWord.Permutation.inv_forward",
    "FerayConjugatePowerWord.Permutation.inv_backward",
    "FerayConjugatePowerWord.Permutation.conj_one",
    "FerayConjugatePowerWord.Permutation.conj_comp",
    "FerayConjugatePowerWord.Permutation.conj_inverse",
    "FerayConjugatePowerWord.Permutation.conj_inverse'",
    "FerayConjugatePowerWord.Permutation.square_conj",
    "FerayConjugatePowerWord.Permutation.conj_two_changes",
    "FerayConjugatePowerWord.Permutation.word_change",
    "FerayConjugatePowerWord.class_preserved",
    "FerayConjugatePowerWord.fibers_equinumerous",
    "FerayConjugatePowerWord.fiber_nonempty",
    "FerayConjugatePowerWord.fiber_support",
]

def main():
    modules = gate.dependency_order(MODULES)
    if modules != MODULES:
        raise RuntimeError("Unexpected project closure")
    before = gate.source_hashes(modules)
    for module in modules:
        path = module.replace(".", "/") + ".lean"
        gate.run("lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true", path)
        gate.run("lake", "build", module)
    gate.audit(MODULES, REQUIRED, modules, TASK)
    for module in modules:
        gate.run("lake", "env", "leanchecker", module)
    if gate.source_hashes(modules) != before:
        raise RuntimeError("Candidate proof inputs changed")
    gate.export_artifacts(TASK, MODULES, modules)
    print("PASS: strict source, axiom whitelist, independent kernel replay")

if __name__ == "__main__":
    main()
