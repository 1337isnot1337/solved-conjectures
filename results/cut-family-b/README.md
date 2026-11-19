# CUT Family B

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

Ellis–Thanatipanonda (2022), Conj. 2: nim-sequence matches the base game iff the least odd cut above 1 exceeds three times the least even cut.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/cut-family-b/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

Complete formalization of the threshold theorem for the recursively defined games, including arbitrary infinite cut sets. The base-game formula and all added even cuts are proved internally. The proof also gives a discrepancy by pile size `4x` when the odd-cut threshold fails. See [the checked statements](../../lean/Conjectures/CutFamilyTheorem.lean) and [verification status](../../docs/lean-status.md).
