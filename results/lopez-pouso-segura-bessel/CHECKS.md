# Verification record

Run from this directory:

```bash
python3 verify.py
```

The verifier uses only `fractions.Fraction` and a small sparse polynomial
implementation. The variable representing $`\pi^2`$ stays formal. The
checks cover the positive rational second derivative, the model
weight-sum identity, the cancellation in the two sequence limits,
the shifted Bernoulli coefficient, the telescoping identity for
$`K_i`$, and the positive-measure constants.

These checks do not use floating-point Bessel zeros. They audit
arithmetic in the proof. The analytic statements, including
convergence, strict convexity, and all-index monotonicity, rest on
the written argument and were read independently by two reviewers.

The complete proof establishes the whole of source Conjectures 2,
5, and 8. The common result is counted once.
