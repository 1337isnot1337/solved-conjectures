# Haralambis’s three-difference conjecture

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

For every triple of positive integer differences, the extremal density equals the circle rotation bound. One pair sum is a period of an optimal set.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/haralambis-three-differences/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

Complete Lean formalization. `Haralambis.three_difference_theorem` proves the exact density and attainment by a periodic set whose period is a pair sum, for every positive integer triple. Common-divisor normalization and arbitrary competing sets are included. The explicit set `{n : n % 7 ∈ {0,1,4}}` attains density `3/7` for `{2,5,9}`. See [the checked proof](LEAN.md) and [the status report](../../docs/lean-status.md).
