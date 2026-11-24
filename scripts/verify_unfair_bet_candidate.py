#!/usr/bin/env python3
"""Standalone candidate check; does not register or promote a result."""
import verify_lean_candidate as gate

TASK = "unfair-bet-overlap"
MODULE = "Conjectures.EkhadZeilbergerOverlap"
REQUIRED = [
    "EkhadZeilberger.overlapMass_step",
    "EkhadZeilberger.overlapMass_bound",
    "EkhadZeilberger.missing_first_lt",
    "EkhadZeilberger.nonconstant_advantage_lt",
    "EkhadZeilberger.constant_loser_advantage",
    "EkhadZeilberger.full_alphabet_constant_beats_nonconstant",
]

def main():
    modules = gate.dependency_order([MODULE])
    if modules != [MODULE]:
        raise RuntimeError("Unexpected project closure")
    before = gate.source_hashes(modules)
    gate.run("lake", "env", "lean", "-j1", "-M4500",
             "-DwarningAsError=true", "Conjectures/EkhadZeilbergerOverlap.lean")
    gate.run("lake", "build", MODULE)
    gate.audit([MODULE], REQUIRED, modules, TASK)
    gate.run("lake", "env", "leanchecker", MODULE)
    if gate.source_hashes(modules) != before:
        raise RuntimeError("Candidate proof inputs changed")
    gate.export_artifacts(TASK, [MODULE], modules)
    print("PASS: strict source, axiom whitelist, independent kernel replay")

if __name__ == "__main__":
    main()
