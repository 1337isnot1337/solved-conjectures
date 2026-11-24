#!/usr/bin/env python3
"""Standalone candidate check; does not register or promote a result."""
import verify_lean_candidate as gate

TASK = "unfair-bet-overlap"
MODULES = [
    "Conjectures.EkhadZeilbergerOverlap",
    "Conjectures.EkhadZeilbergerWords",
]
REQUIRED = [
    "EkhadZeilberger.overlapMass_step",
    "EkhadZeilberger.overlapMass_bound",
    "EkhadZeilberger.missing_first_lt",
    "EkhadZeilberger.nonconstant_advantage_lt",
    "EkhadZeilberger.constant_loser_advantage",
    "EkhadZeilberger.full_alphabet_constant_beats_nonconstant",
    "EkhadZeilberger.constant_of_overlap_one",
    "EkhadZeilberger.overlapWeight_le_shifted_mass",
    "EkhadZeilberger.constant_cross_weight_le",
    "EkhadZeilberger.nonconstant_word_advantage_lt",
    "EkhadZeilberger.constant_word_advantage_le",
    "EkhadZeilberger.lastException_attains",
]

def main():
    modules = gate.dependency_order(MODULES)
    if modules != MODULES:
        raise RuntimeError("Unexpected project closure")
    before = gate.source_hashes(modules)
    for module in modules:
        path = module.replace(".", "/") + ".lean"
        gate.run("lake", "env", "lean", "-j1", "-M4500",
                 "-DwarningAsError=true", path)
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
