# Sagan–Wilson’s plactic coefficient-mode conjecture

**Kernel-verified integer-coefficient disproof; full repository registration and real-scalar adapter pending.** Existing entry [results/sagan-wilson-plactic-mode](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/sagan-wilson-plactic-mode), discovery #479 and publication #483. Follow-up #587. Session start 2026-11-24 18:59 UTC.

The target is Bruce E. Sagan and A. N. Wilson, [*Centralizers in the plactic monoid*](https://users.math.msu.edu/users/bsagan/Papers/Old/cpm-pub.pdf), Conjecture 7.3(d), p. 742. The paper defines the centralizer equivalently using insertion tableaux on p. 725. Corollary 6.6(a), p. 739, gives the degree n−1 polynomial for m≥n. The existing proof package records the n=10 counterexample and a stronger asymptotic; see its proof, audit and check.py for the proof credit and prior work. No new discovery or absolute priority asserted here.

[Lean source](../../lean/Conjectures/SaganWilsonPlacticMode.lean) proves the first-row characterization for every positive word: left multiplication by the letter 1 prepends a 1 to the first row; commuting with 1 holds iff the first row has no entry above 1. The compressed row transition and exact recursive word-list count are proved for every length and positive list alphabet. Membership in the word enumeration is characterized explicitly. Separately the arithmetic part of check.py is reimplemented using hook-length and hook-content products and verified at the ten alphabet sizes 10–19, so the certificate does not assume the source's polynomial agreement extends to m<n. The extraction functional on all ten binomial basis vectors is verified. The conditional coefficient identity a₆−a₅=13609 for integer coefficient rows is also kernel checked. This is a certificate for the exact documented counterexample, not a standalone unrelated fixed-parameter result.

Historical initial obligations (superseded by the subsequent checked cardinality, finite-difference, and counterexample modules): duplicate-free enumeration, actual centralizer counts, the coefficient-polynomial bridge, and the mode negation. The exact real-scalar adapter and full repository gate remain outstanding. The stronger asymptotic result and Conjecture 7.3(c) remain outside this checkpoint. Do not register a complete disproof from the arithmetic formula alone.

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


## Checked coefficient-polynomial identity and mode disproof

The resumed session (2026-11-24 22:06 UTC) replaces the prohibitively expensive alphabet-11–19 evaluations with a general finite-difference argument. Order-preserving relabeling fixing 1 preserves the exact insertion-tableau centralizer predicate. For the count with k specified distinct non-one letters, deleting the next specified letter gives the adjacent-alphabet difference identity. A nonempty centralizing positive word must contain 1; a word of length n therefore cannot contain n additional distinct letters. This proves the nth forward difference of the actual count vanishes on positive alphabets, for every positive n. Pascal's rule gives the same vanishing for the integer binomial row of degree at most n−1. The general positive-polynomial extension and initial-value uniqueness theorems are checked.

The counts for n=10, m=1,…,10 are independently checked using the verified centralizer DP, not the hook formula. The values are 1, 252, 5670, 50820, 275010, 1086090, 3456369, 9398925, 22677445, 49807595. For m=8,9,10 the larger certificates use checked split layer-5 subtrees. The explicit integer binomial coefficient row is (0, 1, 250, 4917, 29648, 75095, 88704, 43414, 4861, 1).

[Counterexample module](../../lean/Conjectures/SaganWilsonPlacticModeCounterexample.lean) proves `coefficient_row10_correct` for **every positive alphabet size**, and `not_modeConjecture` negates the universal integer-row modal-index assertion. In particular a_6=88704>75095=a_5. This is a counterexample to the named general conjecture, not a separate fixed-size research result. The integer row is mathematically a real coefficient row by the canonical embedding, but the Lean adapter explicitly formulated over the original real scalar domain and standard binomial notation is not yet built. The published stronger asymptotic and the distinct clause (c) remain outside the present scope. Do not promote the repository completion count before the exact statement and full package checks pass.

Pinned Lean 4.35.0: strict source compilation and stock kernel replay passed for all newly checked endpoint modules, including the final Counterexample import closure. Both `coefficient_row10_correct` and `not_modeConjecture` depend only on propext, Classical.choice, Quot.sound. No native computation axioms, project axioms, sorry, or admit. Candidate gate updated to cover the final import closure; its full Lake/Mathlib run is outstanding.

The remaining persistent I/O stall was reproduced on a plain Init import (0.05 CPU seconds in a 12-second wall timeout). Extracting the pinned core in ordinary connector job scratch, copying both project source and compiled proof dependencies into scratch before running Lean, and copying successful compiled objects back to persistent workspace resolved the last alphabet-8 and alphabet-9 certificate failures. Scratch staging remains subject to the connector deadline and storage quota; compact archive staging sometimes stalled, so an official release download to scratch was used as a bounded fallback. These are local execution workarounds, not a promise that all future timeouts are eliminated.

Exact new source SHA-256 fingerprints:

```text
7367a77ea4e305d5e684dd4bd30f9d40bafccd3ed98344c8e8ad288bd3a222db  lean/Conjectures/SaganWilsonPlacticModeAlphabet.lean
0b82b8cec69a67c84637167a6044ee5e9257b18e49f99aecf04752c164e734d6  lean/Conjectures/SaganWilsonPlacticModeCounterexample.lean
859cf232c08745230e02b83d94d12550aba2aa69dc1eeda93952e25836745fc2  lean/Conjectures/SaganWilsonPlacticModeDifferences.lean
0c0ca4254f2c0e3e6572f6c90ab21bebf017270d9b003fd738c3ac2620459680  lean/Conjectures/SaganWilsonPlacticModeM7.lean
0007ddc9527bf99f4fe104666feac02c8996ee9f01580cafa6ea830fc03659cb  lean/Conjectures/SaganWilsonPlacticModeM8.lean
f842d981a0053eb008929fcf0c47253d7ef2530ea54b54bfe7e3b773c704544b  lean/Conjectures/SaganWilsonPlacticModeM9.lean
aa2bd3f88200e093221be715bca94f057ff0631fc3b8eac321f0965d4954ed11  lean/Conjectures/SaganWilsonPlacticModeRelabel.lean
394975c90e066f195a9e6799667724e4068a9315435553f642c04395d977be68  lean/Conjectures/SaganWilsonPlacticModeSmall.lean
f11bd063ff1423d2dae94289ae54d98a69dec21d9e72b924a0f57c41c510b0c2  lean/Conjectures/SwM8Layer0.lean
f07a8c918cb12a2f4921c11dc257a27e31eb93b3032a12b86334eb4683db9c84  lean/Conjectures/SwM8Layer1.lean
95ddd9715268e92f66323568a28bf90ca5e0185308b9e9b2264ec957f08910ba  lean/Conjectures/SwM8Layer10.lean
12734e2dad90f1c7f8ba33e23d721c075365eb9dae7c8d2385c901300d30ce7d  lean/Conjectures/SwM8Layer2.lean
50f3a4eb2cadf5d01003c5982f076b53fa78a8a81552aadf4b29f9d1599df4f4  lean/Conjectures/SwM8Layer3.lean
2e3bacd22879c7a739d2dd9559d246ae9354fafd06de199951e64f7b0c5b31cf  lean/Conjectures/SwM8Layer4.lean
8f88ca42bc6262dd234a0e567a36b3b74d71eccddf418b10682445db73a2482a  lean/Conjectures/SwM8Layer5.lean
c177f8fd57122b3e1102e7f6e08c1e1454d1794af78017908478486d8eb6cc30  lean/Conjectures/SwM8Layer5P2.lean
a2a7615b93ded5cdf3296bedde520fc2c078d77a28f9fbfddac7b788765c203c  lean/Conjectures/SwM8Layer5P3.lean
b9f0c3a235be997d18bd7e3495a05a8f10c8b368a96de9ac7261f48ced5f55a4  lean/Conjectures/SwM8Layer5P4.lean
99f1001072634cc77264590aeb028a86f0fb59822492e408f78bd3b243bdc0c4  lean/Conjectures/SwM8Layer5P5.lean
85b3ebceb0d3e7c29f7d0f8c166f25db66ade541cd71e85f162f3ca58ff280b0  lean/Conjectures/SwM8Layer5P6.lean
9e6acadea8ac3dd38eb810272cba710921b5a8880ddb6fc565b2558e77633ee5  lean/Conjectures/SwM8Layer5P7.lean
c11a819a5268ae64667da8d484a359b075366dd3c842dbe0c73a02e105e38dfa  lean/Conjectures/SwM8Layer5P8.lean
c5e41ee00e75f92dd67bc5f4acaabe2b596c7855757be033f5cc4a3e32c19032  lean/Conjectures/SwM8Layer6.lean
a628607d831baa941c645ac70452eba2c8a2377585372d8d8a879a1d7cb41928  lean/Conjectures/SwM8Layer7.lean
ac15f11a63ae198cd7c247308836852b24b867f619918b651eb941b5b4a290cc  lean/Conjectures/SwM8Layer8.lean
4cb0e3f445e811a0f6d389166adc33188ac7e29ef3c8f37351ccf2b3c948e920  lean/Conjectures/SwM8Layer9.lean
4178fd66c37d121fbef5ee5a4da3185c94b2048548f87cb6bc5213c3e70ac871  lean/Conjectures/SwM9Layer0.lean
6c2065de9b621fcdac11908b782a2c3a4d9e54aae4d52adb6969b744fc90b497  lean/Conjectures/SwM9Layer1.lean
30d8dbb8aceaded423d2914f8e09c89c4a73cb677edc8a045b4804352dd60d87  lean/Conjectures/SwM9Layer10.lean
c115275b115fadc879b73afd16d071ffe2dac0b8c7d54f525c4ccc4fd0b1b802  lean/Conjectures/SwM9Layer2.lean
24fa33e24348583e604ff51fd4faf86151465572339236d1e009f98a72bc5aae  lean/Conjectures/SwM9Layer3.lean
ee478bde24d3cf4d511781226a7e88f17e82fd2650eb4763aa1f5a261ed35afe  lean/Conjectures/SwM9Layer4.lean
843f9a2bb7828591fe4a4e3587c77ba2ead65b980156461420cb0ef123e0b09b  lean/Conjectures/SwM9Layer5.lean
66e90684bd6faada28ed4e5e9e6825ae61ea6ce9cc8193ae988c4365fe91c5df  lean/Conjectures/SwM9Layer5P2.lean
ac9587b8601c4eceb3f1ae7aaacf8eba8797fc34e0993f65c8e7b122b09f3e1c  lean/Conjectures/SwM9Layer5P3.lean
ed8c13201958766e9fe6a6f1edb365e927baef753727ab79163575464e50f3e1  lean/Conjectures/SwM9Layer5P4.lean
c2a538090e84d46d39d68ebee567443ca29c4d0e301e8c83623a5c7a404f5051  lean/Conjectures/SwM9Layer5P5.lean
73f8331a6fc0ee4f429e32aa4adc5e8ff54e3c4e1e67bbbb92bb7eed51edec49  lean/Conjectures/SwM9Layer5P6.lean
27ff85fa9899390a9f274c5cf12409683f1881d7f57d9c6ca638c010c2bd550d  lean/Conjectures/SwM9Layer5P7.lean
ebdfbba3db9f0092b9fca40103b6f2a650a64b3acb99fea82c9b52101fe4ca79  lean/Conjectures/SwM9Layer5P8.lean
b61233ddf96163348fd3d3e6116ed3466b0c02286b0a889c11c7e5257c38e885  lean/Conjectures/SwM9Layer5P9.lean
fd9b1a1304027c5c08e0d268be67df98cbbf8f781b3cfc60bfe17805533d62a9  lean/Conjectures/SwM9Layer6.lean
8c9c87f811c066a58f8df1bc108b4155b9c8e7766cbd6af726f2451f11eb9899  lean/Conjectures/SwM9Layer7.lean
5b42b6159d934ea0234536412dd3e1b3f6357cfc528db1eb2eb1c3c46154c665  lean/Conjectures/SwM9Layer8.lean
70eb3fc5d91f1f73e78b85af836a0b94f4f6cd2be9d48908453398487a7d35fc  lean/Conjectures/SwM9Layer9.lean
```

## Real-scalar adapter candidate (2026-11-24 23:13 UTC continuation)

[Real-scalar adapter](../../lean/Conjectures/SaganWilsonPlacticModeReal.lean) expresses the count as the cardinality of a Finset of exactly the source's words (using the checked duplicate-free enumeration), identifies the recursive Pascal coefficients with Mathlib's standard Nat.choose, and maps the full integer binomial identity to a real finite sum. The final `not_realModeConjecture` is a negation of the real-coefficient form of Conjecture 7.3(d), not an assumption of integrality of an arbitrary source row. The explicit row gives an actual witness at n=10 and j=6. The source uses real scalar sequences on page 742; the polynomial range m≥n is preserved. Mathlib v4.35.0 pins are unchanged, and its current nondeprecated real-number import path is used.

**Pending build and audit.** This new adapter is a source candidate, not checked Lean evidence. The core disproof at 16eb880 retains its independently checked status. Pyroam has intermittently returned connector errors, including on smoke tests and staged full-toolchain extraction. Existing repository CI was still pending/queued; the previous public runtime export run 44540193749 failed on missing Cli cached objects. No new verification count, registration, or publication promotion is claimed from this candidate. The next gate is the candidate verifier on the exact head and the complete all-owned/private audit and stock replay.
