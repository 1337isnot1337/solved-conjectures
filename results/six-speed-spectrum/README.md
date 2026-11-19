# Six-speed Loneliness Spectrum Conjecture

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

The values below 1/6 are exactly (P−1)/(6P) for P ≥ 7 congruent to ±1 modulo 6. Cordella’s nine sporadic sextuples exhaust the exceptions to the three known families.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/six-speed-spectrum/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

The realization direction is complete in Lean. For every `P ≥ 7`
congruent to `1` or `5` modulo six, the formal proof constructs six
distinct positive integer speeds with gcd one and exact global loneliness
\((P-1)/(6P)\). This includes both infinite branches, the progression
parameter zero, and the separate `P=11` case. Each value is attained,
and the corresponding upper bound holds at every real time.

The exact 11-module closure passed fresh strict compilation, an audit of all
392 owned declarations including 30 private declarations, and independent
stock-kernel replay of all 11 modules. All 15 required endpoints are theorems.
[Exact scope](../../docs/lean-status.md#six-speed-spectrum-complete-realization) ·
[Raw receipt](../../docs/verification/six-spectrum-realization-44527134869/receipt.json).

The general pair-sum maximum theorem and displayed finite examples also have
checked global values. Universal classification of the three families and
exhaustiveness outside them remain incomplete in Lean.

Reproduce the realization gate from the repository root with the pinned Lean
toolchain and Mathlib cache:

```sh
python3 scripts/verify_six_spectrum_realization.py
```

