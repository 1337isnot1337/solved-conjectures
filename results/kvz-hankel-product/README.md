# Karp–Vishnyakova–Zhang's Hankel-product conjecture

The conjecture is false. Two Hankel kernels can each be strictly sign regular in every order while their pointwise product is not sign regular even in order two.

The counterexample is

```math
K_1(x,y)=\frac1{x+y},\qquad
K_2(x,y)=e^{-(x+y)^2},\qquad x,y>0.
```

The first factor is strictly totally positive by the Cauchy determinant formula. The second is strictly sign regular with signature $`(-1)^{\binom r2}`$, because positive row and column factors reduce it to the exponential kernel $`e^{-2xy}`$.

For their product, the minor on $`x=y=(t,2t)`$ equals

```math
\frac{e^{-20t^2}}{9t^2}\left(\frac98-e^{2t^2}\right).
```

It is positive at $`t=1/10`$ and negative at $`t=1`$. The elementary bounds $`e^{1/50}<50/49<9/8`$ and $`e^2>3>9/8`$ establish both signs exactly. Hence a single order-two signature cannot exist.

This refutes the full universal product-closure assertion. An optional rational counterexample in the proof supplies the independent determinant values $`-23/11250`$ and $`23/57600`$.

## Source and precise scope

Dmitrii Karp, Anna Vishnyakova, and Yi Zhang, *Unimodality preservation by ratios of functional series and integral transforms*, [arXiv:2408.01755v1](https://arxiv.org/html/2408.01755v1), Section 3, item 11, **Conjecture 1 in that version**. The general product claim also appears explicitly on slide 20 of [Karp's October 2024 Sofia talk](https://math.bas.bg/wp-content/uploads/2024/10/JointSeminarSlides-20241015.pdf). The [second preprint version](https://arxiv.org/html/2408.01755v2) and [published article](https://doi.org/10.1007/s00025-025-02431-4), *Results in Mathematics* 80 (2025), article 112, retain the product assertion as a belief in Section 3, item 11; its published location is pages 13–14.

The published paper's numbered Conjecture 1 is a different Bessel-function assertion. The nearby gamma-quotient conjecture, its proposed signature, and the reciprocal q-gamma conjecture are separate statements. This result concerns only universal pointwise product closure.

## Files

- [PROOF.md](PROOF.md): complete all-order factor proofs and two exact counterexamples to product closure.
- [NOVELTY.md](NOVELTY.md): source-version history, prior-resolution searches, and distinctions from existing closure theorems.
- [verify.py](verify.py): Python standard-library checks of the exact arithmetic certificates.
- [Independent mathematical and source audit](../../research/kvz-hankel-product/AUDIT-ANALYSIS.md).
- [Research issue #94](https://github.com/1337isnot1337/solved-conjectures/issues/94).

## Verification and status

Run from the repository root:

```bash
python results/kvz-hankel-product/verify.py
```

Local execution passed the two rational determinants and the two exponential-sign bounds. The written proof, rather than finite numerical testing, establishes the all-order hypotheses. Independent internal mathematical and source audits passed. The note is unrefereed. No earlier resolution was found in the documented search as of 20 November 2026; this is a bounded search, not a guarantee of exclusive priority.
