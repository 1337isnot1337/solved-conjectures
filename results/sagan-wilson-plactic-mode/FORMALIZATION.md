# Lean verification of the plactic coefficient-mode counterexample

Lean disproves Sagan and Wilson’s Conjecture 7.3(d). At word length ten the coefficient of $`\binom{m}{5}`$ is 75,095 and the coefficient of $`\binom{m}{6}`$ is 88,704. The proposed index $`\lceil 10/2\rceil=5`$ therefore fails to maximize the row. The companion theorem locating every mode asymptotically remains a written result. [Primary source, p. 742](https://users.math.msu.edu/users/bsagan/Papers/Old/cpm-pub.pdf#page=19) · [Written proof](PROOF.md).

## What is counted

The [row-insertion module](../../lean/Conjectures/SaganWilsonPlacticMode.lean) computes the Robinson–Schensted–Knuth insertion tableau $`P(w)`$. The centralizer test compares $`P(1w)`$ with $`P(w1)`$, the definition of plactic equivalence used by the authors. The [real-coefficient theorem](../../lean/Conjectures/SaganWilsonPlacticModeReal.lean) takes the cardinality of the finite set of exactly those length-ten words over $`[m]`$ that pass this test. For every positive alphabet size it identifies that cardinality with the expansion in Mathlib’s binomial coefficients and the following real row, starting at index zero.

```math
(0,1,250,4917,29648,75095,88704,43414,4861,1).
```

The [dynamic program](../../lean/Conjectures/SaganWilsonPlacticModeDP.lean) counts the words for alphabet sizes one through ten. The [finite-difference argument](../../lean/Conjectures/SaganWilsonPlacticModeDifferences.lean) and [polynomial identity](../../lean/Conjectures/SaganWilsonPlacticModeCounterexample.lean) extend the exact row to every positive alphabet. The published real-scalar formulation then contradicts the universal mode assertion. The length-ten computation makes no claim about Conjecture 7.3(c) on log-concavity.

## Reproduction and provenance

The [original candidate](https://github.com/1337isnot1337/solved-conjectures/pull/588) contains the split-table construction and its proof history. The [certificate generator](verification/generate_layers.py) and [subtree generator](verification/split_layers.py) reproduce all 57 generated module files byte for byte. From an empty working directory with a subdirectory named `Conjectures`, run the first script at alphabet sizes 8, 9 and 10, followed at each size by the second script with arguments `m 5 1`, where `m` is the alphabet size. Compare the generated files with `lean/Conjectures/`.

The [hook-formula calculation](check.py) checks an independent enumeration. The [tableau check](check_tableaux.py) compares full insertion tableaux on 6,688 words, reconstructs all ten centralizer counts, and recovers the same binomial row. Run both scripts with Python 3 and assertions enabled.

Two runs on the research and publication branches each strictly compiled 71 proof modules and audited all 637 owned declarations, including 348 theorems and 123 private declarations. Both replayed the imports with the pinned stock kernel and checked all 76 registered endpoints. The only axioms found were propositional extensionality, classical choice and quotient soundness. [Verification receipt](verification/receipt.json).
