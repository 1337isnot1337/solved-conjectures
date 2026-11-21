# Ferreira–Simon's Wright log-concavity conjecture

**Disproved.** The parameter threshold in Ferreira and Simon's §6.4 conjecture does not imply log concavity of the Wright density. The proof gives continuous families of counterexamples, including parameters with $\beta>0$.

Source: R. A. C. Ferreira and T. Simon, *On the log-concavity of the Wright function*, Constructive Approximation **60** (2024), 309–338; [DOI](https://doi.org/10.1007/s00365-023-09666-w), [primary author preprint](https://arxiv.org/pdf/2212.07974). Tracking and review: [issue 100](https://github.com/1337isnot1337/solved-conjectures/issues/100).

## Lean verification

[`Conjectures.FerreiraSimonWright`](../../lean/Conjectures/FerreiraSimonWright.lean)
proves the original conjecture false. It defines the Wright function by the
source's infinite reciprocal-Gamma series and uses the source normalization
for the density. For every sufficiently small positive `t`, the actual density
with `alpha = 1 - t` and `beta = 0` violates log concavity at the three points
`1/4`, `1/2`, and `3/4`. The source sets `alpha_star(0) = 1`, so these parameters
satisfy the conjectured threshold.

The proof establishes the infinite-series limit
`wright (-(1-t)) 0 (-x) / t → x/(1-x)^2` for every `0 ≤ x < 1`.
Its values at the three selected points are `4/9`, `2`, and `12`; hence the
square of the middle value is strictly smaller than the product of the
endpoint values. Gamma reflection and a uniform coefficient bound justify
the limit by dominated convergence. No series truncation or numerical
counterexample is a premise.

Strict compilation with warnings treated as errors, the complete owned-module
axiom audit, and independent replay with the pinned stock Lean kernel passed.
The audit includes all 25 declarations, eight of them private, and permits
only `propext`, `Classical.choice`, and `Quot.sound`.
[Validation receipt](../../docs/verification/lean-wright-20261121/wright-receipt.json).
The combined repository gate remains pending.

The Lean result is a complete disproof of the universal source conjecture.
The additional positive-beta families, general slope formulas, and derivative
limits in the written proof below are not claimed to be formalized.

## Counterexample intervals

For every sufficiently small $t>0$, each of the following parameter choices satisfies $\alpha\lt \alpha_*(\beta)$, while its normalized density is not log concave:

| Parameters | Why the threshold holds | Limiting curvature at $x=1/2$ |
|---|---|---|
| $\alpha=1-t$, $\beta=0$ | The source sets $\alpha_*(0)=1$. | $-16$ |
| $\alpha=1-3t$, $\beta=t$ | The curvature at zero, divided by $t^2$, tends to $2>0$. The source proves this sign characterizes the threshold. | $-448$ |

The last column is the limit of $(f_t'^2-f_tf_t'')/t^2$ for the unnormalized Wright density. Multiplication by the positive density-normalization constant preserves the sign. Negative curvature in this convention means that $\log f_t$ has a positive second derivative, contradicting log concavity.

## Proof mechanism

For fixed $a>0$ and $b\geq0$, the proof establishes

```math
\frac{\phi(-(1-at),bt,-x)}{t}
\longrightarrow
\frac{b+(a-b)x}{(1-x)^2},
\qquad |x|\lt 1,
```

locally uniformly together with every fixed derivative order. Gamma reflection and log convexity give the uniform coefficient bound $an+b$ for $n\geq1$. This justifies passing to the curvature limit.

The general limiting curvature at $x=1/2$ is $-16(a^2+6ab+b^2)$. Its value at zero is $a^2-2ab-b^2$. Every fixed slope satisfying $a^2>2ab+b^2$ therefore yields counterexamples for all sufficiently small $t>0$.

The analytic proof establishes whole intervals. The computation below only checks its exact algebra; it does not supply a numerical substitute for the proof. The separate equivalence between density log concavity and reciprocal Mittag–Leffler convexity is not classified here.

## Files and review

- [PROOF.md](PROOF.md): exact source statement and full analytic disproof.
- [NOVELTY.md](NOVELTY.md): two-engine searches, current author records, later primary-paper scope checks, and explicit access limits.
- [verify.py](verify.py): exact rational-polynomial verification of the general curvature identity and displayed derivative values.
- [Independent algebra audit](../../research/ferreira-simon-wright/AUDIT-ALGEBRA.md) and [independent root audit](../../research/ferreira-simon-wright/AUDIT-ROOT.md), with discussion in [issue 100](https://github.com/1337isnot1337/solved-conjectures/issues/100).

Run `python3 results/ferreira-simon-wright/verify.py` from the repository root. The exact check passes. Separate internal reviews by the root and algebra agents found no mathematical gap; these are not outside peer review.

No earlier resolution of the exact conjecture was located in the sources inspected as of 20 November 2026. The novelty record identifies the inaccessible published full text and the abstract-only screen of a recent related manuscript.
