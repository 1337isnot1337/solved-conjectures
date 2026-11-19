# Growing rectangles

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

Gajdzica–Zakarczemny, Remark 5.9: uniform asymptotic for `log p(h,w)` as `h → ∞`, `w ≥ h`.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/rectangle-partition-asymptotics/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

Partial formalization. The general shelf-packing lemma and exact small-part deletion bound have passed source and independent kernel checks. The geometric injection and analytic partition asymptotics remain open. See [the status report](../../docs/lean-status.md) for checked scope and remaining dependencies.
