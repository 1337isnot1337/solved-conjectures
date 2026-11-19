# CUT arithmetic periodicity with a preperiod

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

The general finite decision test, exhaustive candidate enumeration, and both
concrete games are completely formalized. The decision construction proves exact
graph, lower-value, and actual-option recognizers for every finite cut set and
proposed finite-prefix arithmetic sequence.

`CutPeriod.Weight.both_games_exact` identifies the actual recursively defined
games for cuts `{1,2,8}` and `{1,2,7,8}` with the stated sequence at every pile
size, including zero. Both have least positive eventual arithmetic period 12,
saltus 8, and earliest period-12 start at pile 7, hence preperiod 6 on positive
piles. The proof uses finite quotient/residue tables, a proved collision bound,
and explicit lower-option constructions. It does not depend on the unfinished
large higher-pile automata certificates.

All seven new modules passed source checks and the ownership-based axiom audit;
all 23 modules in their exact project closure passed independent kernel replay.
See [the general Lean proof](GENERAL_LEAN.md), [the concrete proof plan](LEAN_PLAN.md),
and [the status report](../../docs/lean-status.md).

## Supporting files

- [`GENERAL_LEAN.md`](GENERAL_LEAN.md)
- [`LEAN_PLAN.md`](LEAN_PLAN.md)
- [`generate_lean_certificates.py`](generate_lean_certificates.py)
- [`generate_weight_certificates.py`](generate_weight_certificates.py)
