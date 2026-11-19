# Tight six-speed sets and seven-coordinate critical subtori

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

The consecutive set is the unique primitive six-speed equality case. The seven-coordinate critical plane is unique up to signs and permutations.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/tight-six-speeds/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

Partial formalization. The general pair-sum maximum theorem and the displayed finite examples have checked global loneliness values. Exhaustiveness and the full classification remain open in Lean. See [the status report](../../docs/lean-status.md) for exact scope.
