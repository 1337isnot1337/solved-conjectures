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

## Verified dynamic-program extension

A second module, [SaganWilsonPlacticModeDP.lean](../../lean/Conjectures/SaganWilsonPlacticModeDP.lean), proves that a finite trie of bounded weakly increasing row states computes the same count as the already verified centralizer recurrence for every alphabet size and word length. Length pruning is justified by the fact that one transition removes at most one state entry. This avoids any assumption about hook formulas; the exact large-alphabet evaluations and scalar-domain bridge still require checked certificates. Native diagnostic evaluations are not counted as proofs.

Pinned core strict compile, endpoint axiom audit and stock kernel replay passed:

```text
VERIFY DP MODULE
DP KERNEL REPLAY PASSED
'SaganWilsonPlacticMode.validRow_weaken' does not depend on any axioms
'SaganWilsonPlacticMode.insertRow_valid' does not depend on any axioms
'SaganWilsonPlacticMode.insertRow_length_bounds' depends on axioms: [propext, Classical.choice, Quot.sound]
'SaganWilsonPlacticMode.next_length_bounds' depends on axioms: [propext, Classical.choice, Quot.sound]
'SaganWilsonPlacticMode.count_zero_of_length' depends on axioms: [propext, Classical.choice, Quot.sound]
'SaganWilsonPlacticMode.mem_alphabet' depends on axioms: [propext, Classical.choice, Quot.sound]
'SaganWilsonPlacticMode.next_valid' depends on axioms: [propext, Classical.choice, Quot.sound]
'SaganWilsonPlacticMode.lookup_tabulate' depends on axioms: [propext, Quot.sound]
'SaganWilsonPlacticMode.countTrie_correct' depends on axioms: [propext, Classical.choice, Quot.sound]
'SaganWilsonPlacticMode.countFast_correct' depends on axioms: [propext, Classical.choice, Quot.sound]
dd756a15c02376d0fadeea5b72ccd153b17177dfc34072562a31d97d10da30c3  Conjectures/SaganWilsonPlacticModeDP.lean
2026-11-24T19:25:54Z
```

## Verified cardinality and first large-alphabet certificate (2026-11-24)

[Cardinality bridge](../../lean/Conjectures/SaganWilsonPlacticModeCardinality.lean): the finite filtered list is duplicate-free and contains exactly the length-n positive words over [m] satisfying the insertion-tableau centralizer predicate. Its length equals the verified fast recurrence for every m,n. This removes the duplicate-free enumeration/cardinality obligation in the earlier note.

[Actual sample theorem](../../lean/Conjectures/SaganWilsonPlacticModeM10.lean): `(centralizerWords 10 10).length = 49807595`. This verifies the first of the ten large-alphabet samples by direct DP, not by assuming the hook-content formula. Eleven layers `SwM10Layer0` through `SwM10Layer10` were compiled under the pinned Lean 4.35.0 toolchain. Layer 5 is split into nine independently compiled subtrees, then assembled with the checked equalities. The layer/root assembly uses theorem rewrites, not native-decide or an external oracle. Strict compilation and stock kernel replay passed for the final sample, cardinality and support modules. `CertM10.value` uses only propext; `centralizer_count10_10` uses only propext, Classical.choice and Quot.sound. The remaining nine required samples and scalar-polynomial comparison are still open. The whole-repository all-owned candidate gate has not run; this does not complete Conjecture 7.3(d).

Reproduce the literal tables: from the Lean source root, run the provided generator `python3 ../research/sagan-wilson-plactic-mode/generate_layers.py 10`, then `python3 ../research/sagan-wilson-plactic-mode/split_layers.py 10 5 1`. The split replaces the unsplit layer-5 file with the checked assembly. Generators are untrusted data producers: all table equations must be proved by Lean, regardless of their outputs.

### Execution workaround

The persistent runner recovered, but archived timestamps caused apparent age-based cleanup of the unpacked installation; extract with current timestamps (`tar --touch`) and resume by archive manifest and small member groups. Persistent-mount reads also stalled even for a plain Init import (0.05 CPU seconds in 12 seconds of wall time). Using an Init-only import cache in the connector's normal automatically cleaned job scratch directory, with a free-space check, reduced the same import to 0.78 seconds. Keep proof sources and compiled objects in the named persistent workspace, isolate LEAN_PATH from unrelated toolchain directories, use single-threaded bounded module builds, and split large certificate layers into independently checked subtrees. Do not rely on the temporary cache surviving a command. This workaround succeeded for the first large-alphabet sample and the cardinality proof; it does not remove the connector's per-command deadline or the Mathlib/full-package verification obligation.

Exact source SHA-256 fingerprints of the added checked modules:

```text
e39383a892f22caf69fe21a367ddc3cac15dc0f0ea396b4f10edac7e5f1b598b  Conjectures/SaganWilsonPlacticModeCertSupport.lean
b59846a4d8793ed95bb383afd2543a136e9060024fa9a0cb78486afe5912cc1b  Conjectures/SaganWilsonPlacticModeCardinality.lean
84a74f05b4d0a54058fea90416357f4dcfeb24d78a78fbcf73fe598b85837310  Conjectures/SwM10Layer0.lean
80728967998ef337881046399114f57a35219307d62d3bde5b9aff671a5267f8  Conjectures/SwM10Layer1.lean
68be6a8869e2d4408926f592a73ca01b73011b8d9bb1c71fac50d7e22123bf65  Conjectures/SwM10Layer10.lean
3997826ead15b67fe3a1604401f00a3b46dbdf3547a4745d0b72979bd072d7a3  Conjectures/SwM10Layer2.lean
ff227cf9cecd510805899d24ed691dcace89e91d4c024ad7e0a37304b74d5049  Conjectures/SwM10Layer3.lean
7746cbb8cff6e9af8b02dd717ab70f746f898e7004e1dd1c0d5d623b19fdd216  Conjectures/SwM10Layer4.lean
0004052779bb9981be4de4de28d18f83f6dac5e08c48c17f7d88a4e0aef724b7  Conjectures/SwM10Layer5.lean
781f77e983649adb00884cfb83ec639db6ab9ec2c0e4c7a006df131f04e89a83  Conjectures/SwM10Layer5P10.lean
35ac69a7c820acbc3c33ea67a7f89fa83a07465b077393715e2dcb99da3d74ff  Conjectures/SwM10Layer5P2.lean
2824ac906acfdd9031c23c8a1c4beb73649fc579f8b339dbdf0a9b8ecd1cb7ff  Conjectures/SwM10Layer5P3.lean
aac5df711c55dcba774f3446e550484528ace27c8aa9410b3bb5ff325686303b  Conjectures/SwM10Layer5P4.lean
969fa0335d11fd38a1ec8ad2fe16c90e51ed89bd43bd25dfe7478d5f65859a36  Conjectures/SwM10Layer5P5.lean
5675a4d8a9ec77a2c49ae31a7098bcca76d949183336311b7c85d571523d668b  Conjectures/SwM10Layer5P6.lean
2a76e0851c38025c8cc77dfe9ce6c1ffac2a87fc08d0e627bb65bc7d35b4c5c5  Conjectures/SwM10Layer5P7.lean
1c59764bdca340eeaaf6093cce93133cd86a911c187752551ee14f93c4601c2a  Conjectures/SwM10Layer5P8.lean
b6fc2ed1d0faf2c26cf7b4aed79da4490d7bc6949d819fecfdac5a8d65f74c51  Conjectures/SwM10Layer5P9.lean
c633c8507c3cd726ab97e8b01dcf64c3e1eac027092853e618f4e1a5780f6334  Conjectures/SwM10Layer6.lean
4069e8e420e0de25a266db51cf52aeeda43fd1da648f23d1fe3db7f4c062e7f9  Conjectures/SwM10Layer7.lean
7f61f239c9b259848595289b536487c5a225833bd917533ecbdd5c81db04b13f  Conjectures/SwM10Layer8.lean
d61a45d941a3888a48f03675bc2a761d71debd4271211a7179a36ac254626ec8  Conjectures/SwM10Layer9.lean
f1b6f9cd98fbb4ba3141bdebedcc7898af81612054a984249532ba9880d07bf7  Conjectures/SaganWilsonPlacticModeM10.lean
```
