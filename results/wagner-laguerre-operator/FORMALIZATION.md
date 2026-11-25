# Lean formalization

**Complete for Wagner’s original Conjecture 4.3.** The [primary source](https://arxiv.org/pdf/2108.01827v2#page=11) asks whether every Laguerre operator preserves the positive shifted Laguerre–Pólya class. The exact Lean endpoint is [`WagnerLaguerreOperator.wagner_conjecture_4_3_false`](../../lean/Conjectures/WagnerLaguerreOperator.lean).

The input is the real entire function `exp z + 1`. The proof constructs the actual real polynomial approximants and proves their compact-uniform convergence; for each fixed shifted derivative degree, all the roots of the shifted derivative lie on the nonpositive real axis. The Taylor derivatives at zero are eventually nonnegative. The first Laguerre operator equals `-exp z`, whose Taylor derivatives are negative at every index. The module defines the whole operator family with the primary source’s Leibniz formula, so the first operator refutes the universal assertion. There is no Jensen-equivalence hypothesis.

The [written proof](PROOF.md), [prior-art audit](AUDIT.md) and [attribution record](https://github.com/1337isnot1337/solved-conjectures/issues/137) retain their scope and authorship. This is not a new discovery and does not cover the different sequence conjectures 4.1 and 4.2.

Pinned Lean 4.35.0 passed strict compilation, the complete all-owned audit (39 declarations, 33 theorems, 23 private declarations, six required endpoints) and stock kernel replay. The Mathlib revision and verification inputs are in the [exact receipt](verification/lean-receipt.json); the [endpoint audit](verification/TargetAudit.lean) records the whitelist.

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.WagnerLaguerreOperator \
  --require WagnerLaguerreOperator.wagner_conjecture_4_3_false \
  --out /tmp/wagner-lean-verification
```
