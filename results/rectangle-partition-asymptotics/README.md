# Rectangle partition asymptotics when both sides grow

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

Complete formalization. Lean proves the uniform asymptotic for every `w ≥ h` as `h → ∞`, counting integer-sided blocks at arbitrary real positions and identifying rotations and arrangements of the same multiset. The real-to-grid bridge, cumulative partition estimate, packing reservations, and exact leading constant are proved internally. See [the complete checked scope](LEAN.md), [the source and verification receipt](lean-verification-receipt.json), and [the status report](../../docs/lean-status.md).
