# Eight lonely runners, all equality cases

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

Exactly three primitive seven-speed sets attain 1/8. They are the consecutive speeds and the two examples in Goddyn and Wong’s census.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/tight-seven-speeds/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

Partial formalization. The general pair-sum maximum theorem and the displayed finite examples have checked global loneliness values. Exhaustiveness and the full classification remain open in Lean. See [the status report](../../docs/lean-status.md) for exact scope.
