#!/usr/bin/env python3
"""Candidate-only verification; no complete conjecture registration."""
import verify_lean_candidate as gate

TASK = "sagan-wilson-plactic-mode"
MODULES = ["Conjectures.SaganWilsonPlacticModeReal"]
REQUIRED = [
    "SaganWilsonPlacticMode.mem_centralizerFinset",
    "SaganWilsonPlacticMode.card_centralizerFinset",
    "SaganWilsonPlacticMode.pascalChoose_eq_choose",
    "SaganWilsonPlacticMode.cast_basisValue",
    "SaganWilsonPlacticMode.real_coefficient_row10_correct",
    "SaganWilsonPlacticMode.real_coeff10_values",
    "SaganWilsonPlacticMode.not_realModeConjecture",
    "SaganWilsonPlacticMode.iterDelta_centralizer_zero",
    "SaganWilsonPlacticMode.positive_polynomial_extension",
    "SaganWilsonPlacticMode.zero_of_initial_and_iterDelta_zero",
    "SaganWilsonPlacticMode.coeff10_initial",
    "SaganWilsonPlacticMode.coefficient_row10_correct",
    "SaganWilsonPlacticMode.not_modeConjecture",
    "SaganWilsonPlacticMode.centralizer_count10_1",
    "SaganWilsonPlacticMode.centralizer_count10_2",
    "SaganWilsonPlacticMode.centralizer_count10_3",
    "SaganWilsonPlacticMode.centralizer_count10_4",
    "SaganWilsonPlacticMode.centralizer_count10_5",
    "SaganWilsonPlacticMode.centralizer_count10_6",
    "SaganWilsonPlacticMode.centralizer_count10_7",
    "SaganWilsonPlacticMode.centralizer_count10_8",
    "SaganWilsonPlacticMode.centralizer_count10_9",
    "SaganWilsonPlacticMode.CertM8.value",
    "SaganWilsonPlacticMode.CertM9.value",
    "SaganWilsonPlacticMode.nodup_map_injective",
    "SaganWilsonPlacticMode.words_nodup",
    "SaganWilsonPlacticMode.alphabet_nodup",
    "SaganWilsonPlacticMode.nodup_filter_bool",
    "SaganWilsonPlacticMode.centralizerWords_mem_iff",
    "SaganWilsonPlacticMode.centralizerWords_nodup",
    "SaganWilsonPlacticMode.countFast_eq_card",
    "SaganWilsonPlacticMode.countTrie_succ_eq",
    "SaganWilsonPlacticMode.tabulate_succ_eq",
    "SaganWilsonPlacticMode.CertM10.value",
    "SaganWilsonPlacticMode.centralizer_count10_10",
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
    gate.export_artifacts(TASK, modules, modules)
    print("PASS: strict source, axiom whitelist, independent kernel replay")

if __name__ == "__main__":
    main()
