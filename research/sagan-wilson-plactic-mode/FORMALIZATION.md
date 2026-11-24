# Sagan–Wilson’s plactic coefficient-mode conjecture

**Incomplete formalization.** Existing entry [results/sagan-wilson-plactic-mode](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/sagan-wilson-plactic-mode), discovery #479 and publication #483. Follow-up #587. Session start 2026-11-24 18:59 UTC.

The target is Bruce E. Sagan and A. N. Wilson, [*Centralizers in the plactic monoid*](https://users.math.msu.edu/users/bsagan/Papers/Old/cpm-pub.pdf), Conjecture 7.3(d), p. 742. The paper defines the centralizer equivalently using insertion tableaux on p. 725. Corollary 6.6(a), p. 739, gives the degree n−1 polynomial for m≥n. The existing proof package records the n=10 counterexample and a stronger asymptotic; see its proof, audit and check.py for the proof credit and prior work. No new discovery or absolute priority asserted here.

[Lean source](../../lean/Conjectures/SaganWilsonPlacticMode.lean) proves the first-row characterization for every positive word: left multiplication by the letter 1 prepends a 1 to the first row; commuting with 1 holds iff the first row has no entry above 1. The compressed row transition and exact recursive word-list count are proved for every length and positive list alphabet. Membership in the word enumeration is characterized explicitly. Separately the arithmetic part of check.py is reimplemented using hook-length and hook-content products and verified at the ten alphabet sizes 10–19, so the certificate does not assume the source's polynomial agreement extends to m<n. The extraction functional on all ten binomial basis vectors is verified. The conditional coefficient identity a₆−a₅=13609 for integer coefficient rows is also kernel checked. This is a certificate for the exact documented counterexample, not a standalone unrelated fixed-parameter result.

Still required: prove the finite word enumeration is duplicate-free for the alphabet [1,…,m], establish the RSK enumeration/hook-length and hook-content formulas for actual centralizer counts (or evaluate the verified row recurrence independently), prove the coefficient-polynomial bridge with the appropriate scalar domain, and conclude the actual conjecture. The stronger asymptotic result and Conjecture 7.3(c) remain outside this checkpoint. Do not register a complete disproof from the arithmetic formula alone.

## Verification

Pinned Lean 4.35.0, warnings-as-errors compilation, transitive endpoint axiom audit and stock leanchecker. No project-specific or native-computation axioms. Repository-wide package gate outstanding. Filename search for plactic/RSK-related modules at the pinned Mathlib revision is recorded in the session output; general combinatorial infrastructure may still be reusable.

```text
VARIANT FULL
789ddce2c3ce5aeec3fe40226c64d3518ac9e426c62ca58bcc70bb3c8b7e0c19  Conjectures/SaganWilsonPlacticMode.lean
STRICT COMPILE PASSED
'SaganWilsonPlacticMode.insert_prependOne' depends on axioms: [propext]
'SaganWilsonPlacticMode.process_prependOne' depends on axioms: [propext]
'SaganWilsonPlacticMode.process_append' does not depend on any axioms
'SaganWilsonPlacticMode.tableau_prependOne' depends on axioms: [propext]
'SaganWilsonPlacticMode.tableau_appendOne' does not depend on any axioms
'SaganWilsonPlacticMode.aboveOne_insertOne' depends on axioms: [propext]
'SaganWilsonPlacticMode.aboveOne_insertBig' depends on axioms: [propext, Quot.sound]
'SaganWilsonPlacticMode.state_insert' depends on axioms: [propext, Quot.sound]
'SaganWilsonPlacticMode.state_process' depends on axioms: [propext, Quot.sound]
'SaganWilsonPlacticMode.insertRow_positive' depends on axioms: [propext, Quot.sound]
'SaganWilsonPlacticMode.top_positive_insert' depends on axioms: [propext, Quot.sound]
'SaganWilsonPlacticMode.top_positive_process' depends on axioms: [propext, Quot.sound]
'SaganWilsonPlacticMode.aboveOne_prepend' depends on axioms: [propext]
'SaganWilsonPlacticMode.insertOne_allOnes' depends on axioms: [propext, Classical.choice, Quot.sound]
'SaganWilsonPlacticMode.centralizes_iff_empty_state' depends on axioms: [propext, Classical.choice, Quot.sound]
'SaganWilsonPlacticMode.count_correct' depends on axioms: [propext, Quot.sound]
'SaganWilsonPlacticMode.words_mem_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'SaganWilsonPlacticMode.centralizer_count' depends on axioms: [propext, Classical.choice, Quot.sound]
'SaganWilsonPlacticMode.hook_values' does not depend on any axioms
'SaganWilsonPlacticMode.hookCount10_10' does not depend on any axioms
'SaganWilsonPlacticMode.hookCount10_11' does not depend on any axioms
'SaganWilsonPlacticMode.hookCount10_12' does not depend on any axioms
'SaganWilsonPlacticMode.hookCount10_13' does not depend on any axioms
'SaganWilsonPlacticMode.hookCount10_14' does not depend on any axioms
'SaganWilsonPlacticMode.hookCount10_15' does not depend on any axioms
'SaganWilsonPlacticMode.hookCount10_16' does not depend on any axioms
'SaganWilsonPlacticMode.hookCount10_17' does not depend on any axioms
'SaganWilsonPlacticMode.hookCount10_18' does not depend on any axioms
'SaganWilsonPlacticMode.hookCount10_19' does not depend on any axioms
'SaganWilsonPlacticMode.differenceWeights_basis' depends on axioms: [propext]
'SaganWilsonPlacticMode.coefficient_gap_of_hook_formula' depends on axioms: [propext, Quot.sound]
KERNEL REPLAY PASSED
```

No completion count or status promotion.
