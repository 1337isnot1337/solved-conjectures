#!/usr/bin/env python3
"""Candidate-only verification; no complete conjecture registration."""
import verify_lean_candidate as gate

TASK = "sagan-wilson-plactic-mode"
MODULES = ["Conjectures.SaganWilsonPlacticMode", "Conjectures.SaganWilsonPlacticModeDP"]
REQUIRED = [
    "SaganWilsonPlacticMode.validRow_weaken",
    "SaganWilsonPlacticMode.insertRow_valid",
    "SaganWilsonPlacticMode.insertRow_length_bounds",
    "SaganWilsonPlacticMode.next_length_bounds",
    "SaganWilsonPlacticMode.count_zero_of_length",
    "SaganWilsonPlacticMode.mem_alphabet",
    "SaganWilsonPlacticMode.next_valid",
    "SaganWilsonPlacticMode.lookup_tabulate",
    "SaganWilsonPlacticMode.countTrie_correct",
    "SaganWilsonPlacticMode.countFast_correct",
    "SaganWilsonPlacticMode.insert_prependOne",
    "SaganWilsonPlacticMode.process_prependOne",
    "SaganWilsonPlacticMode.process_append",
    "SaganWilsonPlacticMode.tableau_prependOne",
    "SaganWilsonPlacticMode.tableau_appendOne",
    "SaganWilsonPlacticMode.aboveOne_insertOne",
    "SaganWilsonPlacticMode.aboveOne_insertBig",
    "SaganWilsonPlacticMode.state_insert",
    "SaganWilsonPlacticMode.state_process",
    "SaganWilsonPlacticMode.insertRow_positive",
    "SaganWilsonPlacticMode.top_positive_insert",
    "SaganWilsonPlacticMode.top_positive_process",
    "SaganWilsonPlacticMode.aboveOne_prepend",
    "SaganWilsonPlacticMode.insertOne_allOnes",
    "SaganWilsonPlacticMode.centralizes_iff_empty_state",
    "SaganWilsonPlacticMode.count_correct",
    "SaganWilsonPlacticMode.words_mem_iff",
    "SaganWilsonPlacticMode.centralizer_count",
    "SaganWilsonPlacticMode.hook_values",
    "SaganWilsonPlacticMode.hookCount10_10",
    "SaganWilsonPlacticMode.hookCount10_11",
    "SaganWilsonPlacticMode.hookCount10_12",
    "SaganWilsonPlacticMode.hookCount10_13",
    "SaganWilsonPlacticMode.hookCount10_14",
    "SaganWilsonPlacticMode.hookCount10_15",
    "SaganWilsonPlacticMode.hookCount10_16",
    "SaganWilsonPlacticMode.hookCount10_17",
    "SaganWilsonPlacticMode.hookCount10_18",
    "SaganWilsonPlacticMode.hookCount10_19",
    "SaganWilsonPlacticMode.differenceWeights_basis",
    "SaganWilsonPlacticMode.coefficient_gap_of_hook_formula",
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
