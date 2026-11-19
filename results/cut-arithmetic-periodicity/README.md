# CUT with a preperiod

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

Dailly et al., Open Problem 4: finite arithmetic-periodicity test; both examples have preperiod 6, period 12, saltus 8.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/cut-arithmetic-periodicity/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

The general finite decision test and exhaustive candidate enumeration are formalized for every finite cut set and every proposed finite-prefix arithmetic sequence. The construction proves the exact graph, lower-value, and actual-option recognizers from the input data. The two concrete games still require the specialized higher-pile certificates. See [the general Lean proof](GENERAL_LEAN.md) and [the status report](../../docs/lean-status.md).

## Supporting files

- [`GENERAL_LEAN.md`](GENERAL_LEAN.md)
- [`LEAN_PLAN.md`](LEAN_PLAN.md)
- [`generate_lean_certificates.py`](generate_lean_certificates.py)
