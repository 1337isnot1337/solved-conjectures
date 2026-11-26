# Lean verification of Chern–Fu–Lin’s three-statistic conjecture

[Main theorem](../../lean/Conjectures/ChernFuLinThreeStatistic.lean) · [Written proof](PROOF.md) · [Original discovery and attribution](https://github.com/1337isnot1337/solved-conjectures/issues/439) · [Literal statement check](verification/StatementCheck.lean)

`Conjectures.ChernFuLinThreeStatistic.equidistribution` proves [Conjecture 6.1](https://arxiv.org/html/2209.12137#S6) for every length, including zero. For each prescribed set of positions of left-to-right minima and each pair of right-to-left maximum and inverse descent counts, it equates the cardinalities of the corresponding fibres of `Av(2134,42153,24153)` and `Av(3124,42153,24153)`. Positions are indexed by `Fin n`; adding one gives the paper’s indexing. The theorem has no recurrence or other mathematical hypotheses.

The repository’s written proof was published in [commit 33f41fe9](https://github.com/1337isnot1337/solved-conjectures/commit/33f41fe96dcdff47746a43268cc5721dbeea7d82), with the [repository attribution](../../README.md) to Cinna Davis and GPT-6.2 Astra. The Lean formalization contributed by [Adam Benazouz](https://github.com/adamben04) reuses the literal pattern definitions and maximum-insertion results for the first class from [Carlos Roberto Martim Junior’s Burstein formalization](../burstein-a218225-enumeration/FORMALIZATION.md). Neither the unweighted enumeration in that work nor Chern–Fu–Lin’s separate Conjecture 6.2 is the endpoint here.

## How the proof reaches literal counts

1. **Recover the code.** For a permutation split at its minimum, the right labels form two value intervals. Their lengths and the rank of the collapsed high block are unique. [Decode](../../lean/Conjectures/ChernFuLinThreeStatisticDecode.lean) constructs the inverse; [Fibre](../../lean/Conjectures/ChernFuLinThreeStatisticFibre.lean) restricts the equivalence to the exact minimum positions.
2. **Factor the weights.** [Product](../../lean/Conjectures/ChernFuLinThreeStatisticProduct.lean) sums the genuine statistic weights over this equivalence. The two consecutive blocks in the second class give its [tail identity](../../lean/Conjectures/ChernFuLinThreeStatisticZTail.lean).
3. **Evaluate the shuffles.** In the first class, each admissible cut is identified on the literal maximum-insertion path. [EdgeWeights](../../lean/Conjectures/ChernFuLinThreeStatisticEdgeWeights.lean) transports both statistics to the flag-word tree. The [power-series moment](../../lean/Conjectures/ChernFuLinThreeStatisticLiteralMoment.lean) and [sum over marked cuts](../../lean/Conjectures/ChernFuLinThreeStatisticXTail.lean) give the same tail identity for the first class.
4. **Extract the joint distribution.** The two marked recurrences agree. [Induction on bit-word length](../../lean/Conjectures/ChernFuLinThreeStatisticMarked.lean) and bivariate polynomial coefficient extraction recover each individual fibre, without specializing either statistic to one.

## Reproduction

From the repository root, after obtaining the pinned Mathlib cache:

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.ChernFuLinThreeStatistic \
  --require Conjectures.ChernFuLinThreeStatistic.equidistribution \
  --require Conjectures.ChernFuLinThreeStatistic.Expansion.weighted_minimum_split \
  --require Conjectures.ChernFuLinThreeStatistic.Expansion.Z_tail_identity \
  --require Conjectures.ChernFuLinThreeStatistic.Growth.X_tail_identity \
  --out /tmp/chern-fu-lin-check
```

The target verifier rebuilds the 42 project modules with Lean 4.35.0 using `-j1 -DwarningAsError=true`, checks every owned declaration, and independently replays the closure with stock `leanchecker`. The [all-owned audit](verification/TargetAudit.lean) covered 1,615 declarations, including 1,251 theorems and 352 private declarations. The only transitive axioms were `propext`, `Classical.choice`, and `Quot.sound`. The [receipt](verification/receipt.json) records the target, input hashes, commands, and results. To check the endpoint against the literal fibres printed in the paper, run `lake env lean -j1 -DwarningAsError=true ../results/chern-fu-lin-three-statistic/verification/StatementCheck.lean` from `lean/`.

The receipt was produced on Windows. All 40 new Lean source hashes match the Git blobs; the two reused Burstein files, package configuration and verifier scripts used the checkout’s CRLF line endings.
