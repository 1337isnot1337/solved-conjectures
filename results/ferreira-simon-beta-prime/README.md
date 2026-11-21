# Ferreira–Simon's conjecture

Complete proposed proof of Conjecture 1 in *Convolution of beta prime distribution*: for every $`a>0`$ and $`0\lt b<1/2`$,

```math
B'_{a,b}+\widetilde B'_{a,b}
\overset{d}{=}
B'_{2a,b}\left(1+\sqrt{\frac{B_{a,1/2}}{B_{b,1/2-b}}}\right),
```

with independent random variables on each side. Here $`B`$ and $`B'`$ denote beta and beta-prime laws with the displayed shape parameters.

The proof evaluates the square-root factor's Mellin transform by a fractional linear substitution and the classical quadratic transformation DLMF 15.8.15. A beta integral and Euler's transformation then identify it with the convolution's Mellin transform. All parameters in the original statement are covered.

## Files

- [PROOF.md](PROOF.md): complete analytic proof, including the convolution formula, parameter domains, convergence, normalization constants, and uniqueness of the positive law.
- [SOURCES.md](SOURCES.md): exact source scope, prior-resolution search, known exclusions, and access limits.
- [ALGEBRA_REVIEW.md](ALGEBRA_REVIEW.md): independent audit of the full written proof.
- [ROOT_REVIEW.md](ROOT_REVIEW.md): second independent derivation and final source audit.
- [verify.py](verify.py): supplementary standard-library checker for 18 exact symbolic identities in formal parameters.

Run the algebra audit with

```text
python3 verify.py
```

It checks substitutions, convergence excesses, rising-factorial duplication, and gamma-product normalization. It performs no floating-point sampling and is not an essential component of the analytic proof.

## Status

The complete written proof passed two independent mathematical reviews. It is not Lean-formalized. The exact symbolic checker passed. The source audit found no earlier resolution of this identity in the examined material; its limits are stated in `SOURCES.md`. The research reservation and checkpoints are in [issue #200](https://github.com/1337isnot1337/solved-conjectures/issues/200).

The paper's complete-monotonicity equivalence and its Mills-ratio conjecture are separate previously refuted assertions. Neither is counted here, and consequences of this distribution identity are not counted separately.
