# Lean verification of Shumyatsky’s conjugate prime-spectrum proof

The existing [proof](PROOF.md) answers Kourovka Notebook Question
17.125. This partial verification retains the original contribution
from [aadrianvv](https://github.com/aadrianvv) in [PR #652](https://github.com/1337isnot1337/solved-conjectures/pull/652)
and the source credits in the [audit](AUDIT.md).

- [Prime-spectrum reduction](../../lean/Conjectures/ShumyatskyPrimeSpectrum.lean).
  Lean uses the actual natural cardinalities of groups and their
  subgroups. It proves that minimality descends along surjections,
  that every finite group contains a minimal subgroup with the same
  prime spectrum, and that conjugate generation on minimal groups
  implies the exact original statement. The final cardinality step
  proves that a quotient-surjecting subgroup of a minimal group is the
  whole group once its order contains every kernel prime.
- [Cycle-label equations](../../lean/Conjectures/ShumyatskyCycleLabels.lean).
  Lean verifies equations (1) and (2) for arbitrary finite lists of
  paired edge labels in a group. Given the starting conjugator label,
  the labels already chosen, and a consistent reference cycle, the
  missing edge label exists uniquely in the prescribed class under the
  quotient homomorphism.

- [Factor action](../../lean/Conjectures/ShumyatskyFactorAction.lean).
  Lean reconstructs an automorphism of the actual finite direct product
  from its permutation of coordinate subgroups and their induced
  automorphisms. It checks the source-label multiplication law, proves
  that equation (1) is equivalent to conjugacy of these automorphisms,
  and identifies a fixed permutation with prescribed outer classes as
  an actual right coset modulo inner automorphisms of the product.

- [Simple factors](../../lean/Conjectures/ShumyatskySimpleFactors.lean).
  Every nontrivial normal subgroup of a direct power of a nonabelian
  simple group contains a coordinate factor. The factors are exactly the
  minimal nontrivial normal subgroups. Consequently every automorphism
  of the finite power permutes the factors and has the label form above.
- [Walk labels](../../lean/Conjectures/ShumyatskyWalkLabels.lean).
  Lean evaluates arbitrary words of forward and reverse factor moves on
  the product. A closed word acts on its base factor by the product of
  its successive labels. Words of the two chosen automorphisms and their
  inverses are in their generated subgroup. For a selected occurrence
  with the other transports fixed, each word label in the prescribed
  outer class determines a unique edge label in its prescribed class.

The solvable-radical reduction, the construction of the spanning
tree and two independent closed walks, the almost-simple generation
inputs, and the simultaneous lift across the socle remain outside
this partial check.

The pinned Lean 4.35.0 gate strictly recompiles each module, audits
all declarations owned by it, and replays the objects with the stock
checker. All five scopes passed.
[Prime-spectrum receipt](verification/prime-spectrum/receipt.json) ·
[Cycle-label receipt](verification/cycle-labels/receipt.json) ·
[Factor-action receipt](verification/factor-action/receipt.json) ·
[Simple-factor receipt](verification/simple-factors/receipt.json) ·
[Walk-label receipt](verification/walk-labels/receipt.json).
