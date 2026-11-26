# Lean verification of the shifted Lonely Runner counterexamples

Lean proves Zhang’s inequality for every integer from 18 through 57. For each size it verifies the exact maximum for the speeds and shifts in the published JSON, including a rational time attaining that maximum. Aadrianvv contributed the configurations for 18–54 and tomdif contributed 55–57. The range 58–94 and Zhang’s question about minimizing configurations remain open. [Certificate data](certificates.json) · [Contributors and search record](PROOF.md) · [Zhang, Question 8.5 and Appendix A](https://arxiv.org/html/2608.13599v3#S8).

The endpoint `ShiftedLonelyRunner.zhang_question_8_5` proves

```math
\Gamma(n) < \frac{1}{n+1} \qquad (18\le n\le 57).
```

Here the infimum ranges over lists of exactly $n$ distinct positive integer speeds and arbitrary real shifts in $[0,1)$. For each configuration the supremum ranges over every real time. The distance is the repository’s absolute distance to the nearest integer. [Definitions and certificate soundness](../../lean/Conjectures/ShiftedLonelyRunnerCertificate.lean) · [Range theorem](../../lean/Conjectures/ShiftedLonelyRunner.lean).

For an individual record, `Row.Verified.maximum` proves that the recorded radius is the greatest value of the minimum distance. The upper certificate is a chain of closed intervals. On each interval one named runner stays within the radius of one integer. Lean checks that successive intervals overlap and cover a full period. Integral speeds carry the bound to every real time. For the lower bound Lean checks the distances of **all** runners at the recorded rational time between zero and one. Consequently each radius is attained, including cases where adjacent closed intervals only touch. [Independent rational review of the later witnesses](REVIEW.md).

## Reproduction

With the repository’s Lean 4.35.0 toolchain and pinned Mathlib dependencies installed, run these commands at the repository root.

```sh
python3 results/shifted-lonely-runner-counterexamples/generate_lean.py --check
python3 scripts/verify_lean_target.py --root Conjectures.ShiftedLonelyRunner \
  --require ShiftedLonelyRunner.verified_range \
  --require ShiftedLonelyRunner.zhang_question_8_5 \
  --require ShiftedLonelyRunner.Row.Verified.gamma_eq \
  --out /tmp/shifted-lonely-runner-replay
```

The generator rescales each published rational shift and radius to a common denominator and selects intervals and a time. Lean checks those witnesses by kernel reduction. The source replay covers 11 modules. The audit checks all 343 owned declarations, including 65 private declarations and 172 theorems, against the allowed axioms `propext`, `Classical.choice` and `Quot.sound`. The stock kernel then replays the compiled modules independently. [Target verification receipt](verification/lean-receipt.json).
