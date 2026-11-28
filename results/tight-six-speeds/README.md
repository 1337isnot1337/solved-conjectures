# Tight six-speed sets and seven-coordinate critical subtori

**Prior work.** The classification of tight six-speed sets was already public in Lee Marshall's [ai-math-results](https://github.com/LeeMarshall1113/ai-math-results/tree/a43cb0b9e0b6f762118b2acb8ee62cd31bdcbc89/results/lonely-runner-tight-6-7), Theorem B1, released 29 October 2026. Cite that work for the classification. This page records a later derivation first committed on 18 November 2026. It is unranked and is not counted as a new resolution. [Details](PROOF.md)

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
