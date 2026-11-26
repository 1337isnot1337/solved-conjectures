# Scope and independent audit

The exact targets are [Braun–Bruegge, JIS 2023, Conjectures 13, 32 and 33](https://cs.uwaterloo.ca/journals/JIS/VOL26/Braun/braun6.pdf). Their prior graph reductions and same-parity results are credited. Conjecture 31 also has a [separate earlier proof](https://www.trureturing.org/research/braun-bruegge-2022-symmetric-edge-polytope-facet-sum-conjecture-5-1/) and is not claimed. The two scope-related new theorems are one campaign publication family.

Independent review checked the exact facet formulas including paths of length one and the simple-graph qualification, Wallis estimates, large-length inequalities and strict balance. The small-parameter base and no-extra-ties checks were independently replayed over 60,899 and 82,037 tuples. Neither verification is used in lieu of the all-large-length proofs.

The written results were reviewed before the Lean formalization. The later [Lean proof and receipt](FORMALIZATION.md) cover both geometric facet maxima and all theta equality cases.
