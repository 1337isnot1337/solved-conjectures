# Prior-resolution correction

Date: 21 November 2026.

The full Bessel-ratio unimodality assertion was already proved before this repository's independent work. [Trure issue 25199](https://github.com/the-omega-institute/trureturing/issues/25199) was created and last updated on **1 November 2026 at 10:29:40 UTC**. Its public body contains a complete ordinary analytic proof. The repository's result was added on 20 November and cannot be counted as a new resolution.

## Exact scope

The primary target is the first sentence of Conjecture 1 in [arXiv:2408.01755v2](https://arxiv.org/abs/2408.01755v2), numbered Conjecture 2 in version 1. For all real orders and positive scales satisfying

```math
\nu_1\geq\nu_2>-1,\qquad 0<a_1\leq a_2,
```

the ratio

```math
R(x)=\frac{I_{\nu_1}(a_1x)}{I_{\nu_2}(a_2x)}
```

is unimodal on the positive half-line. The source permits monotone and constant functions. Its unused parameter does not change the assertion. The separate subsequent log-concavity claim had already been refuted and is not part of either unimodality proof.

The earlier issue explicitly retains this entire domain. It includes nonintegral order gaps, negative orders, equal orders, and equal scales. It is not an adjacent-order, same-argument, or finite-parameter result. Both the analysis and root reviewers independently compared the exact source conventions and read the entire earlier proof.

## Earlier proof checked

Write $`y=I_{\nu_1}(a_1x)`$, $`z=I_{\nu_2}(a_2x)`$, and set

```math
\delta=\nu_1-\nu_2,\qquad
A=\nu_1^2-\nu_2^2,\qquad
B=a_2^2-a_1^2,\qquad
W=x(y'z-yz').
```

The earlier proof derives positivity, differentiability, and the modified Bessel equation directly from the defining series. It then obtains

```math
W'=(A-Bx^2)\frac{yz}{x},\qquad
R'=\frac{W}{xz^2}.
```

For $`\delta>0`$, factoring the positive leading powers in the two series shows that $`W`$ is positive near zero. This argument does not assume the sum of orders is nonnegative or that $`W`$ has a finite endpoint limit. For $`\delta=0`$, the next coefficient gives $`W(0+)=0`$ because $`2\nu+2>0`$.

In the equal-order case, $`W'\leq0`$ gives a nonincreasing ratio. With a strict order gap, if $`A\leq0`$, then $`W`$ decreases from its positive initial sign. If $`A>0`$, then $`W`$ either increases everywhere or first increases and then decreases. In every case it has at most one positive-to-negative crossing. The quotient is therefore monotone or has one peak. This is precisely the full required unimodality conclusion. The argument has no missing large-argument assumption or negative-order exception.

The issue's remaining obligations are formal translation, independent repository checking, and admission. Those are not missing steps in the ordinary analytic proof. This task expressly excludes Lean work; an unfinished formalization cannot be used to claim that a mathematically proved conjecture remains open.

The repository's additional strict branch classification does not restore novelty for the named conjecture. It was not a separately posed unresolved conjecture, and it is not counted as a replacement target.

## Collection correction

The following are removed from the active collection:

- `results/kvz-bessel-unimodality/`, including its duplicate proof and verifier;
- the duplicate research proof and verifier;
- the README and full catalogue rows;
- the active Lean-status row and site alias;
- the verifier workflow step and execution-guide references.

Historical mathematical reviews and source audits are retained with prominent superseding notices. The ordinary proof and verifier can still be read at [the immutable pre-withdrawal snapshot](https://github.com/1337isnot1337/solved-conjectures/tree/260d8cd070fc6642edd722b16e52370a91ab73f7/results/kvz-bessel-unimodality/). The earlier research proof reviewed by both internal reviewers is also preserved at [commit 9a5f90c84d13e85352b79402e4e79fc0f7819c2a](https://github.com/1337isnot1337/solved-conjectures/blob/9a5f90c84d13e85352b79402e4e79fc0f7819c2a/research/kvz-bessel-unimodality/PROOF.md).

The prior-resolution finding is recorded in [target issue 107](https://github.com/1337isnot1337/solved-conjectures/issues/107#issuecomment-7059832754), [campaign issue 156](https://github.com/1337isnot1337/solved-conjectures/issues/156#issuecomment-7059832609), and the [complete-content retrospective audit](../campaign-20261121/TRURE_MXYM_AFTD_AUDIT.md). This older entry was outside the current fourteen campaign families; its withdrawal does not change that subgroup's count. No Lean source or accepted formalization receipt is changed.
